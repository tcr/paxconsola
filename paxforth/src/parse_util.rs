//! Legacy parsing logic.

use crate::*;
use indexmap::{indexmap, IndexMap};
use serde::*;

/**
 * Constants
 */

// Name of the global function aka "main"
const MAIN_FUNCTION: &'static str = "main";

// Value for WebAssembly
// const BASE_VARIABLE_OFFSET: usize = 10000;
// Value for Gameboy
// const BASE_VARIABLE_OFFSET: usize = 49216;
// Value for C64
pub const BASE_VARIABLE_OFFSET: usize = 0x9000;

/**
 * Opcodes
 */

// Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone, Serialize, Deserialize)]
pub enum Pax {
    Drop,

    BranchTarget(usize),
    OldBranchTarget,

    PushLiteral(isize),

    AltPop,
    AltPush,
    LoadTemp,
    StoreTemp,

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

    Abort,

    Print,
}

pub type PaxSpan = Vec<Located<Pax>>;

pub type PaxProgram = IndexMap<String, Vec<Block>>;

/**
 * Blocks
 */

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Block {
    ExitBlock(PaxSpan),
    JumpAlways(PaxSpan),
    JumpIf0Block(PaxSpan),
    BranchTargetBlock(PaxSpan),
    CallBlock(PaxSpan),
}

impl Block {
    pub fn commands(&'_ self) -> &'_ PaxSpan {
        match self {
            Block::ExitBlock(ref commands) => commands,
            Block::JumpIf0Block(ref commands) => commands,
            Block::JumpAlways(ref commands) => commands,
            Block::BranchTargetBlock(ref commands) => commands,
            Block::CallBlock(ref commands) => commands,
        }
    }

    pub fn commands_mut(&'_ mut self) -> &'_ mut PaxSpan {
        match self {
            Block::ExitBlock(ref mut commands) => commands,
            Block::JumpIf0Block(ref mut commands) => commands,
            Block::JumpAlways(ref mut commands) => commands,
            Block::BranchTargetBlock(ref mut commands) => commands,
            Block::CallBlock(ref mut commands) => commands,
        }
    }

    pub fn enum_type(&self) -> String {
        format!("{:?}", self).split("(").next().unwrap().to_string()
    }
}

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

    pub fn record_op(&mut self, op: &Located<Pax>) {
        self.current_block.push(op.to_owned());
    }

    pub fn record_branch_target(&mut self, pos: Pos) {
        self.current_block
            .push((Pax::BranchTarget(self.blocks.len()), pos));
    }

    pub fn exit_block(&mut self) {
        self.blocks
            .push(Block::ExitBlock(self.current_block.clone()));
        self.reset();
    }

    pub fn jump_if_0_block(&mut self) -> usize {
        let index = self.blocks.len();
        self.blocks
            .push(Block::JumpIf0Block(self.current_block.clone()));
        self.reset();
        index
    }

    pub fn jump_always_block(&mut self) -> usize {
        let index = self.blocks.len();
        self.blocks
            .push(Block::JumpAlways(self.current_block.clone()));
        self.reset();
        index
    }

    pub fn branch_target_block(&mut self) -> usize {
        let index = self.blocks.len();
        self.blocks
            .push(Block::BranchTargetBlock(self.current_block.clone()));
        self.reset();
        index
    }

    pub fn call_block(&mut self) {
        self.blocks
            .push(Block::CallBlock(self.current_block.clone()));
        self.reset();
    }

    fn reset(&mut self) {
        self.current_block = vec![];
    }
}

/**
 * Marker groups
 */

#[derive(Debug)]
pub struct MarkerGroup {
    pub name: String,
    pub target_indices: Vec<usize>,
    pub source_index: Option<usize>,

    pub from_block_index: Option<usize>,
    pub to_block_indices: Vec<usize>,
}

/**
 * Parsing
 */

pub enum ParseMode {
    Default,
    FunctionName,
    ConstantName(isize),
    CommentParens,
    Variable,
}

#[derive(Debug)]
pub struct StackAbstraction {
    pub _current_function: String, // TODO not pub
    pub functions: IndexMap<String, PaxSpan>,
    pub program: IndexMap<String, BlockBuilder>,
}

impl StackAbstraction {
    pub fn get_program(self) -> PaxProgram {
        self.program
            .clone()
            .iter_mut()
            .map(|(name, builder)| (name.clone(), builder.blocks.clone()))
            .collect()
    }

    pub fn new() -> StackAbstraction {
        StackAbstraction {
            _current_function: MAIN_FUNCTION.to_string(),
            functions: indexmap![
                MAIN_FUNCTION.to_string() => vec![],
            ],
            program: indexmap![
                MAIN_FUNCTION.to_string() => BlockBuilder::new(),
            ],
        }
    }

    pub fn push_function(&mut self, (name, contents): (String, PaxSpan)) {
        self._current_function = name.clone();
        self.functions.insert(name.clone(), contents);
        self.program.insert(name, BlockBuilder::new());
    }

    pub fn pop_function(&mut self) -> Option<(String, PaxSpan)> {
        let value = (
            self._current_function.clone(),
            self.functions[&self._current_function].clone(),
        );
        self._current_function = format!("main");
        Some(value)
    }

    /* BlockBuilder methods */

    pub fn current_block_builder(&'_ mut self) -> &'_ mut BlockBuilder {
        &mut self.program[&self._current_function]
    }

    pub fn record_op(&mut self, op: Located<Pax>) {
        self.current().push(op.clone());
        self.current_block_builder().record_op(&op);
    }

    pub fn record_branch_target(&mut self, pos: Pos) {
        self.current().push((Pax::OldBranchTarget, pos.clone()));
        self.current_block_builder().record_branch_target(pos);
    }

    pub fn exit_block(&mut self) {
        self.current_block_builder().exit_block();
    }

    pub fn jump_if_0_block(&mut self) -> usize {
        self.current_block_builder().jump_if_0_block()
    }

    pub fn jump_always_block(&mut self) -> usize {
        self.current_block_builder().jump_always_block()
    }

    pub fn branch_target_block(&mut self) -> usize {
        self.current_block_builder().branch_target_block()
    }

    pub fn call_block(&mut self) {
        self.current_block_builder().call_block();
    }

    /* Marker methods */

    pub fn in_function(&self) -> bool {
        self._current_function != MAIN_FUNCTION
    }

    pub fn in_main(&self) -> bool {
        self._current_function == MAIN_FUNCTION
    }

    pub fn current(&'_ mut self) -> &'_ mut PaxSpan {
        &mut self.functions[&self._current_function]
    }

    pub fn current_pop(&mut self) {
        self.current().pop();
    }

    pub fn empty_marker_group(&mut self, name: &str) -> MarkerGroup {
        MarkerGroup {
            name: name.to_string(),
            target_indices: vec![],
            source_index: None,

            from_block_index: None,
            to_block_indices: vec![],
        }
    }

    pub fn new_marker_group(&mut self, name: &str, pos: Pos) -> MarkerGroup {
        let index = self.current().len();
        self.record_branch_target(pos);
        let block_index = self.branch_target_block();

        MarkerGroup {
            name: name.to_string(),
            target_indices: vec![],
            source_index: Some(index),

            from_block_index: Some(block_index),
            to_block_indices: vec![],
        }
    }

    pub fn set_target(&mut self, marker_group: &mut MarkerGroup, pos: Pos) {
        assert!(marker_group.source_index.is_none());
        let index = self.current().len();
        self.record_branch_target(pos);
        let block_index = self.branch_target_block();

        marker_group.source_index = Some(index);
        let output = self.current();
        for target in &marker_group.target_indices {
            match output[*target].0 {
                Pax::JumpIf0(_) => {
                    output[*target].0 = Pax::JumpIf0(index);
                }
                Pax::JumpAlways(_) => {
                    output[*target].0 = Pax::JumpAlways(index);
                }
                _ => {
                    unreachable!();
                }
            }
        }

        marker_group.from_block_index = Some(block_index);
        for target in &marker_group.to_block_indices {
            let op = self.current_block_builder().blocks[*target]
                .commands_mut()
                .last_mut();
            match op {
                Some((Pax::JumpIf0(ref mut target), _))
                | Some((Pax::JumpAlways(ref mut target), _)) => {
                    *target = block_index;
                }
                _ => {
                    unreachable!();
                }
            }
        }
    }

    pub fn jump_if_0(&mut self, marker_group: &mut MarkerGroup, pos: Pos) {
        let index = self.current().len();
        self.record_op((Pax::JumpIf0(marker_group.source_index.unwrap_or(0)), pos));
        marker_group.target_indices.push(index);
        let block_index = self.jump_if_0_block();
        marker_group.to_block_indices.push(block_index);
    }

    pub fn jump_always(&mut self, marker_group: &mut MarkerGroup, pos: Pos) {
        let index = self.current().len();
        self.record_op((Pax::JumpAlways(marker_group.source_index.unwrap_or(0)), pos));
        marker_group.target_indices.push(index);
        let block_index = self.jump_always_block();
        marker_group.to_block_indices.push(block_index);
    }
}
