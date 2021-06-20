#![recursion_limit = "1024"]

pub mod analyze;
pub mod ast;
pub mod parse;
pub mod prelude;
pub mod targets;

pub use analyze::*;
pub use ast::*;
pub use parse::*;

pub trait ForthCompiler {
    fn compile(program: &PaxProgram) -> String;
}

pub fn dump_blocks(blocks: &[Block]) {
    for (i, block) in blocks.iter().enumerate() {
        eprintln!("    ( block {} )", i);
        for command in block.commands() {
            let opcode = match &command.0 {
                Pax::Abort => format!("abort"),
                Pax::Add => format!("+"),
                Pax::AltPop => format!("r<"),
                Pax::AltPush => format!("r>"),
                Pax::BranchTarget(n) => format!("[target-{}]", n),
                Pax::Call(f) => format!("call {:?}", f),
                Pax::Drop => format!("drop"),
                Pax::Exit => format!("exit"),
                Pax::JumpAlways(n) => format!("0 branch0 [target-{}]", n),
                Pax::JumpIf0(n) => format!("branch0 [target-{}]", n),
                Pax::Load => format!("@"),
                Pax::Load8 => format!("c@"),
                Pax::LoadTemp => format!("temp@"),
                // Pax::Metadata(name) => format!("( declare \"{}\" )", name),
                Pax::Nand => format!("nand"),
                Pax::Print => format!("print"),
                Pax::PushLiteral(l) => format!("{}", l),
                Pax::Store => format!("!"),
                Pax::Store8 => format!("c!"),
                Pax::StoreTemp => format!("temp!"),
            };
            eprintln!("        {:<40} {}", opcode, format!("\\ {:>80}", command.1));
        }
    }
    eprintln!();
}

pub fn dump_program(source_program: &PaxProgram) {
    for (name, code) in source_program {
        println!("( fn \"{}\" )", name);
        dump_blocks(&code);
        println!();
    }
}
