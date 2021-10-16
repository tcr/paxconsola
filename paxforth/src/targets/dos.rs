// http://www.forth.org/fd/FD-V13N6.pdf
// See "Pygmy" code reference

// use SP for data until you need ret values, then exchange
// seems faster than alternative? always counts down though

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

pub fn cross_compile_ir_dos(i: usize, op: Located<Pax>) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
; {} {:?}
.op_{}:
        ",
        op.1,
        op.0,
        i,
    );
    match op.0 {
        Pax::Drop => {
            gb_output!(
                out,
                "
    pop bx
                ",
            )
        }
        Pax::PushLiteral(n) => {
            let val = n as u16;
            gb_output!(
                out,
                "
    push bx
    mov bx,{}
            ",
                val,
            )
        }
        Pax::Add => {
            gb_output!(
                out,
                "
    pop ax
    add bx,ax
                "
            )
        }
        Pax::Nand => {
            gb_output!(
                out,
                "
    pop ax
    and bx,ax
    not bx
                "
            )
        }
        Pax::AltPop => {
            gb_output!(
                out,
                "
    push bx
    xchg sp,bp
    pop bx
    xchg sp,bp
                "
            )
        }
        Pax::AltPush => {
            gb_output!(
                out,
                "
    xchg sp,bp
    push bx
    xchg sp,bp
    pop bx
                "
            )
        }

        Pax::TempLoad => {
            gb_output!(
                out,
                "
    push bx
    mov bx,cx
                "
            )
        }
        Pax::TempStore => {
            gb_output!(
                out,
                "
    mov cx,bx
    pop bx
                "
            )
        }

        Pax::Load => {
            gb_output!(
                out,
                "
    mov bx,[bx]
                "
            )
        }
        Pax::Store => {
            gb_output!(
                out,
                "
    pop ax
    mov [bx],ax
    pop bx
                "
            )
        }
        Pax::Load8 => {
            gb_output!(
                out,
                "
    mov bx,[bx]
    xor bh,bh
                "
            )
        }
        Pax::Store8 => {
            gb_output!(
                out,
                "
    pop ax
    mov [bx],al
    pop bx
                "
            )
        }
        Pax::Emit => {
            gb_output!(
                out,
                "
    mov al, bl
    mov ah, 0x0E
    int 10h
    pop bx
                "
            )
        }
        Pax::Abort => {
            gb_output!(
                out,
                "
    int 20h
                "
            )
        }

        e => {
            unimplemented!("e {:?}", e);
        }
    }
    out
}

pub fn cross_compile_ir_term_dos(i: usize, op: Located<PaxTerm>) -> String {
    let mut out = String::new();
    gb_output!(
        out,
        "
; {} {:?}
.op_{}:
        ",
        op.1,
        op.0,
        i,
    );
    match op.0 {
        PaxTerm::LoopLeave(target) | PaxTerm::JumpElse(target) => {
            gb_output!(
                out,
                "
    jmp .target_{}
                ",
                target
            )
        }
        PaxTerm::LoopIf0(target) => {
            gb_output!(
                out,
                "
    mov ax,bx
    pop bx
    test ax,ax
    jz .target_{}
                ",
                target
            )
        }
        PaxTerm::JumpIf0(target) => {
            gb_output!(
                out,
                "
    mov ax,bx
    pop bx
    test ax,ax
    jz .target_{}
                ",
                target
            )
        }

        PaxTerm::LoopTarget(_n) | PaxTerm::JumpTarget(_n) => {}

        PaxTerm::Exit => {
            gb_output!(
                out,
                "
    ; switch hardware stack to alt stack to pop value
    xchg sp,bp
    ret





; function start
            "
            );
        }
        PaxTerm::Call(label) => {
            gb_output!(
                out,
                "
    ; switch hardware stack to alt stack to push value
    xchg sp,bp
    call PAX_{}
    xchg sp,bp
                ",
                name_slug(&label)
            );
        }
        PaxTerm::ExternCall(label) => {
            gb_output!(
                out,
                "
    ; switch hardware stack to alt stack to push value
    xchg sp,bp
    call PAXEXT_{}
    xchg sp,bp
                ",
                name_slug(&label)
            );
        }
    }
    out
}

pub struct DosForthCompiler {}

impl ForthCompiler for DosForthCompiler {
    fn compile(program: &PaxProgram) -> String {
        let mut out = String::new();
        for (name, code) in program {
            gb_output!(
                out,
                "
PAX_{}:
    ; switch hardware stack back from alt stack
    xchg sp,bp

            ",
                name_slug(&name)
            );

            let mut result = vec![];
            for (block_index, block) in code.iter().enumerate() {
                let mut target_str = String::new();
                gb_output!(
                    target_str,
                    "
    .target_{}:
                    ",
                    block_index
                );
                result.push(target_str);

                for op in block.opcodes() {
                    result.push(cross_compile_ir_dos(result.len(), op.clone()));
                }
                let terminator = block.terminator();
                result.push(cross_compile_ir_term_dos(result.len(), terminator.clone()));
            }

            out.push_str(&result.join("\n"));
            out.push_str("\n");
        }

        out
    }
}
