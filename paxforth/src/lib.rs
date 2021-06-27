#![recursion_limit = "1024"]

pub mod analyze;
pub mod ast;
pub mod check;
pub mod debug;
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
        let (opcodes, terminator) = block.opcodes_and_terminator();
        for command in opcodes {
            let opcode = match &command.0 {
                Pax::Abort => format!("abort"),
                Pax::Add => format!("+"),
                Pax::AltPop => format!("r<"),
                Pax::AltPush => format!("r>"),
                Pax::Drop => format!("drop"),
                Pax::Load => format!("@"),
                Pax::Load8 => format!("c@"),
                Pax::LoadTemp => format!("temp@"),
                Pax::Nand => format!("nand"),
                Pax::Print => format!("print"),
                Pax::Emit => format!("emit"),
                Pax::PushLiteral(l) => format!("{}", l),
                Pax::Store => format!("!"),
                Pax::Store8 => format!("c!"),
                Pax::StoreTemp => format!("temp!"),
            };
            eprintln!("        {:<40} {}", opcode, format!("\\ {:>80}", command.1));
        }
        {
            let opcode = match &terminator.0 {
                PaxTerm::BranchTarget(n) => format!("[target-{}]", n),
                PaxTerm::Call(f) => format!("call {:?}", f),
                PaxTerm::Exit => format!("exit"),
                PaxTerm::JumpAlways(n) => format!("0 branch0 [target-{}]", n),
                PaxTerm::JumpIf0(n) => format!("branch0 [target-{}]", n),
            };
            eprintln!(
                "        {:<40} {}",
                opcode,
                format!("\\ {:>80}", terminator.1)
            );
        }
    }
    eprintln!();
}

pub fn dump_program(source_program: &PaxProgram) {
    for (name, code) in source_program {
        eprintln!("( fn \"{}\" )", name);
        dump_blocks(&code);
        eprintln!();
    }
}
