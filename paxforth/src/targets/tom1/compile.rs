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
        Pax::LoadTemp => tom_output!(
            out,
            "push_literal(0x100)
load()"
        ),
        // FIXME should implement real store16
        Pax::StoreTemp => tom_output!(
            out,
            "push_literal(0x100)
store()"
        ),

        Pax::JumpAlways(target) => tom_output!(
            out,
            "push_literal(0x0)
jump_if_0(target_{})",
            target
        ),
        Pax::JumpIf0(target) => tom_output!(out, "jump_if_0(target_{})", target),

        // FIXME should implement real load16
        Pax::Load | Pax::Load8 => tom_output!(out, "load()"),
        // FIXME should implement real store16
        Pax::Store | Pax::Store8 => tom_output!(out, "store()"),

        Pax::BranchTarget(n) => tom_output!(out, "target_{} = loc()", n),

        Pax::Metadata(_s) => tom_output!(out, "start()"),
        Pax::Exit => {
            tom_output!(out, "");
        }
        Pax::Call(_label) => {
            tom_output!(out, "");
        }

        Pax::Print => tom_output!(out, ""),

        e => {
            unimplemented!("e {:?}", e);
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
                for (op, _pos) in block.commands() {
                    result.push(op.to_owned());
                }
            }

            out.push_str(
                &result
                    .iter()
                    .enumerate()
                    .map(|(i, ir)| cross_compile_ir_tom(i, ir.clone()))
                    .collect::<Vec<String>>()
                    .join("\n"),
            );
            out.push_str("\n");
        }

        out
    }
}
