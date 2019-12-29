
; [pax_ir] PushLiteral(39)
.opcode_0:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(39)
        

    ld hl,39
            

; [pax_ir] PushLiteral(39)
.opcode_1:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(39)
        

    ld hl,39
            

; [pax_ir] PushLabel(14)
.opcode_2:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(14)
        

    ld hl,.opcode_14
            

; [pax_ir] Call
.opcode_3:
        

    ; [gb_ir] PopAndCall
        
inc c
inc c
call EMULATE_JP_HL

; [pax_ir] Equals
.opcode_4:
        

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
            

; [pax_ir] PushLabel(9)
.opcode_5:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(9)
        

    ld hl,.opcode_9
            

; [pax_ir] JumpIf0
.opcode_6:
        

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
            

; [pax_ir] PushLabel(31)
.opcode_7:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(31)
        

    ld hl,.opcode_31
            

; [pax_ir] Call
.opcode_8:
        

    ; [gb_ir] PopAndCall
        
inc c
inc c
call EMULATE_JP_HL

; [pax_ir] Stop
.opcode_9:
        

    ; [gb_ir] Ret
        
ret

; [pax_ir] Metadata("drop")
.opcode_10:
        

    ; [gb_ir] Metadata("drop")
        

    ; [metadata] "drop"
        

; [pax_ir] PushLabel(13)
.opcode_11:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(13)
        

    ld hl,.opcode_13
            

; [pax_ir] JumpIf0
.opcode_12:
        

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
    jp nz,.next_3
    jp hl
.next_3:
            

; [pax_ir] Exit
.opcode_13:
        

    ; [gb_ir] Ret
        
ret

; [pax_ir] Metadata("over")
.opcode_14:
        

    ; [gb_ir] Metadata("over")
        

    ; [metadata] "over"
        

; [pax_ir] AltPush
.opcode_15:
        

    ; [gb_ir] AltDup
        

    push hl
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

; [pax_ir] PushLiteral(49158)
.opcode_16:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49158)
        

    ld hl,49158
            

; [pax_ir] Store
.opcode_17:
        

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
            

; [pax_ir] PushLiteral(49158)
.opcode_18:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49158)
        

    ld hl,49158
            

; [pax_ir] Load
.opcode_19:
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

; [pax_ir] AltPop
.opcode_20:
        

    ; [gb_ir] AltPop
        

    pop hl
            

; [pax_ir] PushLiteral(49158)
.opcode_21:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49158)
        

    ld hl,49158
            

; [pax_ir] Load
.opcode_22:
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

; [pax_ir] Exit
.opcode_23:
        

    ; [gb_ir] Ret
        
ret

; [pax_ir] Metadata("move-right")
.opcode_24:
        

    ; [gb_ir] Metadata("move-right")
        

    ; [metadata] "move-right"
        

; [pax_ir] PushLiteral(18)
.opcode_25:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(18)
        

    ld hl,18
            

; [pax_ir] PushLiteral(38912)
.opcode_26:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

; [pax_ir] PushLiteral(3)
.opcode_27:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(3)
        

    ld hl,3
            

; [pax_ir] Add
.opcode_28:
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] ReplaceAddWithDE
        

    add hl, de
            

; [pax_ir] Store
.opcode_29:
        

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
            

; [pax_ir] Exit
.opcode_30:
        

    ; [gb_ir] Ret
        
ret

; [pax_ir] Metadata("move-left")
.opcode_31:
        

    ; [gb_ir] Metadata("move-left")
        

    ; [metadata] "move-left"
        

; [pax_ir] PushLiteral(21)
.opcode_32:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(21)
        

    ld hl,21
            

; [pax_ir] PushLiteral(38912)
.opcode_33:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

; [pax_ir] Store
.opcode_34:
        

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
            

; [pax_ir] Exit
.opcode_35:
        

    ; [gb_ir] Ret
        
ret

; [pax_ir] Metadata("move-up")
.opcode_36:
        

    ; [gb_ir] Metadata("move-up")
        

    ; [metadata] "move-up"
        

; [pax_ir] PushLiteral(19)
.opcode_37:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(19)
        

    ld hl,19
            

; [pax_ir] PushLiteral(38912)
.opcode_38:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

; [pax_ir] PushLiteral(2)
.opcode_39:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(2)
        

    ld hl,2
            

; [pax_ir] Add
.opcode_40:
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] ReplaceAddWithDE
        

    add hl, de
            

; [pax_ir] Store
.opcode_41:
        

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
            

; [pax_ir] Exit
.opcode_42:
        

    ; [gb_ir] Ret
        
ret

; [pax_ir] Metadata("move-down")
.opcode_43:
        

    ; [gb_ir] Metadata("move-down")
        

    ; [metadata] "move-down"
        

; [pax_ir] PushLiteral(20)
.opcode_44:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(20)
        

    ld hl,20
            

; [pax_ir] PushLiteral(38912)
.opcode_45:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

; [pax_ir] PushLiteral(1)
.opcode_46:
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(1)
        

    ld hl,1
            

; [pax_ir] Add
.opcode_47:
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] ReplaceAddWithDE
        

    add hl, de
            

; [pax_ir] Store
.opcode_48:
        

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
            

; [pax_ir] Exit
.opcode_49:
        

    ; [gb_ir] Ret
        
ret

EMULATE_JP_HL:
    jp	hl
    
