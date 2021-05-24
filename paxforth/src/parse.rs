//! Modern parsing logic.

use crate::parse_old::*;
use crate::*;
use indexmap::IndexMap;
use serde::*;

// Value for WebAssemblyBASE_VARIABLE_OFFSET
// const BASE_VARIABLE_OFFSET: usize = 10000;
// Value for Gameboy
// const BASE_VARIABLE_OFFSET: usize = 49216;
// Value for C64
pub const BASE_VARIABLE_OFFSET: usize = 0x9000;

// Only for Gameboy

// Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone, Serialize, Deserialize)]
pub enum Pax {
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
    JumpAlways(usize),

    // pax debug
    Print,
}

pub type SuperSpan = Vec<Located<Pax>>;

pub type PaxProgram = IndexMap<String, Vec<Block>>;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Block {
    ExitBlock(SuperSpan),
    JumpAlways(SuperSpan),
    JumpIf0Block(SuperSpan),
    BranchTargetBlock(SuperSpan),
    CallBlock(SuperSpan),
}

impl Block {
    pub fn commands(&'_ self) -> &'_ SuperSpan {
        match self {
            Block::ExitBlock(ref commands) => commands,
            Block::JumpIf0Block(ref commands) => commands,
            Block::JumpAlways(ref commands) => commands,
            Block::BranchTargetBlock(ref commands) => commands,
            Block::CallBlock(ref commands) => commands,
        }
    }

    pub fn commands_mut(&'_ mut self) -> &'_ mut SuperSpan {
        match self {
            Block::ExitBlock(ref mut commands) => commands,
            Block::JumpIf0Block(ref mut commands) => commands,
            Block::JumpAlways(ref mut commands) => commands,
            Block::BranchTargetBlock(ref mut commands) => commands,
            Block::CallBlock(ref mut commands) => commands,
        }
    }
}

#[derive(Debug, Clone)]
struct BlockBuilder {
    current_block: SuperSpan,
    blocks: Vec<Block>,
}

impl BlockBuilder {
    fn new() -> BlockBuilder {
        BlockBuilder {
            current_block: vec![],
            blocks: vec![],
        }
    }

    fn record_op(&mut self, op: &Located<Pax>) {
        self.current_block.push(op.to_owned());
    }

    fn exit_block(&mut self) {
        self.blocks
            .push(Block::ExitBlock(self.current_block.clone()));
        self.reset();
    }

    fn jump_if_0_block(&mut self) {
        self.blocks
            .push(Block::JumpIf0Block(self.current_block.clone()));
        self.reset();
    }

    fn jump_always_block(&mut self) {
        self.blocks
            .push(Block::JumpAlways(self.current_block.clone()));
        self.reset();
    }

    fn branch_target_block(&mut self) {
        self.blocks
            .push(Block::BranchTargetBlock(self.current_block.clone()));
        self.reset();
    }

    fn call_block(&mut self) {
        self.blocks
            .push(Block::CallBlock(self.current_block.clone()));
        self.reset();
    }

    fn reset(&mut self) {
        self.current_block = vec![];
    }
}

pub fn convert_to_pax(program: Program) -> PaxProgram {
    let mut program_stacks = IndexMap::new();
    for (name, code) in program {
        // Load indexes of BranchTarget opcodes.
        let mut loc_to_block = IndexMap::new();
        let mut block_index = 0;
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            match op.0 {
                PaxOld::BranchTarget => {
                    loc_to_block.insert(i, block_index);
                    block_index += 1;
                }
                PaxOld::Call(_) | PaxOld::Exit => {
                    block_index += 1;
                }
                PaxOld::JumpIf0(target) => {
                    if let Some((_, &(PaxOld::BranchTarget, _))) = code_iter.peek() {
                        if target == i + 1 {
                            code_iter.next();
                            continue;
                        }
                    }
                    block_index += 1;
                }
                _ => {}
            }
        }

        // Convert to block list.
        let mut stack = BlockBuilder::new();
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            // Peek matching.
            match op.0 {
                PaxOld::PushLiteral(value) => {
                    // Jump Always
                    if value == 0 {
                        if let Some((_, &(PaxOld::JumpIf0(ref target), _))) = code_iter.peek() {
                            stack.record_op(&(Pax::JumpAlways(loc_to_block[target]), op.1.clone()));
                            stack.jump_always_block();
                            code_iter.next();
                            continue;
                        }
                    }
                }
                PaxOld::JumpIf0(target) => {
                    // Pax::Drop
                    if let Some((_, &(PaxOld::BranchTarget, _))) = code_iter.peek() {
                        if target == i + 1 {
                            stack.record_op(&(Pax::Drop, op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                    }
                }
                _ => {}
            }

            // Opcode matching.
            match op.0 {
                PaxOld::PushLiteral(value) => {
                    stack.record_op(&(Pax::PushLiteral(value), op.1.clone()));
                }
                PaxOld::AltPush => {
                    stack.record_op(&(Pax::AltPush, op.1.clone()));
                }
                PaxOld::AltPop => {
                    stack.record_op(&(Pax::AltPop, op.1.clone()));
                }
                PaxOld::Metadata(ref arg) => {
                    stack.record_op(&(Pax::Metadata(arg.clone()), op.1.clone()));
                }
                PaxOld::Print => {
                    stack.record_op(&(Pax::Print, op.1.clone()));
                }
                PaxOld::Load => {
                    stack.record_op(&(Pax::Load, op.1.clone()));
                }
                PaxOld::Load8 => {
                    stack.record_op(&(Pax::Load8, op.1.clone()));
                }
                PaxOld::Store => {
                    stack.record_op(&(Pax::Store, op.1.clone()));
                }
                PaxOld::Store8 => {
                    stack.record_op(&(Pax::Store8, op.1.clone()));
                }
                PaxOld::Add => {
                    stack.record_op(&(Pax::Add, op.1.clone()));
                }
                PaxOld::Nand => {
                    stack.record_op(&(Pax::Nand, op.1.clone()));
                }
                PaxOld::Drop => {
                    stack.record_op(&(Pax::Drop, op.1.clone()));
                }
                PaxOld::LoadTemp => {
                    stack.record_op(&(Pax::LoadTemp, op.1.clone()));
                }
                PaxOld::StoreTemp => {
                    stack.record_op(&(Pax::StoreTemp, op.1.clone()));
                }
                PaxOld::Exit => {
                    stack.record_op(&(Pax::Exit, op.1.clone()));
                    stack.exit_block();
                }
                PaxOld::Call(ref arg) => {
                    stack.record_op(&(Pax::Call(arg.clone()), op.1.clone()));
                    stack.call_block();
                }
                PaxOld::JumpAlways(ref target) => {
                    stack.record_op(&(Pax::JumpAlways(loc_to_block[target]), op.1.clone()));
                    stack.jump_always_block();
                }
                PaxOld::JumpIf0(ref target) => {
                    stack.record_op(&(Pax::JumpIf0(loc_to_block[target]), op.1.clone()));
                    stack.jump_if_0_block();
                }
                PaxOld::BranchTarget => {
                    // TODO this should inline the block number, not the opcode number
                    stack.record_op(&(Pax::BranchTarget(loc_to_block[&i]), op.1.clone()));
                    stack.branch_target_block();
                }
            }
        }

        program_stacks.insert(name, stack.blocks);
    }

    program_stacks
}

pub fn parse_to_pax(contents: &str, filename: Option<&str>) -> PaxProgram {
    let buffer = contents.as_bytes().to_owned();
    let program = parse_forth(buffer, filename);
    convert_to_pax(program)
}
