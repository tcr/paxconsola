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

    Function,
    Recurse,
    If,
    Else,
    Then,
    Do,
    Loop,
    PlusLoop,
    IIndex,
    JIndex,
    Begin,
    Until,
}
