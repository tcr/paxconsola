
; [pax_ir] PushLiteral(49156), file.fs:76:1
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

; [pax_ir] Load, file.fs:76:10
.opcode_1:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(37), file.fs:77:3
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

; [pax_ir] PushLabel(81), file.fs:77:8
.opcode_3:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_81")
    ld hl,.opcode_81

; [pax_ir] Call("over"), file.fs:77:8
.opcode_4:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_over")
    ld hl,.PAX_over
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(183), file.fs:77:13
.opcode_5:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:77:13
.opcode_6:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(14), file.fs:77:15
.opcode_7:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_14")
    ld hl,.opcode_14

; [pax_ir] JumpIf0, file.fs:77:15
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

; [pax_ir] PushLabel(344), file.fs:77:18
.opcode_9:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_344")
    ld hl,.opcode_344

; [pax_ir] Call("move-left"), file.fs:77:18
.opcode_10:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_move-left")
    ld hl,.PAX_move-left
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(0), file.fs:77:28
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

; [pax_ir] PushLabel(39), file.fs:77:28
.opcode_12:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_39")
    ld hl,.opcode_39

; [pax_ir] JumpIf0, file.fs:77:28
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

; [pax_ir] BranchTarget, file.fs:77:28
.opcode_14:
        

; [pax_ir] PushLiteral(38), file.fs:78:3
.opcode_15:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

; [pax_ir] PushLabel(81), file.fs:78:6
.opcode_16:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_81")
    ld hl,.opcode_81

; [pax_ir] Call("over"), file.fs:78:6
.opcode_17:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_over")
    ld hl,.PAX_over
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(183), file.fs:78:14
.opcode_18:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:78:14
.opcode_19:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(27), file.fs:78:16
.opcode_20:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_27")
    ld hl,.opcode_27

; [pax_ir] JumpIf0, file.fs:78:16
.opcode_21:
        
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

; [pax_ir] PushLabel(349), file.fs:78:19
.opcode_22:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_349")
    ld hl,.opcode_349

; [pax_ir] Call("move-up"), file.fs:78:19
.opcode_23:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_move-up")
    ld hl,.PAX_move-up
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(0), file.fs:78:27
.opcode_24:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(38), file.fs:78:27
.opcode_25:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_38")
    ld hl,.opcode_38

; [pax_ir] JumpIf0, file.fs:78:27
.opcode_26:
        
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

; [pax_ir] BranchTarget, file.fs:78:27
.opcode_27:
        

; [pax_ir] PushLiteral(39), file.fs:79:3
.opcode_28:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

; [pax_ir] PushLabel(81), file.fs:79:9
.opcode_29:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_81")
    ld hl,.opcode_81

; [pax_ir] Call("over"), file.fs:79:9
.opcode_30:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_over")
    ld hl,.PAX_over
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(183), file.fs:79:15
.opcode_31:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:79:15
.opcode_32:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(37), file.fs:79:17
.opcode_33:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_37")
    ld hl,.opcode_37

; [pax_ir] JumpIf0, file.fs:79:17
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
    jp nz,.next_4
    ret
.next_4:
    pop de ; toss

; [pax_ir] PushLabel(337), file.fs:79:20
.opcode_35:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_337")
    ld hl,.opcode_337

; [pax_ir] Call("move-right"), file.fs:79:20
.opcode_36:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_move-right")
    ld hl,.PAX_move-right
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] BranchTarget, file.fs:80:3
.opcode_37:
        

; [pax_ir] BranchTarget, file.fs:80:8
.opcode_38:
        

; [pax_ir] BranchTarget, file.fs:80:13
.opcode_39:
        

; [pax_ir] PushLiteral(49156), file.fs:82:1
.opcode_40:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49156)
    ld hl,49156

; [pax_ir] Load, file.fs:82:10
.opcode_41:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(40), file.fs:82:12
.opcode_42:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

; [pax_ir] PushLabel(183), file.fs:82:17
.opcode_43:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:82:17
.opcode_44:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(49), file.fs:82:19
.opcode_45:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_49")
    ld hl,.opcode_49

; [pax_ir] JumpIf0, file.fs:82:19
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
    jp nz,.next_5
    ret
.next_5:
    pop de ; toss

; [pax_ir] PushLabel(356), file.fs:82:22
.opcode_47:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_356")
    ld hl,.opcode_356

; [pax_ir] Call("move-down"), file.fs:82:22
.opcode_48:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_move-down")
    ld hl,.PAX_move-down
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] BranchTarget, file.fs:82:32
.opcode_49:
        

; [pax_ir] PushLiteral(49156), file.fs:83:1
.opcode_50:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49156)
    ld hl,49156

; [pax_ir] Load, file.fs:83:10
.opcode_51:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(40), file.fs:83:12
.opcode_52:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

; [pax_ir] PushLabel(183), file.fs:83:17
.opcode_53:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:83:17
.opcode_54:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(59), file.fs:83:19
.opcode_55:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_59")
    ld hl,.opcode_59

; [pax_ir] JumpIf0, file.fs:83:19
.opcode_56:
        
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

; [pax_ir] PushLabel(356), file.fs:83:22
.opcode_57:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_356")
    ld hl,.opcode_356

; [pax_ir] Call("move-down"), file.fs:83:22
.opcode_58:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_move-down")
    ld hl,.PAX_move-down
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] BranchTarget, file.fs:83:32
.opcode_59:
        

; [pax_ir] Stop, file.fs:0:0
.opcode_60:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("cells"), file.fs:6:3
.opcode_61:
        
    ; [gb_ir] Metadata("cells")
    ; [metadata] "cells"
.PAX_cells:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs:6:9
.opcode_62:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("drop"), file.fs:8:3
.opcode_63:
        
    ; [gb_ir] Metadata("drop")
    ; [metadata] "drop"
.PAX_drop:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(66), file.fs:8:11
.opcode_64:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_66")
    ld hl,.opcode_66

; [pax_ir] JumpIf0, file.fs:8:11
.opcode_65:
        
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

; [pax_ir] BranchTarget, file.fs:8:14
.opcode_66:
        

; [pax_ir] Exit, file.fs:8:19
.opcode_67:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("2drop"), file.fs:9:3
.opcode_68:
        
    ; [gb_ir] Metadata("2drop")
    ; [metadata] "2drop"
.PAX_2drop:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Add, file.fs:9:11
.opcode_69:
        
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

; [pax_ir] PushLabel(63), file.fs:9:13
.opcode_70:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_63")
    ld hl,.opcode_63

; [pax_ir] Call("drop"), file.fs:9:13
.opcode_71:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_drop")
    ld hl,.PAX_drop
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:9:18
.opcode_72:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("swap"), file.fs:11:3
.opcode_73:
        
    ; [gb_ir] Metadata("swap")
    ; [metadata] "swap"
.PAX_swap:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:11:10
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

; [pax_ir] PushLiteral(49158), file.fs:11:13
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

; [pax_ir] Store, file.fs:11:18
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

; [pax_ir] AltPop, file.fs:11:20
.opcode_77:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs:11:23
.opcode_78:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:11:28
.opcode_79:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs:11:30
.opcode_80:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("over"), file.fs:12:3
.opcode_81:
        
    ; [gb_ir] Metadata("over")
    ; [metadata] "over"
.PAX_over:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:12:10
.opcode_82:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs:12:13
.opcode_83:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs:12:18
.opcode_84:
        
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

; [pax_ir] PushLiteral(49158), file.fs:12:20
.opcode_85:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:12:25
.opcode_86:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPop, file.fs:12:27
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

; [pax_ir] PushLiteral(49158), file.fs:12:30
.opcode_88:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:12:35
.opcode_89:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs:12:37
.opcode_90:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("rot"), file.fs:13:3
.opcode_91:
        
    ; [gb_ir] Metadata("rot")
    ; [metadata] "rot"
.PAX_rot:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:13:10
.opcode_92:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(73), file.fs:13:13
.opcode_93:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:13:13
.opcode_94:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPop, file.fs:13:18
.opcode_95:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(73), file.fs:13:21
.opcode_96:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:13:21
.opcode_97:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:13:26
.opcode_98:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("r@"), file.fs:16:3
.opcode_99:
        
    ; [gb_ir] Metadata("r@")
    ; [metadata] "r@"
.PAX_r@:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs:16:8
.opcode_100:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:16:11
.opcode_101:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs:16:14
.opcode_102:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs:16:19
.opcode_103:
        
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

; [pax_ir] PushLiteral(49158), file.fs:16:21
.opcode_104:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:16:26
.opcode_105:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPush, file.fs:16:28
.opcode_106:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs:16:31
.opcode_107:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:16:36
.opcode_108:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLabel(73), file.fs:16:38
.opcode_109:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:16:38
.opcode_110:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs:16:43
.opcode_111:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs:16:46
.opcode_112:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("dup"), file.fs:18:3
.opcode_113:
        
    ; [gb_ir] Metadata("dup")
    ; [metadata] "dup"
.PAX_dup:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs:18:10
.opcode_114:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs:18:15
.opcode_115:
        
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

; [pax_ir] PushLiteral(49158), file.fs:18:17
.opcode_116:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:18:22
.opcode_117:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(49158), file.fs:18:24
.opcode_118:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:18:29
.opcode_119:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs:18:31
.opcode_120:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("2dup"), file.fs:19:3
.opcode_121:
        
    ; [gb_ir] Metadata("2dup")
    ; [metadata] "2dup"
.PAX_2dup:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(81), file.fs:19:10
.opcode_122:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_81")
    ld hl,.opcode_81

; [pax_ir] Call("over"), file.fs:19:10
.opcode_123:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_over")
    ld hl,.PAX_over
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(81), file.fs:19:15
.opcode_124:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_81")
    ld hl,.opcode_81

; [pax_ir] Call("over"), file.fs:19:15
.opcode_125:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_over")
    ld hl,.PAX_over
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:19:20
.opcode_126:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("?dup"), file.fs:20:3
.opcode_127:
        
    ; [gb_ir] Metadata("?dup")
    ; [metadata] "?dup"
.PAX_?dup:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs:20:10
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

; [pax_ir] Store, file.fs:20:15
.opcode_129:
        
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

; [pax_ir] PushLiteral(49158), file.fs:20:17
.opcode_130:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:20:22
.opcode_131:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLabel(138), file.fs:20:24
.opcode_132:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_138")
    ld hl,.opcode_138

; [pax_ir] JumpIf0, file.fs:20:24
.opcode_133:
        
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

; [pax_ir] PushLiteral(49158), file.fs:20:27
.opcode_134:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:20:32
.opcode_135:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] PushLiteral(49158), file.fs:20:34
.opcode_136:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:20:39
.opcode_137:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] BranchTarget, file.fs:20:41
.opcode_138:
        

; [pax_ir] Exit, file.fs:20:46
.opcode_139:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("invert"), file.fs:22:3
.opcode_140:
        
    ; [gb_ir] Metadata("invert")
    ; [metadata] "invert"
.PAX_invert:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(-1), file.fs:22:12
.opcode_141:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

; [pax_ir] Nand, file.fs:22:15
.opcode_142:
        
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

; [pax_ir] Exit, file.fs:22:20
.opcode_143:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("negate"), file.fs:23:3
.opcode_144:
        
    ; [gb_ir] Metadata("negate")
    ; [metadata] "negate"
.PAX_negate:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(140), file.fs:23:12
.opcode_145:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_140")
    ld hl,.opcode_140

; [pax_ir] Call("invert"), file.fs:23:12
.opcode_146:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_invert")
    ld hl,.PAX_invert
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(1), file.fs:23:19
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

; [pax_ir] Add, file.fs:23:21
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

; [pax_ir] Exit, file.fs:23:23
.opcode_149:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("-"), file.fs:24:3
.opcode_150:
        
    ; [gb_ir] Metadata("-")
    ; [metadata] "-"
.PAX_-:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(144), file.fs:24:12
.opcode_151:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_144")
    ld hl,.opcode_144

; [pax_ir] Call("negate"), file.fs:24:12
.opcode_152:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_negate")
    ld hl,.PAX_negate
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Add, file.fs:24:19
.opcode_153:
        
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

; [pax_ir] Exit, file.fs:24:21
.opcode_154:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("1+"), file.fs:26:3
.opcode_155:
        
    ; [gb_ir] Metadata("1+")
    ; [metadata] "1+"
.PAX_1+:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(1), file.fs:26:8
.opcode_156:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] Add, file.fs:26:10
.opcode_157:
        
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

; [pax_ir] Exit, file.fs:26:12
.opcode_158:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("1-"), file.fs:27:3
.opcode_159:
        
    ; [gb_ir] Metadata("1-")
    ; [metadata] "1-"
.PAX_1-:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(-1), file.fs:27:8
.opcode_160:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

; [pax_ir] Add, file.fs:27:11
.opcode_161:
        
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

; [pax_ir] Exit, file.fs:27:13
.opcode_162:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("+!"), file.fs:28:3
.opcode_163:
        
    ; [gb_ir] Metadata("+!")
    ; [metadata] "+!"
.PAX_+!:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(113), file.fs:28:8
.opcode_164:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_113")
    ld hl,.opcode_113

; [pax_ir] Call("dup"), file.fs:28:8
.opcode_165:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_dup")
    ld hl,.PAX_dup
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs:28:12
.opcode_166:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Load, file.fs:28:15
.opcode_167:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Add, file.fs:28:17
.opcode_168:
        
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

; [pax_ir] AltPop, file.fs:28:19
.opcode_169:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] Store, file.fs:28:22
.opcode_170:
        
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

; [pax_ir] Exit, file.fs:28:24
.opcode_171:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("0="), file.fs:29:3
.opcode_172:
        
    ; [gb_ir] Metadata("0=")
    ; [metadata] "0="
.PAX_0=:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(179), file.fs:29:8
.opcode_173:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_179")
    ld hl,.opcode_179

; [pax_ir] JumpIf0, file.fs:29:8
.opcode_174:
        
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

; [pax_ir] PushLiteral(0), file.fs:29:11
.opcode_175:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLiteral(0), file.fs:29:13
.opcode_176:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(181), file.fs:29:13
.opcode_177:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_181")
    ld hl,.opcode_181

; [pax_ir] JumpIf0, file.fs:29:13
.opcode_178:
        
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

; [pax_ir] BranchTarget, file.fs:29:13
.opcode_179:
        

; [pax_ir] PushLiteral(-1), file.fs:29:18
.opcode_180:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

; [pax_ir] BranchTarget, file.fs:29:21
.opcode_181:
        

; [pax_ir] Exit, file.fs:29:26
.opcode_182:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("="), file.fs:30:3
.opcode_183:
        
    ; [gb_ir] Metadata("=")
    ; [metadata] "="
.PAX_=:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(150), file.fs:30:8
.opcode_184:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_150")
    ld hl,.opcode_150

; [pax_ir] Call("-"), file.fs:30:8
.opcode_185:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_-")
    ld hl,.PAX_-
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs:30:10
.opcode_186:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_172")
    ld hl,.opcode_172

; [pax_ir] Call("0="), file.fs:30:10
.opcode_187:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_0=")
    ld hl,.PAX_0=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:30:13
.opcode_188:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("<>"), file.fs:31:3
.opcode_189:
        
    ; [gb_ir] Metadata("<>")
    ; [metadata] "<>"
.PAX_<>:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(183), file.fs:31:8
.opcode_190:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:31:8
.opcode_191:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs:31:10
.opcode_192:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_172")
    ld hl,.opcode_172

; [pax_ir] Call("0="), file.fs:31:10
.opcode_193:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_0=")
    ld hl,.PAX_0=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:31:13
.opcode_194:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("=="), file.fs:32:3
.opcode_195:
        
    ; [gb_ir] Metadata("==")
    ; [metadata] "=="
.PAX_==:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(150), file.fs:32:8
.opcode_196:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_150")
    ld hl,.opcode_150

; [pax_ir] Call("-"), file.fs:32:8
.opcode_197:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_-")
    ld hl,.PAX_-
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(172), file.fs:32:10
.opcode_198:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_172")
    ld hl,.opcode_172

; [pax_ir] Call("0="), file.fs:32:10
.opcode_199:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_0=")
    ld hl,.PAX_0=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:32:13
.opcode_200:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("or"), file.fs:34:3
.opcode_201:
        
    ; [gb_ir] Metadata("or")
    ; [metadata] "or"
.PAX_or:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(140), file.fs:34:8
.opcode_202:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_140")
    ld hl,.opcode_140

; [pax_ir] Call("invert"), file.fs:34:8
.opcode_203:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_invert")
    ld hl,.PAX_invert
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(73), file.fs:34:15
.opcode_204:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:34:15
.opcode_205:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(140), file.fs:34:20
.opcode_206:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_140")
    ld hl,.opcode_140

; [pax_ir] Call("invert"), file.fs:34:20
.opcode_207:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_invert")
    ld hl,.PAX_invert
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Nand, file.fs:34:27
.opcode_208:
        
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

; [pax_ir] Exit, file.fs:34:32
.opcode_209:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("xor"), file.fs:35:3
.opcode_210:
        
    ; [gb_ir] Metadata("xor")
    ; [metadata] "xor"
.PAX_xor:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLabel(121), file.fs:35:9
.opcode_211:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_121")
    ld hl,.opcode_121

; [pax_ir] Call("2dup"), file.fs:35:9
.opcode_212:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_2dup")
    ld hl,.PAX_2dup
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Nand, file.fs:35:14
.opcode_213:
        
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

; [pax_ir] PushLabel(155), file.fs:35:19
.opcode_214:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_155")
    ld hl,.opcode_155

; [pax_ir] Call("1+"), file.fs:35:19
.opcode_215:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_1+")
    ld hl,.PAX_1+
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(113), file.fs:35:22
.opcode_216:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_113")
    ld hl,.opcode_113

; [pax_ir] Call("dup"), file.fs:35:22
.opcode_217:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_dup")
    ld hl,.PAX_dup
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Add, file.fs:35:26
.opcode_218:
        
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

; [pax_ir] Add, file.fs:35:28
.opcode_219:
        
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

; [pax_ir] Add, file.fs:35:30
.opcode_220:
        
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

; [pax_ir] Exit, file.fs:35:32
.opcode_221:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("and"), file.fs:36:3
.opcode_222:
        
    ; [gb_ir] Metadata("and")
    ; [metadata] "and"
.PAX_and:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Nand, file.fs:36:9
.opcode_223:
        
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

; [pax_ir] PushLabel(140), file.fs:36:14
.opcode_224:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_140")
    ld hl,.opcode_140

; [pax_ir] Call("invert"), file.fs:36:14
.opcode_225:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_invert")
    ld hl,.PAX_invert
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:36:21
.opcode_226:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("loopimpl"), file.fs:41:3
.opcode_227:
        
    ; [gb_ir] Metadata("loopimpl")
    ; [metadata] "loopimpl"
.PAX_loopimpl:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs:41:12
.opcode_228:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:41:15
.opcode_229:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:41:18
.opcode_230:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(155), file.fs:41:21
.opcode_231:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_155")
    ld hl,.opcode_155

; [pax_ir] Call("1+"), file.fs:41:21
.opcode_232:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_1+")
    ld hl,.PAX_1+
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(121), file.fs:41:24
.opcode_233:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_121")
    ld hl,.opcode_121

; [pax_ir] Call("2dup"), file.fs:41:24
.opcode_234:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_2dup")
    ld hl,.PAX_2dup
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(183), file.fs:41:29
.opcode_235:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:41:29
.opcode_236:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(245), file.fs:41:31
.opcode_237:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_245")
    ld hl,.opcode_245

; [pax_ir] JumpIf0, file.fs:41:31
.opcode_238:
        
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

; [pax_ir] PushLabel(68), file.fs:41:34
.opcode_239:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_68")
    ld hl,.opcode_68

; [pax_ir] Call("2drop"), file.fs:41:34
.opcode_240:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_2drop")
    ld hl,.PAX_2drop
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(1), file.fs:41:40
.opcode_241:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] PushLiteral(0), file.fs:41:42
.opcode_242:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(249), file.fs:41:42
.opcode_243:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_249")
    ld hl,.opcode_249

; [pax_ir] JumpIf0, file.fs:41:42
.opcode_244:
        
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

; [pax_ir] BranchTarget, file.fs:41:42
.opcode_245:
        

; [pax_ir] AltPush, file.fs:41:47
.opcode_246:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:41:50
.opcode_247:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(0), file.fs:41:53
.opcode_248:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] BranchTarget, file.fs:41:55
.opcode_249:
        

; [pax_ir] PushLabel(73), file.fs:41:60
.opcode_250:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:41:60
.opcode_251:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs:41:65
.opcode_252:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs:41:68
.opcode_253:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("-loopimpl"), file.fs:42:3
.opcode_254:
        
    ; [gb_ir] Metadata("-loopimpl")
    ; [metadata] "-loopimpl"
.PAX_-loopimpl:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs:42:13
.opcode_255:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:42:16
.opcode_256:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(91), file.fs:42:19
.opcode_257:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_91")
    ld hl,.opcode_91

; [pax_ir] Call("rot"), file.fs:42:19
.opcode_258:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_rot")
    ld hl,.PAX_rot
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPop, file.fs:42:23
.opcode_259:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLabel(73), file.fs:42:26
.opcode_260:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:42:26
.opcode_261:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(150), file.fs:42:31
.opcode_262:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_150")
    ld hl,.opcode_150

; [pax_ir] Call("-"), file.fs:42:31
.opcode_263:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_-")
    ld hl,.PAX_-
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(121), file.fs:42:33
.opcode_264:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_121")
    ld hl,.opcode_121

; [pax_ir] Call("2dup"), file.fs:42:33
.opcode_265:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_2dup")
    ld hl,.PAX_2dup
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(183), file.fs:42:38
.opcode_266:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_183")
    ld hl,.opcode_183

; [pax_ir] Call("="), file.fs:42:38
.opcode_267:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_=")
    ld hl,.PAX_=
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(276), file.fs:42:40
.opcode_268:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_276")
    ld hl,.opcode_276

; [pax_ir] JumpIf0, file.fs:42:40
.opcode_269:
        
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

; [pax_ir] PushLabel(68), file.fs:42:43
.opcode_270:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_68")
    ld hl,.opcode_68

; [pax_ir] Call("2drop"), file.fs:42:43
.opcode_271:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_2drop")
    ld hl,.PAX_2drop
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLiteral(1), file.fs:42:49
.opcode_272:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] PushLiteral(0), file.fs:42:51
.opcode_273:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] PushLabel(280), file.fs:42:51
.opcode_274:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_280")
    ld hl,.opcode_280

; [pax_ir] JumpIf0, file.fs:42:51
.opcode_275:
        
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

; [pax_ir] BranchTarget, file.fs:42:51
.opcode_276:
        

; [pax_ir] AltPush, file.fs:42:56
.opcode_277:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:42:59
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

; [pax_ir] PushLiteral(0), file.fs:42:62
.opcode_279:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] BranchTarget, file.fs:42:64
.opcode_280:
        

; [pax_ir] PushLabel(73), file.fs:42:69
.opcode_281:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:42:69
.opcode_282:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] AltPush, file.fs:42:74
.opcode_283:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] Exit, file.fs:42:77
.opcode_284:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("i"), file.fs:45:3
.opcode_285:
        
    ; [gb_ir] Metadata("i")
    ; [metadata] "i"
.PAX_i:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs:45:5
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

; [pax_ir] AltPop, file.fs:45:8
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

; [pax_ir] AltPop, file.fs:45:11
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

; [pax_ir] PushLiteral(49158), file.fs:45:14
.opcode_289:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs:45:19
.opcode_290:
        
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

; [pax_ir] PushLiteral(49158), file.fs:45:21
.opcode_291:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:45:26
.opcode_292:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPush, file.fs:45:28
.opcode_293:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:45:31
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

; [pax_ir] AltPush, file.fs:45:34
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

; [pax_ir] PushLiteral(49158), file.fs:45:37
.opcode_296:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:45:42
.opcode_297:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs:45:44
.opcode_298:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("j"), file.fs:46:3
.opcode_299:
        
    ; [gb_ir] Metadata("j")
    ; [metadata] "j"
.PAX_j:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPop, file.fs:46:5
.opcode_300:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:46:8
.opcode_301:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:46:11
.opcode_302:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:46:14
.opcode_303:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] AltPop, file.fs:46:17
.opcode_304:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(49158), file.fs:46:20
.opcode_305:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Store, file.fs:46:25
.opcode_306:
        
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

; [pax_ir] PushLiteral(49158), file.fs:46:27
.opcode_307:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:46:32
.opcode_308:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] AltPush, file.fs:46:34
.opcode_309:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:46:37
.opcode_310:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:46:40
.opcode_311:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:46:43
.opcode_312:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:46:46
.opcode_313:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(49158), file.fs:46:49
.opcode_314:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

; [pax_ir] Load, file.fs:46:54
.opcode_315:
        
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

; [pax_ir] Exit, file.fs:46:56
.opcode_316:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("*"), file.fs:48:3
.opcode_317:
        
    ; [gb_ir] Metadata("*")
    ; [metadata] "*"
.PAX_*:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:48:5
.opcode_318:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(0), file.fs:48:8
.opcode_319:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] AltPop, file.fs:48:10
.opcode_320:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

; [pax_ir] PushLiteral(0), file.fs:48:13
.opcode_321:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

; [pax_ir] AltPush, file.fs:48:15
.opcode_322:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] AltPush, file.fs:48:15
.opcode_323:
        
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] BranchTarget, file.fs:48:15
.opcode_324:
        

; [pax_ir] PushLabel(81), file.fs:48:18
.opcode_325:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_81")
    ld hl,.opcode_81

; [pax_ir] Call("over"), file.fs:48:18
.opcode_326:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_over")
    ld hl,.PAX_over
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Add, file.fs:48:23
.opcode_327:
        
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

; [pax_ir] PushLabel(227), file.fs:48:25
.opcode_328:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_227")
    ld hl,.opcode_227

; [pax_ir] Call("loopimpl"), file.fs:48:25
.opcode_329:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_loopimpl")
    ld hl,.PAX_loopimpl
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(324), file.fs:48:25
.opcode_330:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_324")
    ld hl,.opcode_324

; [pax_ir] JumpIf0, file.fs:48:25
.opcode_331:
        
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

; [pax_ir] PushLabel(73), file.fs:48:30
.opcode_332:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_73")
    ld hl,.opcode_73

; [pax_ir] Call("swap"), file.fs:48:30
.opcode_333:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_swap")
    ld hl,.PAX_swap
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] PushLabel(63), file.fs:48:35
.opcode_334:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".opcode_63")
    ld hl,.opcode_63

; [pax_ir] Call("drop"), file.fs:48:35
.opcode_335:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLabel(".PAX_drop")
    ld hl,.PAX_drop
    ; [gb_ir] PopAndCall
    call EMULATE_JP_HL

; [pax_ir] Exit, file.fs:48:40
.opcode_336:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-right"), file.fs:58:3
.opcode_337:
        
    ; [gb_ir] Metadata("move-right")
    ; [metadata] "move-right"
.PAX_move-right:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(18), file.fs:58:14
.opcode_338:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(18)
    ld hl,18

; [pax_ir] PushLiteral(38912), file.fs:58:17
.opcode_339:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] PushLiteral(3), file.fs:58:26
.opcode_340:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(3)
    ld hl,3

; [pax_ir] Add, file.fs:58:28
.opcode_341:
        
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

; [pax_ir] Store8, file.fs:58:30
.opcode_342:
        
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

; [pax_ir] Exit, file.fs:58:33
.opcode_343:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-left"), file.fs:59:3
.opcode_344:
        
    ; [gb_ir] Metadata("move-left")
    ; [metadata] "move-left"
.PAX_move-left:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(30), file.fs:59:13
.opcode_345:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(30)
    ld hl,30

; [pax_ir] PushLiteral(38912), file.fs:59:16
.opcode_346:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] Store8, file.fs:59:25
.opcode_347:
        
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

; [pax_ir] Exit, file.fs:59:28
.opcode_348:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-up"), file.fs:60:3
.opcode_349:
        
    ; [gb_ir] Metadata("move-up")
    ; [metadata] "move-up"
.PAX_move-up:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(19), file.fs:60:11
.opcode_350:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(19)
    ld hl,19

; [pax_ir] PushLiteral(38912), file.fs:60:14
.opcode_351:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] PushLiteral(2), file.fs:60:23
.opcode_352:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

; [pax_ir] Add, file.fs:60:25
.opcode_353:
        
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

; [pax_ir] Store8, file.fs:60:27
.opcode_354:
        
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

; [pax_ir] Exit, file.fs:60:30
.opcode_355:
        
    ; [gb_ir] Ret
    ret






; function start

; [pax_ir] Metadata("move-down"), file.fs:61:3
.opcode_356:
        
    ; [gb_ir] Metadata("move-down")
    ; [metadata] "move-down"
.PAX_move-down:
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                

; [pax_ir] PushLiteral(20), file.fs:61:13
.opcode_357:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(20)
    ld hl,20

; [pax_ir] PushLiteral(38912), file.fs:61:16
.opcode_358:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

; [pax_ir] PushLiteral(1), file.fs:61:25
.opcode_359:
        
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

; [pax_ir] Add, file.fs:61:27
.opcode_360:
        
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

; [pax_ir] Store8, file.fs:61:29
.opcode_361:
        
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

; [pax_ir] Exit, file.fs:61:32
.opcode_362:
        
    ; [gb_ir] Ret
    ret






; function start

EMULATE_JP_HL:
    jp	hl
    
