#![recursion_limit = "1024"]

pub mod analyze;
pub mod location;
pub mod optimize;
pub mod parse;
pub mod parse_old;
pub mod prelude;
pub mod targets;
pub mod tokenizer;

pub use analyze::*;
pub use location::*;
pub use optimize::*;
pub use parse::*;
pub use tokenizer::*;

pub trait ForthCompiler {
    fn compile(program: &PaxProgram) -> String;
}
