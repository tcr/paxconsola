//! Modern parsing logic.

use crate::parse_old::*;
use indexmap::IndexMap;

pub use crate::parse_old::{Pax, PaxSpan, BASE_VARIABLE_OFFSET, PaxProgram, Block, BlockBuilder};

pub fn convert_to_pax(program: Program) -> PaxProgram {
    let mut program_stacks = IndexMap::new();
    for (name, code) in program {
        // Load indexes of BranchTarget opcodes.
        let mut loc_to_block = IndexMap::new();
        let mut block_index = 0;
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            match op.0 {
                Pax::OldBranchTarget => {
                    loc_to_block.insert(i, block_index);
                    block_index += 1;
                }
                Pax::Call(_) | Pax::Exit => {
                    block_index += 1;
                }
                Pax::JumpIf0(target) => {
                    if let Some((_, &(Pax::OldBranchTarget, _))) = code_iter.peek() {
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
                    // Jump Always
                    if value == 0 {
                        if let Some((_, &(Pax::JumpIf0(ref target), _))) = code_iter.peek() {
                            stack.record_op(&(Pax::JumpAlways(loc_to_block[target]), op.1.clone()));
                            stack.jump_always_block();
                            code_iter.next();
                            continue;
                        }
                    }
                }
                Pax::JumpIf0(target) => {
                    // Pax::Drop
                    if let Some((_, &(Pax::OldBranchTarget, _))) = code_iter.peek() {
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
                Pax::Exit => {
                    stack.record_op(&(Pax::Exit, op.1.clone()));
                    stack.exit_block();
                }
                Pax::Call(ref arg) => {
                    stack.record_op(&(Pax::Call(arg.clone()), op.1.clone()));
                    stack.call_block();
                }
                Pax::JumpAlways(ref target) => {
                    stack.record_op(&(Pax::JumpAlways(loc_to_block[target]), op.1.clone()));
                    stack.jump_always_block();
                }
                Pax::JumpIf0(ref target) => {
                    stack.record_op(&(Pax::JumpIf0(loc_to_block[target]), op.1.clone()));
                    stack.jump_if_0_block();
                }
                Pax::OldBranchTarget => {
                    // TODO this should inline the block number, not the opcode number
                    stack.record_op(&(Pax::BranchTarget(loc_to_block[&i]), op.1.clone()));
                    stack.branch_target_block();
                }
                Pax::BranchTarget(_) => unreachable!(),

                _ => {
                    stack.record_op(&(op.0.clone(), op.1.clone()));
                }
            }
        }

        program_stacks.insert(name, stack.blocks);
    }

    program_stacks
}

pub fn parse_to_pax(contents: &str, filename: Option<&str>) -> PaxProgram {
    let program = parse_forth(contents, filename);
    convert_to_pax(program)
}
