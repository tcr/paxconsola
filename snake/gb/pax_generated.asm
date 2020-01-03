
    ; [pax_ir:0] PushLiteral(49156), file.fs:72:1
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49156)
    ld hl,49156

    ; [pax_ir:1] Load, file.fs:72:10
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:2] PushLiteral(37), file.fs:73:3
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(37)
    ld hl,37

    ; [pax_ir:3] Call("over"), file.fs:73:8
            
    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [pax_ir:4] Call("="), file.fs:73:13
            
    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [pax_ir:5] JumpIf0(9), file.fs:73:15
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_9")
    ld a, e
    cp $0
    jp z,.target_9

    ; [pax_ir:6] Call("move-left"), file.fs:73:18
            
    ; [gb_ir] Call("PAX_FN_move2Dleft")
    call PAX_FN_move2Dleft

    ; [pax_ir:7] PushLiteral(0), file.fs:73:28
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:8] JumpIf0(34), file.fs:73:28
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_34")
    ld a, e
    cp $0
    jp z,.target_34

    ; [pax_ir:9] BranchTarget, file.fs:73:28
            
    ; [gb_ir] Label(".target_9")
.target_9:

    ; [pax_ir:10] PushLiteral(38), file.fs:74:3
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

    ; [pax_ir:11] Call("over"), file.fs:74:6
            
    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [pax_ir:12] Call("="), file.fs:74:14
            
    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [pax_ir:13] JumpIf0(17), file.fs:74:16
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_17")
    ld a, e
    cp $0
    jp z,.target_17

    ; [pax_ir:14] Call("move-up"), file.fs:74:19
            
    ; [gb_ir] Call("PAX_FN_move2Dup")
    call PAX_FN_move2Dup

    ; [pax_ir:15] PushLiteral(0), file.fs:74:27
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:16] JumpIf0(33), file.fs:74:27
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_33")
    ld a, e
    cp $0
    jp z,.target_33

    ; [pax_ir:17] BranchTarget, file.fs:74:27
            
    ; [gb_ir] Label(".target_17")
.target_17:

    ; [pax_ir:18] PushLiteral(39), file.fs:75:3
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

    ; [pax_ir:19] Call("over"), file.fs:75:9
            
    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [pax_ir:20] Call("="), file.fs:75:15
            
    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [pax_ir:21] JumpIf0(25), file.fs:75:17
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_25")
    ld a, e
    cp $0
    jp z,.target_25

    ; [pax_ir:22] Call("move-right"), file.fs:75:20
            
    ; [gb_ir] Call("PAX_FN_move2Dright")
    call PAX_FN_move2Dright

    ; [pax_ir:23] PushLiteral(0), file.fs:75:31
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:24] JumpIf0(32), file.fs:75:31
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_32")
    ld a, e
    cp $0
    jp z,.target_32

    ; [pax_ir:25] BranchTarget, file.fs:75:31
            
    ; [gb_ir] Label(".target_25")
.target_25:

    ; [pax_ir:26] PushLiteral(40), file.fs:76:3
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

    ; [pax_ir:27] Call("over"), file.fs:76:8
            
    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [pax_ir:28] Call("="), file.fs:76:13
            
    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [pax_ir:29] JumpIf0(31), file.fs:76:15
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_31")
    ld a, e
    cp $0
    jp z,.target_31

    ; [pax_ir:30] Call("move-down"), file.fs:76:18
            
    ; [gb_ir] Call("PAX_FN_move2Ddown")
    call PAX_FN_move2Ddown

    ; [pax_ir:31] BranchTarget, file.fs:77:3
            
    ; [gb_ir] Label(".target_31")
.target_31:

    ; [pax_ir:32] BranchTarget, file.fs:77:8
            
    ; [gb_ir] Label(".target_32")
.target_32:

    ; [pax_ir:33] BranchTarget, file.fs:77:13
            
    ; [gb_ir] Label(".target_33")
.target_33:

    ; [pax_ir:34] BranchTarget, file.fs:77:18
            
    ; [gb_ir] Label(".target_34")
.target_34:

    ; [pax_ir:35] Stop, file.fs:0:0
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("drop"), file.fs:8:3
            
    ; [gb_ir] Metadata("drop")
    ; [metadata] "drop"
PAX_FN_drop:

    ; [pax_ir:1] BranchTarget, file.fs:8:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] JumpIf0(3), file.fs:8:11
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_3")
    ld a, e
    cp $0
    jp z,.target_3

    ; [pax_ir:3] BranchTarget, file.fs:8:14
            
    ; [gb_ir] Label(".target_3")
.target_3:

    ; [pax_ir:4] Exit, file.fs:8:19
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("2drop"), file.fs:9:3
            
    ; [gb_ir] Metadata("2drop")
    ; [metadata] "2drop"
PAX_FN_2drop:

    ; [pax_ir:1] BranchTarget, file.fs:9:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] Add, file.fs:9:11
            
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

    ; [pax_ir:3] Call("drop"), file.fs:9:13
            
    ; [gb_ir] Call("PAX_FN_drop")
    call PAX_FN_drop

    ; [pax_ir:4] Exit, file.fs:9:18
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("swap"), file.fs:11:3
            
    ; [gb_ir] Metadata("swap")
    ; [metadata] "swap"
PAX_FN_swap:

    ; [pax_ir:1] BranchTarget, file.fs:11:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] AltPush, file.fs:11:10
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:3] PushLiteral(49158), file.fs:11:13
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:4] Store, file.fs:11:18
            
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

    ; [pax_ir:5] AltPop, file.fs:11:20
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:6] PushLiteral(49158), file.fs:11:23
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:7] Load, file.fs:11:28
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:8] Exit, file.fs:11:30
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("over"), file.fs:12:3
            
    ; [gb_ir] Metadata("over")
    ; [metadata] "over"
PAX_FN_over:

    ; [pax_ir:1] BranchTarget, file.fs:12:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] AltPush, file.fs:12:10
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:3] PushLiteral(49158), file.fs:12:13
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:4] Store, file.fs:12:18
            
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

    ; [pax_ir:5] PushLiteral(49158), file.fs:12:20
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:6] Load, file.fs:12:25
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:7] AltPop, file.fs:12:27
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:8] PushLiteral(49158), file.fs:12:30
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:9] Load, file.fs:12:35
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:10] Exit, file.fs:12:37
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("rot"), file.fs:13:3
            
    ; [gb_ir] Metadata("rot")
    ; [metadata] "rot"
PAX_FN_rot:

    ; [pax_ir:1] BranchTarget, file.fs:13:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] AltPush, file.fs:13:10
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:3] Call("swap"), file.fs:13:13
            
    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [pax_ir:4] AltPop, file.fs:13:18
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:5] Call("swap"), file.fs:13:21
            
    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [pax_ir:6] Exit, file.fs:13:26
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("dup"), file.fs:18:3
            
    ; [gb_ir] Metadata("dup")
    ; [metadata] "dup"
PAX_FN_dup:

    ; [pax_ir:1] BranchTarget, file.fs:18:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] PushLiteral(49158), file.fs:18:10
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:3] Store, file.fs:18:15
            
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

    ; [pax_ir:4] PushLiteral(49158), file.fs:18:17
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:5] Load, file.fs:18:22
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:6] PushLiteral(49158), file.fs:18:24
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:7] Load, file.fs:18:29
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:8] Exit, file.fs:18:31
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("2dup"), file.fs:19:3
            
    ; [gb_ir] Metadata("2dup")
    ; [metadata] "2dup"
PAX_FN_2dup:

    ; [pax_ir:1] BranchTarget, file.fs:19:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] Call("over"), file.fs:19:10
            
    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [pax_ir:3] Call("over"), file.fs:19:15
            
    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [pax_ir:4] Exit, file.fs:19:20
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("invert"), file.fs:22:3
            
    ; [gb_ir] Metadata("invert")
    ; [metadata] "invert"
PAX_FN_invert:

    ; [pax_ir:1] BranchTarget, file.fs:22:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] PushLiteral(-1), file.fs:22:12
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [pax_ir:3] Nand, file.fs:22:15
            
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

    ; [pax_ir:4] Exit, file.fs:22:20
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("negate"), file.fs:23:3
            
    ; [gb_ir] Metadata("negate")
    ; [metadata] "negate"
PAX_FN_negate:

    ; [pax_ir:1] BranchTarget, file.fs:23:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] Call("invert"), file.fs:23:12
            
    ; [gb_ir] Call("PAX_FN_invert")
    call PAX_FN_invert

    ; [pax_ir:3] PushLiteral(1), file.fs:23:19
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [pax_ir:4] Add, file.fs:23:21
            
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

    ; [pax_ir:5] Exit, file.fs:23:23
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("-"), file.fs:24:3
            
    ; [gb_ir] Metadata("-")
    ; [metadata] "-"
PAX_FN_2D:

    ; [pax_ir:1] BranchTarget, file.fs:24:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] Call("negate"), file.fs:24:12
            
    ; [gb_ir] Call("PAX_FN_negate")
    call PAX_FN_negate

    ; [pax_ir:3] Add, file.fs:24:19
            
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

    ; [pax_ir:4] Exit, file.fs:24:21
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("1+"), file.fs:26:3
            
    ; [gb_ir] Metadata("1+")
    ; [metadata] "1+"
PAX_FN_12B:

    ; [pax_ir:1] BranchTarget, file.fs:26:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] PushLiteral(1), file.fs:26:8
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [pax_ir:3] Add, file.fs:26:10
            
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

    ; [pax_ir:4] Exit, file.fs:26:12
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("0="), file.fs:29:3
            
    ; [gb_ir] Metadata("0=")
    ; [metadata] "0="
PAX_FN_03D:

    ; [pax_ir:1] BranchTarget, file.fs:29:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] JumpIf0(6), file.fs:29:8
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_6")
    ld a, e
    cp $0
    jp z,.target_6

    ; [pax_ir:3] PushLiteral(0), file.fs:29:11
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:4] PushLiteral(0), file.fs:29:13
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:5] JumpIf0(8), file.fs:29:13
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_8")
    ld a, e
    cp $0
    jp z,.target_8

    ; [pax_ir:6] BranchTarget, file.fs:29:13
            
    ; [gb_ir] Label(".target_6")
.target_6:

    ; [pax_ir:7] PushLiteral(-1), file.fs:29:18
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [pax_ir:8] BranchTarget, file.fs:29:21
            
    ; [gb_ir] Label(".target_8")
.target_8:

    ; [pax_ir:9] Exit, file.fs:29:26
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("="), file.fs:30:3
            
    ; [gb_ir] Metadata("=")
    ; [metadata] "="
PAX_FN_3D:

    ; [pax_ir:1] BranchTarget, file.fs:30:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] Call("-"), file.fs:30:8
            
    ; [gb_ir] Call("PAX_FN_2D")
    call PAX_FN_2D

    ; [pax_ir:3] Call("0="), file.fs:30:10
            
    ; [gb_ir] Call("PAX_FN_03D")
    call PAX_FN_03D

    ; [pax_ir:4] Exit, file.fs:30:13
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("loopimpl"), file.fs:41:3
            
    ; [gb_ir] Metadata("loopimpl")
    ; [metadata] "loopimpl"
PAX_FN_loopimpl:

    ; [pax_ir:1] BranchTarget, file.fs:41:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] AltPop, file.fs:41:12
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:3] AltPop, file.fs:41:15
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:4] AltPop, file.fs:41:18
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:5] Call("1+"), file.fs:41:21
            
    ; [gb_ir] Call("PAX_FN_12B")
    call PAX_FN_12B

    ; [pax_ir:6] Call("2dup"), file.fs:41:24
            
    ; [gb_ir] Call("PAX_FN_2dup")
    call PAX_FN_2dup

    ; [pax_ir:7] Call("="), file.fs:41:29
            
    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [pax_ir:8] JumpIf0(13), file.fs:41:31
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_13")
    ld a, e
    cp $0
    jp z,.target_13

    ; [pax_ir:9] Call("2drop"), file.fs:41:34
            
    ; [gb_ir] Call("PAX_FN_2drop")
    call PAX_FN_2drop

    ; [pax_ir:10] PushLiteral(1), file.fs:41:40
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [pax_ir:11] PushLiteral(0), file.fs:41:42
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:12] JumpIf0(17), file.fs:41:42
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_17")
    ld a, e
    cp $0
    jp z,.target_17

    ; [pax_ir:13] BranchTarget, file.fs:41:42
            
    ; [gb_ir] Label(".target_13")
.target_13:

    ; [pax_ir:14] AltPush, file.fs:41:47
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:15] AltPush, file.fs:41:50
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:16] PushLiteral(0), file.fs:41:53
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:17] BranchTarget, file.fs:41:55
            
    ; [gb_ir] Label(".target_17")
.target_17:

    ; [pax_ir:18] Call("swap"), file.fs:41:60
            
    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [pax_ir:19] AltPush, file.fs:41:65
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:20] Exit, file.fs:41:68
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("i"), file.fs:45:3
            
    ; [gb_ir] Metadata("i")
    ; [metadata] "i"
PAX_FN_i:

    ; [pax_ir:1] BranchTarget, file.fs:45:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] AltPop, file.fs:45:5
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:3] AltPop, file.fs:45:8
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:4] AltPop, file.fs:45:11
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:5] PushLiteral(49158), file.fs:45:14
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:6] Store, file.fs:45:19
            
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

    ; [pax_ir:7] PushLiteral(49158), file.fs:45:21
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:8] Load, file.fs:45:26
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:9] AltPush, file.fs:45:28
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:10] AltPush, file.fs:45:31
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:11] AltPush, file.fs:45:34
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:12] PushLiteral(49158), file.fs:45:37
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:13] Load, file.fs:45:42
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:14] Exit, file.fs:45:44
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("j"), file.fs:46:3
            
    ; [gb_ir] Metadata("j")
    ; [metadata] "j"
PAX_FN_j:

    ; [pax_ir:1] BranchTarget, file.fs:46:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] AltPop, file.fs:46:5
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:3] AltPop, file.fs:46:8
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:4] AltPop, file.fs:46:11
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:5] AltPop, file.fs:46:14
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:6] AltPop, file.fs:46:17
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:7] PushLiteral(49158), file.fs:46:20
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:8] Store, file.fs:46:25
            
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

    ; [pax_ir:9] PushLiteral(49158), file.fs:46:27
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:10] Load, file.fs:46:32
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:11] AltPush, file.fs:46:34
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:12] AltPush, file.fs:46:37
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:13] AltPush, file.fs:46:40
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:14] AltPush, file.fs:46:43
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:15] AltPush, file.fs:46:46
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:16] PushLiteral(49158), file.fs:46:49
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(49158)
    ld hl,49158

    ; [pax_ir:17] Load, file.fs:46:54
            
    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [pax_ir:18] Exit, file.fs:46:56
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("*"), file.fs:48:3
            
    ; [gb_ir] Metadata("*")
    ; [metadata] "*"
PAX_FN_2A:

    ; [pax_ir:1] BranchTarget, file.fs:48:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] AltPush, file.fs:48:5
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:3] PushLiteral(0), file.fs:48:8
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:4] AltPop, file.fs:48:10
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] AltPop
    pop hl

    ; [pax_ir:5] PushLiteral(0), file.fs:48:13
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [pax_ir:6] AltPush, file.fs:48:15
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:7] AltPush, file.fs:48:15
            
    ; [gb_ir] AltDupFromTOS
    push hl
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [pax_ir:8] BranchTarget, file.fs:48:15
            
    ; [gb_ir] Label(".target_8")
.target_8:

    ; [pax_ir:9] Call("over"), file.fs:48:18
            
    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [pax_ir:10] Add, file.fs:48:23
            
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

    ; [pax_ir:11] Call("loopimpl"), file.fs:48:25
            
    ; [gb_ir] Call("PAX_FN_loopimpl")
    call PAX_FN_loopimpl

    ; [pax_ir:12] JumpIf0(8), file.fs:48:25
            
    ; [gb_ir] CopyToE
    ld e,l
    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
    ; [gb_ir] JumpIfEIs0(".target_8")
    ld a, e
    cp $0
    jp z,.target_8

    ; [pax_ir:13] Call("swap"), file.fs:48:30
            
    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [pax_ir:14] Call("drop"), file.fs:48:35
            
    ; [gb_ir] Call("PAX_FN_drop")
    call PAX_FN_drop

    ; [pax_ir:15] Exit, file.fs:48:40
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("move-right"), file.fs:58:3
            
    ; [gb_ir] Metadata("move-right")
    ; [metadata] "move-right"
PAX_FN_move2Dright:

    ; [pax_ir:1] BranchTarget, file.fs:58:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] PushLiteral(23), file.fs:58:14
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(23)
    ld hl,23

    ; [pax_ir:3] PushLiteral(38912), file.fs:58:17
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [pax_ir:4] PushLiteral(67), file.fs:58:26
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(67)
    ld hl,67

    ; [pax_ir:5] Add, file.fs:58:29
            
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

    ; [pax_ir:6] Store8, file.fs:58:31
            
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

    ; [pax_ir:7] Exit, file.fs:58:34
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("move-left"), file.fs:59:3
            
    ; [gb_ir] Metadata("move-left")
    ; [metadata] "move-left"
PAX_FN_move2Dleft:

    ; [pax_ir:1] BranchTarget, file.fs:59:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] PushLiteral(21), file.fs:59:13
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(21)
    ld hl,21

    ; [pax_ir:3] PushLiteral(38912), file.fs:59:16
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [pax_ir:4] PushLiteral(65), file.fs:59:25
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(65)
    ld hl,65

    ; [pax_ir:5] Add, file.fs:59:28
            
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

    ; [pax_ir:6] Store8, file.fs:59:30
            
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

    ; [pax_ir:7] Exit, file.fs:59:33
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("move-up"), file.fs:60:3
            
    ; [gb_ir] Metadata("move-up")
    ; [metadata] "move-up"
PAX_FN_move2Dup:

    ; [pax_ir:1] BranchTarget, file.fs:60:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] PushLiteral(22), file.fs:60:11
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(22)
    ld hl,22

    ; [pax_ir:3] PushLiteral(38912), file.fs:60:14
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [pax_ir:4] PushLiteral(34), file.fs:60:23
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(34)
    ld hl,34

    ; [pax_ir:5] Add, file.fs:60:26
            
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

    ; [pax_ir:6] Store8, file.fs:60:28
            
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

    ; [pax_ir:7] Exit, file.fs:60:31
            
    ; [gb_ir] Ret
    ret






; function start

    ; [pax_ir:0] Metadata("move-down"), file.fs:61:3
            
    ; [gb_ir] Metadata("move-down")
    ; [metadata] "move-down"
PAX_FN_move2Ddown:

    ; [pax_ir:1] BranchTarget, file.fs:61:3
            
    ; [gb_ir] Label(".target_1")
.target_1:

    ; [pax_ir:2] PushLiteral(24), file.fs:61:13
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(24)
    ld hl,24

    ; [pax_ir:3] PushLiteral(38912), file.fs:61:16
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [pax_ir:4] PushLiteral(98), file.fs:61:25
            
    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
    ; [gb_ir] ReplaceLiteral(98)
    ld hl,98

    ; [pax_ir:5] Add, file.fs:61:28
            
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

    ; [pax_ir:6] Store8, file.fs:61:30
            
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

    ; [pax_ir:7] Exit, file.fs:61:33
            
    ; [gb_ir] Ret
    ret






; function start
