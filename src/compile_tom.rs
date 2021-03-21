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

pub fn cross_compile_ir_tom(i: usize, op: SuperPax) -> String {
    let mut out = String::new();
    match op {
        SuperPax::Drop => tom_output!(out, "drop()"),
        SuperPax::PushLiteral(n) => tom_output!(out, "push_literal({})", n,),
        SuperPax::Add => tom_output!(out, "add()"),
        SuperPax::Nand => tom_output!(out, "nand()"),
        SuperPax::AltPop => tom_output!(out, "return_pop()"),
        SuperPax::AltPush => tom_output!(out, "return_push()"),

        // FIXME should implement real load16
        SuperPax::LoadTemp => tom_output!(
            out,
            "push_literal(0x100)
load()"
        ),
        // FIXME should implement real store16
        SuperPax::StoreTemp => tom_output!(
            out,
            "push_literal(0x100)
store()"
        ),

        SuperPax::JumpAlways(target) => tom_output!(
            out,
            "push_literal(0x0)
jump_if_0(target_{})",
            target
        ),
        SuperPax::JumpIf0(target) => tom_output!(out, "jump_if_0(target_{})", target),

        // FIXME should implement real load16
        SuperPax::Load | SuperPax::Load8 => tom_output!(out, "load()"),
        // FIXME should implement real store16
        SuperPax::Store | SuperPax::Store8 => tom_output!(out, "store()"),

        SuperPax::BranchTarget(n) => tom_output!(out, "target_{} = loc()", n),

        SuperPax::Metadata(s) => tom_output!(out, "start()"),
        SuperPax::Exit => {
            tom_output!(out, "");
        }
        SuperPax::Call(label) => {
            tom_output!(out, "");
        }

        SuperPax::Print => tom_output!(out, ""),

        e => {
            unimplemented!("e {:?}", e);
        }
    }
    out
}

pub struct Tom1ForthCompiler {}

impl ForthCompiler for Tom1ForthCompiler {
    fn compile(program: &SuperPaxProgram) -> Vec<u8> {
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

        out.as_bytes().to_vec()
    }
}
