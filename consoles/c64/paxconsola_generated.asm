.proc PAX_FN_draw2Dapple
@target_0:

; snake_world.fth:205:5 in `draw-apple`
@OPCODE_1:   ; [c64_ir] PushLiteral(-14310)
    inx
    inx
    lda #26
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:205:13 in `draw-apple`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:205:15 in `draw-apple`
@OPCODE_3:   ; [c64_ir] PushLiteral(-14308)
    inx
    inx
    lda #28
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:205:23 in `draw-apple`
@OPCODE_4:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:205:25 in `draw-apple`
@OPCODE_5:   ; [c64_ir] Call("draw-apple-tile")
        jsr PAX_FN_draw2Dapple2Dtile

@target_1:

; snake_world.fth:206:5 in `draw-apple`
@OPCODE_7:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_swap
@target_0:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_4:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:3:28 in `swap`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_over
@target_0:

; src/prelude.fth:4:10 in `over`
@OPCODE_1:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_2:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_4:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_5:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:34 in `over`
@OPCODE_6:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_rot
@target_0:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_2:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_1:

; src/prelude.fth:5:18 in `rot`
@OPCODE_4:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_5:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_2:

; src/prelude.fth:5:26 in `rot`
@OPCODE_7:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_dup
@target_0:

; src/prelude.fth:6:10 in `dup`
@OPCODE_1:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_3:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:28 in `dup`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_2dup
@target_0:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_1:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_1:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_3:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_2:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_invert
@target_0:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2:   ; [c64_ir] Nand
    ; 26
    dex
    dex
    lda $00,x
    and $02,x
    eor #$ff
    sta $00,x
    lda $01,x
    and $03,x
    eor #$ff
    sta $01,x

; src/prelude.fth:14:20 in `invert`
@OPCODE_3:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_negate
@target_0:

; src/prelude.fth:15:12 in `negate`
@OPCODE_1:   ; [c64_ir] Call("invert")
        jsr PAX_FN_invert

@target_1:

; src/prelude.fth:15:19 in `negate`
@OPCODE_3:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_4:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; src/prelude.fth:15:23 in `negate`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_2D
@target_0:

; src/prelude.fth:16:12 in `-`
@OPCODE_1:   ; [c64_ir] Call("negate")
        jsr PAX_FN_negate

@target_1:

; src/prelude.fth:16:19 in `-`
@OPCODE_3:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; src/prelude.fth:16:21 in `-`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_12B
@target_0:

; src/prelude.fth:18:8 in `1+`
@OPCODE_1:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_2:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; src/prelude.fth:18:12 in `1+`
@OPCODE_3:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_2B21
@target_0:

; src/prelude.fth:20:8 in `+!`
@OPCODE_1:   ; [c64_ir] Call("dup")
        jsr PAX_FN_dup

@target_1:

; src/prelude.fth:20:12 in `+!`
@OPCODE_3:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:20:15 in `+!`
@OPCODE_4:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_5:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; src/prelude.fth:20:19 in `+!`
@OPCODE_6:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_7:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; src/prelude.fth:20:24 in `+!`
@OPCODE_8:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_03D
@target_0:

; src/prelude.fth:21:8 in `0=`
@OPCODE_1:   ; [c64_ir] JumpIf0(2)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_2

@target_1:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_4:   ; [c64_ir] JumpElse(3)
    jmp @target_3

@target_2:

; src/prelude.fth:21:18 in `0=`
@OPCODE_6:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_7:   ; [c64_ir] JumpTarget(2)

@target_3:

; src/prelude.fth:21:26 in `0=`
@OPCODE_9:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_3D
@target_0:

; src/prelude.fth:22:8 in `=`
@OPCODE_1:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_1:

; src/prelude.fth:22:10 in `=`
@OPCODE_3:   ; [c64_ir] Call("0=")
        jsr PAX_FN_03D

@target_2:

; src/prelude.fth:22:13 in `=`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_or
@target_0:

; src/prelude.fth:26:8 in `or`
@OPCODE_1:   ; [c64_ir] Call("invert")
        jsr PAX_FN_invert

@target_1:

; src/prelude.fth:26:15 in `or`
@OPCODE_3:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_2:

; src/prelude.fth:26:20 in `or`
@OPCODE_5:   ; [c64_ir] Call("invert")
        jsr PAX_FN_invert

@target_3:

; src/prelude.fth:26:27 in `or`
@OPCODE_7:   ; [c64_ir] Nand
    ; 26
    dex
    dex
    lda $00,x
    and $02,x
    eor #$ff
    sta $00,x
    lda $01,x
    and $03,x
    eor #$ff
    sta $01,x

; src/prelude.fth:26:32 in `or`
@OPCODE_8:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_and
@target_0:

; src/prelude.fth:28:9 in `and`
@OPCODE_1:   ; [c64_ir] Nand
    ; 26
    dex
    dex
    lda $00,x
    and $02,x
    eor #$ff
    sta $00,x
    lda $01,x
    and $03,x
    eor #$ff
    sta $01,x

; src/prelude.fth:28:14 in `and`
@OPCODE_2:   ; [c64_ir] Call("invert")
        jsr PAX_FN_invert

@target_1:

; src/prelude.fth:28:21 in `and`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_loopimpl
@target_0:

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_1:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_2:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_4:   ; [c64_ir] Call("1+")
        jsr PAX_FN_12B

@target_1:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_6:   ; [c64_ir] Call("2dup")
        jsr PAX_FN_2dup

@target_2:

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_8:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_9:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_10:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_3:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_12:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_4:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_14:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_15:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_2Dloopimpl
@target_0:

; src/prelude.fth:35:13 in `-loopimpl`
@OPCODE_1:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:35:16 in `-loopimpl`
@OPCODE_2:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_1:

; src/prelude.fth:35:21 in `-loopimpl`
@OPCODE_4:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:35:24 in `-loopimpl`
@OPCODE_5:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_2:

; src/prelude.fth:35:29 in `-loopimpl`
@OPCODE_7:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:35:32 in `-loopimpl`
@OPCODE_8:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_3:

; src/prelude.fth:35:37 in `-loopimpl`
@OPCODE_10:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_4:

; src/prelude.fth:35:39 in `-loopimpl`
@OPCODE_12:   ; [c64_ir] Call("2dup")
        jsr PAX_FN_2dup

@target_5:

; src/prelude.fth:35:44 in `-loopimpl`
@OPCODE_14:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:35:47 in `-loopimpl`
@OPCODE_15:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:35:50 in `-loopimpl`
@OPCODE_16:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_6:

; src/prelude.fth:35:52 in `-loopimpl`
@OPCODE_18:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_7:

; src/prelude.fth:35:57 in `-loopimpl`
@OPCODE_20:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:35:60 in `-loopimpl`
@OPCODE_21:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_i
@target_0:

; src/prelude.fth:38:5 in `i`
@OPCODE_1:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_2:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_4:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_5:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_6:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_7:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_8:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_9:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:41 in `i`
@OPCODE_10:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_cells
@target_0:

; src/prelude.fth:41:9 in `cells`
@OPCODE_1:   ; [c64_ir] Call("dup")
        jsr PAX_FN_dup

@target_1:

; src/prelude.fth:41:13 in `cells`
@OPCODE_3:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; src/prelude.fth:41:15 in `cells`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_03C
@target_0:

; src/prelude.fth:47:8 in `0<`
@OPCODE_1:   ; [c64_ir] PushLiteral(-32768)
    inx
    inx
    lda #0
    sta $00,x
    lda #128
    sta $01,x

; src/prelude.fth:47:14 in `0<`
@OPCODE_2:   ; [c64_ir] Nand
    ; 26
    dex
    dex
    lda $00,x
    and $02,x
    eor #$ff
    sta $00,x
    lda $01,x
    and $03,x
    eor #$ff
    sta $01,x

; src/prelude.fth:47:19 in `0<`
@OPCODE_3:   ; [c64_ir] Call("invert")
        jsr PAX_FN_invert

@target_1:

; src/prelude.fth:47:26 in `0<`
@OPCODE_5:   ; [c64_ir] JumpIf0(3)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_3

@target_2:

; src/prelude.fth:47:29 in `0<`
@OPCODE_7:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:47:32 in `0<`
@OPCODE_8:   ; [c64_ir] JumpElse(4)
    jmp @target_4

@target_3:

; src/prelude.fth:47:37 in `0<`
@OPCODE_10:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:47:39 in `0<`
@OPCODE_11:   ; [c64_ir] JumpTarget(3)

@target_4:

; src/prelude.fth:47:44 in `0<`
@OPCODE_13:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_25
@target_0:

; src/prelude.fth:48:34 in `%`
@OPCODE_1:   ; [c64_ir] LoopTarget(0)

@target_1:

; src/prelude.fth:48:40 in `%`
@OPCODE_3:   ; [c64_ir] Call("2dup")
        jsr PAX_FN_2dup

@target_2:

; src/prelude.fth:48:45 in `%`
@OPCODE_5:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_3:

; src/prelude.fth:48:47 in `%`
@OPCODE_7:   ; [c64_ir] Call("dup")
        jsr PAX_FN_dup

@target_4:

; src/prelude.fth:48:51 in `%`
@OPCODE_9:   ; [c64_ir] Call("0<")
        jsr PAX_FN_03C

@target_5:

; src/prelude.fth:48:54 in `%`
@OPCODE_11:   ; [c64_ir] JumpIf0(7)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_7

@target_6:

; src/prelude.fth:48:57 in `%`
@OPCODE_13:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; src/prelude.fth:48:59 in `%`
@OPCODE_14:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:48:62 in `%`
@OPCODE_15:   ; [c64_ir] JumpElse(10)
    jmp @target_10

@target_7:

; src/prelude.fth:48:67 in `%`
@OPCODE_17:   ; [c64_ir] Call("rot")
        jsr PAX_FN_rot

@target_8:

; src/prelude.fth:48:71 in `%`
@OPCODE_19:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:76 in `%`
@OPCODE_20:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_9:

; src/prelude.fth:48:81 in `%`
@OPCODE_22:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:48:83 in `%`
@OPCODE_23:   ; [c64_ir] JumpTarget(9)

@target_10:

; src/prelude.fth:48:88 in `%`
@OPCODE_25:   ; [c64_ir] LoopIf0(1)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1

@target_11:

; src/prelude.fth:48:94 in `%`
@OPCODE_27:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_12:

; src/prelude.fth:48:99 in `%`
@OPCODE_29:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:104 in `%`
@OPCODE_30:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_random
@target_0:

; snake_world.fth:4:10 in `random`
@OPCODE_1:   ; [c64_ir] PushLiteral(127)
    inx
    inx
    lda #127
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:4:26 in `random`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:4:28 in `random`
@OPCODE_3:   ; [c64_ir] PushLiteral(255)
    inx
    inx
    lda #255
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:4:32 in `random`
@OPCODE_4:   ; [c64_ir] Call("and")
        jsr PAX_FN_and

@target_1:

; snake_world.fth:4:36 in `random`
@OPCODE_6:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_2:

; snake_world.fth:4:41 in `random`
@OPCODE_8:   ; [c64_ir] Call("%")
        jsr PAX_FN_25

@target_3:

; snake_world.fth:4:43 in `random`
@OPCODE_10:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_snake2Dx
@target_0:

; snake_world.fth:28:3 in `snake-x`
@OPCODE_1:   ; [c64_ir] Call("cells")
        jsr PAX_FN_cells

@target_1:

; snake_world.fth:28:9 in `snake-x`
@OPCODE_3:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:28:22 in `snake-x`
@OPCODE_4:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:29:3 in `snake-x`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_snake2Dy
@target_0:

; snake_world.fth:32:3 in `snake-y`
@OPCODE_1:   ; [c64_ir] Call("cells")
        jsr PAX_FN_cells

@target_1:

; snake_world.fth:32:9 in `snake-y`
@OPCODE_3:   ; [c64_ir] PushLiteral(-15312)
    inx
    inx
    lda #48
    sta $00,x
    lda #196
    sta $01,x

; snake_world.fth:32:22 in `snake-y`
@OPCODE_4:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:33:3 in `snake-y`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_convert2Dx2Dy
@target_0:

; snake_world.fth:36:34 in `convert-x-y`
@OPCODE_1:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:36:37 in `convert-x-y`
@OPCODE_2:   ; [c64_ir] Call("*")
        jsr NATIVE_FN_2A

@target_1:

; snake_world.fth:36:39 in `convert-x-y`
@OPCODE_4:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:36:41 in `convert-x-y`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dindex
@target_0:

; snake_world.fth:37:34 in `draw-index`
@OPCODE_1:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake_world.fth:37:43 in `draw-index`
@OPCODE_2:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:37:45 in `draw-index`
@OPCODE_3:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:37:48 in `draw-index`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw
@target_0:

; snake_world.fth:38:26 in `draw`
@OPCODE_1:   ; [c64_ir] Call("convert-x-y")
        jsr PAX_FN_convert2Dx2Dy

@target_1:

; snake_world.fth:38:38 in `draw`
@OPCODE_3:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_2:

; snake_world.fth:38:49 in `draw`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dwhite
@target_0:

; snake_world.fth:39:26 in `draw-white`
@OPCODE_1:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:39:38 in `draw-white`
@OPCODE_2:   ; [c64_ir] Call("rot")
        jsr PAX_FN_rot

@target_1:

; snake_world.fth:39:42 in `draw-white`
@OPCODE_4:   ; [c64_ir] Call("rot")
        jsr PAX_FN_rot

@target_2:

; snake_world.fth:39:46 in `draw-white`
@OPCODE_6:   ; [c64_ir] Call("draw")
        jsr PAX_FN_draw

@target_3:

; snake_world.fth:39:51 in `draw-white`
@OPCODE_8:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dsnake2Dtile
@target_0:

; snake_world.fth:41:31 in `draw-snake-tile`
@OPCODE_1:   ; [c64_ir] PushLiteral(182)
    inx
    inx
    lda #182
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:41:35 in `draw-snake-tile`
@OPCODE_2:   ; [c64_ir] Call("rot")
        jsr PAX_FN_rot

@target_1:

; snake_world.fth:41:39 in `draw-snake-tile`
@OPCODE_4:   ; [c64_ir] Call("rot")
        jsr PAX_FN_rot

@target_2:

; snake_world.fth:41:43 in `draw-snake-tile`
@OPCODE_6:   ; [c64_ir] Call("draw")
        jsr PAX_FN_draw

@target_3:

; snake_world.fth:41:48 in `draw-snake-tile`
@OPCODE_8:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dapple2Dtile
@target_0:

; snake_world.fth:42:31 in `draw-apple-tile`
@OPCODE_1:   ; [c64_ir] PushLiteral(233)
    inx
    inx
    lda #233
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:42:36 in `draw-apple-tile`
@OPCODE_2:   ; [c64_ir] Call("rot")
        jsr PAX_FN_rot

@target_1:

; snake_world.fth:42:40 in `draw-apple-tile`
@OPCODE_4:   ; [c64_ir] Call("rot")
        jsr PAX_FN_rot

@target_2:

; snake_world.fth:42:44 in `draw-apple-tile`
@OPCODE_6:   ; [c64_ir] Call("draw")
        jsr PAX_FN_draw

@target_3:

; snake_world.fth:42:49 in `draw-apple-tile`
@OPCODE_8:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dbackground
@target_0:

; snake_world.fth:45:5 in `draw-background`
@OPCODE_1:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:46:5 in `draw-background`
@OPCODE_2:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:46:19 in `draw-background`
@OPCODE_3:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:46:21 in `draw-background`
@OPCODE_4:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:46:21 in `draw-background`
@OPCODE_5:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:46:21 in `draw-background`
@OPCODE_6:   ; [c64_ir] LoopTarget(0)

@target_1:

; snake_world.fth:47:9 in `draw-background`
@OPCODE_8:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:47:22 in `draw-background`
@OPCODE_9:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:47:24 in `draw-background`
@OPCODE_10:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:47:24 in `draw-background`
@OPCODE_11:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:47:24 in `draw-background`
@OPCODE_12:   ; [c64_ir] LoopTarget(1)

@target_2:

; snake_world.fth:48:13 in `draw-background`
@OPCODE_14:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:48:25 in `draw-background`
@OPCODE_15:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_3:

; snake_world.fth:48:30 in `draw-background`
@OPCODE_17:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_4:

; snake_world.fth:48:32 in `draw-background`
@OPCODE_19:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:48:34 in `draw-background`
@OPCODE_20:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_5:

; snake_world.fth:49:9 in `draw-background`
@OPCODE_22:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_6:

; snake_world.fth:49:9 in `draw-background`
@OPCODE_24:   ; [c64_ir] LoopIf0(2)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_2

@target_7:

; snake_world.fth:49:9 in `draw-background`
@OPCODE_26:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:49:9 in `draw-background`
@OPCODE_27:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:49:9 in `draw-background`
@OPCODE_28:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:49:9 in `draw-background`
@OPCODE_29:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:50:9 in `draw-background`
@OPCODE_30:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:50:26 in `draw-background`
@OPCODE_31:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:51:5 in `draw-background`
@OPCODE_32:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_8:

; snake_world.fth:51:5 in `draw-background`
@OPCODE_34:   ; [c64_ir] LoopIf0(1)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1

@target_9:

; snake_world.fth:51:5 in `draw-background`
@OPCODE_36:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:51:5 in `draw-background`
@OPCODE_37:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:51:5 in `draw-background`
@OPCODE_38:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:51:5 in `draw-background`
@OPCODE_39:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:52:5 in `draw-background`
@OPCODE_40:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:53:5 in `draw-background`
@OPCODE_41:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dwalls
@target_0:

; snake_world.fth:57:5 in `draw-walls`
@OPCODE_1:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:57:19 in `draw-walls`
@OPCODE_2:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:57:21 in `draw-walls`
@OPCODE_3:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_1:

; snake_world.fth:57:23 in `draw-walls`
@OPCODE_5:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:57:40 in `draw-walls`
@OPCODE_6:   ; [c64_ir] Call("*")
        jsr NATIVE_FN_2A

@target_2:

; snake_world.fth:58:5 in `draw-walls`
@OPCODE_8:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:58:18 in `draw-walls`
@OPCODE_9:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:58:20 in `draw-walls`
@OPCODE_10:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:58:20 in `draw-walls`
@OPCODE_11:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:58:20 in `draw-walls`
@OPCODE_12:   ; [c64_ir] LoopTarget(2)

@target_3:

; snake_world.fth:59:9 in `draw-walls`
@OPCODE_14:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:59:19 in `draw-walls`
@OPCODE_15:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_4:

; snake_world.fth:59:24 in `draw-walls`
@OPCODE_17:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_5:

; snake_world.fth:59:26 in `draw-walls`
@OPCODE_19:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:59:28 in `draw-walls`
@OPCODE_20:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_6:

; snake_world.fth:60:5 in `draw-walls`
@OPCODE_22:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_7:

; snake_world.fth:60:5 in `draw-walls`
@OPCODE_24:   ; [c64_ir] LoopIf0(3)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_3

@target_8:

; snake_world.fth:60:5 in `draw-walls`
@OPCODE_26:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:60:5 in `draw-walls`
@OPCODE_27:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:60:5 in `draw-walls`
@OPCODE_28:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:60:5 in `draw-walls`
@OPCODE_29:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:61:5 in `draw-walls`
@OPCODE_30:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:64:5 in `draw-walls`
@OPCODE_31:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:64:18 in `draw-walls`
@OPCODE_32:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:64:20 in `draw-walls`
@OPCODE_33:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:64:20 in `draw-walls`
@OPCODE_34:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:64:20 in `draw-walls`
@OPCODE_35:   ; [c64_ir] LoopTarget(8)

@target_9:

; snake_world.fth:65:9 in `draw-walls`
@OPCODE_37:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:65:19 in `draw-walls`
@OPCODE_38:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_10:

; snake_world.fth:65:21 in `draw-walls`
@OPCODE_40:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_11:

; snake_world.fth:66:5 in `draw-walls`
@OPCODE_42:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_12:

; snake_world.fth:66:5 in `draw-walls`
@OPCODE_44:   ; [c64_ir] LoopIf0(9)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_9

@target_13:

; snake_world.fth:66:5 in `draw-walls`
@OPCODE_46:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:66:5 in `draw-walls`
@OPCODE_47:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:66:5 in `draw-walls`
@OPCODE_48:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:66:5 in `draw-walls`
@OPCODE_49:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:69:5 in `draw-walls`
@OPCODE_50:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:69:18 in `draw-walls`
@OPCODE_51:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:69:20 in `draw-walls`
@OPCODE_52:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_14:

; snake_world.fth:70:5 in `draw-walls`
@OPCODE_54:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:70:19 in `draw-walls`
@OPCODE_55:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:70:21 in `draw-walls`
@OPCODE_56:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:70:21 in `draw-walls`
@OPCODE_57:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:70:21 in `draw-walls`
@OPCODE_58:   ; [c64_ir] LoopTarget(14)

@target_15:

; snake_world.fth:71:9 in `draw-walls`
@OPCODE_60:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:71:19 in `draw-walls`
@OPCODE_61:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_16:

; snake_world.fth:71:24 in `draw-walls`
@OPCODE_63:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_17:

; snake_world.fth:72:9 in `draw-walls`
@OPCODE_65:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:72:26 in `draw-walls`
@OPCODE_66:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:73:5 in `draw-walls`
@OPCODE_67:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_18:

; snake_world.fth:73:5 in `draw-walls`
@OPCODE_69:   ; [c64_ir] LoopIf0(15)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_15

@target_19:

; snake_world.fth:73:5 in `draw-walls`
@OPCODE_71:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:73:5 in `draw-walls`
@OPCODE_72:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:73:5 in `draw-walls`
@OPCODE_73:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:73:5 in `draw-walls`
@OPCODE_74:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:74:5 in `draw-walls`
@OPCODE_75:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:77:5 in `draw-walls`
@OPCODE_76:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:78:5 in `draw-walls`
@OPCODE_77:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:78:19 in `draw-walls`
@OPCODE_78:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:78:21 in `draw-walls`
@OPCODE_79:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:78:21 in `draw-walls`
@OPCODE_80:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:78:21 in `draw-walls`
@OPCODE_81:   ; [c64_ir] LoopTarget(19)

@target_20:

; snake_world.fth:79:9 in `draw-walls`
@OPCODE_83:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:79:19 in `draw-walls`
@OPCODE_84:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_21:

; snake_world.fth:79:24 in `draw-walls`
@OPCODE_86:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_22:

; snake_world.fth:80:9 in `draw-walls`
@OPCODE_88:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:80:26 in `draw-walls`
@OPCODE_89:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:81:5 in `draw-walls`
@OPCODE_90:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_23:

; snake_world.fth:81:5 in `draw-walls`
@OPCODE_92:   ; [c64_ir] LoopIf0(20)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_20

@target_24:

; snake_world.fth:81:5 in `draw-walls`
@OPCODE_94:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:81:5 in `draw-walls`
@OPCODE_95:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:81:5 in `draw-walls`
@OPCODE_96:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:81:5 in `draw-walls`
@OPCODE_97:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:82:5 in `draw-walls`
@OPCODE_98:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:83:5 in `draw-walls`
@OPCODE_99:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_initialize2Dsnake
@target_0:

; snake_world.fth:86:5 in `initialize-snake`
@OPCODE_1:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:86:7 in `initialize-snake`
@OPCODE_2:   ; [c64_ir] PushLiteral(-14304)
    inx
    inx
    lda #32
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:86:14 in `initialize-snake`
@OPCODE_3:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:87:5 in `initialize-snake`
@OPCODE_4:   ; [c64_ir] PushLiteral(-14304)
    inx
    inx
    lda #32
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:87:12 in `initialize-snake`
@OPCODE_5:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:87:14 in `initialize-snake`
@OPCODE_6:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:87:16 in `initialize-snake`
@OPCODE_7:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:87:18 in `initialize-snake`
@OPCODE_8:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:87:20 in `initialize-snake`
@OPCODE_9:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:87:20 in `initialize-snake`
@OPCODE_10:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:87:20 in `initialize-snake`
@OPCODE_11:   ; [c64_ir] LoopTarget(0)

@target_1:

; snake_world.fth:88:9 in `initialize-snake`
@OPCODE_13:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:88:11 in `initialize-snake`
@OPCODE_14:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_2:

; snake_world.fth:88:13 in `initialize-snake`
@OPCODE_16:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_3:

; snake_world.fth:88:15 in `initialize-snake`
@OPCODE_18:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_4:

; snake_world.fth:88:17 in `initialize-snake`
@OPCODE_20:   ; [c64_ir] Call("snake-x")
        jsr PAX_FN_snake2Dx

@target_5:

; snake_world.fth:88:25 in `initialize-snake`
@OPCODE_22:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:89:9 in `initialize-snake`
@OPCODE_23:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:89:11 in `initialize-snake`
@OPCODE_24:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_6:

; snake_world.fth:89:13 in `initialize-snake`
@OPCODE_26:   ; [c64_ir] Call("snake-y")
        jsr PAX_FN_snake2Dy

@target_7:

; snake_world.fth:89:21 in `initialize-snake`
@OPCODE_28:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:90:5 in `initialize-snake`
@OPCODE_29:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_8:

; snake_world.fth:90:5 in `initialize-snake`
@OPCODE_31:   ; [c64_ir] LoopIf0(1)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1

@target_9:

; snake_world.fth:90:5 in `initialize-snake`
@OPCODE_33:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:90:5 in `initialize-snake`
@OPCODE_34:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:90:5 in `initialize-snake`
@OPCODE_35:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:90:5 in `initialize-snake`
@OPCODE_36:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:91:5 in `initialize-snake`
@OPCODE_37:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:91:11 in `initialize-snake`
@OPCODE_38:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:91:21 in `initialize-snake`
@OPCODE_39:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:92:5 in `initialize-snake`
@OPCODE_40:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_set2Dapple2Dposition
@target_0:

; snake_world.fth:94:22 in `set-apple-position`
@OPCODE_1:   ; [c64_ir] PushLiteral(-14310)
    inx
    inx
    lda #26
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:94:30 in `set-apple-position`
@OPCODE_2:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:94:32 in `set-apple-position`
@OPCODE_3:   ; [c64_ir] PushLiteral(-14308)
    inx
    inx
    lda #28
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:94:40 in `set-apple-position`
@OPCODE_4:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:94:42 in `set-apple-position`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_initialize2Dapple
@target_0:

; snake_world.fth:96:21 in `initialize-apple`
@OPCODE_1:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:96:23 in `initialize-apple`
@OPCODE_2:   ; [c64_ir] PushLiteral(13)
    inx
    inx
    lda #13
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:96:26 in `initialize-apple`
@OPCODE_3:   ; [c64_ir] Call("set-apple-position")
        jsr PAX_FN_set2Dapple2Dposition

@target_1:

; snake_world.fth:96:45 in `initialize-apple`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dfull2Dsnake
@target_0:

; snake_world.fth:99:5 in `draw-full-snake`
@OPCODE_1:   ; [c64_ir] PushLiteral(-14304)
    inx
    inx
    lda #32
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:99:12 in `draw-full-snake`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:99:14 in `draw-full-snake`
@OPCODE_3:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:99:16 in `draw-full-snake`
@OPCODE_4:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:99:16 in `draw-full-snake`
@OPCODE_5:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:99:16 in `draw-full-snake`
@OPCODE_6:   ; [c64_ir] LoopTarget(0)

@target_1:

; snake_world.fth:100:9 in `draw-full-snake`
@OPCODE_8:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_2:

; snake_world.fth:100:11 in `draw-full-snake`
@OPCODE_10:   ; [c64_ir] Call("snake-x")
        jsr PAX_FN_snake2Dx

@target_3:

; snake_world.fth:100:19 in `draw-full-snake`
@OPCODE_12:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:100:21 in `draw-full-snake`
@OPCODE_13:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_4:

; snake_world.fth:100:23 in `draw-full-snake`
@OPCODE_15:   ; [c64_ir] Call("snake-y")
        jsr PAX_FN_snake2Dy

@target_5:

; snake_world.fth:100:31 in `draw-full-snake`
@OPCODE_17:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:100:33 in `draw-full-snake`
@OPCODE_18:   ; [c64_ir] Call("draw-snake-tile")
        jsr PAX_FN_draw2Dsnake2Dtile

@target_6:

; snake_world.fth:101:5 in `draw-full-snake`
@OPCODE_20:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_7:

; snake_world.fth:101:5 in `draw-full-snake`
@OPCODE_22:   ; [c64_ir] LoopIf0(1)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1

@target_8:

; snake_world.fth:101:5 in `draw-full-snake`
@OPCODE_24:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:101:5 in `draw-full-snake`
@OPCODE_25:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:101:5 in `draw-full-snake`
@OPCODE_26:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:101:5 in `draw-full-snake`
@OPCODE_27:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:102:5 in `draw-full-snake`
@OPCODE_28:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_initialize
@target_0:

; snake_world.fth:105:5 in `initialize`
@OPCODE_1:   ; [c64_ir] Call("draw-background")
        jsr PAX_FN_draw2Dbackground

@target_1:

; snake_world.fth:106:5 in `initialize`
@OPCODE_3:   ; [c64_ir] Call("draw-walls")
        jsr PAX_FN_draw2Dwalls

@target_2:

; snake_world.fth:107:5 in `initialize`
@OPCODE_5:   ; [c64_ir] Call("initialize-snake")
        jsr PAX_FN_initialize2Dsnake

@target_3:

; snake_world.fth:108:5 in `initialize`
@OPCODE_7:   ; [c64_ir] Call("initialize-apple")
        jsr PAX_FN_initialize2Dapple

@target_4:

; snake_world.fth:109:5 in `initialize`
@OPCODE_9:   ; [c64_ir] Call("draw-full-snake")
        jsr PAX_FN_draw2Dfull2Dsnake

@target_5:

; snake_world.fth:110:5 in `initialize`
@OPCODE_11:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_move2Dup
@target_0:

; snake_world.fth:115:12 in `move-up`
@OPCODE_1:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; snake_world.fth:115:15 in `move-up`
@OPCODE_2:   ; [c64_ir] PushLiteral(-15312)
    inx
    inx
    lda #48
    sta $00,x
    lda #196
    sta $01,x

; snake_world.fth:115:28 in `move-up`
@OPCODE_3:   ; [c64_ir] Call("+!")
        jsr PAX_FN_2B21

@target_1:

; snake_world.fth:115:31 in `move-up`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_move2Dleft
@target_0:

; snake_world.fth:116:14 in `move-left`
@OPCODE_1:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; snake_world.fth:116:17 in `move-left`
@OPCODE_2:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:116:30 in `move-left`
@OPCODE_3:   ; [c64_ir] Call("+!")
        jsr PAX_FN_2B21

@target_1:

; snake_world.fth:116:33 in `move-left`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_move2Ddown
@target_0:

; snake_world.fth:117:14 in `move-down`
@OPCODE_1:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:117:16 in `move-down`
@OPCODE_2:   ; [c64_ir] PushLiteral(-15312)
    inx
    inx
    lda #48
    sta $00,x
    lda #196
    sta $01,x

; snake_world.fth:117:29 in `move-down`
@OPCODE_3:   ; [c64_ir] Call("+!")
        jsr PAX_FN_2B21

@target_1:

; snake_world.fth:117:32 in `move-down`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_move2Dright
@target_0:

; snake_world.fth:118:15 in `move-right`
@OPCODE_1:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:118:17 in `move-right`
@OPCODE_2:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:118:30 in `move-right`
@OPCODE_3:   ; [c64_ir] Call("+!")
        jsr PAX_FN_2B21

@target_1:

; snake_world.fth:118:33 in `move-right`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_move2Dsnake2Dhead
@target_0:

; snake_world.fth:120:20 in `move-snake-head`
@OPCODE_1:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:120:30 in `move-snake-head`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:121:5 in `move-snake-head`
@OPCODE_3:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:121:10 in `move-snake-head`
@OPCODE_4:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_1:

; snake_world.fth:121:16 in `move-snake-head`
@OPCODE_6:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_2:

; snake_world.fth:121:18 in `move-snake-head`
@OPCODE_8:   ; [c64_ir] JumpIf0(5)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_5

@target_3:

; snake_world.fth:121:21 in `move-snake-head`
@OPCODE_10:   ; [c64_ir] Call("move-left")
        jsr PAX_FN_move2Dleft

@target_4:

; snake_world.fth:121:31 in `move-snake-head`
@OPCODE_12:   ; [c64_ir] JumpElse(23)
    jmp @target_23

@target_5:

; snake_world.fth:122:5 in `move-snake-head`
@OPCODE_14:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:122:8 in `move-snake-head`
@OPCODE_15:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_6:

; snake_world.fth:122:16 in `move-snake-head`
@OPCODE_17:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_7:

; snake_world.fth:122:18 in `move-snake-head`
@OPCODE_19:   ; [c64_ir] JumpIf0(10)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_10

@target_8:

; snake_world.fth:122:21 in `move-snake-head`
@OPCODE_21:   ; [c64_ir] Call("move-up")
        jsr PAX_FN_move2Dup

@target_9:

; snake_world.fth:122:29 in `move-snake-head`
@OPCODE_23:   ; [c64_ir] JumpElse(22)
    jmp @target_22

@target_10:

; snake_world.fth:123:5 in `move-snake-head`
@OPCODE_25:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:123:11 in `move-snake-head`
@OPCODE_26:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_11:

; snake_world.fth:123:16 in `move-snake-head`
@OPCODE_28:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_12:

; snake_world.fth:123:18 in `move-snake-head`
@OPCODE_30:   ; [c64_ir] JumpIf0(15)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_15

@target_13:

; snake_world.fth:123:21 in `move-snake-head`
@OPCODE_32:   ; [c64_ir] Call("move-right")
        jsr PAX_FN_move2Dright

@target_14:

; snake_world.fth:123:32 in `move-snake-head`
@OPCODE_34:   ; [c64_ir] JumpElse(21)
    jmp @target_21

@target_15:

; snake_world.fth:124:5 in `move-snake-head`
@OPCODE_36:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:124:10 in `move-snake-head`
@OPCODE_37:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_16:

; snake_world.fth:124:16 in `move-snake-head`
@OPCODE_39:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_17:

; snake_world.fth:124:18 in `move-snake-head`
@OPCODE_41:   ; [c64_ir] JumpIf0(20)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_20

@target_18:

; snake_world.fth:124:21 in `move-snake-head`
@OPCODE_43:   ; [c64_ir] Call("move-down")
        jsr PAX_FN_move2Ddown

@target_19:

; snake_world.fth:125:5 in `move-snake-head`
@OPCODE_45:   ; [c64_ir] JumpTarget(19)

@target_20:

; snake_world.fth:125:10 in `move-snake-head`
@OPCODE_47:   ; [c64_ir] JumpTarget(20)

@target_21:

; snake_world.fth:125:15 in `move-snake-head`
@OPCODE_49:   ; [c64_ir] JumpTarget(21)

@target_22:

; snake_world.fth:125:20 in `move-snake-head`
@OPCODE_51:   ; [c64_ir] JumpTarget(22)

@target_23:

; snake_world.fth:125:25 in `move-snake-head`
@OPCODE_53:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:125:30 in `move-snake-head`
@OPCODE_54:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_move2Dsnake2Dtail
@target_0:

; snake_world.fth:129:5 in `move-snake-tail`
@OPCODE_1:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; snake_world.fth:129:8 in `move-snake-tail`
@OPCODE_2:   ; [c64_ir] PushLiteral(-14304)
    inx
    inx
    lda #32
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:129:15 in `move-snake-tail`
@OPCODE_3:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:129:17 in `move-snake-tail`
@OPCODE_4:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:129:17 in `move-snake-tail`
@OPCODE_5:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake_world.fth:129:17 in `move-snake-tail`
@OPCODE_6:   ; [c64_ir] LoopTarget(0)

@target_1:

; snake_world.fth:130:9 in `move-snake-tail`
@OPCODE_8:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_2:

; snake_world.fth:130:11 in `move-snake-tail`
@OPCODE_10:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:130:16 in `move-snake-tail`
@OPCODE_11:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_3:

; snake_world.fth:130:18 in `move-snake-tail`
@OPCODE_13:   ; [c64_ir] Call("snake-x")
        jsr PAX_FN_snake2Dx

@target_4:

; snake_world.fth:130:26 in `move-snake-tail`
@OPCODE_15:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:130:28 in `move-snake-tail`
@OPCODE_16:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_5:

; snake_world.fth:130:30 in `move-snake-tail`
@OPCODE_18:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:130:32 in `move-snake-tail`
@OPCODE_19:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:130:34 in `move-snake-tail`
@OPCODE_20:   ; [c64_ir] Call("snake-x")
        jsr PAX_FN_snake2Dx

@target_6:

; snake_world.fth:130:42 in `move-snake-tail`
@OPCODE_22:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:131:9 in `move-snake-tail`
@OPCODE_23:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_7:

; snake_world.fth:131:11 in `move-snake-tail`
@OPCODE_25:   ; [c64_ir] Call("snake-y")
        jsr PAX_FN_snake2Dy

@target_8:

; snake_world.fth:131:19 in `move-snake-tail`
@OPCODE_27:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:131:21 in `move-snake-tail`
@OPCODE_28:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_9:

; snake_world.fth:131:23 in `move-snake-tail`
@OPCODE_30:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:131:25 in `move-snake-tail`
@OPCODE_31:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:131:27 in `move-snake-tail`
@OPCODE_32:   ; [c64_ir] Call("snake-y")
        jsr PAX_FN_snake2Dy

@target_10:

; snake_world.fth:131:35 in `move-snake-tail`
@OPCODE_34:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:132:5 in `move-snake-tail`
@OPCODE_35:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:132:7 in `move-snake-tail`
@OPCODE_36:   ; [c64_ir] Call("-loopimpl")
        jsr PAX_FN_2Dloopimpl

@target_11:

; snake_world.fth:132:7 in `move-snake-tail`
@OPCODE_38:   ; [c64_ir] LoopIf0(1)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1

@target_12:

; snake_world.fth:132:7 in `move-snake-tail`
@OPCODE_40:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:132:7 in `move-snake-tail`
@OPCODE_41:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:132:7 in `move-snake-tail`
@OPCODE_42:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake_world.fth:132:7 in `move-snake-tail`
@OPCODE_43:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:133:5 in `move-snake-tail`
@OPCODE_44:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_is2Dhorizontal
@target_0:

; snake_world.fth:135:18 in `is-horizontal`
@OPCODE_1:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:135:28 in `is-horizontal`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:135:30 in `is-horizontal`
@OPCODE_3:   ; [c64_ir] Call("dup")
        jsr PAX_FN_dup

@target_1:

; snake_world.fth:136:5 in `is-horizontal`
@OPCODE_5:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:136:10 in `is-horizontal`
@OPCODE_6:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_2:

; snake_world.fth:136:12 in `is-horizontal`
@OPCODE_8:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_3:

; snake_world.fth:137:5 in `is-horizontal`
@OPCODE_10:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:137:11 in `is-horizontal`
@OPCODE_11:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_4:

; snake_world.fth:137:13 in `is-horizontal`
@OPCODE_13:   ; [c64_ir] Call("or")
        jsr PAX_FN_or

@target_5:

; snake_world.fth:138:5 in `is-horizontal`
@OPCODE_15:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_is2Dvertical
@target_0:

; snake_world.fth:140:16 in `is-vertical`
@OPCODE_1:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:140:26 in `is-vertical`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:140:28 in `is-vertical`
@OPCODE_3:   ; [c64_ir] Call("dup")
        jsr PAX_FN_dup

@target_1:

; snake_world.fth:141:5 in `is-vertical`
@OPCODE_5:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:141:8 in `is-vertical`
@OPCODE_6:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_2:

; snake_world.fth:141:10 in `is-vertical`
@OPCODE_8:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_3:

; snake_world.fth:142:5 in `is-vertical`
@OPCODE_10:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:142:10 in `is-vertical`
@OPCODE_11:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_4:

; snake_world.fth:142:12 in `is-vertical`
@OPCODE_13:   ; [c64_ir] Call("or")
        jsr PAX_FN_or

@target_5:

; snake_world.fth:143:5 in `is-vertical`
@OPCODE_15:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_turn2Dup
@target_0:

; snake_world.fth:145:15 in `turn-up`
@OPCODE_1:   ; [c64_ir] Call("is-horizontal")
        jsr PAX_FN_is2Dhorizontal

@target_1:

; snake_world.fth:145:29 in `turn-up`
@OPCODE_3:   ; [c64_ir] JumpIf0(3)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_3

@target_2:

; snake_world.fth:145:32 in `turn-up`
@OPCODE_5:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:145:35 in `turn-up`
@OPCODE_6:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:145:45 in `turn-up`
@OPCODE_7:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:145:47 in `turn-up`
@OPCODE_8:   ; [c64_ir] JumpTarget(2)

@target_3:

; snake_world.fth:145:52 in `turn-up`
@OPCODE_10:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_turn2Dleft
@target_0:

; snake_world.fth:146:15 in `turn-left`
@OPCODE_1:   ; [c64_ir] Call("is-vertical")
        jsr PAX_FN_is2Dvertical

@target_1:

; snake_world.fth:146:27 in `turn-left`
@OPCODE_3:   ; [c64_ir] JumpIf0(3)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_3

@target_2:

; snake_world.fth:146:30 in `turn-left`
@OPCODE_5:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:146:35 in `turn-left`
@OPCODE_6:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:146:45 in `turn-left`
@OPCODE_7:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:146:47 in `turn-left`
@OPCODE_8:   ; [c64_ir] JumpTarget(2)

@target_3:

; snake_world.fth:146:52 in `turn-left`
@OPCODE_10:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_turn2Ddown
@target_0:

; snake_world.fth:147:15 in `turn-down`
@OPCODE_1:   ; [c64_ir] Call("is-horizontal")
        jsr PAX_FN_is2Dhorizontal

@target_1:

; snake_world.fth:147:29 in `turn-down`
@OPCODE_3:   ; [c64_ir] JumpIf0(3)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_3

@target_2:

; snake_world.fth:147:32 in `turn-down`
@OPCODE_5:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:147:37 in `turn-down`
@OPCODE_6:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:147:47 in `turn-down`
@OPCODE_7:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:147:49 in `turn-down`
@OPCODE_8:   ; [c64_ir] JumpTarget(2)

@target_3:

; snake_world.fth:147:54 in `turn-down`
@OPCODE_10:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_turn2Dright
@target_0:

; snake_world.fth:148:15 in `turn-right`
@OPCODE_1:   ; [c64_ir] Call("is-vertical")
        jsr PAX_FN_is2Dvertical

@target_1:

; snake_world.fth:148:27 in `turn-right`
@OPCODE_3:   ; [c64_ir] JumpIf0(3)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_3

@target_2:

; snake_world.fth:148:30 in `turn-right`
@OPCODE_5:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:148:36 in `turn-right`
@OPCODE_6:   ; [c64_ir] PushLiteral(-14306)
    inx
    inx
    lda #30
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:148:46 in `turn-right`
@OPCODE_7:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:148:48 in `turn-right`
@OPCODE_8:   ; [c64_ir] JumpTarget(2)

@target_3:

; snake_world.fth:148:53 in `turn-right`
@OPCODE_10:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_change2Ddirection
@target_0:

; snake_world.fth:151:5 in `change-direction`
@OPCODE_1:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:151:10 in `change-direction`
@OPCODE_2:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_1:

; snake_world.fth:151:15 in `change-direction`
@OPCODE_4:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_2:

; snake_world.fth:151:17 in `change-direction`
@OPCODE_6:   ; [c64_ir] JumpIf0(5)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_5

@target_3:

; snake_world.fth:151:20 in `change-direction`
@OPCODE_8:   ; [c64_ir] Call("turn-left")
        jsr PAX_FN_turn2Dleft

@target_4:

; snake_world.fth:151:30 in `change-direction`
@OPCODE_10:   ; [c64_ir] JumpElse(23)
    jmp @target_23

@target_5:

; snake_world.fth:152:5 in `change-direction`
@OPCODE_12:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:152:8 in `change-direction`
@OPCODE_13:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_6:

; snake_world.fth:152:13 in `change-direction`
@OPCODE_15:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_7:

; snake_world.fth:152:15 in `change-direction`
@OPCODE_17:   ; [c64_ir] JumpIf0(10)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_10

@target_8:

; snake_world.fth:152:18 in `change-direction`
@OPCODE_19:   ; [c64_ir] Call("turn-up")
        jsr PAX_FN_turn2Dup

@target_9:

; snake_world.fth:152:26 in `change-direction`
@OPCODE_21:   ; [c64_ir] JumpElse(22)
    jmp @target_22

@target_10:

; snake_world.fth:153:5 in `change-direction`
@OPCODE_23:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:153:11 in `change-direction`
@OPCODE_24:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_11:

; snake_world.fth:153:16 in `change-direction`
@OPCODE_26:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_12:

; snake_world.fth:153:18 in `change-direction`
@OPCODE_28:   ; [c64_ir] JumpIf0(15)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_15

@target_13:

; snake_world.fth:153:21 in `change-direction`
@OPCODE_30:   ; [c64_ir] Call("turn-right")
        jsr PAX_FN_turn2Dright

@target_14:

; snake_world.fth:153:32 in `change-direction`
@OPCODE_32:   ; [c64_ir] JumpElse(21)
    jmp @target_21

@target_15:

; snake_world.fth:154:5 in `change-direction`
@OPCODE_34:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:154:10 in `change-direction`
@OPCODE_35:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_16:

; snake_world.fth:154:15 in `change-direction`
@OPCODE_37:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_17:

; snake_world.fth:154:17 in `change-direction`
@OPCODE_39:   ; [c64_ir] JumpIf0(20)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_20

@target_18:

; snake_world.fth:154:20 in `change-direction`
@OPCODE_41:   ; [c64_ir] Call("turn-down")
        jsr PAX_FN_turn2Ddown

@target_19:

; snake_world.fth:155:5 in `change-direction`
@OPCODE_43:   ; [c64_ir] JumpTarget(19)

@target_20:

; snake_world.fth:155:10 in `change-direction`
@OPCODE_45:   ; [c64_ir] JumpTarget(20)

@target_21:

; snake_world.fth:155:15 in `change-direction`
@OPCODE_47:   ; [c64_ir] JumpTarget(21)

@target_22:

; snake_world.fth:155:20 in `change-direction`
@OPCODE_49:   ; [c64_ir] JumpTarget(22)

@target_23:

; snake_world.fth:155:25 in `change-direction`
@OPCODE_51:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:156:5 in `change-direction`
@OPCODE_52:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_check2Dinput
@target_0:

; snake_world.fth:159:5 in `check-input`
@OPCODE_1:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:159:14 in `check-input`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:159:16 in `check-input`
@OPCODE_3:   ; [c64_ir] Call("change-direction")
        jsr PAX_FN_change2Ddirection

@target_1:

; snake_world.fth:160:5 in `check-input`
@OPCODE_5:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:160:7 in `check-input`
@OPCODE_6:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:160:16 in `check-input`
@OPCODE_7:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:161:5 in `check-input`
@OPCODE_8:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_random2Dx2Dposition
@target_0:

; snake_world.fth:166:5 in `random-x-position`
@OPCODE_1:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:166:18 in `random-x-position`
@OPCODE_2:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:166:20 in `random-x-position`
@OPCODE_3:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_1:

; snake_world.fth:166:22 in `random-x-position`
@OPCODE_5:   ; [c64_ir] Call("random")
        jsr PAX_FN_random

@target_2:

; snake_world.fth:166:29 in `random-x-position`
@OPCODE_7:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:166:31 in `random-x-position`
@OPCODE_8:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:166:33 in `random-x-position`
@OPCODE_9:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_random2Dy2Dposition
@target_0:

; snake_world.fth:169:5 in `random-y-position`
@OPCODE_1:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:169:19 in `random-y-position`
@OPCODE_2:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:169:21 in `random-y-position`
@OPCODE_3:   ; [c64_ir] Call("-")
    ; http://www.obelisk.me.uk/6502/algorithms.html
    dex
    dex
    sec
    lda $00,x
    sbc $02,x 
    sta $00,x
    lda $01,x
    sbc $03,x
    sta $01,x

@target_1:

; snake_world.fth:169:23 in `random-y-position`
@OPCODE_5:   ; [c64_ir] Call("random")
        jsr PAX_FN_random

@target_2:

; snake_world.fth:169:30 in `random-y-position`
@OPCODE_7:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:169:32 in `random-y-position`
@OPCODE_8:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:169:34 in `random-y-position`
@OPCODE_9:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_move2Dapple
@target_0:

; snake_world.fth:172:5 in `move-apple`
@OPCODE_1:   ; [c64_ir] PushLiteral(-14310)
    inx
    inx
    lda #26
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:172:13 in `move-apple`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:172:15 in `move-apple`
@OPCODE_3:   ; [c64_ir] PushLiteral(-14308)
    inx
    inx
    lda #28
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:172:23 in `move-apple`
@OPCODE_4:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:172:25 in `move-apple`
@OPCODE_5:   ; [c64_ir] Call("draw-white")
        jsr PAX_FN_draw2Dwhite

@target_1:

; snake_world.fth:173:5 in `move-apple`
@OPCODE_7:   ; [c64_ir] Call("random-x-position")
        jsr PAX_FN_random2Dx2Dposition

@target_2:

; snake_world.fth:173:23 in `move-apple`
@OPCODE_9:   ; [c64_ir] Call("random-y-position")
        jsr PAX_FN_random2Dy2Dposition

@target_3:

; snake_world.fth:174:5 in `move-apple`
@OPCODE_11:   ; [c64_ir] Call("set-apple-position")
        jsr PAX_FN_set2Dapple2Dposition

@target_4:

; snake_world.fth:174:24 in `move-apple`
@OPCODE_13:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_grow2Dsnake
@target_0:

; snake_world.fth:176:15 in `grow-snake`
@OPCODE_1:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:176:17 in `grow-snake`
@OPCODE_2:   ; [c64_ir] PushLiteral(-14304)
    inx
    inx
    lda #32
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:176:24 in `grow-snake`
@OPCODE_3:   ; [c64_ir] Call("+!")
        jsr PAX_FN_2B21

@target_1:

; snake_world.fth:176:27 in `grow-snake`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_check2Dapple
@target_0:

; snake_world.fth:179:5 in `check-apple`
@OPCODE_1:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:179:18 in `check-apple`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:179:20 in `check-apple`
@OPCODE_3:   ; [c64_ir] PushLiteral(-14310)
    inx
    inx
    lda #26
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:179:28 in `check-apple`
@OPCODE_4:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:179:30 in `check-apple`
@OPCODE_5:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_1:

; snake_world.fth:180:5 in `check-apple`
@OPCODE_7:   ; [c64_ir] PushLiteral(-15312)
    inx
    inx
    lda #48
    sta $00,x
    lda #196
    sta $01,x

; snake_world.fth:180:18 in `check-apple`
@OPCODE_8:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:180:20 in `check-apple`
@OPCODE_9:   ; [c64_ir] PushLiteral(-14308)
    inx
    inx
    lda #28
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:180:28 in `check-apple`
@OPCODE_10:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:180:30 in `check-apple`
@OPCODE_11:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_2:

; snake_world.fth:181:5 in `check-apple`
@OPCODE_13:   ; [c64_ir] Call("and")
        jsr PAX_FN_and

@target_3:

; snake_world.fth:181:9 in `check-apple`
@OPCODE_15:   ; [c64_ir] JumpIf0(7)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_7

@target_4:

; snake_world.fth:182:9 in `check-apple`
@OPCODE_17:   ; [c64_ir] Call("move-apple")
        jsr PAX_FN_move2Dapple

@target_5:

; snake_world.fth:183:9 in `check-apple`
@OPCODE_19:   ; [c64_ir] Call("grow-snake")
        jsr PAX_FN_grow2Dsnake

@target_6:

; snake_world.fth:184:5 in `check-apple`
@OPCODE_21:   ; [c64_ir] JumpTarget(6)

@target_7:

; snake_world.fth:184:10 in `check-apple`
@OPCODE_23:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_check2Dcollision
@target_0:

; snake_world.fth:188:5 in `check-collision`
@OPCODE_1:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:188:18 in `check-collision`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:188:20 in `check-collision`
@OPCODE_3:   ; [c64_ir] PushLiteral(-15312)
    inx
    inx
    lda #48
    sta $00,x
    lda #196
    sta $01,x

; snake_world.fth:188:33 in `check-collision`
@OPCODE_4:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:191:5 in `check-collision`
@OPCODE_5:   ; [c64_ir] Call("convert-x-y")
        jsr PAX_FN_convert2Dx2Dy

@target_1:

; snake_world.fth:191:17 in `check-collision`
@OPCODE_7:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake_world.fth:191:26 in `check-collision`
@OPCODE_8:   ; [c64_ir] Add
    ; 21
    dex
    dex
    clc
    lda $00,x
    adc $02,x 
    sta $00,x
    lda $01,x
    adc $03,x
    sta $01,x

; snake_world.fth:191:28 in `check-collision`
@OPCODE_9:   ; [c64_ir] Load8
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:194:5 in `check-collision`
@OPCODE_10:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:194:17 in `check-collision`
@OPCODE_11:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_2:

; snake_world.fth:195:5 in `check-collision`
@OPCODE_13:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dsnake2Dhead2Dtail
@target_0:

; snake_world.fth:198:5 in `draw-snake-head-tail`
@OPCODE_1:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:198:7 in `draw-snake-head-tail`
@OPCODE_2:   ; [c64_ir] Call("snake-x")
        jsr PAX_FN_snake2Dx

@target_1:

; snake_world.fth:198:15 in `draw-snake-head-tail`
@OPCODE_4:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:198:17 in `draw-snake-head-tail`
@OPCODE_5:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:198:19 in `draw-snake-head-tail`
@OPCODE_6:   ; [c64_ir] Call("snake-y")
        jsr PAX_FN_snake2Dy

@target_2:

; snake_world.fth:198:27 in `draw-snake-head-tail`
@OPCODE_8:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:198:29 in `draw-snake-head-tail`
@OPCODE_9:   ; [c64_ir] Call("draw-snake-tile")
        jsr PAX_FN_draw2Dsnake2Dtile

@target_3:

; snake_world.fth:199:5 in `draw-snake-head-tail`
@OPCODE_11:   ; [c64_ir] PushLiteral(-14304)
    inx
    inx
    lda #32
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:199:12 in `draw-snake-head-tail`
@OPCODE_12:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:199:14 in `draw-snake-head-tail`
@OPCODE_13:   ; [c64_ir] Call("snake-x")
        jsr PAX_FN_snake2Dx

@target_4:

; snake_world.fth:199:22 in `draw-snake-head-tail`
@OPCODE_15:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:200:5 in `draw-snake-head-tail`
@OPCODE_16:   ; [c64_ir] PushLiteral(-14304)
    inx
    inx
    lda #32
    sta $00,x
    lda #200
    sta $01,x

; snake_world.fth:200:12 in `draw-snake-head-tail`
@OPCODE_17:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:200:14 in `draw-snake-head-tail`
@OPCODE_18:   ; [c64_ir] Call("snake-y")
        jsr PAX_FN_snake2Dy

@target_5:

; snake_world.fth:200:22 in `draw-snake-head-tail`
@OPCODE_20:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:201:5 in `draw-snake-head-tail`
@OPCODE_21:   ; [c64_ir] Call("draw-white")
        jsr PAX_FN_draw2Dwhite

@target_6:

; snake_world.fth:202:5 in `draw-snake-head-tail`
@OPCODE_23:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_main
@target_0:

; snake_world.fth:16:1 in `main`
@OPCODE_1:   ; [c64_ir] PushLiteral(500)
    inx
    inx
    lda #244
    sta $00,x
    lda #1
    sta $01,x

; snake_world.fth:16:5 in `main`
@OPCODE_2:   ; [c64_ir] Call("cells")
        jsr PAX_FN_cells

@target_1:

; snake_world.fth:16:11 in `main`
@OPCODE_4:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:19:1 in `main`
@OPCODE_5:   ; [c64_ir] PushLiteral(500)
    inx
    inx
    lda #244
    sta $00,x
    lda #1
    sta $01,x

; snake_world.fth:19:5 in `main`
@OPCODE_6:   ; [c64_ir] Call("cells")
        jsr PAX_FN_cells

@target_2:

; snake_world.fth:19:11 in `main`
@OPCODE_8:   ; [c64_ir] Drop
    dex
    dex

; snake_world.fth:210:1 in `main`
@OPCODE_9:   ; [c64_ir] PushLiteral(-16318)
    inx
    inx
    lda #66
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:210:13 in `main`
@OPCODE_10:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:210:15 in `main`
@OPCODE_11:   ; [c64_ir] Call("0=")
        jsr PAX_FN_03D

@target_3:

; snake_world.fth:210:18 in `main`
@OPCODE_13:   ; [c64_ir] JumpIf0(6)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_6

@target_4:

; snake_world.fth:210:21 in `main`
@OPCODE_15:   ; [c64_ir] Call("initialize")
        jsr PAX_FN_initialize

@target_5:

; snake_world.fth:210:32 in `main`
@OPCODE_17:   ; [c64_ir] JumpTarget(5)

@target_6:

; snake_world.fth:211:1 in `main`
@OPCODE_19:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:211:3 in `main`
@OPCODE_20:   ; [c64_ir] PushLiteral(-16318)
    inx
    inx
    lda #66
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:211:15 in `main`
@OPCODE_21:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:214:1 in `main`
@OPCODE_22:   ; [c64_ir] Call("draw-snake-head-tail")
        jsr PAX_FN_draw2Dsnake2Dhead2Dtail

@target_7:

; snake_world.fth:215:1 in `main`
@OPCODE_24:   ; [c64_ir] Call("draw-apple")
        jsr PAX_FN_draw2Dapple

@target_8:

; snake_world.fth:216:1 in `main`
@OPCODE_26:   ; [c64_ir] Call("check-input")
        jsr PAX_FN_check2Dinput

@target_9:

; snake_world.fth:217:1 in `main`
@OPCODE_28:   ; [c64_ir] Call("move-snake-tail")
        jsr PAX_FN_move2Dsnake2Dtail

@target_10:

; snake_world.fth:218:1 in `main`
@OPCODE_30:   ; [c64_ir] Call("move-snake-head")
        jsr PAX_FN_move2Dsnake2Dhead

@target_11:

; snake_world.fth:219:1 in `main`
@OPCODE_32:   ; [c64_ir] Call("check-apple")
        jsr PAX_FN_check2Dapple

@target_12:

; snake_world.fth:221:1 in `main`
@OPCODE_34:   ; [c64_ir] Call("check-collision")
        jsr PAX_FN_check2Dcollision

@target_13:

; snake_world.fth:222:1 in `main`
@OPCODE_36:   ; [c64_ir] JumpIf0(15)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_15

@target_14:

; snake_world.fth:222:4 in `main`
@OPCODE_38:   ; [c64_ir] JumpElse(16)
    jmp @target_16

@target_15:

; snake_world.fth:222:9 in `main`
@OPCODE_40:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake_world.fth:222:11 in `main`
@OPCODE_41:   ; [c64_ir] PushLiteral(-16318)
    inx
    inx
    lda #66
    sta $00,x
    lda #192
    sta $01,x

; snake_world.fth:222:23 in `main`
@OPCODE_42:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake_world.fth:222:25 in `main`
@OPCODE_43:   ; [c64_ir] JumpTarget(15)

@target_16:

; :0:0 in ``
@OPCODE_45:   ; [c64_ir] Exit
    rts
.endproc





; function start


