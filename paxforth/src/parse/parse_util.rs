//! Legacy parsing logic.

use crate::*;
use indexmap::{indexmap, IndexMap};

/**
 * Constants
 */

// Name of the global function aka "main"
const MAIN_FUNCTION: &'static str = "main";

// Value for WebAssembly
pub const BASE_VARIABLE_OFFSET: usize = 10000;
// Value for Gameboy
// const BASE_VARIABLE_OFFSET: usize = 49216;
// Value for C64
// pub const BASE_VARIABLE_OFFSET: usize = 0x1000;

/**
 * BlockBuilder
 */

#[derive(Debug, Clone)]
pub struct BlockBuilder {
    pub current_block: PaxSpan,
    pub blocks: Vec<Block>,
}

impl BlockBuilder {
    pub fn new() -> BlockBuilder {
        BlockBuilder {
            current_block: vec![],
            blocks: vec![],
        }
    }

    pub fn op(&mut self, op: &Located<Pax>) {
        self.current_block.push(op.to_owned());
    }

    pub fn exit_block(&mut self, terminator: Located<PaxTerm>) -> usize {
        let index = self.blocks.len();
        self.blocks
            .push(Block::new(self.current_block.clone(), terminator));
        self.reset();
        index
    }

    fn reset(&mut self) {
        self.current_block = vec![];
    }

    /* Jump references */

    pub fn jump_if_0(&mut self, marker_group: &mut BlockReference, pos: Pos) {
        let block_index = self.exit_block((
            PaxTerm::JumpIf0(marker_group.from_block_index.unwrap_or(0)),
            pos,
        ));
        marker_group.to_block_indices.push(block_index);
    }

    pub fn jump_else(&mut self, marker_group: &mut BlockReference, pos: Pos) {
        let block_index = self.exit_block((
            PaxTerm::JumpElse(marker_group.from_block_index.unwrap_or(0)),
            pos,
        ));
        marker_group.to_block_indices.push(block_index);
    }

    /* Loop references */

    pub fn loop_if_0(&mut self, marker_group: &mut BlockReference, pos: Pos) {
        let block_index = self.exit_block((
            PaxTerm::LoopIf0(marker_group.from_block_index.unwrap_or(0)),
            pos,
        ));
        marker_group.to_block_indices.push(block_index);
    }

    pub fn loop_leave(&mut self, marker_group: &mut BlockReference, pos: Pos) {
        let block_index = self.exit_block((
            PaxTerm::LoopLeave(marker_group.from_block_index.unwrap_or(0)),
            pos,
        ));
        marker_group.to_block_indices.push(block_index);
    }

    pub fn loop_target(&mut self, label: &str, pos: Pos) -> BlockReference {
        let block_index = self.exit_block((PaxTerm::LoopTarget(self.blocks.len()), pos));

        BlockReference::new(label, Some(block_index))
    }

    /* Forward references */

    pub fn set_branch_target(&mut self, marker_group: &mut BlockReference, pos: Pos) {
        // Set this as the target of a forward reference group.
        assert!(marker_group.from_block_index.is_none());
        let block_index = self.blocks.len();
        marker_group.from_block_index = Some(block_index);

        // Update forward references.
        for target in &marker_group.to_block_indices {
            let last_op = self.blocks[*target].terminator_mut();
            match last_op {
                (PaxTerm::JumpIf0(ref mut target), _)
                | (PaxTerm::JumpElse(ref mut target), ..)
                | (PaxTerm::LoopLeave(ref mut target), ..) => {
                    *target = block_index;
                }
                _ => {
                    unreachable!();
                }
            }
        }
    }

    pub fn set_loop_target(&mut self, marker_group: &mut BlockReference, pos: Pos) {
        // Set this as the target of a forward reference group.
        assert!(marker_group.from_block_index.is_none());
        let block_index = self.exit_block((PaxTerm::LoopTarget(self.blocks.len()), pos));
        marker_group.from_block_index = Some(block_index);
    }

    pub fn set_jump_target(&mut self, marker_group: &mut BlockReference, pos: Pos) {
        // Set this as the target of a forward reference group.
        assert!(marker_group.from_block_index.is_none());
        let block_index = self.exit_block((PaxTerm::JumpTarget(self.blocks.len()), pos));
        marker_group.from_block_index = Some(block_index);

        // Update forward references.
        for target in &marker_group.to_block_indices {
            let last_op = self.blocks[*target].terminator_mut();
            match last_op {
                (PaxTerm::JumpIf0(ref mut target), _)
                | (PaxTerm::JumpElse(ref mut target), ..)
                | (PaxTerm::LoopLeave(ref mut target), ..) => {
                    *target = block_index;
                }
                _ => {
                    unreachable!();
                }
            }
        }
    }
}

/**
 * Block references
 */

#[derive(Debug, Clone)]
pub struct BlockReference {
    pub label: String,
    pub from_block_index: Option<usize>,
    pub to_block_indices: Vec<usize>,
}

impl BlockReference {
    pub fn new(label: &str, from: Option<usize>) -> BlockReference {
        BlockReference {
            label: label.to_string(),
            from_block_index: from,
            to_block_indices: vec![],
        }
    }
}

/**
 * Parsing
 */

pub enum ParseMode {
    Default,
    FunctionName,
    ConstantName(isize),
    Variable,
}

/**
 * PaxProgram Builder
 */

#[derive(Debug, Clone)]
pub struct PaxProgramBuilder {
    pub _current_function: String, // TODO not pub
    pub program: IndexMap<String, BlockBuilder>,
}

impl PaxProgramBuilder {
    pub fn new() -> PaxProgramBuilder {
        PaxProgramBuilder {
            _current_function: MAIN_FUNCTION.to_string(),
            program: indexmap![
                MAIN_FUNCTION.to_string() => BlockBuilder::new(),
            ],
        }
    }

    // Convert this into a PaxProgram.
    pub fn result(self) -> PaxProgram {
        self.program
            .clone()
            .iter_mut()
            .map(|(name, builder)| (name.clone(), builder.blocks.clone()))
            .collect()
    }

    /* Function stack */

    pub fn enter_function(&mut self, name: String) {
        self._current_function = name.clone();
        self.program.insert(name, BlockBuilder::new());
    }

    pub fn exit_function(&mut self) {
        self._current_function = format!("main");
    }

    pub fn in_function(&self) -> bool {
        self._current_function != MAIN_FUNCTION
    }

    pub fn defer_function(&mut self, name: String) {
        self.program.insert(name, BlockBuilder::new());
    }

    pub fn rename_function(&mut self, name: String) {
        let previous_name = self._current_function.clone();
        self._current_function = name.to_string();
        let fun = self.program.remove(&previous_name).unwrap();
        self.program.insert(name, fun);
    }

    /* BlockBuilder methods */

    pub fn current(&'_ mut self) -> &'_ mut BlockBuilder {
        &mut self.program[&self._current_function]
    }
}
