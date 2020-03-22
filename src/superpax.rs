use crate::*;
use indexmap::IndexMap;
use serde::*;

// Only for Gameboy

// Extends the regular Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone, Serialize, Deserialize)]
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
    JumpAlways(usize),

    // pax debug
    Print,
}

pub type SuperSpan = Vec<Located<SuperPax>>;

pub type SuperPaxProgram = IndexMap<String, Vec<Block>>;

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

    fn record_op(&mut self, op: &Located<SuperPax>) {
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

pub fn convert_to_superpax(program: Program) -> SuperPaxProgram {
    let mut program_stacks = IndexMap::new();
    for (name, code) in program {
        // Load indexes of BranchTarget opcodes.
        let mut loc_to_block = IndexMap::new();
        let mut block_index = 0;
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            match op.0 {
                Pax::BranchTarget => {
                    loc_to_block.insert(i, block_index);
                    block_index += 1;
                }
                Pax::Call(_) | Pax::Exit => {
                    block_index += 1;
                }
                Pax::JumpIf0(target) => {
                    if let Some((_, &(Pax::BranchTarget, _))) = code_iter.peek() {
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
                Pax::PushLiteral(value) => {
                    // Temp is always first assigned variable(??)
                    // FIXME this is super fragile
                    let temp_address = BASE_VARIABLE_OFFSET;

                    // Temp values
                    if value == temp_address as isize {
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

                    // Jump Always
                    if value == 0 {
                        if let Some((_, &(Pax::JumpIf0(ref target), _))) = code_iter.peek() {
                            stack.record_op(&(
                                SuperPax::JumpAlways(loc_to_block[target]),
                                op.1.clone(),
                            ));
                            stack.jump_always_block();
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

            // Opcode matching.
            match op.0 {
                Pax::PushLiteral(value) => {
                    stack.record_op(&(SuperPax::PushLiteral(value), op.1.clone()));
                }
                Pax::BranchTarget => {
                    // TODO this should inline the block number, not the opcode number
                    stack.record_op(&(SuperPax::BranchTarget(loc_to_block[&i]), op.1.clone()));
                    stack.branch_target_block();
                }
                Pax::AltPush => {
                    stack.record_op(&(SuperPax::AltPush, op.1.clone()));
                }
                Pax::AltPop => {
                    stack.record_op(&(SuperPax::AltPop, op.1.clone()));
                }

                Pax::Debugger | Pax::Sleep => {
                    unreachable!("unknown opcode");
                }

                Pax::Metadata(ref arg) => {
                    // noop
                    stack.record_op(&(SuperPax::Metadata(arg.clone()), op.1.clone()));
                }
                Pax::Print => {
                    stack.record_op(&(SuperPax::Print, op.1.clone()));
                }
                Pax::Load => {
                    stack.record_op(&(SuperPax::Load, op.1.clone()));
                }
                Pax::Load8 => {
                    stack.record_op(&(SuperPax::Load8, op.1.clone()));
                }
                Pax::Store => {
                    stack.record_op(&(SuperPax::Store, op.1.clone()));
                }
                Pax::Store8 => {
                    stack.record_op(&(SuperPax::Store8, op.1.clone()));
                }
                Pax::Add => {
                    stack.record_op(&(SuperPax::Add, op.1.clone()));
                }
                Pax::Nand => {
                    stack.record_op(&(SuperPax::Nand, op.1.clone()));
                }
                Pax::Exit => {
                    stack.record_op(&(SuperPax::Exit, op.1.clone()));
                    stack.exit_block();
                }
                Pax::Call(ref arg) => {
                    stack.record_op(&(SuperPax::Call(arg.clone()), op.1.clone()));
                    stack.call_block();
                }
                Pax::JumpIf0(ref target) => {
                    stack.record_op(&(SuperPax::JumpIf0(loc_to_block[target]), op.1.clone()));
                    stack.jump_if_0_block();
                }
            }
        }

        program_stacks.insert(name, stack.blocks);
    }

    program_stacks
}

pub fn parse_to_superpax(buffer: Vec<u8>, filename: Option<&str>) -> SuperPaxProgram {
    let program = parse_forth(buffer, filename);
    convert_to_superpax(program)
}
