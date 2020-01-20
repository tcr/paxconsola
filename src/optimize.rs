#![allow(dead_code)]

use crate::*;
use indexmap::{IndexMap, IndexSet};
use petgraph::algo::{dijkstra, min_spanning_tree};
use petgraph::data::FromElements;
use petgraph::dot::{Config, Dot};
use petgraph::graph::{DiGraph, Graph, NodeIndex};
use petgraph::Direction;
use std::iter::FromIterator;

// FIXME TODO make all labels one of Parameter(i), Temporary(i), or Return(i) instead of S0, A1, etc

// TODO use these to model stacks and merging logic, converge on ExitStack after minimizing loops
// once there's full coverage of all/most functions, can refactor GbIr generation to do explicit
// loads (for example).
// can also do function inlining. Splice in Pax Ir, readjust JumpIf0 targets
// and rename temporaries / converge arguments / convert return values. If inlining works do auto
// inline for up to N opcodes (determined from stack vector) and see if there is speed improvement
// or,
// recursively solve call ependencies to correct local stacks

/// (opcode, data registers, return registers, temp register)
pub type Analyzed<T> = (T, Vec<String>, Vec<String>, Option<String>);

pub type BlockSpan = Vec<Analyzed<Located<SuperPax>>>;

pub type DataRegs = Vec<String>;

#[derive(Debug, Clone)]
pub enum Block {
    // (Vec of dataflow analyzed/position-based commands, data stack registers, global registers analysis.)
    ExitBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
    JumpIf0Block(BlockSpan, DataRegs, IndexMap<String, StackItem>),
    BranchTargetBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
    CallBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
}

impl Block {
    fn commands(&'_ self) -> &'_ BlockSpan {
        match self {
            Block::ExitBlock(ref commands, ..) => commands,
            Block::JumpIf0Block(ref commands, ..) => commands,
            Block::BranchTargetBlock(ref commands, ..) => commands,
            Block::CallBlock(ref commands, ..) => commands,
        }
    }

    fn registers(&'_ self) -> &'_ IndexMap<String, StackItem> {
        match self {
            Block::ExitBlock(.., ref regs) => regs,
            Block::JumpIf0Block(.., ref regs) => regs,
            Block::BranchTargetBlock(.., ref regs) => regs,
            Block::CallBlock(.., ref regs) => regs,
        }
    }

    fn enter_stack(&self) -> DataRegs {
        match self {
            Block::ExitBlock(_, ref start_stack, _) => start_stack.clone(),
            Block::JumpIf0Block(_, ref start_stack, _) => start_stack.clone(),
            Block::BranchTargetBlock(_, ref start_stack, _) => start_stack.clone(),
            Block::CallBlock(_, ref start_stack, _) => start_stack.clone(),
        }
    }

    fn exit_stack(&self) -> Option<Vec<String>> {
        self.commands().last().map(|a| a.1.clone())
    }
}

#[derive(Debug, Clone)]
struct StackGroup {
    index: usize,
    data_stack: Vec<String>,
    return_stack: Vec<String>,
    temp: Option<String>,
    values: IndexMap<String, StackItem>,
    current_block: BlockSpan,
    blocks: Vec<Block>,
    start_stack: Vec<String>,
}

#[derive(Debug, Clone)]
pub struct StackItem {
    id: String,
    ancestors: IndexSet<String>,
    literal: Option<isize>,
}

pub type StackMap = IndexMap<String, StackItem>;

impl StackGroup {
    fn new() -> StackGroup {
        StackGroup {
            index: 0,
            data_stack: vec![],
            return_stack: vec![],
            temp: None,
            values: IndexMap::new(),
            current_block: vec![],
            blocks: vec![],
            start_stack: vec![],
        }
    }

    fn record_op(&mut self, op: &Located<SuperPax>) {
        self.current_block.push((
            op.to_owned(),
            self.data_stack.clone(),
            self.return_stack.clone(),
            self.temp.clone(),
        ));
    }

    fn drop_last_op(&mut self) {
        self.current_block.pop();
    }

    fn exit_block(&mut self) {
        self.blocks.push(Block::ExitBlock(
            self.current_block.clone(),
            self.start_stack.clone(),
            self.values.clone(),
        ));
        self.reset();
    }

    fn jump_if_0_block(&mut self) {
        self.blocks.push(Block::JumpIf0Block(
            self.current_block.clone(),
            self.start_stack.clone(),
            self.values.clone(),
        ));
        self.reset();
    }

    fn branch_target_block(&mut self) {
        self.blocks.push(Block::BranchTargetBlock(
            self.current_block.clone(),
            self.start_stack.clone(),
            self.values.clone(),
        ));
        self.reset();
    }

    fn call_block(&mut self) {
        self.blocks.push(Block::CallBlock(
            self.current_block.clone(),
            self.start_stack.clone(),
            self.values.clone(),
        ));
        self.reset();
    }

    fn reset(&mut self) {
        // self.index = 0;
        self.data_stack = vec![];
        self.return_stack = vec![];
        // self.values = IndexMap::new();
        self.current_block = vec![];
        self.start_stack = vec![];
    }

    fn push_literal(&mut self, value: isize) -> String {
        let target = format!("L{}", self.index);
        self.index += 1;

        self.data_stack.push(target.clone());
        self.values.insert(
            target.clone(),
            StackItem {
                id: target.clone(),
                ancestors: IndexSet::new(),
                literal: Some(value),
            },
        );
        target
    }

    fn push_data(&mut self, ancestors: &[String]) {
        let value = format!("T{}", self.index);
        self.index += 1;

        self.data_stack.push(value.clone());
        self.values.insert(
            value.clone(),
            StackItem {
                id: value.clone(),
                ancestors: IndexSet::from_iter(ancestors.to_owned().into_iter()),
                literal: None,
            },
        );
    }

    fn push_return_stack(&mut self) -> String {
        let reg = self.pop_data(false);
        self.return_stack.push(reg.clone());
        reg
    }

    fn pop_return_stack(&mut self) -> String {
        let ret = if let Some(ret) = self.return_stack.pop() {
            ret
        } else {
            let value = format!("R{}", self.index);
            self.index += 1;

            // TODO insertion
            for command in &mut self.current_block {
                command.2.insert(0, value.clone());
            }

            self.values.insert(
                value.clone(),
                StackItem {
                    id: value.clone(),
                    ancestors: IndexSet::new(),
                    literal: None,
                },
            );
            value
        };
        self.data_stack.push(ret.clone());
        ret
    }

    fn pop_data(&mut self, stored: bool) -> String {
        // If there is a register on the data stack, pop it.
        if let Some(value) = self.data_stack.pop() {
            let mut iter = vec![value.clone()];

            if stored {
                while let Some(iter_value) = iter.pop() {
                    let value_item = self.values.get_mut(&iter_value).unwrap();
                    iter.extend(value_item.ancestors.clone());
                }
            }

            value
        } else {
            // Otherwise, create a new argument and inject it.
            let value = format!("D{}", self.index);
            self.index += 1;

            // TODO insertion
            self.start_stack.insert(0, value.clone());
            for command in &mut self.current_block {
                command.1.insert(0, value.clone());
            }

            self.values.insert(
                value.clone(),
                StackItem {
                    id: value.clone(),
                    ancestors: IndexSet::new(),
                    literal: None,
                },
            );
            value
        }
    }

    fn load_temp(&mut self) -> (String, String) {
        let target = self.temp.clone().unwrap();
        self.data_stack.push(target.clone());

        // Bump temporary counter
        let next_target = format!("{}{}", &self.temp.as_ref().unwrap()[0..1], self.index);
        self.temp = Some(next_target.clone());
        self.index += 1;
        let mut stack_item = self.values.get(&target).unwrap().clone();
        stack_item.id = next_target.clone();
        self.values.insert(next_target.clone(), stack_item);
        (target, next_target)
    }

    fn store_temp(&mut self) -> String {
        let ret = self.pop_data(false);
        self.temp = Some(ret.clone());
        ret
    }
}

// Extends the regular Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone)]
pub enum SuperPax {
    Pax(Pax),
    Drop,

    BranchTarget(usize),

    // PushLiteral(temp reg pushed to stack, value)
    PushLiteral(String, isize),

    // AltPop(register that was popped)
    AltPop(String),
    // AltPush(register that was pushed)
    AltPush(String),
    // LoadTemp(temp reg pushed to data stack, upserted temp reg)
    LoadTemp(String, String),
    // StoreTemp(data reg stored in temp, upserted temp reg)
    StoreTemp(String),
}

pub type SuperSpan = Vec<Located<SuperPax>>;

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
                            let (target, next_target) = stack.load_temp();
                            stack.record_op(&(
                                SuperPax::LoadTemp(target, next_target),
                                op.1.clone(),
                            ));

                            code_iter.next();
                            continue;
                        }
                        // SuperPax::StoreTemp
                        if let Some((_, &(Pax::Store, _))) = code_iter.peek() {
                            let reg = stack.store_temp();
                            stack.record_op(&(SuperPax::StoreTemp(reg), op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                    }
                }
                Pax::JumpIf0(target) => {
                    // SuperPax::Drop
                    if let Some((_, &(Pax::BranchTarget, _))) = code_iter.peek() {
                        if target == i + 1 {
                            stack.pop_data(false);
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
                    let target = stack.push_literal(value);
                    stack.record_op(&(SuperPax::PushLiteral(target, value), op.1.clone()));
                    continue;
                }
                Pax::BranchTarget => {
                    // FIXME this should inline the block number, not the opcode number
                    stack.record_op(&(SuperPax::BranchTarget(i), op.1.clone()));
                    stack.branch_target_block();
                    continue;
                }

                Pax::Metadata(_) | Pax::Debugger => {
                    // noop
                }
                Pax::Sleep | Pax::Print => {
                    stack.pop_data(true);
                }
                Pax::AltPush => {
                    let reg = stack.push_return_stack();
                    stack.record_op(&(SuperPax::AltPush(reg), op.1.clone()));
                    continue;
                }
                Pax::AltPop => {
                    let reg = stack.pop_return_stack();
                    stack.record_op(&(SuperPax::AltPop(reg), op.1.clone()));
                    continue;
                }
                Pax::Load | Pax::Load8 => {
                    let s0 = stack.pop_data(true);
                    stack.push_data(&[s0]);
                }
                Pax::Add | Pax::Nand => {
                    let s0 = stack.pop_data(false);
                    let s1 = stack.pop_data(false);
                    stack.push_data(&[s0, s1]);
                }
                Pax::Store | Pax::Store8 => {
                    stack.pop_data(false);
                    stack.pop_data(true);
                }

                Pax::Exit => {}
                Pax::Call(_) => {}
                Pax::JumpIf0(_target) => {
                    stack.pop_data(false);
                }
            }

            // inject
            stack.record_op(&(SuperPax::Pax(op.0.clone()), op.1));

            // close blocks
            match op.0 {
                Pax::Exit => stack.exit_block(),
                Pax::Call(_) => stack.call_block(),
                Pax::JumpIf0(_target) => stack.jump_if_0_block(),
                _ => {}
            }

            // eprintln!(" ... [stack: {:?}]", stack.stack);
        }

        // // Identify branch targets and jump commands.
        // let mut jump_targets = IndexMap::new();
        // let mut branch_targets = IndexMap::new();
        // for block in &stack.blocks {
        //     for op in block.commands() {
        //         match op.0 {
        //             (SuperPax::BranchTarget(target), _pos) => {
        //                 branch_targets.insert(target, op.1.clone());
        //             }
        //             (SuperPax::Pax(Pax::JumpIf0(target)), _pos) => {
        //                 jump_targets.insert(target, op.1.clone());
        //             }
        //             _ => {}
        //         }
        //     }
        // }
        // Uncomment if can merge keys set to IndexSet
        // assert!(jump_targets.is_subset(&branch_targets), "jump to non-branch targets");

        // stack.reset();
        program_stacks.insert(name, (stack.blocks, stack.values));

        // program_stacks.get_mut(&name).unwrap().push(stack);
        // eprintln!("{:?}", program_stacks.get(&name));
    }

    program_stacks
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
                Some(((SuperPax::BranchTarget(_target), ..), ..)) => {
                    // Only stop if flag is passed in saying to stop.
                }
                Some(((SuperPax::Pax(Pax::JumpIf0(target)), ..), ..)) => {
                    // noop
                    // let commands = blocks[i].commands();
                    let mut is_absolute = false;
                    if block.commands().len() > 1 {
                        if let Some(((SuperPax::PushLiteral(.., 0), ..), ..)) =
                            block.commands().get(block.commands().len() - 2)
                        {
                            is_absolute = true;
                        }
                    }

                    // Jump immediate
                    for (b_index, b) in stack_blocks.iter().enumerate() {
                        if let Some(((SuperPax::BranchTarget(bt), ..), ..)) = b.commands().last() {
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

            // Cache stack of previous block.
            // let previous_block_stack = block.exit_stack().unwrap_or(vec![]);
            // previous_block = Some(rewrite_stack(&previous_block_stack));

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
fn connect_blocks(graph: &Graph<(), i32>, blocks: &[Block], registers: &mut StackMap) {
    // Walk graph, do assignment of previous registers
    let mut exit_stacks = IndexMap::<_, DataRegs>::new();
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
        let mut exit_stack: DataRegs = relative_exit_stack.clone();
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
                if n.index() < block_index.index() {
                    for (next_reg, prev_reg) in relative_enter_stack
                        .iter()
                        .zip(incoming_stack.iter().skip(prefix.len()))
                    {
                        // rewrite_regs.insert(next_reg.to_owned(), prev_reg.to_owned());
                        if let Some(StackItem {
                            literal: Some(prev_literal),
                            ..
                        }) = registers.get(prev_reg).map(|x| x.clone())
                        {
                            if let Some(StackItem {
                                literal: ref mut next_literal,
                                ..
                            }) = registers.get_mut(next_reg)
                            {
                                assert!(next_literal.is_none());
                                *next_literal = Some(prev_literal.clone());
                            }
                        }
                    }
                }
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

fn propagate_literals_in_block(
    block: &Block,
    registers: &StackMap,
) -> (Vec<SuperPax>, IndexSet<String>) {
    let mut reg_blacklist = IndexSet::new();

    let new_commands = block
        .commands()
        .iter()
        .rev()
        .map(|command| {
            // eprintln!("{:?}\n----> {:?}", command.0, reg_blacklist);
            let mut result = (command.0).0.clone();

            match &result {
                SuperPax::LoadTemp(reg, _next_reg) if reg_blacklist.contains(reg) => {
                    return None;
                }
                SuperPax::AltPush(reg) if reg_blacklist.contains(reg) => {
                    return None;
                }
                SuperPax::AltPop(reg) if reg_blacklist.contains(reg) => {
                    return None;
                }
                SuperPax::PushLiteral(reg, _) if reg_blacklist.contains(reg) => {
                    return None;
                }
                SuperPax::StoreTemp(reg) if reg_blacklist.contains(reg) => {
                    return None;
                }
                _ => {}
            }

            if let Some(reg) = command.1.last() {
                if let Some(StackItem {
                    literal: Some(lit), ..
                }) = registers.get(reg)
                {
                    // eprintln!("      ^-> {:?} <= {:?}", reg.clone(), lit);
                    match &result {
                        SuperPax::AltPop(target_reg) if *reg == *target_reg => {
                            reg_blacklist.insert(target_reg.clone());
                            result = SuperPax::PushLiteral(target_reg.clone(), *lit);
                        }
                        SuperPax::LoadTemp(target_reg, _next_reg) if *reg == *target_reg => {
                            reg_blacklist.insert(target_reg.clone());
                            result = SuperPax::PushLiteral(target_reg.clone(), *lit);
                        }
                        _ => {}
                    }
                }
            }

            Some(result)
        })
        .collect::<Vec<_>>()
        .into_iter()
        .filter_map(|x| x)
        .rev()
        .collect::<Vec<_>>();

    (new_commands, reg_blacklist)
}

fn propagate_literals(blocks: &[Block], graph: &Graph<(), i32>, registers: &StackMap) {
    // First we want to analyze the whole program and identify basic blocks.
    // let mut exit_stacks = IndexMap::<_, DataRegs>::new();
    let mut bfs = petgraph::visit::Bfs::new(&graph, 0.into());
    let mut seq = vec![];
    while let Some(block_index) = bfs.next(&graph) {
        seq.push(block_index.index() as usize);
    }
    seq.reverse();

    let mut block_blacklist = IndexMap::new();
    for block in seq {
        eprintln!("block[{:?}]", block);
        let (_commands, blacklist) = propagate_literals_in_block(&blocks[block], registers);
        eprintln!("    blacklist {:?}", blacklist);
        block_blacklist.insert(block, blacklist);
    }
}

fn dump_blocks(blocks: &[Block]) {
    for (i, block) in blocks.iter().enumerate() {
        println!("block[{}]", i);
        for command in block.commands() {
            eprintln!("    {:?}:", (command.0).0,);
            eprintln!("                        data: {:?}", command.1,);
            eprintln!("                        retn: {:?}", command.2,);
            eprintln!(
                "                        temp: {}",
                command.3.clone().unwrap_or("".to_string()),
            );
            eprintln!();
        }
        eprintln!("\n  {} entries.\n  ---", block.commands().len(),);
    }
}

pub fn optimize_forth(program: Program) {
    let mut block_analysis = analyze_blocks(program);
    if let Some((blocks, ref mut registers)) = block_analysis.get_mut("main") {
        let graph = dataflow_graph(blocks.clone());
        connect_blocks(&graph, &blocks, registers);

        // println!("{:?}", graph);
        // println!();
        // for reg in &*registers {
        //   println!("reg {:?}: {:?}", reg.0, reg.1.literal);
        // }
        // println!();
        // println!();
        // println!();

        propagate_literals(&blocks, &graph, &*registers);

        // dump_blocks(&block);
    }
}
