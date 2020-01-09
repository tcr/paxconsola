#[derive(Debug, PartialEq, Clone)]
pub enum Pax {
    // pax
    // todo noop
    Metadata(String),
    Exit,

    Call(String),

    PushLiteral(isize),
    Add,
    Nand,

    AltPop,
    AltPush,

    Load,
    Load8,
    Store8,
    Store,

    BranchTarget,
    JumpIf0(usize),

    // pax debug
    Print,
    Debugger,
    Sleep, // todo: should be "yieldframe"
}
