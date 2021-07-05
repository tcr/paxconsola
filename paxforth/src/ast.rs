use indexmap::IndexMap;
use serde::*;

/**
 * Opcodes
 */

pub type PaxLiteral = isize;

// Pax opcodes for execution.
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
    Emit,
    Abort,
    Debugger,
}

// Pax opcodes for terminating a block.
#[derive(Debug, PartialEq, Clone, Serialize, Deserialize)]
pub enum PaxTerm {
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
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct Block {
    opcodes: PaxSpan,
    terminator: Located<PaxTerm>,
}

impl Block {
    pub fn new(opcodes: PaxSpan, terminator: Located<PaxTerm>) -> Block {
        Block {
            opcodes,
            terminator,
        }
    }

    pub fn opcodes(&self) -> &PaxSpan {
        &self.opcodes
    }

    pub fn opcodes_mut(&mut self) -> &mut PaxSpan {
        &mut self.opcodes
    }

    #[deprecated]
    pub fn opcodes_and_terminator(&self) -> (&[Located<Pax>], &Located<PaxTerm>) {
        (&self.opcodes, &self.terminator)
    }

    pub fn terminator(&self) -> &Located<PaxTerm> {
        &self.terminator
    }

    pub fn terminator_mut(&mut self) -> &mut Located<PaxTerm> {
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
