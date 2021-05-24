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
    pub aliases: Vec<(Reg, Reg)>, // list of associations
}

impl RegFile {
    pub fn new() -> Self {
        Self {
            index: 0,
            registers: IndexMap::new(),
            aliases: vec![],
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
    fn new() -> Self {
        Self {
            state: StackState::new(),
            record: vec![StackState::new()],
        }
    }

    // Accept registers from a previous block, but mask them
    // because we might have two block parents.
    fn from_previous_masked(
        registers: &mut RegFile,
        previous: &[BlockAnalysis],
        add_aliases: bool,
    ) -> Self {
        assert!(
            !previous.is_empty(),
            "expected non empty list for BlockAnalysis masking"
        );

        // Model after the first previous entry state
        let mut enter_state = previous[0].exit_state();
        enter_state.data.iter_mut().for_each(|d| {
            *d = registers.allocate("D", None);
        });
        enter_state.ret.iter_mut().for_each(|d| {
            *d = registers.allocate("R", None);
        });
        enter_state.temp = None;

        let this = Self {
            state: enter_state.clone(),
            record: vec![enter_state],
        };

        // Assert all equal
        eprintln!("previous");
        for p in previous {
            eprintln!("  {:?}", p);
        }
        assert!(
            previous.windows(2).all(|l| l[0].exit_state().data.len()
                == l[1].exit_state().data.len()
                && l[0].exit_state().ret.len() == l[1].exit_state().ret.len()),
            "not all register maps equal in size"
        );

        if add_aliases {
            for prev in previous {
                this.add_alias(registers, prev.exit_state());
            }
        }

        this
    }

    fn add_alias(&self, registers: &mut RegFile, state: StackState) {
        let enter_state = self.record.get(0).unwrap_or_else(|| &self.state);

        // FIXME assert proper stack lengths
        if state.data.len() != enter_state.data.len() || state.ret.len() != enter_state.ret.len() {
            eprintln!();
            eprintln!("WARNING: THIS SHOULD FAIL in add_alias.");
            eprintln!();
            return;
        }

        enter_state.data.iter().enumerate().for_each(|(i, d)| {
            registers.aliases.push((state.data[i].clone(), d.clone()));
        });
        enter_state.ret.iter().enumerate().for_each(|(i, d)| {
            registers.aliases.push((state.ret[i].clone(), d.clone()));
        });
    }

    fn from_previous(previous: &BlockAnalysis) -> Self {
        Self {
            state: previous.exit_state(),
            record: vec![previous.exit_state()],
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
        use Pax::*;
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
                Some((Pax::JumpIf0(target), ..)) => {
                    // Inject next edge (for both absolute jump OR branch)
                    let alt_target = target + 1;
                    edges.push((i as u32, alt_target as u32));

                    // Invoke branch as though we jumped (nonzero).
                    // only iterate future branches, not reverse ones (which are loops)
                    if alt_target > i {
                        conditions.push_front(alt_target);
                    }
                }
                Some((Pax::JumpAlways(target), ..)) => {
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

fn graph_directed_edges(graph: &Graph<(), i32>, block_index: usize, dir: Direction) -> Vec<usize> {
    let mut incoming: Vec<usize> = graph
        .neighbors_directed(NodeIndex::new(block_index), dir)
        .map(|idx| idx.index() as usize)
        .collect::<Vec<_>>();
    incoming.dedup();
    incoming.sort();
    incoming
}

/// Iterate all blocks in descending topological order and produce a FunctionAnalysis
/// of register use. Dead code elimination can happen in reverse.
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

    eprintln!("[analyze_blocks] start");

    let mut analysis = FunctionAnalysis {
        blocks: IndexMap::<usize, BlockAnalysis>::new(),
        registers: RegFile::new(),
    };

    #[derive(Debug)]
    enum TargetType {
        Start,
        Block,
        Then,
        Begin,
        AfterLoop,
    }

    for block_index in seq.clone() {
        // Get the set of incoming edges to this block and iterate in ascending order.
        let incoming = graph_directed_edges(graph, block_index, Direction::Incoming);

        let target_type = if incoming.len() == 0 {
            // If there are no incoming blocks, we are not a branch target.
            TargetType::Start
        } else if incoming
            .iter()
            .find(|x| analysis.blocks.get(*x).is_none())
            .is_some()
        {
            // If an incoming block is not populated yet, we assume we are starting
            // a loop ("begin").
            TargetType::Begin
        } else if incoming.len() == 1 && incoming[0] == block_index - 1 && {
            let outgoing = graph_directed_edges(graph, incoming[0], Direction::Outgoing);
            outgoing.len() > 1 && outgoing.iter().any(|x| *x < incoming[0])
        } {
            TargetType::AfterLoop
        } else if incoming.len() >= 2 {
            // If there are two or more incoming edges, we assume we are joining a branch ("then").
            TargetType::Then
        } else {
            // A sole incoming edge is probably an "else" block.
            TargetType::Block
        };

        // Generate the next block analysis.
        eprintln!("  [incoming] {:?}", incoming);
        eprintln!(
            "[analyze_blocks] block [{}] is target {:?}",
            block_index, target_type
        );
        eprintln!();
        let mut next_analysis = match target_type {
            TargetType::Start => BlockAnalysis::new(),
            TargetType::Then | TargetType::Begin => {
                // eprintln!("[analyze_graph] block[{}] is starting a loop.", block_index);

                let prev_analyses = incoming
                    .into_iter()
                    .filter_map(|x| analysis.blocks.get(&x))
                    .cloned()
                    .collect::<Vec<_>>();

                // Missing a previous analysis means we might be in a loop.
                BlockAnalysis::from_previous_masked(
                    &mut analysis.registers,
                    prev_analyses.as_slice(),
                    true,
                )
            }
            TargetType::AfterLoop => {
                let prev_analyses = incoming
                    .into_iter()
                    .filter_map(|x| analysis.blocks.get(&x))
                    .cloned()
                    .collect::<Vec<_>>();

                // Missing a previous analysis means we might be in a loop.
                BlockAnalysis::from_previous_masked(
                    &mut analysis.registers,
                    prev_analyses.as_slice(),
                    false,
                )
            }
            TargetType::Block => {
                BlockAnalysis::from_previous(analysis.blocks.get(&incoming[0]).unwrap())
            }
        };

        // Run analyze_block() to finish the analysis, then store it.
        // TODO this could be moved into a method of FunctionAnalyzer
        analyze_block(&blocks[block_index], &mut analysis, &mut next_analysis);

        // Get the set of outgoing edges and find ones which call backward (loop).
        // FIXME need to enable outgoing loop aliasing
        // let outgoing = graph_directed_edges(graph, block_index, Direction::Outgoing);
        // if outgoing.len() > 1 {
        //     if let Some(begin_block_index) = outgoing.iter().find(|x| **x < block_index) {
        //         // Add as aliases to the register set we started with.
        //         analysis.blocks[&(*begin_block_index - 1)]
        //             .add_alias(&mut analysis.registers, next_analysis.exit_state());
        //     }
        // }

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
pub fn function_arity(program: &PaxProgram, method: &str) -> (usize, usize, usize, usize) {
    let mut program = program.to_owned();
    inline_into_function(&mut program, method);
    let blocks = program.get(method).unwrap();
    let graph = dataflow_graph(blocks);
    let analysis = analyze_blocks(blocks, &graph);
    eprintln!(
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

    eprintln!("data_in:  {:?}", data_in);
    eprintln!("data_out: {:?}", data_out);
    eprintln!(" ret_in:  {:?}", ret_in);
    eprintln!(" ret_out: {:?}", ret_out);

    (data_in, data_out, ret_in, ret_out)
}

#[cfg(test)]
#[allow(unused_imports)]
mod tests {
    use super::*;

    #[test]
    fn test_function_arity() {
        let program = parse_to_pax("1 print", None);

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
