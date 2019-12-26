use crate::*;

pub fn cross_compile_forth_gb(code: Vec<Pax>) {
    let mut idx = 0;
    for op in code {
        println!(";[op] {:?}", op);
        match op {
            Pax::Pushn(lit) => {
                println!("    ; {lit}
    ld d, h
    ld e, l ; push new value
    ld hl,{lit}
", lit=lit);
            }
            Pax::Load => {
                println!("    ; @ (8-bit)
    ld a, [hl]
    ld h, 0
    ld l, a
");
            }
            Pax::Store => {
                println!("    ; ! (8-bit)
    ld a, e
    ld [hl],a
");
            }
            Pax::If => {
                println!("    ; if (8-bit)
    ld a,l
    cp $0
    jr z,.next_{index}
", index=idx);
                idx += 1;
            }
            Pax::Then => {
                println!(".next_{index}
", index=idx - 1);
            }
            Pax::Equals => {
                println!("    ; =
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
            _ => {}
        }
    }
}
