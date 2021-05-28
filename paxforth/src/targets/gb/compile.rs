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

#[derive(Debug, PartialEq, Clone)]
pub enum GbIr {
    Metadata(String),

    // ( a -- a a )
    Dup, // dup hl onto stack
    // ( a -- value )
    ReplaceLiteral(u16), // TOS = $nn
    // ( a b -- b )
    NipIntoDE, // store [stack - 1] into de
    // ( a -- a )
    CopyToA, // copy TOS to register A
    // ( a -- a )
    CopyToE, // copy TOS to register E
    // ( a -- a )
    CopyToDE, // copy TOS to register DE
    // ( a -- )
    Pop, // pop stack, load TOS into hl
    // ( -- )
    Call(String),
    // ( -- )
    Ret,
    // ( addr -- value )
    ReplaceLoad,
    // ( -- value )
    ReplaceLoadDirect(u16),
    // ( addr -- addr )
    StoreDE,
    // ( -- )
    JumpIfDEIs0(String), // label destination
    // ( -- )
    JumpAlways(String), // label destination
    // ( a -- result )
    ReplaceAddWithDE,
    // ( a -- result )
    ReplaceNandWithDE,
    // ( addr -- )
    PushRetAddr,
    // ( -- )
    AltDupFromTOS,
    // ( a -- peek )
    AltPop,

    // ( addr -- value )
    ReplaceLoad8,
    // ( addr -- addr )
    StoreDE8,

    Label(String),
    SetE(u8),
    Invert,
    Inc,
}

fn translate_to_gb(_i: usize, op: Pax) -> Vec<GbIr> {
    match op {
        Pax::Metadata(s) => vec![GbIr::Metadata(s)],
        // ( -- value )
        Pax::PushLiteral(value) => vec![GbIr::Dup, GbIr::ReplaceLiteral(value as _)],
        // ( address -- value )
        Pax::Load => vec![GbIr::ReplaceLoad],
        // ( address -- value )
        Pax::Load8 => vec![GbIr::ReplaceLoad8],
        // ( value address -- )
        Pax::Store => vec![GbIr::NipIntoDE, GbIr::StoreDE, GbIr::Pop],
        // ( value address -- )
        Pax::Store8 => vec![GbIr::NipIntoDE, GbIr::StoreDE8, GbIr::Pop],
        // ( cond -- )
        Pax::JumpIf0(offset) => vec![
            GbIr::CopyToDE,
            GbIr::Pop,
            GbIr::JumpIfDEIs0(format!(".target_{}", offset)),
        ],
        // ( cond -- )
        Pax::JumpAlways(offset) => vec![GbIr::JumpAlways(format!(".target_{}", offset))],
        // ( address -- )
        Pax::Call(target) => vec![GbIr::Call(format!("PAX_FN_{}", name_slug(&target)))],
        // ( -- )
        Pax::Exit => vec![GbIr::Ret],
        // ( a b -- c )
        Pax::Add => vec![GbIr::NipIntoDE, GbIr::ReplaceAddWithDE],
        // ( a b -- c )
        Pax::Nand => vec![GbIr::NipIntoDE, GbIr::ReplaceNandWithDE],
        // ( a -- )
        Pax::AltPush => vec![GbIr::AltDupFromTOS, GbIr::Pop],
        // ( a -- )
        Pax::AltPop => vec![GbIr::Dup, GbIr::AltPop],
        Pax::Print => vec![
            // nah
        ],
        // ( -- )
        Pax::BranchTarget(n) => vec![GbIr::Label(format!(".target_{}", n))],
        // ( a -- )
        Pax::Drop => vec![GbIr::Pop],
        // ( a -- )
        Pax::Abort => panic!("gb backend doesn't support abort"),
        // ( -- t )
        Pax::LoadTemp => vec![
            GbIr::Dup,
            // FIXME assumes temp is first variable
            GbIr::ReplaceLiteral(BASE_VARIABLE_OFFSET as _),
            GbIr::ReplaceLoad,
        ],
        // ( t -- )
        Pax::StoreTemp => vec![
            GbIr::Dup,
            // FIXME assumes temp is first variable
            GbIr::ReplaceLiteral(BASE_VARIABLE_OFFSET as _),
            GbIr::NipIntoDE,
            GbIr::StoreDE,
            GbIr::Pop,
        ],
    }
}

lazy_static! {
    static ref RE_TRIM_GB: Regex = Regex::new(r"^\s*?\n|\n\s*?$").unwrap();
}

macro_rules! gb_output {
    ($out:expr, $fmt:expr) => (
        $out.push_str(&format!("{}\n", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n")), "")))
    );
    ($out:expr, $fmt:expr, $($arg:tt)*) => (
        $out.push_str(&format!("{}\n", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n"), $($arg)*), "")))
    );
}

pub fn cross_compile_ir_gb(op: GbIr) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
    ; [gb_ir] {:?}
        ",
        op
    );
    match op {
        GbIr::Label(label) => gb_output!(
            out,
            "
{}:
        ",
            label
        ),

        GbIr::Metadata(s) => gb_output!(
            out,
            "
    ; [metadata] {:?}
PAX_FN_{}:
        ",
            s,
            name_slug(&s)
        ),
        GbIr::Dup => {
            gb_output!(
                out,
                "
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            "
            );
        }
        GbIr::Pop => {
            gb_output!(
                out,
                "
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
            "
            );
        }
        GbIr::ReplaceLiteral(lit) => {
            gb_output!(
                out,
                "
    ld hl,{lit}
            ",
                lit = lit
            );
        }
        GbIr::NipIntoDE => {
            gb_output!(
                out,
                "
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
            "
            );
        }
        GbIr::CopyToE => {
            gb_output!(
                out,
                "
    ld e,l
            "
            );
        }
        GbIr::SetE(value) => {
            gb_output!(
                out,
                "
    ld e,{}
            ",
                value
            );
        }
        GbIr::CopyToDE => {
            gb_output!(
                out,
                "
    ld e,l
    ld d,h
            "
            );
        }
        GbIr::CopyToA => {
            gb_output!(
                out,
                "
    ; Move to accumulator for comparison
    ld a,l
            "
            );
        }
        GbIr::ReplaceLoad => {
            gb_output!(
                out,
                "
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b
            "
            );
        }
        GbIr::ReplaceLoadDirect(addr) => {
            gb_output!(
                out,
                "
    ld a, [{}]
    ld l, a
    ld a, [{}+1]
    ld h, a
            ",
                addr,
                addr
            );
        }
        GbIr::ReplaceLoad8 => {
            gb_output!(
                out,
                "
.wait:
    ld   a,[$0FF41]
    bit  1,a       ; Wait until Mode is 0 or 1
    jr   nz,.wait

    ld a, [hl]
    ld l, a
    xor a
    ld h, a
            "
            );
        }
        GbIr::StoreDE8 => {
            // HACK wait for VRAM to be available
            gb_output!(
                out,
                "
.wait:
    ld   a,[$0FF41]
    bit  1,a       ; Wait until Mode is 0 or 1
    jr   nz,.wait

    ld a, e
    ld [hl],a
            "
            );
        }
        GbIr::StoreDE => {
            gb_output!(
                out,
                "
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
            "
            );
        }
        GbIr::PushRetAddr => {
            gb_output!(
                out,
                "
    push hl
            "
            );
        }
        GbIr::JumpAlways(addr) => {
            gb_output!(
                out,
                "
    jp {}
            ",
                addr
            );
        }
        GbIr::JumpIfDEIs0(addr) => {
            gb_output!(
                out,
                "
    ld a,d
    or e
    jp z,{}
            ",
                addr
            );
        }
        GbIr::ReplaceAddWithDE => {
            gb_output!(
                out,
                "
    add hl, de
            "
            );
        }
        GbIr::ReplaceNandWithDE => {
            gb_output!(
                out,
                "
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a
            "
            );
        }
        GbIr::Invert => {
            gb_output!(
                out,
                "
    ld a,l
    cpl
    ld l,a
    ld a,h
    cpl
    ld h,a
            "
            );
        }
        GbIr::AltDupFromTOS => {
            gb_output!(
                out,
                "
    push hl
            "
            );
        }
        GbIr::AltPop => {
            gb_output!(
                out,
                "
    pop hl
            "
            );
        }
        GbIr::Inc => {
            gb_output!(
                out,
                "
    inc hl
            "
            );
        }
        GbIr::Ret => {
            gb_output!(
                out,
                "
    ret






; function start
            "
            );
        }
        GbIr::Call(label) => {
            gb_output!(
                out,
                "
    call {}
            ",
                label
            );
        }
    }
    out
}

pub struct GameboyForthCompiler {}

impl ForthCompiler for GameboyForthCompiler {
    fn compile(program: &PaxProgram) -> String {
        let mut out = String::new();
        for (_name, code) in program {
            let mut result = vec![];
            for (i, block) in code.iter().enumerate() {
                for (op, _pos) in block.commands() {
                    result.extend(translate_to_gb(i, op.to_owned()));
                }
            }

            // In-place optimizations.
            const OPTIMIZE: bool = true;
            const PASSES: usize = 3;
            if OPTIMIZE {
                for _ in 0..PASSES {
                    let mut i = 0;
                    while i < result.len() {
                        let op = &result[i];
                        i += 1;

                        match op {
                            GbIr::Pop => {
                                if let (Some(GbIr::Dup), Some(GbIr::ReplaceLiteral(_))) =
                                    (result.get(i), result.get(i + 1))
                                {
                                    eprintln!("optimizing [pop, dup, replace literal]");
                                    i -= 1;
                                    let _ = result.splice(i..i + 2, vec![]);
                                    continue;
                                }
                            }
                            GbIr::ReplaceLiteral(addr) => {
                                let addr = *addr;
                                if let Some(GbIr::ReplaceLoad) = result.get(i) {
                                    eprintln!("optimizing [replace literal, replace load]");
                                    i -= 1;
                                    let _ = result
                                        .splice(i..i + 2, vec![GbIr::ReplaceLoadDirect(addr)]);
                                    continue;
                                }
                            }
                            GbIr::CopyToDE => {
                                if let (
                                    Some(GbIr::ReplaceLiteral(65535)),
                                    Some(GbIr::ReplaceNandWithDE),
                                ) = (result.get(i), result.get(i + 1))
                                {
                                    eprintln!("optimizing [copy to de, replace literal -1, replace nand with de]");
                                    i -= 1;
                                    let _ = result.splice(i..i + 3, vec![GbIr::Invert]);
                                    continue;
                                }

                                if let (
                                    Some(GbIr::ReplaceLiteral(1)),
                                    Some(GbIr::ReplaceAddWithDE),
                                ) = (result.get(i), result.get(i + 1))
                                {
                                    eprintln!("optimizing [copy to de, replace literal 1, replace add with de]");
                                    i -= 1;
                                    let _ = result.splice(i..i + 3, vec![GbIr::Inc]);
                                    continue;
                                }

                                if let (
                                    Some(GbIr::Pop),
                                    Some(GbIr::JumpIfDEIs0(ref label1)),
                                    Some(GbIr::Label(ref label2)),
                                ) = (result.get(i), result.get(i + 1), result.get(i + 2))
                                {
                                    if label1 == label2 {
                                        eprintln!("optimizing [copy to de, pop, jump to next label, next label]");
                                        i -= 1;
                                        let _ = result.splice(i..i + 4, vec![GbIr::Pop]);
                                    }
                                }
                            }

                            GbIr::Dup => {
                                if let (Some(GbIr::ReplaceLiteral(value)), Some(GbIr::NipIntoDE)) =
                                    (result.get(i), result.get(i + 1))
                                {
                                    let value = *value;
                                    eprintln!("optimizing [dup, replace literal, nip]");
                                    i -= 1;
                                    let _ = result.splice(
                                        i..i + 3,
                                        vec![GbIr::CopyToDE, GbIr::ReplaceLiteral(value)],
                                    );
                                    continue;
                                }

                                // TODO could this can be uncommented once it works with DE values? just
                                // we don't have to assume u8
                                // if let (Some(GbIr::ReplaceLiteral(value)), Some(GbIr::CopyToDE), Some(GbIr::Pop)) = (result.get(i), result.get(i + 1), result.get(1 + 2)) {
                                //     let value = *value;
                                //     eprintln!("optimizing [dup, replace literal, copy to e, pop]");
                                //     i -= 1;
                                //     let _ = result.splice(i..i+4, vec![
                                //         GbIr::SetDE(value as u8),
                                //     ]);
                                //     continue;
                                // }
                            }
                            _ => {}
                        }
                    }
                }
            }

            out.push_str(
                &result
                    .iter()
                    .map(|gbir| cross_compile_ir_gb(gbir.clone()))
                    .collect::<Vec<String>>()
                    .join("\n"),
            );
            out.push_str("\n");

            /*
                for (i, (op, pos)) in code.iter().enumerate() {
                    println!("
            ; [pax_ir:{}] {:?}, file.fs:{}
                    ", i, op, pos);

                    translate_to_gb(i, op.to_owned()).into_iter().for_each(|g| cross_compile_ir_gb(g));
                }
                */
        }

        out
    }
}
