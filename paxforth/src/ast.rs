use indexmap::IndexMap;
use serde::*;

/**
 * Opcodes
 */

pub type PaxLiteral = isize;

// Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone, Serialize, Deserialize)]
pub enum Pax {
    Drop,

    PushLiteral(PaxLiteral),

    AltPop,
    AltPush,
    LoadTemp,
    StoreTemp,

    // Metadata(String),
    Add,
    Nand,

    Load,
    Load8,
    Store8,
    Store,

    Print,
    Abort,

    // TODO Split these off as block opcodes
    BranchTarget(usize),
    Exit,
    Call(String),
    JumpIf0(usize),
    JumpAlways(usize),
}

pub type PaxSpan = Vec<Located<Pax>>;

pub type PaxProgram = IndexMap<String, Vec<Block>>;

/**
 * Blocks
 */

// TODO make blocks read-only
// And do validation on creation each block ends with a terminating opcode
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct Block {
    commands: PaxSpan,
    terminator: Located<Pax>,
}

impl Block {
    pub fn new(commands: PaxSpan, terminator: Located<Pax>) -> Block {
        Block {
            commands,
            terminator,
        }
    }

    pub fn opcodes_and_terminator(&self) -> (&[Located<Pax>], &Located<Pax>) {
        (&self.commands, &self.terminator)
    }

    pub fn opcodes(&self) -> &PaxSpan {
        &self.commands
    }

    pub fn opcodes_mut(&mut self) -> &mut PaxSpan {
        &mut self.commands
    }

    pub fn terminator(&self) -> &Located<Pax> {
        &self.terminator
    }

    pub fn terminator_mut(&mut self) -> &mut Located<Pax> {
        &mut self.terminator
    }
}

/**
 * Position in source code
 */

#[derive(Debug, Clone, PartialEq, Default, Serialize, Deserialize)]
pub struct Pos {
    pub filename: String,
    pub function: String,
    pub line: usize,
    pub col: usize,
}

impl std::fmt::Display for Pos {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{}:{}:{} in `{}`",
            self.filename, self.line, self.col, self.function
        )
    }
}

pub type Located<T> = (T, Pos);