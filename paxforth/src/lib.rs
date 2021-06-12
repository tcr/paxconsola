#![recursion_limit = "1024"]

pub mod analyze;
pub mod ast;
pub mod location;
pub mod optimize;
pub mod parse;
pub mod parse_util;
pub mod prelude;
pub mod targets;
pub mod tokenizer;

pub use analyze::*;
pub use ast::*;
pub use location::*;
pub use optimize::*;
pub use parse::*;
pub use parse_util::*;
pub use tokenizer::*;

pub trait ForthCompiler {
    fn compile(program: &PaxProgram) -> String;
}

pub fn dump_blocks(blocks: &[Block]) {
    eprintln!("program:");
    for (i, block) in blocks.iter().enumerate() {
        eprintln!("  block[{}] with {} entries:", i, block.commands().len());
        for command in block.commands() {
            eprintln!("    {:30} {}", format!("{:?}", command.0), command.1);
        }
    }
    eprintln!();
    eprintln!();
}

// Silly introspection method
pub fn dump_as_forth(blocks: &[Block]) {
    eprintln!("\\ Forth Decompiled ");
    for (i, block) in blocks.iter().enumerate() {
        for command in block.commands() {
            match &command.0 {
                Pax::Abort => eprintln!("abort"),
                Pax::Add => eprintln!("+"),
                Pax::AltPop => eprintln!("r<"),
                Pax::AltPush => eprintln!("r>"),
                Pax::BranchTarget(n) => eprintln!("[{}]", n),
                Pax::Call(f) => eprintln!("{}", f),
                Pax::Drop => eprintln!("drop"),
                Pax::Exit => {}
                Pax::JumpAlways(n) => eprintln!("0 branch0"),
                Pax::JumpIf0(n) => eprintln!("branch0"),
                Pax::Load => eprintln!("@"),
                Pax::Load8 => eprintln!("c@"),
                Pax::LoadTemp => eprintln!("temp@"),
                Pax::Metadata(n) => {}
                Pax::Nand => eprintln!("nand"),
                Pax::Print => eprintln!("print"),
                Pax::PushLiteral(l) => eprintln!("{}", l),
                Pax::Store => eprintln!("!"),
                Pax::Store8 => eprintln!("c!"),
                Pax::StoreTemp => eprintln!("temp!"),
            }
        }
    }
    eprintln!();
    eprintln!();
}
