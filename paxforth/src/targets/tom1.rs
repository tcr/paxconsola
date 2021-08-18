#![allow(dead_code)]

use crate::*;
use lazy_static::*;
use percent_encoding::{utf8_percent_encode, AsciiSet, NON_ALPHANUMERIC};
use regex::Regex;

fn name_slug(name: &str) -> String {
    const NON_ALPHA: AsciiSet = NON_ALPHANUMERIC.remove(b'_');
    utf8_percent_encode(name, &NON_ALPHA)
        .to_string()
        .replace("%", "")
        .to_string()
}

lazy_static! {
    static ref RE_TRIM_GB: Regex = Regex::new(r"^\s*?\n|\n\s*?$").unwrap();
}

macro_rules! tom_output {
    ($out:expr, $fmt:expr) => (
        $out.push_str(&format!("{}\n", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n")), "")))
    );
    ($out:expr, $fmt:expr, $($arg:tt)*) => (
        $out.push_str(&format!("{}\n", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n"), $($arg)*), "")))
    );
}

pub fn cross_compile_ir_tom(_i: usize, op: Pax) -> String {
    let mut out = String::new();
    match op {
        Pax::Drop => tom_output!(out, "drop()"),
        Pax::PushLiteral(n) => tom_output!(out, "push_literal({})", n,),
        Pax::Add => tom_output!(out, "add()"),
        Pax::Nand => tom_output!(out, "nand()"),
        Pax::AltPop => tom_output!(out, "return_pop()"),
        Pax::AltPush => tom_output!(out, "return_push()"),

        // FIXME should implement real load16
        Pax::TempLoad => tom_output!(
            out,
            "push_literal(0x100)
load()"
        ),
        // FIXME should implement real store16
        Pax::TempStore => tom_output!(
            out,
            "push_literal(0x100)
store()"
        ),

        // FIXME should implement real load16
        Pax::Load | Pax::Load8 => tom_output!(out, "load()"),
        // FIXME should implement real store16
        Pax::Store | Pax::Store8 => tom_output!(out, "store()"),

        Pax::Print => tom_output!(out, ""),

        e => {
            unimplemented!("e {:?}", e);
        }
    }
    out
}

pub fn cross_compile_ir_term_tom(_i: usize, op: PaxTerm) -> String {
    let mut out = String::new();
    match op {
        PaxTerm::JumpElse(target) => tom_output!(
            out,
            "push_literal(0x0)
jump_if_0(target_{})",
            target
        ),
        PaxTerm::LoopLeave(target) | PaxTerm::LoopIf0(target) | PaxTerm::JumpIf0(target) => {
            tom_output!(out, "jump_if_0(target_{})", target)
        }

        PaxTerm::LoopTarget(n) | PaxTerm::JumpTarget(n) => {
            tom_output!(out, "target_{} = loc()", n)
        }

        // Pax::Metadata(_s) => tom_output!(out, "start()"),
        PaxTerm::Call(_label) | PaxTerm::InlineCall(_label) => {
            tom_output!(out, "");
        }
        PaxTerm::Exit | PaxTerm::InlineExit => {
            tom_output!(out, "");
        }
    }
    out
}

pub struct Tom1ForthCompiler {}

impl ForthCompiler for Tom1ForthCompiler {
    fn compile(program: &PaxProgram) -> String {
        let mut out = String::new();
        for (name, code) in program {
            if name != "main" {
                continue;
            }

            let mut result = vec![];
            for (_i, block) in code.iter().enumerate() {
                for (op, _pos) in block.opcodes() {
                    result.push(cross_compile_ir_tom(result.len(), op.to_owned()));
                }
                result.push(cross_compile_ir_term_tom(
                    result.len(),
                    block.terminator().0.to_owned(),
                ));
            }

            out.push_str(&result.join("\n"));
            out.push_str("\n");
        }

        out
    }
}
