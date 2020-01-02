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

    Load8,
    Store8,

    PushLiteral(isize),
    PushLabel(isize),

    Metadata(String),

    // pax debug
    Print,
    Debugger,
    Sleep, // todo: should be "yieldframe"
    Equals,

    Stop,

    Jump, // temporary, for <recurse>
    JumpIf0, // maybe the way forward

}
