    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49188)
    ld a, [49188]
    ld l, a
    ld a, [49188+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_03D")
    call PAX_FN_03D

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_5")
    ld a, e
    cp $0
    jp z,.target_5

    ; [gb_ir] Call("PAX_FN_initialize")
    call PAX_FN_initialize

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49188)
    ld hl,49188

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(49190)
    ld a, [49190]
    ld l, a
    ld a, [49190+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49192)
    ld a, [49192]
    ld l, a
    ld a, [49192+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49200)
    ld a, [49200]
    ld l, a
    ld a, [49200+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_12B")
    call PAX_FN_12B

    ; [gb_ir] Call("PAX_FN_dup")
    call PAX_FN_dup

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49200)
    ld hl,49200

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLiteral(5)
    ld hl,5

    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_97")
    ld a, e
    cp $0
    jp z,.target_97

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49200)
    ld hl,49200

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(49184)
    ld a, [49184]
    ld l, a
    ld a, [49184+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(37)
    ld hl,37

    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_44")
    ld a, e
    cp $0
    jp z,.target_44

    ; [gb_ir] Call("PAX_FN_clear")
    call PAX_FN_clear

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49190)
    ld a, [49190]
    ld l, a
    ld a, [49190+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_12D")
    call PAX_FN_12D

    ; [gb_ir] Call("PAX_FN_dup")
    call PAX_FN_dup

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49190)
    ld hl,49190

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLiteral(49192)
    ld hl,49192

    ; [gb_ir] Call("PAX_FN_check2Dcollision")
    call PAX_FN_check2Dcollision

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_96")
    ld a, e
    cp $0
    jp z,.target_96

    ; [gb_ir] Label(".target_44")
.target_44:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_61")
    ld a, e
    cp $0
    jp z,.target_61

    ; [gb_ir] Call("PAX_FN_clear")
    call PAX_FN_clear

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(49190)
    ld hl,49190

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49192)
    ld a, [49192]
    ld l, a
    ld a, [49192+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_12D")
    call PAX_FN_12D

    ; [gb_ir] Call("PAX_FN_dup")
    call PAX_FN_dup

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49192)
    ld hl,49192

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

    ; [gb_ir] Call("PAX_FN_check2Dcollision")
    call PAX_FN_check2Dcollision

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_95")
    ld a, e
    cp $0
    jp z,.target_95

    ; [gb_ir] Label(".target_61")
.target_61:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_78")
    ld a, e
    cp $0
    jp z,.target_78

    ; [gb_ir] Call("PAX_FN_clear")
    call PAX_FN_clear

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49190)
    ld a, [49190]
    ld l, a
    ld a, [49190+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_12B")
    call PAX_FN_12B

    ; [gb_ir] Call("PAX_FN_dup")
    call PAX_FN_dup

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49190)
    ld hl,49190

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLiteral(49192)
    ld hl,49192

    ; [gb_ir] Call("PAX_FN_check2Dcollision")
    call PAX_FN_check2Dcollision

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_94")
    ld a, e
    cp $0
    jp z,.target_94

    ; [gb_ir] Label(".target_78")
.target_78:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_93")
    ld a, e
    cp $0
    jp z,.target_93

    ; [gb_ir] Call("PAX_FN_clear")
    call PAX_FN_clear

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(49190)
    ld hl,49190

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49192)
    ld a, [49192]
    ld l, a
    ld a, [49192+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_12B")
    call PAX_FN_12B

    ; [gb_ir] Call("PAX_FN_dup")
    call PAX_FN_dup

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49192)
    ld hl,49192

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

    ; [gb_ir] Call("PAX_FN_check2Dcollision")
    call PAX_FN_check2Dcollision

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Label(".target_93")
.target_93:

    ; [gb_ir] Label(".target_94")
.target_94:

    ; [gb_ir] Label(".target_95")
.target_95:

    ; [gb_ir] Label(".target_96")
.target_96:

    ; [gb_ir] Label(".target_97")
.target_97:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("cells")
    ; [metadata] "cells"
PAX_FN_cells:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("drop")
    ; [metadata] "drop"
PAX_FN_drop:

    ; [gb_ir] Label(".target_1")
.target_1:

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

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("2drop")
    ; [metadata] "2drop"
PAX_FN_2drop:

    ; [gb_ir] Label(".target_1")
.target_1:

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

    ; [gb_ir] Call("PAX_FN_drop")
    call PAX_FN_drop

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("swap")
    ; [metadata] "swap"
PAX_FN_swap:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLiteral(49186)
    ld hl,49186

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

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("over")
    ; [metadata] "over"
PAX_FN_over:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLiteral(49186)
    ld hl,49186

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

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("rot")
    ; [metadata] "rot"
PAX_FN_rot:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("dup")
    ; [metadata] "dup"
PAX_FN_dup:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49186)
    ld hl,49186

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("2dup")
    ; [metadata] "2dup"
PAX_FN_2dup:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("invert")
    ; [metadata] "invert"
PAX_FN_invert:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Invert
    ld a,l
    cpl
    ld l,a
    ld a,h
    cpl
    ld h,a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("negate")
    ; [metadata] "negate"
PAX_FN_negate:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("PAX_FN_invert")
    call PAX_FN_invert

    ; [gb_ir] Inc
    inc hl

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("-")
    ; [metadata] "-"
PAX_FN_2D:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("PAX_FN_negate")
    call PAX_FN_negate

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("1+")
    ; [metadata] "1+"
PAX_FN_12B:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Inc
    inc hl

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("1-")
    ; [metadata] "1-"
PAX_FN_12D:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("0=")
    ; [metadata] "0="
PAX_FN_03D:

    ; [gb_ir] Label(".target_1")
.target_1:

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

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] SetE(0)
    ld e,0

    ; [gb_ir] JumpIfEIs0(".target_8")
    ld a, e
    cp $0
    jp z,.target_8

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("=")
    ; [metadata] "="
PAX_FN_3D:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("PAX_FN_2D")
    call PAX_FN_2D

    ; [gb_ir] Call("PAX_FN_03D")
    call PAX_FN_03D

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("loopimpl")
    ; [metadata] "loopimpl"
PAX_FN_loopimpl:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Call("PAX_FN_12B")
    call PAX_FN_12B

    ; [gb_ir] Call("PAX_FN_2dup")
    call PAX_FN_2dup

    ; [gb_ir] Call("PAX_FN_3D")
    call PAX_FN_3D

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

    ; [gb_ir] Call("PAX_FN_2drop")
    call PAX_FN_2drop

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

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

    ; [gb_ir] Label(".target_13")
.target_13:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Label(".target_17")
.target_17:

    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("i")
    ; [metadata] "i"
PAX_FN_i:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49186)
    ld hl,49186

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("j")
    ; [metadata] "j"
PAX_FN_j:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49186)
    ld hl,49186

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLoadDirect(49186)
    ld a, [49186]
    ld l, a
    ld a, [49186+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("*")
    ; [metadata] "*"
PAX_FN_2A:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Call("PAX_FN_over")
    call PAX_FN_over

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

    ; [gb_ir] Call("PAX_FN_loopimpl")
    call PAX_FN_loopimpl

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

    ; [gb_ir] Call("PAX_FN_swap")
    call PAX_FN_swap

    ; [gb_ir] Call("PAX_FN_drop")
    call PAX_FN_drop

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("convert-x-y")
    ; [metadata] "convert-x-y"
PAX_FN_convert2Dx2Dy:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(32)
    ld hl,32

    ; [gb_ir] Call("PAX_FN_cells")
    call PAX_FN_cells

    ; [gb_ir] Call("PAX_FN_2A")
    call PAX_FN_2A

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("draw")
    ; [metadata] "draw"
PAX_FN_draw:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("PAX_FN_convert2Dx2Dy")
    call PAX_FN_convert2Dx2Dy

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c

    ; [gb_ir] StoreDE8
.wait:
    ld   a,[$0FF41]
    bit  1,a       ; Wait until Mode is 0 or 1
    jr   nz,.wait

    ld a, e
    ld [hl],a

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("draw-white")
    ; [metadata] "draw-white"
PAX_FN_draw2Dwhite:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(6)
    ld hl,6

    ; [gb_ir] Call("PAX_FN_rot")
    call PAX_FN_rot

    ; [gb_ir] Call("PAX_FN_rot")
    call PAX_FN_rot

    ; [gb_ir] Call("PAX_FN_draw")
    call PAX_FN_draw

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("draw-black")
    ; [metadata] "draw-black"
PAX_FN_draw2Dblack:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(23)
    ld hl,23

    ; [gb_ir] Call("PAX_FN_rot")
    call PAX_FN_rot

    ; [gb_ir] Call("PAX_FN_rot")
    call PAX_FN_rot

    ; [gb_ir] Call("PAX_FN_draw")
    call PAX_FN_draw

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("draw-walls")
    ; [metadata] "draw-walls"
PAX_FN_draw2Dwalls:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(20)
    ld hl,20

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Call("PAX_FN_i")
    call PAX_FN_i

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Call("PAX_FN_i")
    call PAX_FN_i

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(18)
    ld hl,18

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [gb_ir] Call("PAX_FN_2D")
    call PAX_FN_2D

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Call("PAX_FN_loopimpl")
    call PAX_FN_loopimpl

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

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(18)
    ld hl,18

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Label(".target_21")
.target_21:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Call("PAX_FN_i")
    call PAX_FN_i

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(20)
    ld hl,20

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [gb_ir] Call("PAX_FN_2D")
    call PAX_FN_2D

    ; [gb_ir] Call("PAX_FN_i")
    call PAX_FN_i

    ; [gb_ir] Call("PAX_FN_draw2Dblack")
    call PAX_FN_draw2Dblack

    ; [gb_ir] Call("PAX_FN_loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_21")
    ld a, e
    cp $0
    jp z,.target_21

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("initialize")
    ; [metadata] "initialize"
PAX_FN_initialize:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("PAX_FN_draw2Dwalls")
    call PAX_FN_draw2Dwalls

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(6)
    ld hl,6

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49190)
    ld hl,49190

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLiteral(8)
    ld hl,8

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49192)
    ld hl,49192

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("check-collision")
    ; [metadata] "check-collision"
PAX_FN_check2Dcollision:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49190)
    ld a, [49190]
    ld l, a
    ld a, [49190+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49192)
    ld a, [49192]
    ld l, a
    ld a, [49192+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_convert2Dx2Dy")
    call PAX_FN_convert2Dx2Dy

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] ReplaceLoad8
.wait:
    ld   a,[$0FF41]
    bit  1,a       ; Wait until Mode is 0 or 1
    jr   nz,.wait

    ld a, [hl]
    ld l, a
    xor a
    ld h, a

    ; [gb_ir] Call("PAX_FN_03D")
    call PAX_FN_03D

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_14")
    ld a, e
    cp $0
    jp z,.target_14

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_18")
    ld a, e
    cp $0
    jp z,.target_18

    ; [gb_ir] Label(".target_14")
.target_14:

    ; [gb_ir] Label(".target_15")
.target_15:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] CopyToE
    ld e,l

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfEIs0(".target_15")
    ld a, e
    cp $0
    jp z,.target_15

    ; [gb_ir] Label(".target_18")
.target_18:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Metadata("clear")
    ; [metadata] "clear"
PAX_FN_clear:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49190)
    ld a, [49190]
    ld l, a
    ld a, [49190+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49192)
    ld a, [49192]
    ld l, a
    ld a, [49192+1]
    ld h, a

    ; [gb_ir] Call("PAX_FN_draw2Dwhite")
    call PAX_FN_draw2Dwhite

    ; [gb_ir] Ret
    ret






; function start

