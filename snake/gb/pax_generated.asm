
.opcode_0:
    ; [pax] PushLiteral(49156)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49156)
        

    ld hl,49156
            

.opcode_1:
    ; [pax] Load
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

.opcode_2:
    ; [pax] PushLiteral(37)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(37)
        

    ld hl,37
            

.opcode_3:
    ; [pax] Equals
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] CompareDEAndReplace
        

    ld a, d
    cp h
    jp nz,.next_0
    ld a, e
    cp l
    jp nz,.next_0
    ld hl, $1
    jp .next_1
.next_0:
    ld hl, $0
.next_1:
            

.opcode_4:
    ; [pax] PushLabel(8)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(8)
        

    ld hl,.opcode_8
            

.opcode_5:
    ; [pax] JumpIf0
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] JumpIfDEIs0
        

    ld a, e
    cp $0
    jp nz,.next_2
    jp hl
.next_2:
            

.opcode_6:
    ; [pax] PushLabel(9)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(9)
        

    ld hl,.opcode_9
            

.opcode_7:
    ; [pax] Call
        

    ; [gb_ir] PopAndCall
        
inc c
inc c
call EMULATE_JP_HL

.opcode_8:
    ; [pax] Stop
        

    ; [gb_ir] Ret
        
ret

.opcode_9:
    ; [pax] PushLiteral(20)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(20)
        

    ld hl,20
            

.opcode_10:
    ; [pax] PushLiteral(38912)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

.opcode_11:
    ; [pax] Store
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] StoreDE
        

    ld a, e
    ld [hl],a
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

.opcode_12:
    ; [pax] Exit
        

    ; [gb_ir] Ret
        
ret

EMULATE_JP_HL:
    jp	hl
    
