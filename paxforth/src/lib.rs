#![recursion_limit = "1024"]

pub mod ast;
#[cfg(not(feature = "web"))]
pub mod check;
#[cfg(not(feature = "web"))]
pub mod debug;
pub mod parse;
pub mod program;
pub mod runner;
pub mod targets;

pub use ast::*;
pub use parse::*;

use percent_encoding::{utf8_percent_encode, AsciiSet, NON_ALPHANUMERIC};
use std::path::{Path, PathBuf};

pub const PRELUDE: &str = include_str!("../lib/prelude.fth");

pub trait ForthCompiler {
    fn compile(program: &PaxProgram) -> String;
}

pub struct ForthParser {}

impl ForthParser {
    pub fn parse(code: &str, arg_file: Option<&Path>) -> Result<PaxProgram, PaxParseError> {
        let preludes: Vec<(PathBuf, String)> =
            vec![(PathBuf::from("../../lib/prelude.fth"), PRELUDE.to_string())];

        if let Some(arg) = arg_file {
            let arg_str = arg.to_string_lossy().to_string();
            parse_to_pax(&code, Some(&arg_str), preludes)
        } else {
            parse_to_pax(&code, None, preludes)
        }
    }
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
