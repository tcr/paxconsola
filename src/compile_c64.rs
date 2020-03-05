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

macro_rules! gb_output {
    ($out:expr, $fmt:expr) => (
        $out.push_str(&format!("{}\n", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n")), "")))
    );
    ($out:expr, $fmt:expr, $($arg:tt)*) => (
        $out.push_str(&format!("{}\n", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n"), $($arg)*), "")))
    );
}

pub fn cross_compile_ir_c64(op: SuperPax) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
    ; [c64_ir] {:?}
        ",
        op
    );
    match op {
        SuperPax::Drop => gb_output!(
            out,
            "
    pla
    tay
    pla
        "
        ),
        SuperPax::PushLiteral(n) => gb_output!(
            out,
            "
    pha
    tya
    pha
    ldy #{}
    lda #{}
        ",
            ((n as u16) >> 8) & 0xFF,
            (n as u8) & 0xFF,
        ),
        SuperPax::Add => gb_output!(
            out,
            "
    clc
    sta TEMP
    sty TEMP2
    pla
    sta TEMP3
    pla
    adc TEMP
    sta TEMP
    lda TEMP2
    adc TEMP3
    tay
    lda TEMP
        "
        ),
        SuperPax::Nand => gb_output!(
            out,
            "
    clc
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor $ff
    tya
    pla
    adc TEMP2
    eor $ff
        "
        ),
        SuperPax::AltPop => gb_output!(
            out,
            "
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x
        "
        ),
        SuperPax::AltPush => gb_output!(
            out,
            "
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla
        "
        ),

        // FIXME should implement real load16
        SuperPax::LoadTemp => gb_output!(
            out,
            "
    lda TEMP_PAX1
    ldy TEMP_PAX2
        "
        ),
        // FIXME should implement real store16
        SuperPax::StoreTemp => gb_output!(
            out,
            "
    sta TEMP_PAX1
    ldy TEMP_PAX2
        "
        ),

        SuperPax::JumpAlways(target) => gb_output!(
            out,
            "
    jmp @target_{}
        ",
            target
        ),
        SuperPax::JumpIf0(target) => gb_output!(
            out,
            "
    sta TEMP
    tya
    ora TEMP
    sta TEMP
    pla
    tay
    pla
    cmp TEMP
    bne *+5
    jmp @target_{}
        ",
            target
        ),

        // FIXME should implement real load16
        SuperPax::Load | SuperPax::Load8 => gb_output!(
            out,
            "
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y
        "
        ),
        // FIXME should implement real store16
        SuperPax::Store | SuperPax::Store8 => gb_output!(
            out,
            "
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #1
    sta (TEMP),y
    pla
    tay
    pla
        "
        ),

        SuperPax::BranchTarget(n) => gb_output!(
            out,
            "
@target_{}:
        ",
            n
        ),

        SuperPax::Metadata(s) => gb_output!(
            out,
            "
    ; [metadata] {:?}
PAX_FN_{}:
        ",
            s,
            name_slug(&s)
        ),
        SuperPax::Exit => {
            gb_output!(
                out,
                "
    rts






; function start
            "
            );
        }
        SuperPax::Call(label) => {
            gb_output!(
                out,
                "
    jsr PAX_FN_{}
            ",
                name_slug(&label)
            );
        }

        e => {
            unimplemented!("e {:?}", e);
        }
    }
    out
}

pub fn cross_compile_forth_c64(program: SuperPaxProgram) -> String {
    let mut out = String::new();
    for (name, code) in program {
        let mut result = vec![];
        for (i, block) in code.iter().enumerate() {
            for (op, pos) in block.commands() {
                result.push(op.to_owned());
            }
        }

        out.push_str(
            &result
                .iter()
                .map(|ir| cross_compile_ir_c64(ir.clone()))
                .collect::<Vec<String>>()
                .join("\n"),
        );
        out.push_str("\n");
    }

    out
}
