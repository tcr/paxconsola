#![allow(dead_code)]

use crate::*;
use indexmap::{IndexMap, IndexSet};
use petgraph::graph::{Graph, NodeIndex};
use petgraph::Direction;

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
pub struct FunctionAnalysis {
  pub blocks: IndexMap<usize, BlockAnalysis>,
  pub registers: RegFile,
}

impl FunctionAnalysis {
  fn push_data(&mut self, block: &mut BlockAnalysis, reg: Reg) {
    block.state.data.push(reg);
  }

  fn push_return(&mut self, block: &mut BlockAnalysis, reg: Reg) {
    block.state.ret.push(reg);
  }

  fn pop_data(&mut self, block: &mut BlockAnalysis) -> Reg {
    block
      .state
      .data
      .pop()
      .unwrap_or_else(|| self.require_data(block))
  }

  fn pop_return(&mut self, block: &mut BlockAnalysis) -> Reg {
    block
      .state
      .ret
      .pop()
      .unwrap_or_else(|| self.require_ret(block))
  }

  fn temp_store(&mut self, block: &mut BlockAnalysis, reg: Reg) {
    block.state.temp = Some(reg);
  }

  fn temp_load(&mut self, block: &mut BlockAnalysis) -> Reg {
    let reg = block.state.temp.clone().expect("no temp var to load!");
    let literal = self
      .registers
      .registers
      .get(&reg)
      .and_then(|x| x.literal.clone());
    block.state.temp = Some(self.new_temp(block, literal));
    reg
  }

  // Register constructors.

  fn require_data(&mut self, block: &mut BlockAnalysis) -> Reg {
    let reg = self.registers.allocate("D", None);
    // propagate backward
    for prev_state in &mut block.record {
      prev_state.data.insert(0, reg.clone());
    }
    // all the way backward
    for block in self.blocks.values_mut() {
      for prev_state in &mut block.record {
        prev_state.data.insert(0, reg.clone());
      }
    }
    reg
  }

  fn require_ret(&mut self, block: &mut BlockAnalysis) -> Reg {
    let reg = self.registers.allocate("R", None);
    // propagate backward
    for prev_state in &mut block.record {
      prev_state.ret.insert(0, reg.clone());
    }
    // all the way backward
    for block in self.blocks.values_mut() {
      for prev_state in &mut block.record {
        prev_state.ret.insert(0, reg.clone());
      }
    }
    reg
  }

  fn new_literal(&mut self, _block: &mut BlockAnalysis, value: isize) -> Reg {
    self.registers.allocate("L", Some(value))
  }

  fn new_temp(&mut self, _block: &mut BlockAnalysis, value: Option<isize>) -> Reg {
    self.registers.allocate("T", value)
  }

  fn new_var(&mut self, _block: &mut BlockAnalysis) -> Reg {
    self.registers.allocate("V", None)
  }
}

#[derive(Clone, Debug)]
pub struct BlockAnalysis {
  state: StackState,
  record: Vec<StackState>,
}

impl BlockAnalysis {
  // Accept registers from a previous block, but mask them
  // because we might have two block parents.
  fn from_previous_masked(registers: &mut RegFile, previous: &BlockAnalysis) -> Self {
    let prev_state = previous.exit_state();

    let mut enter_state = prev_state.clone();
    enter_state.data.iter_mut().for_each(|d| {
      *d = registers.allocate("D", None);
    });
    enter_state.ret.iter_mut().for_each(|d| {
      *d = registers.allocate("R", None);
    });
    enter_state.temp = None;

    Self {
      state: enter_state.clone(),
      record: vec![enter_state],
    }
  }

  fn from_previous(previous: &BlockAnalysis) -> Self {
    Self {
      state: previous.exit_state(),
      record: vec![previous.exit_state()],
    }
  }

  fn new() -> Self {
    Self {
      state: StackState::new(),
      record: vec![StackState::new()],
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
}

fn analyze_block(
  block: &Block,
  analysis: &mut FunctionAnalysis,
  block_analysis: &mut BlockAnalysis,
) {
  for command in block.commands() {
    use SuperPax::*;
    match (command.0).clone() {
      JumpAlways(_) => {}
      Drop | JumpIf0(_) | Print => {
        analysis.pop_data(block_analysis);
      }
      Load | Load8 => {
        analysis.pop_data(block_analysis);
        let reg = analysis.new_var(block_analysis);
        analysis.push_data(block_analysis, reg);
      }
      AltPush => {
        let reg = analysis.pop_data(block_analysis);
        analysis.push_return(block_analysis, reg);
      }

      Add | Nand => {
        analysis.pop_data(block_analysis);
        analysis.pop_data(block_analysis);

        let reg = analysis.new_var(block_analysis);
        analysis.push_data(block_analysis, reg);
      }

      Store | Store8 => {
        analysis.pop_data(block_analysis);
        analysis.pop_data(block_analysis);
      }

      PushLiteral(value) => {
        let reg = analysis.new_literal(block_analysis, value);
        analysis.push_data(block_analysis, reg);
      }

      AltPop => {
        let reg = analysis.pop_return(block_analysis);
        analysis.push_data(block_analysis, reg);
      }

      LoadTemp => {
        let reg = analysis.temp_load(block_analysis);
        analysis.push_data(block_analysis, reg);
      }

      StoreTemp => {
        let reg = analysis.pop_data(block_analysis);
        analysis.temp_store(block_analysis, reg);
      }

      // Pax ports
      BranchTarget(_) => {}
      Metadata(_) => {}
      Exit => {}

      Call(_) => {
        unreachable!("Cannot optimize non-inlined method");
      }
    }
    block_analysis.record_state();
  }
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

pub fn analyze_blocks(blocks: &[Block], graph: &Graph<(), i32>) -> FunctionAnalysis {
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

  let mut analysis = FunctionAnalysis {
    blocks: IndexMap::<usize, BlockAnalysis>::new(),
    registers: RegFile::new(),
  };

  for block_index in seq.clone() {
    let mut incoming = graph
      .neighbors_directed(NodeIndex::new(block_index), Direction::Incoming)
      .map(|idx| idx.index() as usize)
      .collect::<Vec<_>>();
    incoming.sort();

    let mut next_analysis = if incoming.len() == 0 {
      BlockAnalysis::new()
    } else if incoming
      .iter()
      .find(|x| analysis.blocks.get(*x).is_none())
      .is_some()
    {
      let prev_analysis = incoming
        .iter()
        .map(|x| analysis.blocks.get(x))
        .find(|x| x.is_some())
        .unwrap()
        .unwrap()
        .to_owned();

      // Missing a previous analysis means we might be in a loop.
      eprintln!("[analyze_graph] block[{}] is starting a loop.", block_index);
      BlockAnalysis::from_previous_masked(&mut analysis.registers, &prev_analysis)
    } else if let Some(prev) = incoming.get(1) {
      let prev_analysis = analysis.blocks.get(prev).unwrap();

      // Having two previous analysis means we joined from a branch.
      eprintln!(
        "[analyze_graph] block[{}] joining from branch.",
        block_index
      );
      BlockAnalysis::from_previous_masked(&mut analysis.registers, prev_analysis)
    } else {
      // Pick the first analysis.
      BlockAnalysis::from_previous(analysis.blocks.get(&incoming[0]).unwrap())
    };

    // Run analyze_block() on each block.
    analyze_block(&blocks[block_index], &mut analysis, &mut next_analysis);

    // Store the analysis.
    analysis.blocks.insert(block_index, next_analysis);
  }
  eprintln!();

  for (block_index, block) in &analysis.blocks {
    eprintln!("block[{}]", block_index);
    let commands = blocks[*block_index].commands();
    for (i, state) in block.record.iter().enumerate() {
      eprintln!("        data: {:?}", state.data);
      eprintln!("        retn: {:?}", state.ret);
      eprintln!(
        "        temp: {:?}",
        state.temp.clone().unwrap_or("".to_string())
      );
      if let Some(command) = commands.get(i) {
        eprintln!("  {:?}       {}", command.0, command.1);
      }
    }
  }
  eprintln!();

  eprintln!("[analyze_graph] registers:");
  for (k, v) in &analysis.registers.registers {
    eprintln!("  {}: {:?}", k, v);
  }
  eprintln!();
  eprintln!();

  analysis
}

// Returns the arity of the function. You require the whole program
// for this, because you need the arity of nested functions.
pub fn function_arity(program: &SuperPaxProgram, method: &str) -> (usize, usize, usize, usize) {
  let mut program = program.to_owned();
  inline_into_function(&mut program, method);
  let blocks = program.get(method).unwrap();
  let graph = dataflow_graph(blocks);
  let analysis = analyze_blocks(blocks, &graph);
  println!(
    "analysis\n  {:?}\n  {:?}",
    analysis.blocks[&0].record.iter().next(),
    analysis.blocks[&(blocks.len() - 1)].record.iter().last(),
  );

  let data_in = analysis.blocks[&0].record.iter().next().unwrap().data.len();
  let ret_in = analysis.blocks[&0].record.iter().next().unwrap().ret.len();
  let data_out = analysis.blocks[&(blocks.len() - 1)]
    .record
    .iter()
    .last()
    .unwrap()
    .data
    .len();
  let ret_out = analysis.blocks[&(blocks.len() - 1)]
    .record
    .iter()
    .last()
    .unwrap()
    .ret
    .len();

  println!("data_in:  {:?}", data_in);
  println!("data_out: {:?}", data_out);
  println!(" ret_in:  {:?}", ret_in);
  println!(" ret_out: {:?}", ret_out);

  (data_in, data_out, ret_in, ret_out)
}

#[cfg(test)]
#[allow(unused_imports)]
mod tests {
  use super::*;

  #[test]
  fn test_function_arity() {
    let program = parse_to_superpax("1 print".as_bytes().to_owned(), None);

    assert_eq!(function_arity(&program, "drop"), (1, 0, 0, 0));
    assert_eq!(function_arity(&program, "2drop"), (2, 0, 0, 0));
    assert_eq!(function_arity(&program, "swap"), (2, 2, 0, 0));
    assert_eq!(function_arity(&program, "rot"), (3, 3, 0, 0));
    assert_eq!(function_arity(&program, "-"), (2, 1, 0, 0));
    assert_eq!(function_arity(&program, "xor"), (2, 1, 0, 0));
    assert_eq!(function_arity(&program, "r@"), (0, 1, 2, 2));
    assert_eq!(function_arity(&program, "loopimpl"), (0, 1, 3, 3));
    assert_eq!(function_arity(&program, "i"), (0, 1, 3, 3));
    assert_eq!(function_arity(&program, "j"), (0, 1, 5, 5));
    assert_eq!(function_arity(&program, "*"), (2, 1, 0, 0));
  }
}
