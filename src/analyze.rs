#![allow(dead_code)]

use crate::*;
use indexmap::{IndexMap, IndexSet};
use petgraph::graph::{Graph, NodeIndex};
use petgraph::Direction;
use std::cell::RefCell;
use std::sync::Arc;

// TODO TODO make all labels one of Parameter(i), Temporary(i), or Return(i) instead of S0, A1, etc

// TODO use these to model stacks and merging logic, converge on ExitStack after minimizing loops
// once there's full coverage of all/most functions, can refactor GbIr generation to do explicit
// loads (for example).
// can also do function inlining. Splice in Pax Ir, readjust JumpIf0 targets
// and rename temporaries / converge arguments / convert return values. If inlining works do auto
// inline for up to N opcodes (determined from stack vector) and see if there is speed improvement
// or,
// recursively solve call ependencies to correct local stacks

pub type Reg = String;
pub type RegList = Vec<Reg>;

#[derive(Debug, Clone)]
pub struct RegMeta {
  pub literal: Option<isize>,
}

#[derive(Debug, Clone)]
pub struct RegFile {
  pub index: usize,
  pub registers: IndexMap<Reg, RegMeta>,
}

impl RegFile {
  pub fn new() -> Self {
    Self {
      index: 0,
      registers: IndexMap::new(),
    }
  }

  pub fn allocate(&mut self, prefix: &str, literal: Option<isize>) -> Reg {
    let reg = format!("{}{}", prefix, self.index);
    self.index += 1;
    self.registers.insert(reg.clone(), RegMeta { literal });
    reg
  }
}

pub type SharedRegFile = Arc<RefCell<RegFile>>;

#[derive(Clone, Debug)]
pub struct StackState {
  pub data: RegList,
  pub ret: RegList,
  pub temp: Option<Reg>,
}

impl StackState {
  pub fn new() -> Self {
    Self {
      data: vec![],
      ret: vec![],
      temp: None,
    }
  }
}

#[derive(Clone, Debug)]
pub struct Analysis {
  registers: SharedRegFile,
  state: StackState,
  record: Vec<StackState>,
}

impl Analysis {
  fn from_previous_masked(previous: &Analysis) -> Self {
    let prev_state = previous.exit_state();

    let mut enter_state = prev_state.clone();
    // FIXME this is a hack for testing, and shouldn't be committed:
    // let exempt = vec!["L0", "L1", "V8", "V10"];
    let exempt = vec![];
    enter_state.data.iter_mut().for_each(|d| {
      if !exempt.contains(&d.as_str()) {
        *d = previous.registers.borrow_mut().allocate("D", None);
      }
    });
    enter_state.ret.iter_mut().for_each(|d| {
      if !exempt.contains(&d.as_str()) {
        *d = previous.registers.borrow_mut().allocate("R", None);
      }
    });
    enter_state.temp = None;

    Self {
      state: enter_state.clone(),
      record: vec![enter_state],
      registers: previous.registers.clone(),
    }
  }

  fn from_previous(previous: &Analysis) -> Self {
    Self {
      state: previous.exit_state(),
      record: vec![previous.exit_state()],
      registers: previous.registers.clone(),
    }
  }

  fn new(registers: SharedRegFile) -> Self {
    Self {
      state: StackState::new(),
      record: vec![StackState::new()],
      registers,
    }
  }

  fn record_state(&mut self) {
    self.record.push(self.state.clone());
  }

  pub fn result(&self) -> Vec<StackState> {
    self.record.clone()
  }

  fn exit_state(&self) -> StackState {
    self.record.last().unwrap().clone()
  }

  // Push or inject new var reg.

  // TODO move to RegFile impl operating ON a mutable state ref

  fn push_data(&mut self, reg: Reg) {
    self.state.data.push(reg);
  }

  fn push_return(&mut self, reg: Reg) {
    self.state.ret.push(reg);
  }

  fn pop_data(&mut self) -> Reg {
    self.state.data.pop().unwrap_or_else(|| self.require_data())
  }

  fn pop_return(&mut self) -> Reg {
    self.state.ret.pop().unwrap_or_else(|| self.require_ret())
  }

  fn temp_store(&mut self, reg: Reg) {
    self.state.temp = Some(reg);
  }

  fn temp_load(&mut self) -> Reg {
    let reg = self.state.temp.clone().expect("no temp var to load!");
    let literal = self
      .registers
      .borrow()
      .registers
      .get(&reg)
      .and_then(|x| x.literal.clone());
    self.state.temp = Some(self.new_temp(literal));
    reg
  }

  // Register constructors.

  fn require_data(&mut self) -> Reg {
    let reg = self.registers.borrow_mut().allocate("D", None);
    // propagate backward
    for prev_state in &mut self.record {
      prev_state.data.insert(0, reg.clone());
    }
    reg
  }

  fn require_ret(&mut self) -> Reg {
    let reg = self.registers.borrow_mut().allocate("R", None);
    // propagate backward
    for prev_state in &mut self.record {
      prev_state.ret.insert(0, reg.clone());
    }
    reg
  }

  fn new_literal(&mut self, value: isize) -> Reg {
    self.registers.borrow_mut().allocate("L", Some(value))
  }

  fn new_temp(&mut self, value: Option<isize>) -> Reg {
    self.registers.borrow_mut().allocate("T", value)
  }

  fn new_var(&mut self) -> Reg {
    self.registers.borrow_mut().allocate("V", None)
  }
}

fn analyze_block(block: &Block, mut analysis: Analysis) -> Analysis {
  for command in block.commands() {
    use SuperPax::*;
    match (command.0).clone() {
      JumpAlways(_) => {}
      Drop | JumpIf0(_) | Print => {
        analysis.pop_data();
      }
      Load | Load8 => {
        analysis.pop_data();
        let reg = analysis.new_var();
        analysis.push_data(reg);
      }
      AltPush => {
        let reg = analysis.pop_data();
        analysis.push_return(reg);
      }

      Add | Nand => {
        analysis.pop_data();
        analysis.pop_data();

        // TODO enable and/nand optimization
        // if let Some(RegMeta {
        //     literal: Some(a_value),
        //     ..
        // }) = analysis.registers.borrow().registers.get(&a)
        // {
        //     if let Some(RegMeta {
        //         literal: Some(b_value),
        //         ..
        //     }) = analysis.registers.borrow().registers.get(&b)
        //     {
        //         panic!("opt: A={}={:?} B={}={:?}", a, a_value, b, b_value);
        //     }
        // }

        let reg = analysis.new_var();
        analysis.push_data(reg);
      }

      Store | Store8 => {
        analysis.pop_data();
        analysis.pop_data();
      }

      PushLiteral(value) => {
        let reg = analysis.new_literal(value);
        analysis.push_data(reg);
      }

      AltPop => {
        let reg = analysis.pop_return();
        analysis.push_data(reg);
      }

      LoadTemp => {
        let reg = analysis.temp_load();
        analysis.push_data(reg);
      }

      StoreTemp => {
        let reg = analysis.pop_data();
        analysis.temp_store(reg);
      }

      // Pax ports
      BranchTarget(_) => {}
      Metadata(_) => {}
      Exit => {}

      Call(_) => {
        unreachable!("Cannot optimize non-inlined method");
      }
    }
    analysis.record_state();
  }

  analysis
}

/// Composes blocks together into a graph.
pub fn dataflow_graph(stack_blocks: &[Block]) -> Graph<(), i32> {
  // List of blocks we've already seen.
  let mut visited = IndexSet::new();

  // Starting conditions. Each block flow starts (originally from 0) at a block
  // and continues until we hit a "visited" block, or a terminating "exit" block.
  let mut conditions = std::collections::VecDeque::<usize>::new();
  conditions.push_front(0);

  // Collect edges which will compose the graph.
  let mut edges: Vec<(u32, u32)> = vec![];
  while let Some(start) = conditions.pop_back() {
    // We iterate through blocks using an index.
    let mut i = start;
    while i < stack_blocks.len() {
      let block: &Block = &stack_blocks[i];

      // If we've visited this block already, we can stop here.
      if visited.contains(&i) {
        break;
      }
      visited.insert(i);

      // Determine what the next block target is going to be.
      match block.commands().last() {
        Some((SuperPax::JumpIf0(target), ..)) => {
          // Inject next edge (for both absolute jump OR branch)
          let alt_target = target + 1;
          edges.push((i as u32, alt_target as u32));

          // Invoke branch as though we jumped (nonzero).
          // only iterate future branches, not reverse ones (which are loops)
          if alt_target > i {
            conditions.push_front(alt_target);
          }
        }
        Some((SuperPax::JumpAlways(target), ..)) => {
          // Inject next edge (for both absolute jump OR branch)
          let alt_target = target + 1;
          edges.push((i as u32, alt_target as u32));

          // Invoke branch as though we jumped (nonzero).
          i = *target as usize;
        }
        _ => {}
      }

      // Add new edge to the forthcoming block.
      if i < stack_blocks.len() - 1 {
        edges.push((i as u32, (i + 1) as u32));
      }

      i += 1;
    }
  }

  Graph::<(), i32>::from_edges(&edges)
}

pub fn analyze_blocks(
  blocks: &[Block],
  graph: &Graph<(), i32>,
) -> (IndexMap<usize, Analysis>, Arc<RefCell<RegFile>>) {
  // First we want to analyze the whole program and identify basic blocks.
  // let mut exit_stacks = IndexMap::<_, DataRegs>::new();
  let seq = if graph.node_count() > 1 {
    let mut bfs = petgraph::visit::Bfs::new(&graph, 0.into());
    let mut seq = vec![];
    while let Some(block_index) = bfs.next(&graph) {
      seq.push(block_index.index() as usize);
    }
    seq
  } else {
    vec![0]
  };

  // REVIEW The Analysis struct should hold the analyses of all blocks at once, injected
  // in topological order, so that propagation of arguments from later blocks can happen
  // on all blocks upstream (or parallel) to it. This would also allow splitting out
  // the SharedRegFile and using it as a separate struct.
  // This change isn't needed yet, because the main() function will never have an unknown
  // number of values on the data or return stacks, they will always be empty. Blocks
  // downstream from #0 don't have unknown stack requirements until a call site.

  eprintln!("[analyze_graph] start");
  eprintln!();
  let mut analyses = IndexMap::<usize, Analysis>::new();
  let registers = Arc::new(RefCell::new(RegFile::new()));
  for block_index in seq.clone() {
    let mut incoming = graph
      .neighbors_directed(NodeIndex::new(block_index), Direction::Incoming)
      .map(|idx| idx.index() as usize)
      .collect::<Vec<_>>();
    incoming.sort();

    let next_analysis = if incoming.len() == 0 {
      Analysis::new(registers.clone())
    } else if incoming
      .iter()
      .find(|x| analyses.get(*x).is_none())
      .is_some()
    {
      let prev_analysis = incoming
        .iter()
        .map(|x| analyses.get(x))
        .find(|x| x.is_some())
        .unwrap()
        .unwrap();

      // Missing a previous analysis means we might be in a loop.
      eprintln!();
      eprintln!("block[{}] loop start.", block_index);
      Analysis::from_previous_masked(prev_analysis)
    } else if let Some(prev) = incoming.get(1) {
      let prev_analysis = analyses.get(prev).unwrap();

      // Having two previous analysis means we joined from a branch.
      eprintln!();
      eprintln!("block[{}] joining from branch.", block_index);
      Analysis::from_previous_masked(prev_analysis)
    } else {
      // Pick the first analysis.
      Analysis::from_previous(analyses.get(&incoming[0]).unwrap())
    };

    // Run analyze_block() on each block.
    let analysis = analyze_block(&blocks[block_index], next_analysis);
    analyses.insert(block_index, analysis.clone());
    eprintln!("block[{}]", block_index);

    let result = analysis.result();
    let commands = blocks[block_index].commands();
    for (i, state) in result.iter().enumerate() {
      eprintln!("        data: {:?}", state.data);
      eprintln!("        retn: {:?}", state.ret);
      eprintln!(
        "        temp: {:?}",
        state.temp.clone().unwrap_or("".to_string())
      );
      if let Some(command) = commands.get(i) {
        eprintln!("  {:?}", command.0);
      }
    }

    // Store the analysis.
    analyses.insert(block_index, analysis);
  }
  eprintln!();
  eprintln!();

  eprintln!("[analyze_graph] registers:");
  for (k, v) in &registers.borrow().registers {
    eprintln!("  {}: {:?}", k, v);
  }
  eprintln!();
  eprintln!();

  (analyses, registers)
}

// Returns the arity of the function. You require the whole program
// for this, because you need the arity of nested functions.
pub fn function_arity(program: &SuperPaxProgram, method: &str) {
  let mut program = program.to_owned();
  inline_into_function(&mut program, method);
  let blocks = program.get(method).unwrap();
  let graph = dataflow_graph(blocks);
  let (analysis, registers) = analyze_blocks(blocks, &graph);
  println!(
    "analysis\n  {:?}\n  {:?}",
    analysis[&0].record.iter().next(),
    analysis[&(blocks.len() - 1)].record.iter().last(),
  );
  // (0, 0)
}

#[cfg(test)]
#[allow(unused_imports)]
mod tests {
  use super::*;

  #[test]
  fn test_function_arity() {
    let program = parse_to_superpax("drop".as_bytes().to_owned(), None);
    function_arity(&program, "2dup");
  }
}