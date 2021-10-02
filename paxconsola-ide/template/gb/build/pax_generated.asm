    ; [gb_ir] Label("PAX_FN_draw2Dapple")
PAX_FN_draw2Dapple:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51226)
    ld a, [51226]
    ld l, a
    ld a, [51226+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51228)
    ld a, [51228]
    ld l, a
    ld a, [51228+1]
    ld h, a

    ; [gb_ir] Call("draw-apple-tile")
    call PAX_FN_draw2Dapple2Dtile

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_swap")
PAX_FN_swap:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLiteral(49216)
    ld hl,49216

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

    ; [gb_ir] ReplaceLoadDirect(49216)
    ld a, [49216]
    ld l, a
    ld a, [49216+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_over")
PAX_FN_over:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] ReplaceLiteral(49216)
    ld hl,49216

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

    ; [gb_ir] ReplaceLoadDirect(49216)
    ld a, [49216]
    ld l, a
    ld a, [49216+1]
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

    ; [gb_ir] ReplaceLoadDirect(49216)
    ld a, [49216]
    ld l, a
    ld a, [49216+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_rot")
PAX_FN_rot:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] AltDupFromTOS
    push hl

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

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

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_dup")
PAX_FN_dup:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49216)
    ld hl,49216

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(49216)
    ld a, [49216]
    ld l, a
    ld a, [49216+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49216)
    ld a, [49216]
    ld l, a
    ld a, [49216+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_2dup")
PAX_FN_2dup:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_invert")
PAX_FN_invert:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] Label("PAX_FN_negate")
PAX_FN_negate:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("invert")
    call PAX_FN_invert

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Inc
    inc hl

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_2D")
PAX_FN_2D:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("negate")
    call PAX_FN_negate

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_12B")
PAX_FN_12B:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Inc
    inc hl

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_2B21")
PAX_FN_2B21:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("dup")
    call PAX_FN_dup

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

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

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

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_03D")
PAX_FN_03D:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_2")
    ld a,d
    or e
    jp z,.target_2

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] JumpAlways(".target_3")
    jp .target_3

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_3D")
PAX_FN_3D:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("-")
    call PAX_FN_2D

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("0=")
    call PAX_FN_03D

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_or")
PAX_FN_or:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("invert")
    call PAX_FN_invert

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("invert")
    call PAX_FN_invert

    ; [gb_ir] Label(".target_3")
.target_3:

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_and")
PAX_FN_and:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] Call("invert")
    call PAX_FN_invert

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_loopimpl")
PAX_FN_loopimpl:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] Call("1+")
    call PAX_FN_12B

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("2dup")
    call PAX_FN_2dup

    ; [gb_ir] Label(".target_2")
.target_2:

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

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_4")
.target_4:

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

    ; [gb_ir] Label("PAX_FN_2Dloopimpl")
PAX_FN_2Dloopimpl:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

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

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("-")
    call PAX_FN_2D

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("2dup")
    call PAX_FN_2dup

    ; [gb_ir] Label(".target_5")
.target_5:

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

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_7")
.target_7:

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

    ; [gb_ir] Label("PAX_FN_i")
PAX_FN_i:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] ReplaceLiteral(49216)
    ld hl,49216

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(49216)
    ld a, [49216]
    ld l, a
    ld a, [49216+1]
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

    ; [gb_ir] ReplaceLoadDirect(49216)
    ld a, [49216]
    ld l, a
    ld a, [49216+1]
    ld h, a

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_cells")
PAX_FN_cells:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("dup")
    call PAX_FN_dup

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_2A")
PAX_FN_2A:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_2")
.target_2:

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

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_1")
    ld a,d
    or e
    jp z,.target_1

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_5")
.target_5:

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

    ; [gb_ir] Label("PAX_FN_03C")
PAX_FN_03C:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(32768)
    ld hl,32768

    ; [gb_ir] ReplaceNandWithDE
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a

    ; [gb_ir] Call("invert")
    call PAX_FN_invert

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_3")
    ld a,d
    or e
    jp z,.target_3

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] JumpAlways(".target_4")
    jp .target_4

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_25")
PAX_FN_25:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("2dup")
    call PAX_FN_2dup

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("-")
    call PAX_FN_2D

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("dup")
    call PAX_FN_dup

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("0<")
    call PAX_FN_03C

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_7")
    ld a,d
    or e
    jp z,.target_7

    ; [gb_ir] Label(".target_6")
.target_6:

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

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] JumpAlways(".target_10")
    jp .target_10

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] Call("rot")
    call PAX_FN_rot

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Label(".target_10")
.target_10:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_1")
    ld a,d
    or e
    jp z,.target_1

    ; [gb_ir] Label(".target_11")
.target_11:

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_12")
.target_12:

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

    ; [gb_ir] Label("PAX_FN_random")
PAX_FN_random:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(255)
    ld hl,255

    ; [gb_ir] Call("and")
    call PAX_FN_and

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("%")
    call PAX_FN_25

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_snake2Dx")
PAX_FN_snake2Dx:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("cells")
    call PAX_FN_cells

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49222)
    ld hl,49222

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_snake2Dy")
PAX_FN_snake2Dy:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("cells")
    call PAX_FN_cells

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(50224)
    ld hl,50224

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_convert2Dx2Dy")
PAX_FN_convert2Dx2Dy:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(32)
    ld hl,32

    ; [gb_ir] Call("*")
    call PAX_FN_2A

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_draw")
PAX_FN_draw:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("convert-x-y")
    call PAX_FN_convert2Dx2Dy

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("draw-index")
    call PAX_NATIVE_draw2Dindex

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_draw2Dwhite")
PAX_FN_draw2Dwhite:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Call("rot")
    call PAX_FN_rot

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("rot")
    call PAX_FN_rot

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("draw")
    call PAX_FN_draw

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_draw2Dsnake2Dtile")
PAX_FN_draw2Dsnake2Dtile:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(3)
    ld hl,3

    ; [gb_ir] Call("rot")
    call PAX_FN_rot

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("rot")
    call PAX_FN_rot

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("draw")
    call PAX_FN_draw

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_draw2Dapple2Dtile")
PAX_FN_draw2Dapple2Dtile:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(4)
    ld hl,4

    ; [gb_ir] Call("rot")
    call PAX_FN_rot

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("rot")
    call PAX_FN_rot

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("draw")
    call PAX_FN_draw

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_draw2Dbackground")
PAX_FN_draw2Dbackground:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

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

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_4")
.target_4:

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

    ; [gb_ir] Call("draw-index")
    call PAX_NATIVE_draw2Dindex

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_2")
    ld a,d
    or e
    jp z,.target_2

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] ReplaceLiteral(32)
    ld hl,32

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

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_1")
    ld a,d
    or e
    jp z,.target_1

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

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

    ; [gb_ir] Label("PAX_FN_draw2Dwalls")
PAX_FN_draw2Dwalls:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] Call("-")
    call PAX_FN_2D

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

    ; [gb_ir] Call("*")
    call PAX_FN_2A

    ; [gb_ir] Label(".target_2")
.target_2:

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

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_5")
.target_5:

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

    ; [gb_ir] Call("draw-index")
    call PAX_NATIVE_draw2Dindex

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_3")
    ld a,d
    or e
    jp z,.target_3

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

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

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_10")
.target_10:

    ; [gb_ir] Call("draw-index")
    call PAX_NATIVE_draw2Dindex

    ; [gb_ir] Label(".target_11")
.target_11:

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_12")
.target_12:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_9")
    ld a,d
    or e
    jp z,.target_9

    ; [gb_ir] Label(".target_13")
.target_13:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Call("-")
    call PAX_FN_2D

    ; [gb_ir] Label(".target_14")
.target_14:

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

    ; [gb_ir] Label(".target_15")
.target_15:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_16")
.target_16:

    ; [gb_ir] Call("draw-index")
    call PAX_NATIVE_draw2Dindex

    ; [gb_ir] Label(".target_17")
.target_17:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(32)
    ld hl,32

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_18")
.target_18:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_15")
    ld a,d
    or e
    jp z,.target_15

    ; [gb_ir] Label(".target_19")
.target_19:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

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

    ; [gb_ir] Label(".target_20")
.target_20:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_21")
.target_21:

    ; [gb_ir] Call("draw-index")
    call PAX_NATIVE_draw2Dindex

    ; [gb_ir] Label(".target_22")
.target_22:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(32)
    ld hl,32

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_23")
.target_23:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_20")
    ld a,d
    or e
    jp z,.target_20

    ; [gb_ir] Label(".target_24")
.target_24:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

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

    ; [gb_ir] Label("PAX_FN_initialize2Dsnake")
PAX_FN_initialize2Dsnake:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(4)
    ld hl,4

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(51232)
    ld hl,51232

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLoadDirect(51232)
    ld a, [51232]
    ld l, a
    ld a, [51232+1]
    ld h, a

    ; [gb_ir] Inc
    inc hl

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

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(8)
    ld hl,8

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("-")
    call PAX_FN_2D

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("snake-x")
    call PAX_FN_snake2Dx

    ; [gb_ir] Label(".target_5")
.target_5:

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

    ; [gb_ir] ReplaceLiteral(8)
    ld hl,8

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Call("snake-y")
    call PAX_FN_snake2Dy

    ; [gb_ir] Label(".target_7")
.target_7:

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

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_1")
    ld a,d
    or e
    jp z,.target_1

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(51230)
    ld hl,51230

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

    ; [gb_ir] Label("PAX_FN_set2Dapple2Dposition")
PAX_FN_set2Dapple2Dposition:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(51226)
    ld hl,51226

    ; [gb_ir] StoreDE
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a

    ; [gb_ir] ReplaceLiteral(51228)
    ld hl,51228

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

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_initialize2Dapple")
PAX_FN_initialize2Dapple:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(8)
    ld hl,8

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(13)
    ld hl,13

    ; [gb_ir] Call("set-apple-position")
    call PAX_FN_set2Dapple2Dposition

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_draw2Dfull2Dsnake")
PAX_FN_draw2Dfull2Dsnake:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51232)
    ld a, [51232]
    ld l, a
    ld a, [51232+1]
    ld h, a

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

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("snake-x")
    call PAX_FN_snake2Dx

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("snake-y")
    call PAX_FN_snake2Dy

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Call("draw-snake-tile")
    call PAX_FN_draw2Dsnake2Dtile

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Call("loopimpl")
    call PAX_FN_loopimpl

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_1")
    ld a,d
    or e
    jp z,.target_1

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Label("PAX_FN_initialize")
PAX_FN_initialize:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("draw-background")
    call PAX_FN_draw2Dbackground

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("draw-walls")
    call PAX_FN_draw2Dwalls

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("initialize-snake")
    call PAX_FN_initialize2Dsnake

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("initialize-apple")
    call PAX_FN_initialize2Dapple

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("draw-full-snake")
    call PAX_FN_draw2Dfull2Dsnake

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_move2Dup")
PAX_FN_move2Dup:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(50224)
    ld hl,50224

    ; [gb_ir] Call("+!")
    call PAX_FN_2B21

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_move2Dleft")
PAX_FN_move2Dleft:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(49222)
    ld hl,49222

    ; [gb_ir] Call("+!")
    call PAX_FN_2B21

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_move2Ddown")
PAX_FN_move2Ddown:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] ReplaceLiteral(50224)
    ld hl,50224

    ; [gb_ir] Call("+!")
    call PAX_FN_2B21

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_move2Dright")
PAX_FN_move2Dright:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] ReplaceLiteral(49222)
    ld hl,49222

    ; [gb_ir] Call("+!")
    call PAX_FN_2B21

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_move2Dsnake2Dhead")
PAX_FN_move2Dsnake2Dhead:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51230)
    ld a, [51230]
    ld l, a
    ld a, [51230+1]
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

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_5")
    ld a,d
    or e
    jp z,.target_5

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("move-left")
    call PAX_FN_move2Dleft

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] JumpAlways(".target_23")
    jp .target_23

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_10")
    ld a,d
    or e
    jp z,.target_10

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Call("move-up")
    call PAX_FN_move2Dup

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] JumpAlways(".target_22")
    jp .target_22

    ; [gb_ir] Label(".target_10")
.target_10:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_11")
.target_11:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_12")
.target_12:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_15")
    ld a,d
    or e
    jp z,.target_15

    ; [gb_ir] Label(".target_13")
.target_13:

    ; [gb_ir] Call("move-right")
    call PAX_FN_move2Dright

    ; [gb_ir] Label(".target_14")
.target_14:

    ; [gb_ir] JumpAlways(".target_21")
    jp .target_21

    ; [gb_ir] Label(".target_15")
.target_15:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_16")
.target_16:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_17")
.target_17:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_20")
    ld a,d
    or e
    jp z,.target_20

    ; [gb_ir] Label(".target_18")
.target_18:

    ; [gb_ir] Call("move-down")
    call PAX_FN_move2Ddown

    ; [gb_ir] Label(".target_19")
.target_19:

    ; [gb_ir] Label(".target_20")
.target_20:

    ; [gb_ir] Label(".target_21")
.target_21:

    ; [gb_ir] Label(".target_22")
.target_22:

    ; [gb_ir] Label(".target_23")
.target_23:

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

    ; [gb_ir] Label("PAX_FN_move2Dsnake2Dtail")
PAX_FN_move2Dsnake2Dtail:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(65535)
    ld hl,65535

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51232)
    ld a, [51232]
    ld l, a
    ld a, [51232+1]
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

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("snake-x")
    call PAX_FN_snake2Dx

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Inc
    inc hl

    ; [gb_ir] Call("snake-x")
    call PAX_FN_snake2Dx

    ; [gb_ir] Label(".target_6")
.target_6:

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

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] Call("snake-y")
    call PAX_FN_snake2Dy

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Call("i")
    call PAX_FN_i

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] Inc
    inc hl

    ; [gb_ir] Call("snake-y")
    call PAX_FN_snake2Dy

    ; [gb_ir] Label(".target_10")
.target_10:

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

    ; [gb_ir] ReplaceLiteral(1)
    ld hl,1

    ; [gb_ir] Call("-loopimpl")
    call PAX_FN_2Dloopimpl

    ; [gb_ir] Label(".target_11")
.target_11:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_1")
    ld a,d
    or e
    jp z,.target_1

    ; [gb_ir] Label(".target_12")
.target_12:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] AltPop
    pop hl

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

    ; [gb_ir] Label("PAX_FN_is2Dhorizontal")
PAX_FN_is2Dhorizontal:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51230)
    ld a, [51230]
    ld l, a
    ld a, [51230+1]
    ld h, a

    ; [gb_ir] Call("dup")
    call PAX_FN_dup

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(37)
    ld hl,37

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("or")
    call PAX_FN_or

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_is2Dvertical")
PAX_FN_is2Dvertical:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51230)
    ld a, [51230]
    ld l, a
    ld a, [51230+1]
    ld h, a

    ; [gb_ir] Call("dup")
    call PAX_FN_dup

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("swap")
    call PAX_FN_swap

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("or")
    call PAX_FN_or

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_turn2Dup")
PAX_FN_turn2Dup:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("is-horizontal")
    call PAX_FN_is2Dhorizontal

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_3")
    ld a,d
    or e
    jp z,.target_3

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(51230)
    ld hl,51230

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

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_turn2Dleft")
PAX_FN_turn2Dleft:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("is-vertical")
    call PAX_FN_is2Dvertical

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_3")
    ld a,d
    or e
    jp z,.target_3

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(37)
    ld hl,37

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(51230)
    ld hl,51230

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

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_turn2Ddown")
PAX_FN_turn2Ddown:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("is-horizontal")
    call PAX_FN_is2Dhorizontal

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_3")
    ld a,d
    or e
    jp z,.target_3

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(51230)
    ld hl,51230

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

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_turn2Dright")
PAX_FN_turn2Dright:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Call("is-vertical")
    call PAX_FN_is2Dvertical

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_3")
    ld a,d
    or e
    jp z,.target_3

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(51230)
    ld hl,51230

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

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_change2Ddirection")
PAX_FN_change2Ddirection:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(37)
    ld hl,37

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_5")
    ld a,d
    or e
    jp z,.target_5

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("turn-left")
    call PAX_FN_turn2Dleft

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] JumpAlways(".target_23")
    jp .target_23

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(38)
    ld hl,38

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_10")
    ld a,d
    or e
    jp z,.target_10

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Call("turn-up")
    call PAX_FN_turn2Dup

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] JumpAlways(".target_22")
    jp .target_22

    ; [gb_ir] Label(".target_10")
.target_10:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(39)
    ld hl,39

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_11")
.target_11:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_12")
.target_12:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_15")
    ld a,d
    or e
    jp z,.target_15

    ; [gb_ir] Label(".target_13")
.target_13:

    ; [gb_ir] Call("turn-right")
    call PAX_FN_turn2Dright

    ; [gb_ir] Label(".target_14")
.target_14:

    ; [gb_ir] JumpAlways(".target_21")
    jp .target_21

    ; [gb_ir] Label(".target_15")
.target_15:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(40)
    ld hl,40

    ; [gb_ir] Call("over")
    call PAX_FN_over

    ; [gb_ir] Label(".target_16")
.target_16:

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_17")
.target_17:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_20")
    ld a,d
    or e
    jp z,.target_20

    ; [gb_ir] Label(".target_18")
.target_18:

    ; [gb_ir] Call("turn-down")
    call PAX_FN_turn2Ddown

    ; [gb_ir] Label(".target_19")
.target_19:

    ; [gb_ir] Label(".target_20")
.target_20:

    ; [gb_ir] Label(".target_21")
.target_21:

    ; [gb_ir] Label(".target_22")
.target_22:

    ; [gb_ir] Label(".target_23")
.target_23:

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

    ; [gb_ir] Label("PAX_FN_check2Dinput")
PAX_FN_check2Dinput:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49184)
    ld a, [49184]
    ld l, a
    ld a, [49184+1]
    ld h, a

    ; [gb_ir] Call("change-direction")
    call PAX_FN_change2Ddirection

    ; [gb_ir] Label(".target_1")
.target_1:

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

    ; [gb_ir] ReplaceLiteral(49184)
    ld hl,49184

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

    ; [gb_ir] Label("PAX_FN_random2Dx2Dposition")
PAX_FN_random2Dx2Dposition:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] ReplaceLiteral(4)
    ld hl,4

    ; [gb_ir] Call("-")
    call PAX_FN_2D

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("random")
    call PAX_FN_random

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_random2Dy2Dposition")
PAX_FN_random2Dy2Dposition:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] ReplaceLiteral(4)
    ld hl,4

    ; [gb_ir] Call("-")
    call PAX_FN_2D

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("random")
    call PAX_FN_random

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(2)
    ld hl,2

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_move2Dapple")
PAX_FN_move2Dapple:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51226)
    ld a, [51226]
    ld l, a
    ld a, [51226+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51228)
    ld a, [51228]
    ld l, a
    ld a, [51228+1]
    ld h, a

    ; [gb_ir] Call("draw-white")
    call PAX_FN_draw2Dwhite

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("random-x-position")
    call PAX_FN_random2Dx2Dposition

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("random-y-position")
    call PAX_FN_random2Dy2Dposition

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Call("set-apple-position")
    call PAX_FN_set2Dapple2Dposition

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_grow2Dsnake")
PAX_FN_grow2Dsnake:

    ; [gb_ir] Label(".target_0")
.target_0:

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

    ; [gb_ir] ReplaceLiteral(51232)
    ld hl,51232

    ; [gb_ir] Call("+!")
    call PAX_FN_2B21

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_check2Dapple")
PAX_FN_check2Dapple:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49222)
    ld a, [49222]
    ld l, a
    ld a, [49222+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51226)
    ld a, [51226]
    ld l, a
    ld a, [51226+1]
    ld h, a

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(50224)
    ld a, [50224]
    ld l, a
    ld a, [50224+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51228)
    ld a, [51228]
    ld l, a
    ld a, [51228+1]
    ld h, a

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Call("and")
    call PAX_FN_and

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_7")
    ld a,d
    or e
    jp z,.target_7

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("move-apple")
    call PAX_FN_move2Dapple

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Call("grow-snake")
    call PAX_FN_grow2Dsnake

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_check2Dcollision")
PAX_FN_check2Dcollision:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(49222)
    ld a, [49222]
    ld l, a
    ld a, [49222+1]
    ld h, a

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(50224)
    ld a, [50224]
    ld l, a
    ld a, [50224+1]
    ld h, a

    ; [gb_ir] Call("convert-x-y")
    call PAX_FN_convert2Dx2Dy

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] Call("read-index")
    call PAX_NATIVE_read2Dindex

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Call("=")
    call PAX_FN_3D

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_draw2Dsnake2Dhead2Dtail")
PAX_FN_draw2Dsnake2Dhead2Dtail:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Call("snake-x")
    call PAX_FN_snake2Dx

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(0)
    ld hl,0

    ; [gb_ir] Call("snake-y")
    call PAX_FN_snake2Dy

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Call("draw-snake-tile")
    call PAX_FN_draw2Dsnake2Dtile

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51232)
    ld a, [51232]
    ld l, a
    ld a, [51232+1]
    ld h, a

    ; [gb_ir] Call("snake-x")
    call PAX_FN_snake2Dx

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLoadDirect(51232)
    ld a, [51232]
    ld l, a
    ld a, [51232+1]
    ld h, a

    ; [gb_ir] Call("snake-y")
    call PAX_FN_snake2Dy

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] ReplaceLoad
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b

    ; [gb_ir] Call("draw-white")
    call PAX_FN_draw2Dwhite

    ; [gb_ir] Label(".target_6")
.target_6:

    ; [gb_ir] Ret
    ret






; function start

    ; [gb_ir] Label("PAX_FN_main")
PAX_FN_main:

    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] Dup
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a

    ; [gb_ir] ReplaceLiteral(500)
    ld hl,500

    ; [gb_ir] Call("cells")
    call PAX_FN_cells

    ; [gb_ir] Label(".target_1")
.target_1:

    ; [gb_ir] ReplaceLiteral(500)
    ld hl,500

    ; [gb_ir] Call("cells")
    call PAX_FN_cells

    ; [gb_ir] Label(".target_2")
.target_2:

    ; [gb_ir] ReplaceLoadDirect(49218)
    ld a, [49218]
    ld l, a
    ld a, [49218+1]
    ld h, a

    ; [gb_ir] Call("0=")
    call PAX_FN_03D

    ; [gb_ir] Label(".target_3")
.target_3:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_6")
    ld a,d
    or e
    jp z,.target_6

    ; [gb_ir] Label(".target_4")
.target_4:

    ; [gb_ir] Call("initialize")
    call PAX_FN_initialize

    ; [gb_ir] Label(".target_5")
.target_5:

    ; [gb_ir] Label(".target_6")
.target_6:

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

    ; [gb_ir] ReplaceLiteral(49218)
    ld hl,49218

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

    ; [gb_ir] Call("draw-snake-head-tail")
    call PAX_FN_draw2Dsnake2Dhead2Dtail

    ; [gb_ir] Label(".target_7")
.target_7:

    ; [gb_ir] Call("draw-apple")
    call PAX_FN_draw2Dapple

    ; [gb_ir] Label(".target_8")
.target_8:

    ; [gb_ir] Call("check-input")
    call PAX_FN_check2Dinput

    ; [gb_ir] Label(".target_9")
.target_9:

    ; [gb_ir] Call("move-snake-tail")
    call PAX_FN_move2Dsnake2Dtail

    ; [gb_ir] Label(".target_10")
.target_10:

    ; [gb_ir] Call("move-snake-head")
    call PAX_FN_move2Dsnake2Dhead

    ; [gb_ir] Label(".target_11")
.target_11:

    ; [gb_ir] Call("check-apple")
    call PAX_FN_check2Dapple

    ; [gb_ir] Label(".target_12")
.target_12:

    ; [gb_ir] Call("check-collision")
    call PAX_FN_check2Dcollision

    ; [gb_ir] Label(".target_13")
.target_13:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] JumpIfDEIs0(".target_15")
    ld a,d
    or e
    jp z,.target_15

    ; [gb_ir] Label(".target_14")
.target_14:

    ; [gb_ir] JumpAlways(".target_16")
    jp .target_16

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

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(49218)
    ld hl,49218

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

    ; [gb_ir] Label(".target_16")
.target_16:

    ; [gb_ir] Ret
    ret






; function start


