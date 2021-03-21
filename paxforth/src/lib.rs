#![recursion_limit = "1024"]

pub mod analyze;
pub mod location;
pub mod optimize;
pub mod parse;
pub mod prelude;
pub mod superpax;
pub mod targets;
pub mod tokenizer;

pub use analyze::*;
pub use location::*;
pub use optimize::*;
pub use parse::*;
pub use superpax::*;
pub use tokenizer::*;

pub trait ForthCompiler {
    fn compile(program: &SuperPaxProgram) -> String;
}
