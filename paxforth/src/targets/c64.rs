#![allow(dead_code)]

use crate::*;
use lazy_static::*;
use percent_encoding::{utf8_percent_encode, AsciiSet, NON_ALPHANUMERIC};
use regex::Regex;
use maplit::btreemap;
use std::collections::BTreeMap;

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

// Whether the data stack should live in zero-page, and the return stack should live in
// stack memory. This changes code verbosity and CPU time.
const DATA_STACK_IN_ZERO_PAGE: bool = true;

pub fn cross_compile_ir_c64(i: usize, op: Located<Pax>) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
; {}
@OPCODE_{}:   ; [c64_ir] {:?}
        ",
        op.1,
        i,
        op.0,
    );
    match op.0 {
        Pax::Drop => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    dex
    dex
            ",
                )
            } else {
                gb_output!(
                    out,
                    "
    pla
    tay
    pla
            "
                )
            }
        }
        Pax::PushLiteral(n) => {
            let val = n as u16;
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    inx
    inx
    lda #{}
    sta $00,x
    lda #{}
    sta $01,x
            ",
                    (val as u8) & 0xFF,
                    (val >> 8) & 0xFF,
                )
            } else {
                gb_output!(
                    out,
                    "
    pha
    tya
    pha
    ldy #{}
    lda #{}
            ",
                    (val >> 8) & 0xFF,
                    (val as u8) & 0xFF,
                )
            }
        }
        Pax::Add => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x
                    "
                )
            } else {
                gb_output!(
                    out,
                    "
    ; 36
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
                )
            }
        }
        Pax::Nand => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    ; 26
    dex
    dex
    lda $00,x
    and $02,x
    eor #$ff
    sta $00,x
    lda $01,x
    and $03,x
    eor #$ff
    sta $01,x

            "
                )
            } else {
                gb_output!(
                    out,
                    "
    ; 27
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
                )
            }
        }
        Pax::AltPop => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x
        "
                )
            } else {
                gb_output!(
                    out,
                    "
    pha
    tya
    pha ; bump down TOS
    dex
    ldy $00,x
    dex
    lda $00,x
        "
                )
            }
        }
        Pax::AltPush => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha
                    "
                )
            } else {
                gb_output!(
                    out,
                    "
    sta $00,x
    inx
    sty $00,x
    inx
    pla
    tay
    pla
                    "
                )
            }
        }

        // FIXME should implement real load16
        Pax::TempLoad => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x
                    "
                )
            } else {
                gb_output!(
                    out,
                    "
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2
                    "
                )
            }
        }
        // FIXME should implement real store16
        Pax::TempStore => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1
                    "
                )
            } else {
                gb_output!(
                    out,
                    "
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla
                    "
                )
            }
        }

        // FIXME should implement real load16
        Pax::Load | Pax::Load8 => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x
                    "
                )
            } else {
                gb_output!(
                    out,
                    "
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y
                    "
                )
            }
        }
        // FIXME should implement real store16
        Pax::Store | Pax::Store8 => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte
                    "
                )
            } else {
                gb_output!(
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
                )
            }
        }

        e => {
            unimplemented!("e {:?}", e);
        }
    }
    out
}

pub fn cross_compile_ir_term_c64(i: usize, op: Located<PaxTerm>) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
; {}
@OPCODE_{}:   ; [c64_ir] {:?}
        ",
        op.1,
        i,
        op.0
    );
    match op.0 {
        PaxTerm::LoopLeave(target) | PaxTerm::JumpElse(target) => {
            gb_output!(
                out,
                "
    jmp @target_{}
            ",
                target
            )
        }
        PaxTerm::LoopIf0(target) => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_{}
                    ",
                    target
                )
            } else {
                gb_output!(
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
                )
            }
        }
        PaxTerm::JumpIf0(target) => {
            if DATA_STACK_IN_ZERO_PAGE {
                gb_output!(
                    out,
                    "
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_{}
                    ",
                    target
                )
            } else {
                gb_output!(
                    out,
                    "
    sta TEMP
    tya
    ora TEMP
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
                )
            }
        }

        PaxTerm::LoopTarget(_n) | PaxTerm::JumpTarget(_n) => {}

        PaxTerm::Exit => {
            gb_output!(
                out,
                "
    rts
.endproc





; function start
            "
            );
        }
        PaxTerm::Call(label) => {
            if label == "*" {
                gb_output!(
                    out,
                    "
        jsr NATIVE_FN_{}
                ",
                    name_slug(&label)
                );
            } else if label == "-" {
                gb_output!(
                    out,
                    "
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x
                ",
                );
            } else {
                gb_output!(
                    out,
                    "
        jsr PAX_FN_{}
                ",
                    name_slug(&label)
                );
            }
        }
    }
    out
}

pub struct C64ForthCompiler {}

impl ForthCompiler for C64ForthCompiler {
    fn preludes() -> Vec<(PathBuf, String)> {
        vec![
            (PathBuf::from("../../lib/prelude.fth"), PRELUDE.to_string()),
            (PathBuf::from("../../lib/prelude-c64.fth"), PRELUDE_C64.to_string()),
        ]
    }

    fn compile(program: &PaxProgram) -> String {
        let mut out = String::new();
        for (name, code) in program {
            gb_output!(
                out,
                "
.proc PAX_FN_{}
            ",
                name_slug(&name)
            );

            let mut result = vec![];
            for (block_index, block) in code.iter().enumerate() {
                let mut target_str = String::new();
                gb_output!(
                    target_str,
                    "
@target_{}:
                ",
                    block_index
                );
                result.push(target_str);

                for op in block.opcodes() {
                    result.push(cross_compile_ir_c64(result.len(), op.clone()));
                }
                let terminator = block.terminator();
                result.push(cross_compile_ir_term_c64(result.len(), terminator.clone()));
            }

            out.push_str(&result.join("\n"));
            out.push_str("\n");
        }

        out
    }
}
