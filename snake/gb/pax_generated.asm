
; [pax_ir] PushLiteral(49156)
.opcode_0:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49156)
    ld hl,49156

; [pax_ir] Load
.opcode_1:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(37)
.opcode_2:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(37)
    ld hl,37

; [pax_ir] PushLabel(48)
.opcode_3:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(48)
    ld hl,.opcode_48

; [pax_ir] Call
.opcode_4:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Equals
.opcode_5:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
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

; [pax_ir] PushLabel(13)
.opcode_6:
        
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
.opcode_7:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_2
    ret
.next_2:
    pop de ; toss

; [pax_ir] PushLabel(65)
.opcode_8:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call
.opcode_9:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(0)
.opcode_10:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(43)
.opcode_11:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(43)
    ld hl,.opcode_43

; [pax_ir] JumpIf0
.opcode_12:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_3
    ret
.next_3:
    pop de ; toss

; [pax_ir] PushLiteral(38)
.opcode_13:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

; [pax_ir] PushLabel(48)
.opcode_14:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(48)
    ld hl,.opcode_48

; [pax_ir] Call
.opcode_15:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Equals
.opcode_16:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] CompareDEAndReplace
    ld a, d
    cp h
    jp nz,.next_4
    ld a, e
    cp l
    jp nz,.next_4
    ld hl, $1
    jp .next_5
.next_4:
    ld hl, $0
.next_5:

; [pax_ir] PushLabel(24)
.opcode_17:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(24)
    ld hl,.opcode_24

; [pax_ir] JumpIf0
.opcode_18:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_6
    ret
.next_6:
    pop de ; toss

; [pax_ir] PushLabel(70)
.opcode_19:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(70)
    ld hl,.opcode_70

; [pax_ir] Call
.opcode_20:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(0)
.opcode_21:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(43)
.opcode_22:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(43)
    ld hl,.opcode_43

; [pax_ir] JumpIf0
.opcode_23:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_7
    ret
.next_7:
    pop de ; toss

; [pax_ir] PushLiteral(39)
.opcode_24:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

; [pax_ir] PushLabel(48)
.opcode_25:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(48)
    ld hl,.opcode_48

; [pax_ir] Call
.opcode_26:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Equals
.opcode_27:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] CompareDEAndReplace
    ld a, d
    cp h
    jp nz,.next_8
    ld a, e
    cp l
    jp nz,.next_8
    ld hl, $1
    jp .next_9
.next_8:
    ld hl, $0
.next_9:

; [pax_ir] PushLabel(35)
.opcode_28:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(35)
    ld hl,.opcode_35

; [pax_ir] JumpIf0
.opcode_29:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_10
    ret
.next_10:
    pop de ; toss

; [pax_ir] PushLabel(58)
.opcode_30:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(58)
    ld hl,.opcode_58

; [pax_ir] Call
.opcode_31:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(0)
.opcode_32:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(43)
.opcode_33:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(43)
    ld hl,.opcode_43

; [pax_ir] JumpIf0
.opcode_34:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_11
    ret
.next_11:
    pop de ; toss

; [pax_ir] PushLiteral(40)
.opcode_35:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

; [pax_ir] PushLabel(48)
.opcode_36:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(48)
    ld hl,.opcode_48

; [pax_ir] Call
.opcode_37:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Equals
.opcode_38:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] CompareDEAndReplace
    ld a, d
    cp h
    jp nz,.next_12
    ld a, e
    cp l
    jp nz,.next_12
    ld hl, $1
    jp .next_13
.next_12:
    ld hl, $0
.next_13:

; [pax_ir] PushLabel(43)
.opcode_39:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(43)
    ld hl,.opcode_43

; [pax_ir] JumpIf0
.opcode_40:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_14
    ret
.next_14:
    pop de ; toss

; [pax_ir] PushLabel(77)
.opcode_41:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(77)
    ld hl,.opcode_77

; [pax_ir] Call
.opcode_42:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Stop
.opcode_43:
        
    ; [gb_ir] Ret
    ret

; [pax_ir] Metadata("drop")
.opcode_44:
        
    ; [gb_ir] Metadata("drop")
    ; [metadata] "drop"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(47)
.opcode_45:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(47)
    ld hl,.opcode_47

; [pax_ir] JumpIf0
.opcode_46:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] PushRetAddr
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
    ; [gb_ir] RetIfDEIs0
    ld a, e
    cp $0
    jp nz,.next_15
    ret
.next_15:
    pop de ; toss

; [pax_ir] Exit
.opcode_47:
        
    ; [gb_ir] Ret
    ret

; [pax_ir] Metadata("over")
.opcode_48:
        
    ; [gb_ir] Metadata("over")
    ; [metadata] "over"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush
.opcode_49:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158)
.opcode_50:
        
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
.opcode_51:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158)
.opcode_52:
        
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
.opcode_53:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPop
.opcode_54:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158)
.opcode_55:
        
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
.opcode_56:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit
.opcode_57:
        
    ; [gb_ir] Ret
    ret

; [pax_ir] Metadata("move-right")
.opcode_58:
        
    ; [gb_ir] Metadata("move-right")
    ; [metadata] "move-right"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(18)
.opcode_59:
        
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
.opcode_60:
        
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
.opcode_61:
        
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
.opcode_62:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] ReplaceAddWithDE
    add hl, de

; [pax_ir] Store
.opcode_63:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit
.opcode_64:
        
    ; [gb_ir] Ret
    ret

; [pax_ir] Metadata("move-left")
.opcode_65:
        
    ; [gb_ir] Metadata("move-left")
    ; [metadata] "move-left"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(21)
.opcode_66:
        
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
.opcode_67:
        
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
.opcode_68:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit
.opcode_69:
        
    ; [gb_ir] Ret
    ret

; [pax_ir] Metadata("move-up")
.opcode_70:
        
    ; [gb_ir] Metadata("move-up")
    ; [metadata] "move-up"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(19)
.opcode_71:
        
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
.opcode_72:
        
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
.opcode_73:
        
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
.opcode_74:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] ReplaceAddWithDE
    add hl, de

; [pax_ir] Store
.opcode_75:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit
.opcode_76:
        
    ; [gb_ir] Ret
    ret

; [pax_ir] Metadata("move-down")
.opcode_77:
        
    ; [gb_ir] Metadata("move-down")
    ; [metadata] "move-down"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(20)
.opcode_78:
        
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
.opcode_79:
        
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
.opcode_80:
        
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
.opcode_81:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] ReplaceAddWithDE
    add hl, de

; [pax_ir] Store
.opcode_82:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit
.opcode_83:
        
    ; [gb_ir] Ret
    ret

EMULATE_JP_HL:
    jp	hl
    
