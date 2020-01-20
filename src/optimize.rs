#![allow(dead_code)]

use crate::*;
use indexmap::{IndexMap, IndexSet};
use petgraph::graph::Graph;

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
pub enum Block {
    // (Vec of dataflow analyzed/position-based commands, data stack registers, global registers analysis.)
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
}

#[derive(Debug, Clone)]
struct StackGroup {
    current_block: SuperSpan,
    blocks: Vec<Block>,
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

fn analyze_block(block: &Block, reg_start: usize) -> Vec<StackState> {
    struct Analysis {
        reg_index: usize,
        state: StackState,
        record: Vec<StackState>,
    }

    impl Analysis {
        fn new(reg_index: usize) -> Self {
            Self {
                reg_index,
                state: StackState::new(),
                record: vec![],
            }
        }

        fn result(self) -> Vec<StackState> {
            self.record
        }

        // Push or inject new var reg.

        fn push_data(&mut self, reg: Option<Reg>) -> Reg {
            let reg = reg.unwrap_or_else(|| self.new_var());
            self.state.data.push(reg.clone());
            reg
        }

        fn push_return(&mut self, reg: Option<Reg>) -> Reg {
            let reg = reg.unwrap_or_else(|| self.new_var());
            self.state.ret.push(reg.clone());
            reg
        }

        // Pop or inject with data/ret regs

        fn pop_data(&mut self) -> Reg {
            if let Some(reg) = self.state.data.pop() {
                reg
            } else {
                // Inject new register.
                let dropped_reg = self.new_data();
                for prev_state in &mut self.record {
                    prev_state.data.insert(0, dropped_reg.clone());
                }
                dropped_reg
            }
        }

        fn pop_return(&mut self) -> Reg {
            if let Some(reg) = self.state.ret.pop() {
                reg
            } else {
                // Inject new register.
                let dropped_reg = self.new_ret();
                for prev_state in &mut self.record {
                    prev_state.ret.insert(0, dropped_reg.clone());
                }
                dropped_reg
            }
        }

        fn temp_store(&mut self, reg: Reg) {
            self.state.temp = Some(reg);
        }

        fn temp_load(&mut self) -> Reg {
            let reg = self.state.temp.clone().expect("no temp var to load!");
            self.state.temp = Some(self.new_temp());
            reg
        }

        // Register constructors.

        fn new_data(&mut self) -> Reg {
            let reg = format!("D{}", self.reg_index);
            self.reg_index += 1;
            reg
        }

        fn new_literal(&mut self) -> Reg {
            let reg = format!("L{}", self.reg_index);
            self.reg_index += 1;
            reg
        }

        fn new_temp(&mut self) -> Reg {
            let reg = format!("T{}", self.reg_index);
            self.reg_index += 1;
            reg
        }

        fn new_ret(&mut self) -> Reg {
            let reg = format!("R{}", self.reg_index);
            self.reg_index += 1;
            reg
        }

        fn new_var(&mut self) -> Reg {
            let reg = format!("V{}", self.reg_index);
            self.reg_index += 1;
            reg
        }

        fn record_state(&mut self) {
            self.record.push(self.state.clone());
        }
    }

    let mut analysis = Analysis::new(reg_start);

    for command in block.commands() {
        use SuperPax::*;
        match (command.0).clone() {
            Drop | JumpIf0(_) | Print => {
                analysis.pop_data();
            }
            Load | Load8 => {
                analysis.pop_data();
                analysis.push_data(None);
            }
            AltPush => {
                let reg = analysis.pop_data();
                analysis.push_return(Some(reg));
            }

            Add | Nand => {
                analysis.pop_data();
                analysis.pop_data();
                analysis.push_data(None);
            }

            Store | Store8 => {
                analysis.pop_data();
                analysis.pop_data();
            }

            // FIXME correct these
            PushLiteral(_value) => {
                let reg = analysis.new_literal();
                analysis.push_data(Some(reg));
            }

            AltPop => {
                let reg = analysis.pop_return();
                analysis.push_data(Some(reg));
            }

            LoadTemp => {
                analysis.temp_load();
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

    analysis.result()
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

/*
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
                // SuperPax::AltPush(_) if reg_blacklist.contains(reg) => {
                //     return None;
                // }
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
*/

fn propagate_literals(blocks: &[Block], graph: &Graph<(), i32>, registers: &StackMap) {
    // First we want to analyze the whole program and identify basic blocks.
    // let mut exit_stacks = IndexMap::<_, DataRegs>::new();
    let mut bfs = petgraph::visit::Bfs::new(&graph, 0.into());
    let mut seq = vec![];
    while let Some(block_index) = bfs.next(&graph) {
        seq.push(block_index.index() as usize);
    }

    eprintln!();
    eprintln!("ANALYZE");
    for block_index in seq {
        let result = analyze_block(&blocks[block_index], 0);
        eprintln!("block[{}]", block_index);
        for ((ref command, ..), ref state) in blocks[block_index].commands().iter().zip(result) {
            eprintln!("  {:?}", command);
            eprintln!("        {:?}", state.data);
        }
    }

    // Iterate block sequence in perform constant propagation.
    // seq.reverse();

    // let mut block_blacklist = IndexMap::new();
    // for block in seq {
    //     eprintln!("block[{:?}]", block);
    //     let (_commands, blacklist) = propagate_literals_in_block(&blocks[block], registers);
    //     eprintln!("    blacklist {:?}", blacklist);
    //     block_blacklist.insert(block, blacklist.clone());

    //     if !blacklist.is_empty() {
    //         for ((command, ..), ..) in blocks[block].commands() {
    //             eprintln!("        command: {:?}", command);
    //         }
    //         eprintln!("    vs:");
    //         for command in _commands {
    //             eprintln!("        command: {:?}", command);
    //         }
    //     }
    // }
}

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
    if let Some((blocks, ref mut registers)) = block_analysis.get_mut("main") {
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

        propagate_literals(&blocks, &graph, &*registers);
    }
}
