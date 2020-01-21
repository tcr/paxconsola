#![allow(dead_code)]

use crate::*;
use indexmap::{IndexMap, IndexSet};
use petgraph::graph::{Graph, NodeIndex};
use petgraph::Direction;
use std::cell::RefCell;
use std::sync::Arc;

// Extends the regular Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone)]
pub enum SuperPax {
    Drop,

    BranchTarget(usize),

    // PushLiteral(temp reg pushed to stack, value)
    PushLiteral(isize),

    AltPop,
    AltPush,
    LoadTemp,
    StoreTemp,

    // Pax ports
    Metadata(String),
    Exit,

    Call(String),

    Add,
    Nand,

    Load,
    Load8,
    Store8,
    Store,

    JumpIf0(usize),

    // pax debug
    Print,
}

pub type SuperSpan = Vec<Located<SuperPax>>;

// FIXME TODO make all labels one of Parameter(i), Temporary(i), or Return(i) instead of S0, A1, etc

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

#[derive(Debug, Clone)]
pub enum Block {
    ExitBlock(SuperSpan),
    JumpIf0Block(SuperSpan),
    BranchTargetBlock(SuperSpan),
    CallBlock(SuperSpan),
}

impl Block {
    fn commands(&'_ self) -> &'_ SuperSpan {
        match self {
            Block::ExitBlock(ref commands) => commands,
            Block::JumpIf0Block(ref commands) => commands,
            Block::BranchTargetBlock(ref commands) => commands,
            Block::CallBlock(ref commands) => commands,
        }
    }

    fn commands_mut(&'_ mut self) -> &'_ mut SuperSpan {
        match self {
            Block::ExitBlock(ref mut commands) => commands,
            Block::JumpIf0Block(ref mut commands) => commands,
            Block::BranchTargetBlock(ref mut commands) => commands,
            Block::CallBlock(ref mut commands) => commands,
        }
    }
}

#[derive(Debug, Clone)]
struct StackGroup {
    current_block: SuperSpan,
    blocks: Vec<Block>,
}

#[derive(Debug, Clone)]
struct StackItem {
    id: String,
    ancestors: IndexSet<String>,
    literal: Option<isize>,
}

type StackMap = IndexMap<String, StackItem>;

impl StackGroup {
    fn new() -> StackGroup {
        StackGroup {
            current_block: vec![],
            blocks: vec![],
        }
    }

    fn record_op(&mut self, op: &Located<SuperPax>) {
        self.current_block.push(op.to_owned());
    }

    fn drop_last_op(&mut self) {
        self.current_block.pop();
    }

    fn exit_block(&mut self) {
        self.blocks.push(Block::ExitBlock(
            self.current_block.clone(),
            // self.start_stack.clone(),
            // self.values.clone(),
        ));
        self.reset();
    }

    fn jump_if_0_block(&mut self) {
        self.blocks.push(Block::JumpIf0Block(
            self.current_block.clone(),
            // self.start_stack.clone(),
            // self.values.clone(),
        ));
        self.reset();
    }

    fn branch_target_block(&mut self) {
        self.blocks.push(Block::BranchTargetBlock(
            self.current_block.clone(),
            // self.start_stack.clone(),
            // self.values.clone(),
        ));
        self.reset();
    }

    fn call_block(&mut self) {
        self.blocks.push(Block::CallBlock(
            self.current_block.clone(),
            // self.start_stack.clone(),
            // self.values.clone(),
        ));
        self.reset();
    }

    fn reset(&mut self) {
        self.current_block = vec![];
    }
}

fn analyze_blocks(program: Program) -> IndexMap<String, (Vec<Block>, StackMap)> {
    let mut program_stacks = IndexMap::new();
    for (name, code) in program {
        let mut stack = StackGroup::new();

        // Create dataflow analysis
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            match op.0 {
                Pax::PushLiteral(value) => {
                    // Temp values
                    if value == 49216 {
                        // SuperPax::LoadTemp
                        if let Some((_, &(Pax::Load, _))) = code_iter.peek() {
                            stack.record_op(&(SuperPax::LoadTemp, op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                        // SuperPax::StoreTemp
                        if let Some((_, &(Pax::Store, _))) = code_iter.peek() {
                            stack.record_op(&(SuperPax::StoreTemp, op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                    }
                }
                Pax::JumpIf0(target) => {
                    // SuperPax::Drop
                    if let Some((_, &(Pax::BranchTarget, _))) = code_iter.peek() {
                        if target == i + 1 {
                            stack.record_op(&(SuperPax::Drop, op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                    }
                }
                _ => {}
            }

            // eprintln!("{:?}", op.0);
            match op.0 {
                Pax::PushLiteral(value) => {
                    stack.record_op(&(SuperPax::PushLiteral(value), op.1.clone()));
                }
                Pax::BranchTarget => {
                    // FIXME this should inline the block number, not the opcode number
                    stack.record_op(&(SuperPax::BranchTarget(i), op.1.clone()));
                    stack.branch_target_block();
                }
                Pax::AltPush => {
                    stack.record_op(&(SuperPax::AltPush, op.1.clone()));
                }
                Pax::AltPop => {
                    stack.record_op(&(SuperPax::AltPop, op.1.clone()));
                }

                Pax::Debugger | Pax::Sleep => {
                    unreachable!();
                }

                Pax::Metadata(ref arg) => {
                    // noop
                    stack.record_op(&(SuperPax::Metadata(arg.clone()), op.1));
                }
                Pax::Print => {
                    stack.record_op(&(SuperPax::Print, op.1));
                }
                Pax::Load => {
                    stack.record_op(&(SuperPax::Load, op.1));
                }
                Pax::Load8 => {
                    stack.record_op(&(SuperPax::Load8, op.1));
                }
                Pax::Store => {
                    stack.record_op(&(SuperPax::Store, op.1));
                }
                Pax::Store8 => {
                    stack.record_op(&(SuperPax::Store8, op.1));
                }
                Pax::Add => {
                    stack.record_op(&(SuperPax::Add, op.1));
                }
                Pax::Nand => {
                    stack.record_op(&(SuperPax::Nand, op.1));
                }
                Pax::Exit => {
                    stack.record_op(&(SuperPax::Exit, op.1));
                    stack.exit_block();
                }
                Pax::Call(ref arg) => {
                    stack.record_op(&(SuperPax::Call(arg.clone()), op.1));
                    stack.call_block();
                }
                Pax::JumpIf0(ref target) => {
                    stack.record_op(&(SuperPax::JumpIf0(target.clone()), op.1));
                    stack.jump_if_0_block();
                }
            }
        }

        program_stacks.insert(name, (stack.blocks, IndexMap::new()));
    }

    program_stacks
}

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
        enter_state.data.iter_mut().for_each(|d| {
            // FIXME this is a hack for testing, and shouldn't be committed:
            if *d != "L0" && *d != "L1" {
                *d = previous.registers.borrow_mut().allocate("D", None);
            }
        });
        enter_state.ret.iter_mut().for_each(|d| {
            // FIXME this is a hack for testing, and shouldn't be committed:
            if *d != "L1" {
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

                if let Some(RegMeta {
                    literal: Some(a_value),
                    ..
                }) = analysis.registers.borrow().registers.get(&a)
                {
                    if let Some(RegMeta {
                        literal: Some(b_value),
                        ..
                    }) = analysis.registers.borrow().registers.get(&b)
                    {
                        panic!("opt: A={}={:?} B={}={:?}", a, a_value, b, b_value);
                    }
                }

                let reg = analysis.new_var();
                analysis.push_data(reg);
            }

            Store | Store8 => {
                analysis.pop_data();
                analysis.pop_data();
            }

            // FIXME correct these
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
            BranchTarget(target) => {}
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
fn dataflow_graph(stack_blocks: Vec<Block>) -> Graph<(), i32> {
    // List of blocks we've already seen, so
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
                // println!("unified[{}], ending block search.", i);
                break;
            }
            // println!("block[{}]", i);

            visited.insert(i);

            // Determine what the next block target is going to be.
            match block.commands().last() {
                Some((SuperPax::JumpIf0(target), ..)) => {
                    // If the previous command was push literal 0, we can interpret
                    // this to be an absolute jump.
                    let mut is_absolute = false;
                    if block.commands().len() > 1 {
                        if let Some((SuperPax::PushLiteral(.., 0), ..)) =
                            block.commands().get(block.commands().len() - 2)
                        {
                            is_absolute = true;
                        }
                    }

                    // Jump immediate
                    for (b_index, b) in stack_blocks.iter().enumerate() {
                        if let Some((SuperPax::BranchTarget(bt), ..)) = b.commands().last() {
                            if bt == target {
                                // Inject next edge (for both absolute jump OR branch)
                                edges.push((i as u32, (b_index + 1) as u32));

                                // Invoke branch as though we jumped (nonzero).
                                // b_index + 1 is the block following the BranchTarget we're jumping to.
                                if is_absolute {
                                    i = b_index + 1;
                                    // println!("  absolute jump: {:?}", i);
                                    continue 'block;
                                } else {
                                    // only iterate future branches, not reverse ones (which are loops)
                                    if b_index + 1 > i {
                                        conditions.push_front(b_index + 1);
                                    }
                                }
                            }
                        }
                    }
                }
                _ => {}
            }

            // Add new edge.
            if i < stack_blocks.len() - 1 {
                edges.push((i as u32, (i + 1) as u32));
            }

            i += 1;
        }
        // println!("next cond.\n");
    }

    Graph::<(), i32>::from_edges(&edges)
}

/// Modify a block list and a register list by connecting block stacks.
/*
fn connect_blocks(graph: &Graph<(), i32>, blocks: &[Block], registers: &mut StackMap) {
    // Walk graph, do assignment of previous registers
    let mut exit_stacks = IndexMap::<_, RegList>::new();
    let mut bfs = petgraph::visit::Bfs::new(&graph, 0.into());
    while let Some(block_index) = bfs.next(&graph) {
        eprintln!("node[{:?}]:", block_index.index());

        // Get exit stack for current block.
        let relative_enter_stack = blocks[block_index.index() as usize].enter_stack();
        let relative_exit_stack = blocks[block_index.index() as usize]
            .exit_stack()
            .unwrap_or(vec![]);
        // eprintln!("------- our exit stack: {:?}", relative_exit_stack);

        // Iterate incoming edges on the graph.
        let mut exit_stack: RegList = relative_exit_stack.clone();
        for n in graph.neighbors_directed(block_index, Direction::Incoming) {
            // Lookup their stacks
            if let Some(incoming_stack) = exit_stacks.get(&n) {
                eprintln!(
                    "    neighbor[{}] data stack: {:?}",
                    n.index(),
                    incoming_stack
                );

                // Rewrite the exit stack to be [incoming stack [new stack overlayed at end] ]
                let prefix = incoming_stack
                    .clone()
                    .into_iter()
                    .rev()
                    .skip(relative_exit_stack.len())
                    .rev()
                    .collect::<Vec<_>>();
                exit_stack = prefix.clone();
                exit_stack.extend(relative_exit_stack.clone());

                // If there is no backward jump to the previous block,
                // forward literal values across the barrier by updating the registers map.
                // if n.index() < block_index.index() {
                //     for (next_reg, prev_reg) in relative_enter_stack
                //         .iter()
                //         .zip(incoming_stack.iter().skip(prefix.len()))
                //     {
                //         // rewrite_regs.insert(next_reg.to_owned(), prev_reg.to_owned());
                //         if let Some(StackItem {
                //             literal: Some(prev_literal),
                //             ..
                //         }) = registers.get(prev_reg).map(|x| x.clone())
                //         {
                //             if let Some(StackItem {
                //                 literal: ref mut next_literal,
                //                 ..
                //             }) = registers.get_mut(next_reg)
                //             {
                //                 assert!(next_literal.is_none());
                //                 *next_literal = Some(prev_literal.clone());
                //             }
                //         }
                //     }
                // }
            } else {
                eprintln!("    loop[{}]", n.index());
            }
        }

        eprintln!(
            "node[{:?}] data stack: {:?}",
            block_index.index(),
            exit_stack
        );
        eprintln!();
        exit_stacks.insert(block_index, exit_stack);
    }
}
*/

fn propagate_literals_in_block(
    block: &Block,
    analysis: &Analysis,
    registers: SharedRegFile,
    reg_blacklist: &mut IndexSet<Reg>,
) -> SuperSpan {
    let new_commands = block
        .commands()
        .iter()
        .enumerate()
        .rev()
        .map(|(i, input_command)| {
            // eprintln!("{:?}\n----> {:?}", command.0, reg_blacklist);
            let mut command = (input_command.0).clone();
            let stack: StackState = analysis.result()[i].clone();
            let next_stack: Option<StackState> = analysis.result().get(i + 1).map(|x| x.clone());

            match &command {
                SuperPax::AltPop | SuperPax::LoadTemp | SuperPax::PushLiteral(_) => {
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
                SuperPax::StoreTemp => {
                    let reg = next_stack.as_ref().unwrap().temp.as_ref().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        return None;
                    }
                    return None;
                }
                _ => {}
            }

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

    new_commands
}

fn analyze_graph(blocks: &[Block], graph: &Graph<(), i32>) {
    // First we want to analyze the whole program and identify basic blocks.
    // let mut exit_stacks = IndexMap::<_, DataRegs>::new();
    let mut bfs = petgraph::visit::Bfs::new(&graph, 0.into());
    let mut seq = vec![];
    while let Some(block_index) = bfs.next(&graph) {
        seq.push(block_index.index() as usize);
    }

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
        for (block_index, block) in blocks.iter().enumerate() {
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
        for (block_index, block) in blocks.iter().enumerate() {
            eprintln!("  block[{}]", block_index);

            for command in blocks[block_index].commands() {
                eprintln!("    {:?}", command.0);
            }
        }
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

// fn dump_blocks(blocks: &[Block]) {
//     for (i, block) in blocks.iter().enumerate() {
//         println!("block[{}]", i);
//         eprintln!("                        data: {:?}", block.enter_stack());
//         for command in block.commands() {
//             eprintln!("    {:?}:", (command.0).0,);
//             eprintln!("                        data: {:?}", command.1,);
//             eprintln!("                        retn: {:?}", command.2,);
//             eprintln!(
//                 "                        temp: {}",
//                 command.3.clone().unwrap_or("".to_string()),
//             );
//             eprintln!();
//         }
//         eprintln!("\n  {} entries.\n  ---", block.commands().len(),);
//     }
// }

pub fn optimize_forth(program: Program) {
    let mut block_analysis = analyze_blocks(program);
    if let Some((blocks, _)) = block_analysis.get_mut("main") {
        // dump_blocks(&blocks);

        let graph = dataflow_graph(blocks.clone());
        // connect_blocks(&graph, &blocks, registers);

        // println!("{:?}", graph);
        // println!();
        // for reg in &*registers {
        //   println!("reg {:?}: {:?}", reg.0, reg.1.literal);
        // }
        // println!();
        // println!();
        // println!();

        analyze_graph(&blocks, &graph);
    }
}
