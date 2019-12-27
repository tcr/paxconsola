#[derive(Debug, PartialEq, Clone)]
pub enum Pax {
    // pax
    // todo noop
    Load,
    Call,
    Exit,
    
    AltPop, 
    Add,
    Nand,
    Remainder,
    AltPush,
    Store,
    Multiply,

    PushLiteral(isize),
    PushLabel(isize),

    // pax debug
    Print,
    Debugger,
    Sleep, // todo: should be "yieldframe"
    Equals,

    Stop,

    Jump, // temporary, for <recurse>
    JumpIf0, // maybe the way forward

    Do,
    Loop,
    PlusLoop,
    IIndex,
    JIndex,
}
