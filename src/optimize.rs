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
struct RegMeta {
    literal: Option<isize>,
}

#[derive(Debug, Clone)]
pub struct RegFile {
    index: usize,
    registers: IndexMap<Reg, RegMeta>,
}

impl RegFile {
    fn new() -> Self {
        Self {
            index: 0,
            registers: IndexMap::new(),
        }
    }

    fn allocate(&mut self, prefix: &str, literal: Option<isize>) -> Reg {
        let reg = format!("{}{}", prefix, self.index);
        self.index += 1;
        self.registers.insert(reg.clone(), RegMeta { literal });
        reg
    }
}

type SharedRegFile = Arc<RefCell<RegFile>>;

#[derive(Clone, Debug)]
struct StackState {
    data: RegList,
    ret: RegList,
    temp: Option<Reg>,
}

impl StackState {
    fn new() -> Self {
        Self {
            data: vec![],
            ret: vec![],
            temp: None,
        }
    }
}

#[derive(Clone, Debug)]
struct Analysis {
    registers: SharedRegFile,
    state: StackState,
    record: Vec<StackState>,
}

impl Analysis {
    fn from_previous_masked(previous: &Analysis) -> Self {
        let prev_state = previous.exit_state();

        let mut enter_state = prev_state.clone();
        // FIXME this is a hack for testing, and shouldn't be committed:
        let exempt = vec!["L0", "L1", "V8", "V10"];
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

    fn result(&self) -> Vec<StackState> {
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
                let a = analysis.pop_data();
                let b = analysis.pop_data();

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
                unreachable!();
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
        'block: while i < stack_blocks.len() {
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

/// Given a block and analaysis, propagate the literal values loaded in this function
/// if detected and then blacklist their containing registers.
fn propagate_literals_in_block(
    block: &Block,
    analysis: &Analysis,
    registers: SharedRegFile,
    reg_blacklist: &mut IndexSet<Reg>,
) -> SuperSpan {
    let mut new_commands = block
        .commands()
        .iter()
        .enumerate()
        .rev()
        .map(|(i, input_command)| {
            // eprintln!("{:?}\n----> {:?}", command.0, reg_blacklist);
            let command = (input_command.0).clone();
            let stack: StackState = analysis.result()[i].clone();
            let next_stack: Option<StackState> = analysis.result().get(i + 1).map(|x| x.clone());

            match &command {
                // If the register is in a blacklist, drop this command.
                SuperPax::AltPop | SuperPax::PushLiteral(_) => {
                    let reg = next_stack.as_ref().unwrap().data.last().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        return None;
                    }
                }
                SuperPax::AltPush => {
                    let reg = next_stack.as_ref().unwrap().ret.last().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        return None;
                    }
                }
                SuperPax::Exit => {
                    // Blacklist previous temp value.
                    if let Some(ref temp_reg) = stack.temp {
                        reg_blacklist.insert(temp_reg.clone());
                    }
                }
                SuperPax::StoreTemp => {
                    // Blacklist previous temp value.
                    if let Some(ref temp_reg) = stack.temp {
                        reg_blacklist.insert(temp_reg.clone());
                    }

                    let reg = next_stack.as_ref().unwrap().temp.as_ref().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        return None;
                    }
                }

                SuperPax::LoadTemp => {
                    let next_reg = next_stack.as_ref().unwrap().temp.as_ref().unwrap();
                    let reg = next_stack.as_ref().unwrap().data.last().unwrap();

                    // If we are used to load a temp value, de-blacklist this register.
                    if !reg_blacklist.contains(&*next_reg) {
                        reg_blacklist.remove(reg);
                    }
                    // Else if this register is in a blacklist, drop this command.
                    if reg_blacklist.contains(&*reg) {
                        return None;
                    }
                }

                // Blacklist is viral.
                SuperPax::Add | SuperPax::Nand => {
                    let reg = next_stack.as_ref().unwrap().data.last().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        // TODO want an easy way to specify last_two
                        let input_regs = stack.data.iter().rev().take(2).rev().collect::<Vec<_>>();
                        for reg in input_regs {
                            reg_blacklist.insert(reg.to_owned());
                        }
                        return None;
                    }
                }

                // Drop command can ignore their values entirely.
                SuperPax::Drop => {
                    let reg = stack.data.last().unwrap();
                    reg_blacklist.insert(reg.clone());
                    if !reg.starts_with("D") {
                        // FIXME is this the wrong thing
                        return None;
                    }
                }
                _ => {}
            }

            // When a TOS register load is a literal, replace with
            // a direct literal load and blacklist the register.
            let target_reg = match &command {
                SuperPax::AltPop => next_stack.as_ref().and_then(|s| s.data.last()),
                SuperPax::LoadTemp => stack.temp.as_ref(),
                _ => None,
            };
            if let Some(target_reg) = target_reg {
                if let Some(RegMeta {
                    literal: Some(lit), ..
                }) = registers.borrow().registers.get(target_reg)
                {
                    // eprintln!("      ^-> {:?} <= {:?}", target_reg, lit);
                    reg_blacklist.insert(target_reg.clone());
                    return Some((SuperPax::PushLiteral(*lit), input_command.1));
                }
            }

            Some((command, input_command.1))
        })
        .collect::<Vec<_>>()
        .into_iter()
        .filter_map(|x| x)
        .rev()
        .collect::<Vec<_>>();

    // Peephole optimizations.
    let mut splices = vec![];
    new_commands
        .windows(2)
        .enumerate()
        .for_each(|(i, window)| match window {
            [(SuperPax::AltPush, _), (SuperPax::AltPop, _)] => {
                splices.push(i);
            }
            _ => {}
        });
    let mut splice_delta = 0;
    for mut splice in splices {
        splice -= splice_delta;
        new_commands.splice(splice..splice + 2, vec![]);
        splice_delta += 2;
    }

    new_commands
}

/// Analyse stack values and produce a register mapping for values as they
/// move through the function.
fn analyze_graph(blocks: &[Block], graph: &Graph<(), i32>) -> Vec<Block> {
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

    eprintln!();
    eprintln!("[[[[[ANALYZE]]]]]]");
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

    eprintln!("registers:");
    for (k, v) in &registers.borrow().registers {
        eprintln!("  {}: {:?}", k, v);
    }
    eprintln!();
    eprintln!();

    // TODO break this out into a const prop method

    {
        eprintln!(
            "program: {} commands (unmodified)",
            blocks.iter().map(|x| x.commands().len()).sum::<usize>()
        );
        for (block_index, _block) in blocks.iter().enumerate() {
            eprintln!("  block[{}]", block_index);

            for command in blocks[block_index].commands() {
                eprintln!("    {:?}", command.0);
            }
        }
        eprintln!();
        eprintln!();

        let mut blocks = blocks.to_owned();
        let mut reg_blacklist = IndexSet::new();
        eprintln!("propagate:");
        for i in seq.clone().into_iter().rev() {
            let block = &mut blocks[i];
            if let Some(analysis) = analyses.get(&i) {
                let new_commands = propagate_literals_in_block(
                    &block,
                    analysis,
                    registers.clone(),
                    &mut reg_blacklist,
                );
                eprintln!("block[{}]:", i);
                eprintln!("    literals: {:?}", reg_blacklist);
                *block.commands_mut() = new_commands;
            }
        }
        eprintln!();
        eprintln!();

        eprintln!(
            "program: {} commands (optimized)",
            blocks.iter().map(|x| x.commands().len()).sum::<usize>()
        );
        for (block_index, _block) in blocks.iter().enumerate() {
            eprintln!("  block[{}]", block_index);

            for command in blocks[block_index].commands() {
                eprintln!("    {:?}", command.0);
            }
        }

        blocks
    }
}

// Iterate block sequence in perform constant propagation.
// seq.reverse();

// let mut block_blacklist = IndexMap::new();
// for block in seq {
//     eprintln!("block[{:?}]", block);
//     // let (_commands, blacklist) = propagate_literals_in_block(&blocks[block], registers);
//     // eprintln!("    blacklist {:?}", blacklist);
//     // block_blacklist.insert(block, blacklist.clone());

//     // if !blacklist.is_empty() {
//     for (command, ..) in blocks[block].commands() {
//         eprintln!("        command: {:?}", command);
//     }
//     // eprintln!("    vs:");
//     // for command in _commands {
//     //     eprintln!("        command: {:?}", command);
//     // }
//     // }
// }

/// Reduces branching in a function by removing unused BranchTargets.
/// This function will also rewrite target offsets.
pub fn reduce_branches(program: &mut SuperPaxProgram, method: &str) {
    // FIXME need to do this
    eprintln!(" hii   !!!!!");
    if let Some(blocks) = program.get_mut(method) {
        let readonly_blocks = blocks.clone();

        let mut used_blocks = IndexSet::new();
        for block in readonly_blocks {
            match block.commands().last() {
                Some((SuperPax::JumpAlways(target), ..))
                | Some((SuperPax::JumpIf0(target), ..)) => {
                    used_blocks.insert(*target);
                }
                _ => {}
            }
        }
        eprintln!("used {:?}", used_blocks);

        let mut continue_pass = true;
        let mut i = 0;
        while continue_pass && i < blocks.len() {
            match blocks[i].commands().last() {
                Some((SuperPax::BranchTarget(target), ..)) => {
                    if !used_blocks.contains(target) {
                        eprintln!("stripping {:?}", target);

                        let block = blocks.remove(i);
                        let commands = block.commands().clone().into_iter().rev().skip(1).rev();

                        blocks
                            .get_mut(i)
                            .unwrap()
                            .commands_mut()
                            .splice(0..0, commands);
                        i = 0;
                        continue;
                    }
                }
                _ => {}
            }

            i += 1;
        }
    }
}

/// Helper method to otpimize a single function by propagating literals.
pub fn optimize_function(program: &mut SuperPaxProgram, method: &str) {
    if let Some(blocks) = program.get_mut(method) {
        let graph = dataflow_graph(&blocks);
        *blocks = analyze_graph(&blocks, &graph);
    }
    reduce_branches(program, method);

    if let Some(blocks) = program.get_mut(method) {
        dump_blocks(blocks);
    }
}

pub fn inline_into_function(program: &mut SuperPaxProgram, method: &str) {
    let mut continue_pass = true;
    'pass_loop: while continue_pass {
        continue_pass = false;

        let main = program.get(method).unwrap().clone();
        dump_blocks(&main);

        let mut i = 0;
        let mut j = 0;
        while let Some(block) = main.get(i) {
            i += 1;
            j += 1;

            // Determine what the next block target is going to be.
            match block.commands().last() {
                Some((SuperPax::Call(target), ..)) => {
                    eprintln!("call to {:?}", target);
                    eprintln!();

                    // Flag that this pass succeeded.
                    continue_pass = true;

                    // We want to inline this function. First grab our offsets.
                    let mut inlined_blocks = program.get(target).unwrap().clone();
                    dump_blocks(&inlined_blocks);
                    // Inline code length (trim off start and end block).
                    let inlined_blocks_len = inlined_blocks.len() - 2;

                    // Rewrite the sequence we're inlining.
                    for (_i, inline_block) in inlined_blocks.iter_mut().enumerate() {
                        match inline_block.commands_mut().last_mut() {
                            Some((SuperPax::BranchTarget(ref mut target), ..))
                            | Some((SuperPax::JumpIf0(ref mut target), ..))
                            | Some((SuperPax::JumpAlways(ref mut target), ..)) => {
                                *target += j - 1;
                            }
                            _ => {}
                        }
                    }

                    // Refetch a mutable version of this method.
                    let main_mut = program.get_mut(method).unwrap();
                    // Now rewrite all targets.
                    for (_i, main_block) in main_mut.iter_mut().enumerate() {
                        match main_block.commands_mut().last_mut() {
                            Some((SuperPax::BranchTarget(ref mut target), ..))
                            | Some((SuperPax::JumpIf0(ref mut target), ..))
                            | Some((SuperPax::JumpAlways(ref mut target), ..)) => {
                                if *target >= j {
                                    *target += inlined_blocks_len;
                                }
                            }
                            _ => {}
                        }
                    }

                    // ANCHOR figure out why addition.fs doesn't work
                    // ANCHOR when we inject the altpush and altpop logic

                    // Generate enter block.
                    let mut enter_block = inlined_blocks[0].clone();
                    let enter_commands = block
                        .commands()
                        .to_owned()
                        .into_iter()
                        .rev()
                        .skip(1)
                        .rev()
                        .chain(
                            vec![
                                (SuperPax::PushLiteral(0xFFFF), Default::default()),
                                (SuperPax::AltPush, Default::default()),
                            ]
                            .into_iter(),
                        );
                    enter_block.commands_mut().splice(0..1, enter_commands);
                    // Generate exit block.
                    let exit_commands = inlined_blocks[inlined_blocks.len() - 1]
                        .commands()
                        .to_owned()
                        .into_iter()
                        .rev()
                        .skip(1)
                        .rev()
                        .chain(
                            vec![
                                (SuperPax::AltPop, Default::default()),
                                (SuperPax::Drop, Default::default()),
                            ]
                            .into_iter(),
                        );
                    let mut exit_block = main_mut[j].clone();
                    exit_block.commands_mut().splice(0..0, exit_commands);
                    // Remove first + last blocks from our inline sequence.
                    let inline_seq = inlined_blocks[1..inlined_blocks.len() - 1].to_owned();

                    // Combine current block.
                    main_mut[j - 1] = enter_block;
                    // Combine next block.
                    main_mut[j] = exit_block;
                    // Splice in new chunk.
                    main_mut.splice(j..j, inline_seq);

                    // Arbitrarily stop after this, though we could keep going,
                    // instead just perform another pass
                    // let j = inlined_blocks_len + 1;
                    continue 'pass_loop;
                }
                _ => {}
            }
        }
    }
}

fn dump_blocks(blocks: &[Block]) {
    eprintln!("program:");
    for (i, block) in blocks.iter().enumerate() {
        eprintln!("  block[{}] with {} entries:", i, block.commands().len());
        for command in block.commands() {
            eprintln!("    {:30} {:?}", format!("{:?}", command.0), command.1);
        }
    }
    eprintln!();
    eprintln!();
}

pub fn optimize_forth(program: Program) {
    let mut superprogram = convert_to_superpax(program);

    inline_into_function(&mut superprogram, "main");

    if let Some(blocks) = superprogram.get_mut("main") {
        dump_blocks(&blocks);

        // println!("{:?}", graph);
        // println!();
        // for reg in &*registers {
        //   println!("reg {:?}: {:?}", reg.0, reg.1.literal);
        // }
        // println!();
        // println!();
        // println!();

        // let graph = dataflow_graph(blocks.clone());
        // analyze_graph(&blocks, &graph);
    }

    // Inlining.
}
