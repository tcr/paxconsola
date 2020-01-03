#![allow(dead_code)]

use crate::*;
use lazy_static::*;
use regex::Regex;
use percent_encoding::{utf8_percent_encode, NON_ALPHANUMERIC, AsciiSet};

fn name_slug(name: &str) -> String {
    const NON_ALPHA: AsciiSet = NON_ALPHANUMERIC.remove(b'_');
    utf8_percent_encode(name, &NON_ALPHA).to_string().replace("%", "").to_string()
}

#[derive(Debug, PartialEq, Clone)]
pub enum GbIr {
    Metadata(String),

    // ( a -- a a )
    Dup,                        // dup hl onto stack
    // ( a -- value )
    ReplaceLiteral(u16),      // TOS = $nn
    // ( a b -- b )
    NipIntoDE,                  // store [stack - 1] into de
    // ( a -- a )
    CopyToA,                    // copy TOS to register A
    // ( a -- a )
    CopyToE,                    // copy TOS to register E
    // ( a -- )
    Pop,                        // pop stack, load TOS into hl
    // ( -- )
    Call(String),
    // ( -- )
    Ret,
    // ( addr -- value )
    ReplaceLoad,
    // ( addr -- addr )
    StoreDE,
    // ( -- )
    JumpIfEIs0(String),         // label destination
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
}

fn translate_to_gb(i: usize, op: Pax) -> Vec<GbIr> {
    match op {
        Pax::Metadata(s) => vec![
            GbIr::Metadata(s),
        ],
        // ( -- value )
        Pax::PushLiteral(value) => vec![
            GbIr::Dup,
            GbIr::ReplaceLiteral(value as _),
        ],
        // ( address -- value )
        Pax::Load => vec![
            GbIr::ReplaceLoad,
        ],
        // ( address -- value )
        Pax::Load8 => vec![
            GbIr::ReplaceLoad8,
        ],
        // ( value address -- )
        Pax::Store => vec![
            GbIr::NipIntoDE,
            GbIr::StoreDE,
            GbIr::Pop,
        ],
        // ( value address -- )
        Pax::Store8 => vec![
            GbIr::NipIntoDE,
            GbIr::StoreDE8,
            GbIr::Pop,
        ],
        // ( cond -- )
        Pax::JumpIf0(offset) => vec![
            GbIr::CopyToE,
            GbIr::Pop,
            GbIr::JumpIfEIs0(format!(".target_{}", offset)),
        ],
        // ( address -- )
        Pax::Call(target) => vec![
            GbIr::Call(format!("PAX_FN_{}", name_slug(&target))),
        ],
        // ( -- )
        Pax::Exit | Pax::Stop => vec![
            GbIr::Ret
        ],
        // ( a b -- c )
        Pax::Add => vec![
            GbIr::NipIntoDE,
            GbIr::ReplaceAddWithDE,
        ],
        // ( a b -- c )
        Pax::Nand => vec![
            GbIr::NipIntoDE,
            GbIr::ReplaceNandWithDE,
        ],
        // ( a -- )
        Pax::AltPush => vec![
            GbIr::AltDupFromTOS,
            GbIr::Pop,
        ],
        // ( a -- )
        Pax::AltPop => vec![
            GbIr::Dup,
            GbIr::AltPop,
        ],
        // Pax::Remainder => vec![],
        Pax::Print => vec![
            // nah
        ],
        // ( -- )
        Pax::BranchTarget => vec![
            GbIr::Label(format!(".target_{}", i)),
        ],
        op => {
            panic!("not yet implemented: {:?}", op);
        }
    }
}

lazy_static! {
    static ref RE_TRIM_GB: Regex = Regex::new(r"^\s*?\n|\n\s*?$").unwrap();
}

macro_rules! gb_output {
    ($fmt:expr) => (
        println!("{}", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n")), ""))
    );
    ($fmt:expr, $($arg:tt)*) => (
        println!("{}", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n"), $($arg)*), ""))
    );
}

pub fn cross_compile_ir_gb(op: GbIr) {
    gb_output!("
    ; [gb_ir] {:?}
        ", op);
    match op {
        GbIr::Label(label) => gb_output!("
{}:
        ", label),

        GbIr::Metadata(s) => gb_output!("
    ; [metadata] {:?}
PAX_FN_{}:
        ", s, name_slug(&s)),
        GbIr::Dup => {
            gb_output!("
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            ");
        }
        GbIr::Pop => {
            gb_output!("
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
            ");
        }
        GbIr::ReplaceLiteral(lit) => {
            gb_output!("
    ld hl,{lit}
            ", lit=lit);
        }
        GbIr::NipIntoDE => {
            gb_output!("
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
            ");
        }
        GbIr::CopyToE => {
            gb_output!("
    ld e,l
            ");
        }
        GbIr::CopyToA => {
            gb_output!("
    ; Move to accumulator for comparison
    ld a,l
            ");
        }
        GbIr::ReplaceLoad =>  {
            gb_output!("
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b
            ");
        }
        GbIr::ReplaceLoad8 =>  {
            gb_output!("
    ld a, [hl]
    ld l, a
    xor a
    ld h, a
            ");
        }
        GbIr::StoreDE8 => {
            gb_output!("
    ld a, e
    ld [hl],a
            ");
        }
        GbIr::StoreDE => {
            gb_output!("
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
            ");
        }
        GbIr::PushRetAddr => {
            gb_output!("
    push hl
            ");
        }
        GbIr::JumpIfEIs0(addr) => {
            gb_output!("
    ld a, e
    cp $0
    jp z,{}
            ", addr);
        }
        GbIr::ReplaceAddWithDE => {
            gb_output!("
    add hl, de
            ");
        }
        GbIr::ReplaceNandWithDE => {
            gb_output!("
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a
            ");
        }
        GbIr::AltDupFromTOS => {
            gb_output!("
    push hl
            ");
        }
        GbIr::AltPop => {
            gb_output!("
    pop hl
            ");
        }
        GbIr::Ret => {
            gb_output!("
    ret






; function start
            ");
        }
        GbIr::Call(label) => {
            gb_output!("
    call {}
            ", label);
        }
    }
}


pub fn cross_compile_forth_gb(program: Program) {
    for (name, code) in program {
        let mut result = vec![];
        for (i, (op, pos)) in code.iter().enumerate() {
            result.extend(translate_to_gb(i, op.to_owned()));
        }

        // In-place optimizations.
        let mut i = 0;
        while i < result.len() {
            let op = &result[i];
            i += 1;

            match op {
                GbIr::Pop => {
                    if let (Some(GbIr::Dup), Some(GbIr::ReplaceLiteral(_))) = (result.get(i), result.get(i + 1)) {
                        eprintln!("optimizing [pop, dup, replace]");
                        i -= 1;
                        let _ = result.splice(i..i+2, vec![]);
                        continue;
                    }
                }
                _ => {}
            }
        }

        for gbir in result {
            cross_compile_ir_gb(gbir);
            println!();
        }

        /*
        for (i, (op, pos)) in code.iter().enumerate() {
            println!("
    ; [pax_ir:{}] {:?}, file.fs:{}
            ", i, op, pos);

            translate_to_gb(i, op.to_owned()).into_iter().for_each(|g| cross_compile_ir_gb(g));
        }
        */
    }
}
