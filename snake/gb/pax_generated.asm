
; [pax_ir] PushLiteral(49156), file.fs: Pos { line: 76, col: 1 }
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

; [pax_ir] Load, file.fs: Pos { line: 76, col: 10 }
.opcode_1:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(37), file.fs: Pos { line: 77, col: 3 }
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

; [pax_ir] PushLabel(73), file.fs: Pos { line: 77, col: 8 }
.opcode_3:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(73)
    ld hl,.opcode_73

; [pax_ir] Call, file.fs: Pos { line: 77, col: 8 }
.opcode_4:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs: Pos { line: 77, col: 13 }
.opcode_5:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 77, col: 13 }
.opcode_6:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(14), file.fs: Pos { line: 77, col: 15 }
.opcode_7:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(14)
    ld hl,.opcode_14

; [pax_ir] JumpIf0, file.fs: Pos { line: 77, col: 15 }
.opcode_8:
        
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
    jp nz,.next_0
    ret
.next_0:
    pop de ; toss

; [pax_ir] PushLabel(328), file.fs: Pos { line: 77, col: 18 }
.opcode_9:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(328)
    ld hl,.opcode_328

; [pax_ir] Call, file.fs: Pos { line: 77, col: 18 }
.opcode_10:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 77, col: 28 }
.opcode_11:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(35), file.fs: Pos { line: 77, col: 28 }
.opcode_12:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(35)
    ld hl,.opcode_35

; [pax_ir] JumpIf0, file.fs: Pos { line: 77, col: 28 }
.opcode_13:
        
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
    jp nz,.next_1
    ret
.next_1:
    pop de ; toss

; [pax_ir] PushLiteral(38), file.fs: Pos { line: 78, col: 3 }
.opcode_14:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

; [pax_ir] PushLabel(73), file.fs: Pos { line: 78, col: 6 }
.opcode_15:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(73)
    ld hl,.opcode_73

; [pax_ir] Call, file.fs: Pos { line: 78, col: 6 }
.opcode_16:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs: Pos { line: 78, col: 14 }
.opcode_17:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 78, col: 14 }
.opcode_18:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(26), file.fs: Pos { line: 78, col: 16 }
.opcode_19:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(26)
    ld hl,.opcode_26

; [pax_ir] JumpIf0, file.fs: Pos { line: 78, col: 16 }
.opcode_20:
        
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

; [pax_ir] PushLabel(333), file.fs: Pos { line: 78, col: 19 }
.opcode_21:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(333)
    ld hl,.opcode_333

; [pax_ir] Call, file.fs: Pos { line: 78, col: 19 }
.opcode_22:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 78, col: 27 }
.opcode_23:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(35), file.fs: Pos { line: 78, col: 27 }
.opcode_24:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(35)
    ld hl,.opcode_35

; [pax_ir] JumpIf0, file.fs: Pos { line: 78, col: 27 }
.opcode_25:
        
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

; [pax_ir] PushLiteral(39), file.fs: Pos { line: 79, col: 3 }
.opcode_26:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

; [pax_ir] PushLabel(73), file.fs: Pos { line: 79, col: 9 }
.opcode_27:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(73)
    ld hl,.opcode_73

; [pax_ir] Call, file.fs: Pos { line: 79, col: 9 }
.opcode_28:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs: Pos { line: 79, col: 15 }
.opcode_29:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 79, col: 15 }
.opcode_30:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(35), file.fs: Pos { line: 79, col: 17 }
.opcode_31:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(35)
    ld hl,.opcode_35

; [pax_ir] JumpIf0, file.fs: Pos { line: 79, col: 17 }
.opcode_32:
        
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
    jp nz,.next_4
    ret
.next_4:
    pop de ; toss

; [pax_ir] PushLabel(321), file.fs: Pos { line: 79, col: 20 }
.opcode_33:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(321)
    ld hl,.opcode_321

; [pax_ir] Call, file.fs: Pos { line: 79, col: 20 }
.opcode_34:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(49156), file.fs: Pos { line: 82, col: 1 }
.opcode_35:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49156)
    ld hl,49156

; [pax_ir] Load, file.fs: Pos { line: 82, col: 10 }
.opcode_36:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(40), file.fs: Pos { line: 82, col: 12 }
.opcode_37:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

; [pax_ir] PushLabel(172), file.fs: Pos { line: 82, col: 17 }
.opcode_38:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 82, col: 17 }
.opcode_39:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(44), file.fs: Pos { line: 82, col: 19 }
.opcode_40:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(44)
    ld hl,.opcode_44

; [pax_ir] JumpIf0, file.fs: Pos { line: 82, col: 19 }
.opcode_41:
        
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
    jp nz,.next_5
    ret
.next_5:
    pop de ; toss

; [pax_ir] PushLabel(340), file.fs: Pos { line: 82, col: 22 }
.opcode_42:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(340)
    ld hl,.opcode_340

; [pax_ir] Call, file.fs: Pos { line: 82, col: 22 }
.opcode_43:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(49156), file.fs: Pos { line: 83, col: 1 }
.opcode_44:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49156)
    ld hl,49156

; [pax_ir] Load, file.fs: Pos { line: 83, col: 10 }
.opcode_45:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(40), file.fs: Pos { line: 83, col: 12 }
.opcode_46:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

; [pax_ir] PushLabel(172), file.fs: Pos { line: 83, col: 17 }
.opcode_47:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 83, col: 17 }
.opcode_48:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(53), file.fs: Pos { line: 83, col: 19 }
.opcode_49:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(53)
    ld hl,.opcode_53

; [pax_ir] JumpIf0, file.fs: Pos { line: 83, col: 19 }
.opcode_50:
        
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

; [pax_ir] PushLabel(340), file.fs: Pos { line: 83, col: 22 }
.opcode_51:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(340)
    ld hl,.opcode_340

; [pax_ir] Call, file.fs: Pos { line: 83, col: 22 }
.opcode_52:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Stop, file.fs: Pos { line: 0, col: 0 }
.opcode_53:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("cells"), file.fs: Pos { line: 6, col: 3 }
.opcode_54:
        
    ; [gb_ir] Metadata("cells")
    ; [metadata] "cells"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 6, col: 9 }
.opcode_55:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("drop"), file.fs: Pos { line: 8, col: 3 }
.opcode_56:
        
    ; [gb_ir] Metadata("drop")
    ; [metadata] "drop"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(59), file.fs: Pos { line: 8, col: 11 }
.opcode_57:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(59)
    ld hl,.opcode_59

; [pax_ir] JumpIf0, file.fs: Pos { line: 8, col: 11 }
.opcode_58:
        
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

; [pax_ir] Exit, file.fs: Pos { line: 8, col: 19 }
.opcode_59:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("2drop"), file.fs: Pos { line: 9, col: 3 }
.opcode_60:
        
    ; [gb_ir] Metadata("2drop")
    ; [metadata] "2drop"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Add, file.fs: Pos { line: 9, col: 11 }
.opcode_61:
        
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

; [pax_ir] PushLabel(56), file.fs: Pos { line: 9, col: 13 }
.opcode_62:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(56)
    ld hl,.opcode_56

; [pax_ir] Call, file.fs: Pos { line: 9, col: 13 }
.opcode_63:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 9, col: 18 }
.opcode_64:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("swap"), file.fs: Pos { line: 11, col: 3 }
.opcode_65:
        
    ; [gb_ir] Metadata("swap")
    ; [metadata] "swap"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 11, col: 10 }
.opcode_66:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 11, col: 13 }
.opcode_67:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs: Pos { line: 11, col: 18 }
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

; [pax_ir] AltPop, file.fs: Pos { line: 11, col: 20 }
.opcode_69:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 11, col: 23 }
.opcode_70:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 11, col: 28 }
.opcode_71:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs: Pos { line: 11, col: 30 }
.opcode_72:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("over"), file.fs: Pos { line: 12, col: 3 }
.opcode_73:
        
    ; [gb_ir] Metadata("over")
    ; [metadata] "over"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 12, col: 10 }
.opcode_74:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 12, col: 13 }
.opcode_75:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs: Pos { line: 12, col: 18 }
.opcode_76:
        
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

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 12, col: 20 }
.opcode_77:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 12, col: 25 }
.opcode_78:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPop, file.fs: Pos { line: 12, col: 27 }
.opcode_79:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 12, col: 30 }
.opcode_80:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 12, col: 35 }
.opcode_81:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs: Pos { line: 12, col: 37 }
.opcode_82:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("rot"), file.fs: Pos { line: 13, col: 3 }
.opcode_83:
        
    ; [gb_ir] Metadata("rot")
    ; [metadata] "rot"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 13, col: 10 }
.opcode_84:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(65), file.fs: Pos { line: 13, col: 13 }
.opcode_85:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 13, col: 13 }
.opcode_86:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPop, file.fs: Pos { line: 13, col: 18 }
.opcode_87:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(65), file.fs: Pos { line: 13, col: 21 }
.opcode_88:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 13, col: 21 }
.opcode_89:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 13, col: 26 }
.opcode_90:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("r@"), file.fs: Pos { line: 16, col: 3 }
.opcode_91:
        
    ; [gb_ir] Metadata("r@")
    ; [metadata] "r@"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs: Pos { line: 16, col: 8 }
.opcode_92:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 16, col: 11 }
.opcode_93:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 16, col: 14 }
.opcode_94:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs: Pos { line: 16, col: 19 }
.opcode_95:
        
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

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 16, col: 21 }
.opcode_96:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 16, col: 26 }
.opcode_97:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPush, file.fs: Pos { line: 16, col: 28 }
.opcode_98:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 16, col: 31 }
.opcode_99:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 16, col: 36 }
.opcode_100:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLabel(65), file.fs: Pos { line: 16, col: 38 }
.opcode_101:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 16, col: 38 }
.opcode_102:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs: Pos { line: 16, col: 43 }
.opcode_103:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 16, col: 46 }
.opcode_104:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("dup"), file.fs: Pos { line: 18, col: 3 }
.opcode_105:
        
    ; [gb_ir] Metadata("dup")
    ; [metadata] "dup"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 18, col: 10 }
.opcode_106:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs: Pos { line: 18, col: 15 }
.opcode_107:
        
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

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 18, col: 17 }
.opcode_108:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 18, col: 22 }
.opcode_109:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 18, col: 24 }
.opcode_110:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 18, col: 29 }
.opcode_111:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs: Pos { line: 18, col: 31 }
.opcode_112:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("2dup"), file.fs: Pos { line: 19, col: 3 }
.opcode_113:
        
    ; [gb_ir] Metadata("2dup")
    ; [metadata] "2dup"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(73), file.fs: Pos { line: 19, col: 10 }
.opcode_114:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(73)
    ld hl,.opcode_73

; [pax_ir] Call, file.fs: Pos { line: 19, col: 10 }
.opcode_115:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(73), file.fs: Pos { line: 19, col: 15 }
.opcode_116:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(73)
    ld hl,.opcode_73

; [pax_ir] Call, file.fs: Pos { line: 19, col: 15 }
.opcode_117:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 19, col: 20 }
.opcode_118:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("?dup"), file.fs: Pos { line: 20, col: 3 }
.opcode_119:
        
    ; [gb_ir] Metadata("?dup")
    ; [metadata] "?dup"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 20, col: 10 }
.opcode_120:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs: Pos { line: 20, col: 15 }
.opcode_121:
        
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

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 20, col: 17 }
.opcode_122:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 20, col: 22 }
.opcode_123:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLabel(130), file.fs: Pos { line: 20, col: 24 }
.opcode_124:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(130)
    ld hl,.opcode_130

; [pax_ir] JumpIf0, file.fs: Pos { line: 20, col: 24 }
.opcode_125:
        
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
    jp nz,.next_8
    ret
.next_8:
    pop de ; toss

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 20, col: 27 }
.opcode_126:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 20, col: 32 }
.opcode_127:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 20, col: 34 }
.opcode_128:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 20, col: 39 }
.opcode_129:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs: Pos { line: 20, col: 46 }
.opcode_130:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("invert"), file.fs: Pos { line: 22, col: 3 }
.opcode_131:
        
    ; [gb_ir] Metadata("invert")
    ; [metadata] "invert"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(-1), file.fs: Pos { line: 22, col: 12 }
.opcode_132:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

; [pax_ir] Nand, file.fs: Pos { line: 22, col: 15 }
.opcode_133:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] ReplaceNandWithDE
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a

; [pax_ir] Exit, file.fs: Pos { line: 22, col: 20 }
.opcode_134:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("negate"), file.fs: Pos { line: 23, col: 3 }
.opcode_135:
        
    ; [gb_ir] Metadata("negate")
    ; [metadata] "negate"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(131), file.fs: Pos { line: 23, col: 12 }
.opcode_136:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(131)
    ld hl,.opcode_131

; [pax_ir] Call, file.fs: Pos { line: 23, col: 12 }
.opcode_137:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(1), file.fs: Pos { line: 23, col: 19 }
.opcode_138:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] Add, file.fs: Pos { line: 23, col: 21 }
.opcode_139:
        
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

; [pax_ir] Exit, file.fs: Pos { line: 23, col: 23 }
.opcode_140:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("-"), file.fs: Pos { line: 24, col: 3 }
.opcode_141:
        
    ; [gb_ir] Metadata("-")
    ; [metadata] "-"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(135), file.fs: Pos { line: 24, col: 12 }
.opcode_142:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(135)
    ld hl,.opcode_135

; [pax_ir] Call, file.fs: Pos { line: 24, col: 12 }
.opcode_143:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Add, file.fs: Pos { line: 24, col: 19 }
.opcode_144:
        
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

; [pax_ir] Exit, file.fs: Pos { line: 24, col: 21 }
.opcode_145:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("1+"), file.fs: Pos { line: 26, col: 3 }
.opcode_146:
        
    ; [gb_ir] Metadata("1+")
    ; [metadata] "1+"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(1), file.fs: Pos { line: 26, col: 8 }
.opcode_147:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] Add, file.fs: Pos { line: 26, col: 10 }
.opcode_148:
        
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

; [pax_ir] Exit, file.fs: Pos { line: 26, col: 12 }
.opcode_149:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("1-"), file.fs: Pos { line: 27, col: 3 }
.opcode_150:
        
    ; [gb_ir] Metadata("1-")
    ; [metadata] "1-"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(-1), file.fs: Pos { line: 27, col: 8 }
.opcode_151:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

; [pax_ir] Add, file.fs: Pos { line: 27, col: 11 }
.opcode_152:
        
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

; [pax_ir] Exit, file.fs: Pos { line: 27, col: 13 }
.opcode_153:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("+!"), file.fs: Pos { line: 28, col: 3 }
.opcode_154:
        
    ; [gb_ir] Metadata("+!")
    ; [metadata] "+!"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(105), file.fs: Pos { line: 28, col: 8 }
.opcode_155:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(105)
    ld hl,.opcode_105

; [pax_ir] Call, file.fs: Pos { line: 28, col: 8 }
.opcode_156:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs: Pos { line: 28, col: 12 }
.opcode_157:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Load, file.fs: Pos { line: 28, col: 15 }
.opcode_158:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Add, file.fs: Pos { line: 28, col: 17 }
.opcode_159:
        
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

; [pax_ir] AltPop, file.fs: Pos { line: 28, col: 19 }
.opcode_160:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] Store, file.fs: Pos { line: 28, col: 22 }
.opcode_161:
        
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

; [pax_ir] Exit, file.fs: Pos { line: 28, col: 24 }
.opcode_162:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("0="), file.fs: Pos { line: 29, col: 3 }
.opcode_163:
        
    ; [gb_ir] Metadata("0=")
    ; [metadata] "0="
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(170), file.fs: Pos { line: 29, col: 8 }
.opcode_164:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(170)
    ld hl,.opcode_170

; [pax_ir] JumpIf0, file.fs: Pos { line: 29, col: 8 }
.opcode_165:
        
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
    jp nz,.next_9
    ret
.next_9:
    pop de ; toss

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 29, col: 11 }
.opcode_166:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 29, col: 13 }
.opcode_167:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(171), file.fs: Pos { line: 29, col: 13 }
.opcode_168:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(171)
    ld hl,.opcode_171

; [pax_ir] JumpIf0, file.fs: Pos { line: 29, col: 13 }
.opcode_169:
        
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

; [pax_ir] PushLiteral(-1), file.fs: Pos { line: 29, col: 18 }
.opcode_170:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

; [pax_ir] Exit, file.fs: Pos { line: 29, col: 26 }
.opcode_171:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("="), file.fs: Pos { line: 30, col: 3 }
.opcode_172:
        
    ; [gb_ir] Metadata("=")
    ; [metadata] "="
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(141), file.fs: Pos { line: 30, col: 8 }
.opcode_173:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(141)
    ld hl,.opcode_141

; [pax_ir] Call, file.fs: Pos { line: 30, col: 8 }
.opcode_174:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(163), file.fs: Pos { line: 30, col: 10 }
.opcode_175:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(163)
    ld hl,.opcode_163

; [pax_ir] Call, file.fs: Pos { line: 30, col: 10 }
.opcode_176:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 30, col: 13 }
.opcode_177:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("<>"), file.fs: Pos { line: 31, col: 3 }
.opcode_178:
        
    ; [gb_ir] Metadata("<>")
    ; [metadata] "<>"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(172), file.fs: Pos { line: 31, col: 8 }
.opcode_179:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 31, col: 8 }
.opcode_180:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(163), file.fs: Pos { line: 31, col: 10 }
.opcode_181:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(163)
    ld hl,.opcode_163

; [pax_ir] Call, file.fs: Pos { line: 31, col: 10 }
.opcode_182:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 31, col: 13 }
.opcode_183:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("=="), file.fs: Pos { line: 32, col: 3 }
.opcode_184:
        
    ; [gb_ir] Metadata("==")
    ; [metadata] "=="
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(141), file.fs: Pos { line: 32, col: 8 }
.opcode_185:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(141)
    ld hl,.opcode_141

; [pax_ir] Call, file.fs: Pos { line: 32, col: 8 }
.opcode_186:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(163), file.fs: Pos { line: 32, col: 10 }
.opcode_187:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(163)
    ld hl,.opcode_163

; [pax_ir] Call, file.fs: Pos { line: 32, col: 10 }
.opcode_188:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 32, col: 13 }
.opcode_189:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("or"), file.fs: Pos { line: 34, col: 3 }
.opcode_190:
        
    ; [gb_ir] Metadata("or")
    ; [metadata] "or"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(131), file.fs: Pos { line: 34, col: 8 }
.opcode_191:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(131)
    ld hl,.opcode_131

; [pax_ir] Call, file.fs: Pos { line: 34, col: 8 }
.opcode_192:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(65), file.fs: Pos { line: 34, col: 15 }
.opcode_193:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 34, col: 15 }
.opcode_194:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(131), file.fs: Pos { line: 34, col: 20 }
.opcode_195:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(131)
    ld hl,.opcode_131

; [pax_ir] Call, file.fs: Pos { line: 34, col: 20 }
.opcode_196:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Nand, file.fs: Pos { line: 34, col: 27 }
.opcode_197:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] ReplaceNandWithDE
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a

; [pax_ir] Exit, file.fs: Pos { line: 34, col: 32 }
.opcode_198:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("xor"), file.fs: Pos { line: 35, col: 3 }
.opcode_199:
        
    ; [gb_ir] Metadata("xor")
    ; [metadata] "xor"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(113), file.fs: Pos { line: 35, col: 9 }
.opcode_200:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(113)
    ld hl,.opcode_113

; [pax_ir] Call, file.fs: Pos { line: 35, col: 9 }
.opcode_201:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Nand, file.fs: Pos { line: 35, col: 14 }
.opcode_202:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] ReplaceNandWithDE
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a

; [pax_ir] PushLabel(146), file.fs: Pos { line: 35, col: 19 }
.opcode_203:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(146)
    ld hl,.opcode_146

; [pax_ir] Call, file.fs: Pos { line: 35, col: 19 }
.opcode_204:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(105), file.fs: Pos { line: 35, col: 22 }
.opcode_205:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(105)
    ld hl,.opcode_105

; [pax_ir] Call, file.fs: Pos { line: 35, col: 22 }
.opcode_206:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Add, file.fs: Pos { line: 35, col: 26 }
.opcode_207:
        
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

; [pax_ir] Add, file.fs: Pos { line: 35, col: 28 }
.opcode_208:
        
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

; [pax_ir] Add, file.fs: Pos { line: 35, col: 30 }
.opcode_209:
        
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

; [pax_ir] Exit, file.fs: Pos { line: 35, col: 32 }
.opcode_210:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("and"), file.fs: Pos { line: 36, col: 3 }
.opcode_211:
        
    ; [gb_ir] Metadata("and")
    ; [metadata] "and"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Nand, file.fs: Pos { line: 36, col: 9 }
.opcode_212:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] ReplaceNandWithDE
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a

; [pax_ir] PushLabel(131), file.fs: Pos { line: 36, col: 14 }
.opcode_213:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(131)
    ld hl,.opcode_131

; [pax_ir] Call, file.fs: Pos { line: 36, col: 14 }
.opcode_214:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 36, col: 21 }
.opcode_215:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("loopimpl"), file.fs: Pos { line: 41, col: 3 }
.opcode_216:
        
    ; [gb_ir] Metadata("loopimpl")
    ; [metadata] "loopimpl"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs: Pos { line: 41, col: 12 }
.opcode_217:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 41, col: 15 }
.opcode_218:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 41, col: 18 }
.opcode_219:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(146), file.fs: Pos { line: 41, col: 21 }
.opcode_220:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(146)
    ld hl,.opcode_146

; [pax_ir] Call, file.fs: Pos { line: 41, col: 21 }
.opcode_221:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(113), file.fs: Pos { line: 41, col: 24 }
.opcode_222:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(113)
    ld hl,.opcode_113

; [pax_ir] Call, file.fs: Pos { line: 41, col: 24 }
.opcode_223:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs: Pos { line: 41, col: 29 }
.opcode_224:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 41, col: 29 }
.opcode_225:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(234), file.fs: Pos { line: 41, col: 31 }
.opcode_226:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(234)
    ld hl,.opcode_234

; [pax_ir] JumpIf0, file.fs: Pos { line: 41, col: 31 }
.opcode_227:
        
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

; [pax_ir] PushLabel(60), file.fs: Pos { line: 41, col: 34 }
.opcode_228:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(60)
    ld hl,.opcode_60

; [pax_ir] Call, file.fs: Pos { line: 41, col: 34 }
.opcode_229:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(1), file.fs: Pos { line: 41, col: 40 }
.opcode_230:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 41, col: 42 }
.opcode_231:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(237), file.fs: Pos { line: 41, col: 42 }
.opcode_232:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(237)
    ld hl,.opcode_237

; [pax_ir] JumpIf0, file.fs: Pos { line: 41, col: 42 }
.opcode_233:
        
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
    jp nz,.next_12
    ret
.next_12:
    pop de ; toss

; [pax_ir] AltPush, file.fs: Pos { line: 41, col: 47 }
.opcode_234:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 41, col: 50 }
.opcode_235:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 41, col: 53 }
.opcode_236:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(65), file.fs: Pos { line: 41, col: 60 }
.opcode_237:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 41, col: 60 }
.opcode_238:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs: Pos { line: 41, col: 65 }
.opcode_239:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 41, col: 68 }
.opcode_240:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("-loopimpl"), file.fs: Pos { line: 42, col: 3 }
.opcode_241:
        
    ; [gb_ir] Metadata("-loopimpl")
    ; [metadata] "-loopimpl"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs: Pos { line: 42, col: 13 }
.opcode_242:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 42, col: 16 }
.opcode_243:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(83), file.fs: Pos { line: 42, col: 19 }
.opcode_244:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(83)
    ld hl,.opcode_83

; [pax_ir] Call, file.fs: Pos { line: 42, col: 19 }
.opcode_245:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPop, file.fs: Pos { line: 42, col: 23 }
.opcode_246:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(65), file.fs: Pos { line: 42, col: 26 }
.opcode_247:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 42, col: 26 }
.opcode_248:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(141), file.fs: Pos { line: 42, col: 31 }
.opcode_249:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(141)
    ld hl,.opcode_141

; [pax_ir] Call, file.fs: Pos { line: 42, col: 31 }
.opcode_250:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(113), file.fs: Pos { line: 42, col: 33 }
.opcode_251:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(113)
    ld hl,.opcode_113

; [pax_ir] Call, file.fs: Pos { line: 42, col: 33 }
.opcode_252:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs: Pos { line: 42, col: 38 }
.opcode_253:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(172)
    ld hl,.opcode_172

; [pax_ir] Call, file.fs: Pos { line: 42, col: 38 }
.opcode_254:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(263), file.fs: Pos { line: 42, col: 40 }
.opcode_255:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(263)
    ld hl,.opcode_263

; [pax_ir] JumpIf0, file.fs: Pos { line: 42, col: 40 }
.opcode_256:
        
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
    jp nz,.next_13
    ret
.next_13:
    pop de ; toss

; [pax_ir] PushLabel(60), file.fs: Pos { line: 42, col: 43 }
.opcode_257:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(60)
    ld hl,.opcode_60

; [pax_ir] Call, file.fs: Pos { line: 42, col: 43 }
.opcode_258:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(1), file.fs: Pos { line: 42, col: 49 }
.opcode_259:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 42, col: 51 }
.opcode_260:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(266), file.fs: Pos { line: 42, col: 51 }
.opcode_261:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(266)
    ld hl,.opcode_266

; [pax_ir] JumpIf0, file.fs: Pos { line: 42, col: 51 }
.opcode_262:
        
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

; [pax_ir] AltPush, file.fs: Pos { line: 42, col: 56 }
.opcode_263:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 42, col: 59 }
.opcode_264:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 42, col: 62 }
.opcode_265:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(65), file.fs: Pos { line: 42, col: 69 }
.opcode_266:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 42, col: 69 }
.opcode_267:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs: Pos { line: 42, col: 74 }
.opcode_268:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 42, col: 77 }
.opcode_269:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("i"), file.fs: Pos { line: 45, col: 3 }
.opcode_270:
        
    ; [gb_ir] Metadata("i")
    ; [metadata] "i"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs: Pos { line: 45, col: 5 }
.opcode_271:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 45, col: 8 }
.opcode_272:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 45, col: 11 }
.opcode_273:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 45, col: 14 }
.opcode_274:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs: Pos { line: 45, col: 19 }
.opcode_275:
        
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

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 45, col: 21 }
.opcode_276:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 45, col: 26 }
.opcode_277:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPush, file.fs: Pos { line: 45, col: 28 }
.opcode_278:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 45, col: 31 }
.opcode_279:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 45, col: 34 }
.opcode_280:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 45, col: 37 }
.opcode_281:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 45, col: 42 }
.opcode_282:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs: Pos { line: 45, col: 44 }
.opcode_283:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("j"), file.fs: Pos { line: 46, col: 3 }
.opcode_284:
        
    ; [gb_ir] Metadata("j")
    ; [metadata] "j"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs: Pos { line: 46, col: 5 }
.opcode_285:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 46, col: 8 }
.opcode_286:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 46, col: 11 }
.opcode_287:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 46, col: 14 }
.opcode_288:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs: Pos { line: 46, col: 17 }
.opcode_289:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 46, col: 20 }
.opcode_290:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs: Pos { line: 46, col: 25 }
.opcode_291:
        
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

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 46, col: 27 }
.opcode_292:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 46, col: 32 }
.opcode_293:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPush, file.fs: Pos { line: 46, col: 34 }
.opcode_294:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 46, col: 37 }
.opcode_295:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 46, col: 40 }
.opcode_296:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 46, col: 43 }
.opcode_297:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 46, col: 46 }
.opcode_298:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs: Pos { line: 46, col: 49 }
.opcode_299:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs: Pos { line: 46, col: 54 }
.opcode_300:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs: Pos { line: 46, col: 56 }
.opcode_301:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("*"), file.fs: Pos { line: 48, col: 3 }
.opcode_302:
        
    ; [gb_ir] Metadata("*")
    ; [metadata] "*"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 48, col: 5 }
.opcode_303:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 48, col: 8 }
.opcode_304:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] AltPop, file.fs: Pos { line: 48, col: 10 }
.opcode_305:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(0), file.fs: Pos { line: 48, col: 13 }
.opcode_306:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] AltPush, file.fs: Pos { line: 48, col: 15 }
.opcode_307:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs: Pos { line: 48, col: 15 }
.opcode_308:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(73), file.fs: Pos { line: 48, col: 18 }
.opcode_309:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(73)
    ld hl,.opcode_73

; [pax_ir] Call, file.fs: Pos { line: 48, col: 18 }
.opcode_310:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Add, file.fs: Pos { line: 48, col: 23 }
.opcode_311:
        
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

; [pax_ir] PushLabel(216), file.fs: Pos { line: 48, col: 25 }
.opcode_312:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(216)
    ld hl,.opcode_216

; [pax_ir] Call, file.fs: Pos { line: 48, col: 25 }
.opcode_313:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(309), file.fs: Pos { line: 48, col: 25 }
.opcode_314:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(309)
    ld hl,.opcode_309

; [pax_ir] JumpIf0, file.fs: Pos { line: 48, col: 25 }
.opcode_315:
        
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

; [pax_ir] PushLabel(65), file.fs: Pos { line: 48, col: 30 }
.opcode_316:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(65)
    ld hl,.opcode_65

; [pax_ir] Call, file.fs: Pos { line: 48, col: 30 }
.opcode_317:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(56), file.fs: Pos { line: 48, col: 35 }
.opcode_318:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(56)
    ld hl,.opcode_56

; [pax_ir] Call, file.fs: Pos { line: 48, col: 35 }
.opcode_319:
        
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs: Pos { line: 48, col: 40 }
.opcode_320:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-right"), file.fs: Pos { line: 58, col: 3 }
.opcode_321:
        
    ; [gb_ir] Metadata("move-right")
    ; [metadata] "move-right"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(18), file.fs: Pos { line: 58, col: 14 }
.opcode_322:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(18)
    ld hl,18

; [pax_ir] PushLiteral(38912), file.fs: Pos { line: 58, col: 17 }
.opcode_323:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] PushLiteral(3), file.fs: Pos { line: 58, col: 26 }
.opcode_324:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(3)
    ld hl,3

; [pax_ir] Add, file.fs: Pos { line: 58, col: 28 }
.opcode_325:
        
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

; [pax_ir] Store8, file.fs: Pos { line: 58, col: 30 }
.opcode_326:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE8
    ld a, e
    ld [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 58, col: 33 }
.opcode_327:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-left"), file.fs: Pos { line: 59, col: 3 }
.opcode_328:
        
    ; [gb_ir] Metadata("move-left")
    ; [metadata] "move-left"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(30), file.fs: Pos { line: 59, col: 13 }
.opcode_329:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(30)
    ld hl,30

; [pax_ir] PushLiteral(38912), file.fs: Pos { line: 59, col: 16 }
.opcode_330:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] Store8, file.fs: Pos { line: 59, col: 25 }
.opcode_331:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE8
    ld a, e
    ld [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 59, col: 28 }
.opcode_332:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-up"), file.fs: Pos { line: 60, col: 3 }
.opcode_333:
        
    ; [gb_ir] Metadata("move-up")
    ; [metadata] "move-up"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(19), file.fs: Pos { line: 60, col: 11 }
.opcode_334:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(19)
    ld hl,19

; [pax_ir] PushLiteral(38912), file.fs: Pos { line: 60, col: 14 }
.opcode_335:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] PushLiteral(2), file.fs: Pos { line: 60, col: 23 }
.opcode_336:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

; [pax_ir] Add, file.fs: Pos { line: 60, col: 25 }
.opcode_337:
        
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

; [pax_ir] Store8, file.fs: Pos { line: 60, col: 27 }
.opcode_338:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE8
    ld a, e
    ld [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 60, col: 30 }
.opcode_339:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-down"), file.fs: Pos { line: 61, col: 3 }
.opcode_340:
        
    ; [gb_ir] Metadata("move-down")
    ; [metadata] "move-down"
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(20), file.fs: Pos { line: 61, col: 13 }
.opcode_341:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(20)
    ld hl,20

; [pax_ir] PushLiteral(38912), file.fs: Pos { line: 61, col: 16 }
.opcode_342:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] PushLiteral(1), file.fs: Pos { line: 61, col: 25 }
.opcode_343:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] Add, file.fs: Pos { line: 61, col: 27 }
.opcode_344:
        
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

; [pax_ir] Store8, file.fs: Pos { line: 61, col: 29 }
.opcode_345:
        
    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
    ; [gb_ir] StoreDE8
    ld a, e
    ld [hl],a
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs: Pos { line: 61, col: 32 }
.opcode_346:
        
    ; [gb_ir] Ret
    ret






; function start

EMULATE_JP_HL:
    jp	hl
    
