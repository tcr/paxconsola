#![recursion_limit = "1024"]

pub mod analyze;
pub mod ast;
pub mod check;
pub mod debug;
pub mod parse;
pub mod runner;
pub mod targets;

pub use analyze::*;
pub use ast::*;
pub use parse::*;

use percent_encoding::{utf8_percent_encode, AsciiSet, NON_ALPHANUMERIC};

pub const PRELUDE: &str = include_str!("prelude.fth");

pub trait ForthCompiler {
    fn compile(program: &PaxProgram) -> String;
}

pub fn dump_blocks(blocks: &[Block]) {
    for (i, block) in blocks.iter().enumerate() {
        println!("    Block({})", i);
        for command in block.opcodes() {
            println!(
                "        {:<30} {}",
                format!("{:?}", command.0),
                format!("// {:>80}", command.1)
            );
        }
        {
            let terminator = block.terminator();
            println!(
                "        {:<30} {}",
                format!("{:?}", terminator.0),
                format!("// {:>80}", terminator.1)
            );
        }
    }
    println!();
}

pub fn dump_program(source_program: &PaxProgram) {
    for (name, code) in source_program {
        println!("( fn \"{}\" )", name);
        dump_blocks(&code);
        println!();
    }
}

pub fn name_slug(name: &str) -> String {
    const NON_ALPHA: AsciiSet = NON_ALPHANUMERIC.remove(b'_');
    utf8_percent_encode(name, &NON_ALPHA)
        .to_string()
        .replace("$", "$$")
        .replace("%", "$")
        .to_string()
}
