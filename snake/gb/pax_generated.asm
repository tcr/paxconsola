
; [pax_ir] PushLiteral(4)
.opcode_0:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(4)
    ld hl,4

; [pax_ir] PushLiteral(6)
.opcode_1:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(6)
    ld hl,6

; [pax_ir] Multiply
.opcode_2:
        
