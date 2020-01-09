#[derive(Debug, PartialEq, Clone)]
pub enum Pax {
    // pax
    // todo noop
    Load,
    Call(String),
    Exit,

    Add,
    Nand,
    AltPop,
    AltPush,
    Store,

    Load8,
    Store8,

    BranchTarget,

    PushLiteral(isize),

    Metadata(String),

    // pax debug
    Print,
    Debugger,
    Sleep, // todo: should be "yieldframe"

    JumpIf0(usize),
}
