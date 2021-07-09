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

pub fn cross_compile_ir_c64(i: usize, op: Pax) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
@OPCODE_{}:   ; [c64_ir] {:?}
        ",
        i,
        op
    );
    match op {
        Pax::Drop => gb_output!(
            out,
            "
    pla
    tay
    pla
        "
        ),
        Pax::PushLiteral(n) => gb_output!(
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
        Pax::Add => gb_output!(
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
        Pax::Nand => gb_output!(
            out,
            "
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff
        "
        ),
        Pax::AltPop => gb_output!(
            out,
            "
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x
        "
        ),
        Pax::AltPush => gb_output!(
            out,
            "
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla
        "
        ),

        // FIXME should implement real load16
        Pax::LoadTemp => gb_output!(
            out,
            "
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2
        "
        ),
        // FIXME should implement real store16
        Pax::StoreTemp => gb_output!(
            out,
            "
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla
        "
        ),

        // FIXME should implement real load16
        Pax::Load | Pax::Load8 => gb_output!(
            out,
            "
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y
        "
        ),
        // FIXME should implement real store16
        Pax::Store | Pax::Store8 => gb_output!(
            out,
            "
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla
        "
        ),

        //         Pax::Metadata(s) => gb_output!(
        //             out,
        //             "
        //     ; [metadata] {:?}
        // PAX_FN_{}:
        //         ",
        //             s,
        //             name_slug(&s)
        //         ),
        e => {
            unimplemented!("e {:?}", e);
        }
    }
    out
}

pub fn cross_compile_ir_term_c64(i: usize, op: PaxTerm) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
@OPCODE_{}:   ; [c64_ir] {:?}
        ",
        i,
        op
    );
    match op {
        PaxTerm::JumpAlways(target) => gb_output!(
            out,
            "
    jmp @target_{}
        ",
            target
        ),
        PaxTerm::LoopIf0(target) | PaxTerm::JumpIf0(target) => gb_output!(
            out,
            "
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_{}

    lda TEMP2
        ",
            target
        ),

        PaxTerm::LoopTarget(n) | PaxTerm::BranchTarget(n) => gb_output!(
            out,
            "
@target_{}:
        ",
            n
        ),

        //         Pax::Metadata(s) => gb_output!(
        //             out,
        //             "
        //     ; [metadata] {:?}
        // PAX_FN_{}:
        //         ",
        //             s,
        //             name_slug(&s)
        //         ),
        PaxTerm::Exit => {
            gb_output!(
                out,
                "
    ;rts






; function start
            "
            );
        }
        PaxTerm::Call(label) => {
            gb_output!(
                out,
                "
    jsr PAX_FN_{}
            ",
                name_slug(&label)
            );
        }
    }
    out
}

pub struct C64ForthCompiler {}

impl ForthCompiler for C64ForthCompiler {
    fn compile(program: &PaxProgram) -> String {
        let mut out = String::new();
        for (name, code) in program {
            if name != "main" {
                continue;
            }

            let mut result = vec![];
            for (_i, block) in code.iter().enumerate() {
                for (op, _pos) in block.opcodes() {
                    result.push(cross_compile_ir_c64(result.len(), op.to_owned()));
                }
                let terminator = block.terminator();
                result.push(cross_compile_ir_term_c64(
                    result.len(),
                    terminator.0.to_owned(),
                ));
            }

            out.push_str(&result.join("\n"));
            out.push_str("\n");
        }

        out
    }
}
