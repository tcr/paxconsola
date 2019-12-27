#![allow(dead_code)]

use crate::*;

#[derive(Debug, PartialEq, Clone)]
pub enum GbIr {
    // ( a -- a a )
    Dup,                        // dup hl onto stack
    // ( a -- value )
    ReplaceLiteral(usize),      // TOS = $nn
    // ( a -- value )
    ReplaceLabel(usize),        // TOS = .opcode_${nn}
    // ( a b -- b )
    NipIntoDE,                  // store [stack - 1] into de
    // ( a -- a )
    CopyToA,                    // copy top of stack to A
    // ( a -- )
    Pop,                        // pop stack, load TOS into hl
    // ( addr -- )
    PopAndCall,
    // ( -- )
    Ret,
    // ( addr -- value )
    ReplaceLoad,
    // ( addr -- addr )
    StoreDE,
    // ( addr -- addr )
    JumpIfDEIs0,
    // ( b -- cond )
    CompareDEAndReplace,
}

fn translate_to_gb(op: Pax) -> Vec<GbIr> {
    match op {
        // ( -- value )
        Pax::PushLiteral(value) => vec![
            GbIr::Dup,
            GbIr::ReplaceLiteral(value as _),
        ],
        // ( -- label )
        Pax::PushLabel(value) => vec![
            GbIr::Dup,
            GbIr::ReplaceLabel(value as _)
        ],
        // ( address -- value )
        Pax::Load => vec![
            GbIr::ReplaceLoad,
        ],
        // ( value address -- )
        Pax::Store => vec![
            GbIr::NipIntoDE,
            GbIr::StoreDE,
            GbIr::Pop,
        ],
        // ( cond addr -- )
        Pax::JumpIf0 => vec![
            GbIr::NipIntoDE,
            GbIr::JumpIfDEIs0,
        ],
        // ( a b -- cond )
        Pax::Equals => vec![
            GbIr::NipIntoDE,
            GbIr::CompareDEAndReplace,
        ],
        // ( address -- )
        Pax::Call => vec![
            GbIr::PopAndCall
        ],
        // ( -- )
        Pax::Exit | Pax::Stop => vec![
            GbIr::Ret
        ],
        _ => {
            unimplemented!();
        }
    }
}

pub fn cross_compile_ir_gb(idx: &mut usize, op: GbIr) {
    println!("
    ; [gb_ir] {:?}
        ", op);
    match op {
        GbIr::Dup => {
            println!("
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            ");
        }
        GbIr::Pop => {
            println!("
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            ");
        }
        GbIr::ReplaceLiteral(lit) => {
            println!("
    ld hl,{lit}
            ", lit=lit);
        }
        GbIr::ReplaceLabel(lit) => {
            println!("
    ld hl,.opcode_{lit}
            ", lit=lit);
        }
        GbIr::NipIntoDE => {
            println!("
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            ");
        }
        GbIr::CopyToA => {
            println!("
    ; Move to accumulator for comparison
    ld a,l
            ");
        }
        GbIr::ReplaceLoad => {
            println!("
    ld a, [hl]
    ld h, 0
    ld l, a
            ");
        }
        GbIr::StoreDE => {
            println!("
    ld a, e
    ld [hl],a
            ");
        }
        GbIr::JumpIfDEIs0 => {
            println!("
    ld a, e
    cp $0
    jp nz,.next_{index}
    jp hl
.next_{index}:
            ", index = idx);
            *idx += 1;
        }
        GbIr::CompareDEAndReplace => {
            println!("
    ld a, d
    cp h
    jp nz,.next_{index_1}
    ld a, e
    cp l
    jp nz,.next_{index_1}
    ld hl, $1
    jp .next_{index_2}
.next_{index_1}:
    ld hl, $0
.next_{index_2}:
            ", index_1 = idx, index_2 = *idx + 1);
            *idx += 2;
        }
        GbIr::Ret => {
            println!("ret");
        }
        GbIr::PopAndCall => {
            println!("inc c");
            println!("inc c");
            println!("call EMULATE_JP_HL");
        }
    }
}


pub fn cross_compile_forth_gb(code: Vec<Pax>) {

    let mut idx = 0;
    for (i, op) in code.iter().enumerate() {
        println!("
.opcode_{}:
    ; [pax] {:?}
        ", i, op);

        if true {
            translate_to_gb(op.to_owned()).into_iter().for_each(|g| cross_compile_ir_gb(&mut idx, g));
            continue;
        }

        match op {
            Pax::PushLiteral(lit) => {
                println!("
    ld d, h
    ld e, l
    ld hl,{lit}
                ", lit=lit);
            }
            Pax::PushLabel(lit) => {
                println!("
    ld d, h
    ld e, l
    ld hl,.opcode_{lit}
                ", lit=lit);
            }
            Pax::Load => {
                println!("
    ld a, [hl]
    ld h, a
    ld l, 0
                ");
            }
            Pax::Store => {
                println!("
    ld a, e
    ld [hl],a
                ");
            }
            Pax::JumpIf0 => {
                println!("
    ld a,e
    cp $0
    jp nz,.next_{index}
    jp hl
.next_{index}:
                ", index = idx);
                idx += 1;
            }
            Pax::Equals => {
                println!("
    ld a, d
    cp h
    jp nz,.next_{index_1}
    ld a, e
    cp l
    jp nz,.next_{index_1}
    ld hl, $1
    ; pop de
    jp .next_{index_2}
.next_{index_1}:
    ld hl, $0
    ; pop de
.next_{index_2}:
                ", index_1 = idx, index_2 = idx + 1);
                idx += 2;
            }
            Pax::Exit => {
                println!("ret");
            }
            Pax::Call => {
                println!("call EMULATE_JP_HL");
            }
            Pax::Stop => {
                println!("ret");
            }
            op => {
                panic!("not yet implemented: {:?}", op);
            }
        }
    }

    println!("
EMULATE_JP_HL:
    jp	hl
    ")
}
