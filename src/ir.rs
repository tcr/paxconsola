#[derive(Debug, PartialEq, Clone)]
pub enum Pax {
    // pax
    // todo noop
    Load,
    Call,
    Exit,
    Pushn(isize), // (literal: u<N>)
    AltPop, 
    Add,
    Nand,
    Remainder,
    AltPush,
    // todo 0branch
    Store,
    Multiply,

    // pax debug
    Print,
    Debugger,
    Sleep, // todo: should be "yieldframe"
    Equals,

    Stop,

    Function, // not needed?

    Jump, // temporary, for <recurse>
    JumpIf0, // maybe the way forward

    Do,
    Loop,
    PlusLoop,
    IIndex,
    JIndex,
}
