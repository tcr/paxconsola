    ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

    ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

    ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #1
    sta (TEMP),y
    pla
    tay
    pla

    ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

    ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

    ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

    ; [c64_ir] Add
    clc
    sta TEMP
    sty TEMP2
    pla
    sta TEMP3
    pla
    adc TEMP
    sta TEMP
    lda TEMP2
    adc TEMP3
    tay
    lda TEMP

    ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #1
    sta (TEMP),y
    pla
    tay
    pla

    ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

    ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

    ; [c64_ir] Add
    clc
    sta TEMP
    sty TEMP2
    pla
    sta TEMP3
    pla
    adc TEMP
    sta TEMP
    lda TEMP2
    adc TEMP3
    tay
    lda TEMP

    ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #1
    sta (TEMP),y
    pla
    tay
    pla

    ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] Drop
    pla
    tay
    pla

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] Drop
    pla
    tay
    pla

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("drop")
    ; [metadata] "drop"
PAX_FN_drop:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] Drop
    pla
    tay
    pla

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("2drop")
    ; [metadata] "2drop"
PAX_FN_2drop:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] Add
    clc
    sta TEMP
    sty TEMP2
    pla
    sta TEMP3
    pla
    adc TEMP
    sta TEMP
    lda TEMP2
    adc TEMP3
    tay
    lda TEMP

    ; [c64_ir] Call("drop")
    jsr PAX_FN_drop

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("swap")
    ; [metadata] "swap"
PAX_FN_swap:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] LoadTemp
    lda TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("over")
    ; [metadata] "over"
PAX_FN_over:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] LoadTemp
    lda TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] LoadTemp
    lda TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("rot")
    ; [metadata] "rot"
PAX_FN_rot:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] Call("swap")
    jsr PAX_FN_swap

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] Call("swap")
    jsr PAX_FN_swap

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("dup")
    ; [metadata] "dup"
PAX_FN_dup:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] LoadTemp
    lda TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] LoadTemp
    lda TEMP_PAX1
    ldy TEMP_PAX2

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("2dup")
    ; [metadata] "2dup"
PAX_FN_2dup:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] Call("over")
    jsr PAX_FN_over

    ; [c64_ir] Call("over")
    jsr PAX_FN_over

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("invert")
    ; [metadata] "invert"
PAX_FN_invert:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

    ; [c64_ir] Nand
    clc
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor $ff
    tya
    pla
    adc TEMP2
    eor $ff

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("negate")
    ; [metadata] "negate"
PAX_FN_negate:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] Call("invert")
    jsr PAX_FN_invert

    ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

    ; [c64_ir] Add
    clc
    sta TEMP
    sty TEMP2
    pla
    sta TEMP3
    pla
    adc TEMP
    sta TEMP
    lda TEMP2
    adc TEMP3
    tay
    lda TEMP

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("-")
    ; [metadata] "-"
PAX_FN_2D:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] Call("negate")
    jsr PAX_FN_negate

    ; [c64_ir] Add
    clc
    sta TEMP
    sty TEMP2
    pla
    sta TEMP3
    pla
    adc TEMP
    sta TEMP
    lda TEMP2
    adc TEMP3
    tay
    lda TEMP

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("1+")
    ; [metadata] "1+"
PAX_FN_12B:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

    ; [c64_ir] Add
    clc
    sta TEMP
    sty TEMP2
    pla
    sta TEMP3
    pla
    adc TEMP
    sta TEMP
    lda TEMP2
    adc TEMP3
    tay
    lda TEMP

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("0=")
    ; [metadata] "0="
PAX_FN_03D:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] JumpIf0(3)
    sta TEMP
    tya
    ora TEMP
    sta TEMP
    pla
    tay
    pla
    cmp TEMP
    bne *+5
    jmp @target_3

    ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

    ; [c64_ir] JumpAlways(4)
    jmp @target_4

    ; [c64_ir] BranchTarget(3)
@target_3:

    ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

    ; [c64_ir] BranchTarget(4)
@target_4:

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("=")
    ; [metadata] "="
PAX_FN_3D:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] Call("-")
    jsr PAX_FN_2D

    ; [c64_ir] Call("0=")
    jsr PAX_FN_03D

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("loopimpl")
    ; [metadata] "loopimpl"
PAX_FN_loopimpl:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] AltPop
    pha
    tay
    pha ; bump down TOS
    dex
    lda $0100,x
    tay
    dex
    lda $0100,x

    ; [c64_ir] Call("1+")
    jsr PAX_FN_12B

    ; [c64_ir] Call("2dup")
    jsr PAX_FN_2dup

    ; [c64_ir] Call("=")
    jsr PAX_FN_3D

    ; [c64_ir] JumpIf0(7)
    sta TEMP
    tya
    ora TEMP
    sta TEMP
    pla
    tay
    pla
    cmp TEMP
    bne *+5
    jmp @target_7

    ; [c64_ir] Call("2drop")
    jsr PAX_FN_2drop

    ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

    ; [c64_ir] JumpAlways(8)
    jmp @target_8

    ; [c64_ir] BranchTarget(7)
@target_7:

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

    ; [c64_ir] BranchTarget(8)
@target_8:

    ; [c64_ir] Call("swap")
    jsr PAX_FN_swap

    ; [c64_ir] AltPush
    sta $0100,x
    tya
    inx
    sta $0100,x
    inx
    pla
    tay
    pla

    ; [c64_ir] Exit
    rts






; function start

    ; [c64_ir] Metadata("0<")
    ; [metadata] "0<"
PAX_FN_03C:

    ; [c64_ir] BranchTarget(0)
@target_0:

    ; [c64_ir] PushLiteral(32768)
    pha
    tya
    pha
    ldy #128
    lda #0

    ; [c64_ir] Nand
    clc
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor $ff
    tya
    pla
    adc TEMP2
    eor $ff

    ; [c64_ir] Call("invert")
    jsr PAX_FN_invert

    ; [c64_ir] JumpIf0(4)
    sta TEMP
    tya
    ora TEMP
    sta TEMP
    pla
    tay
    pla
    cmp TEMP
    bne *+5
    jmp @target_4

    ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

    ; [c64_ir] JumpAlways(5)
    jmp @target_5

    ; [c64_ir] BranchTarget(4)
@target_4:

    ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

    ; [c64_ir] BranchTarget(5)
@target_5:

    ; [c64_ir] Exit
    rts






; function start


