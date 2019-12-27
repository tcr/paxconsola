use crate::*;

pub fn cross_compile_forth_gb(code: Vec<Pax>) {
    let mut idx = 0;
    for op in code {
        println!("    ; {:?}", op);
        match op {
            Pax::Pushn(lit) => {
                println!("    ld d, h
    ld e, l
    ld hl,{lit}
", lit=lit);
            }
            Pax::Load => {
                println!("    ld a, [hl]
    ld h, 0
    ld l, a
");
            }
            Pax::Store => {
                println!("    ld a, e
    ld [hl],a
");
            }
            Pax::JumpIf0 => {
                println!("    ld a,e
    cp $0
    jr z,[hl]
");
            }
            Pax::Equals => {
                println!("    ld a, d
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
                println!("    ret
");
            }
            Pax::Call => {
                println!("    call [hl]
");
            }
            Pax::Stop => {
                println!("    ret
");
            }
            op => {
                panic!("not yet implemented: {:?}", op);
            }
        }
    }
}
