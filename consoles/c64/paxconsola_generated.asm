.proc PAX_FN_check2Dinput
@target_0:

; sword_world.fth:80:5 in `check-input`
@OPCODE_1:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:80:14 in `check-input`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:80:16 in `check-input`
@OPCODE_3:   ; [c64_ir] Call("change-direction")
        jsr PAX_FN_change2Ddirection

@target_1:

; sword_world.fth:81:5 in `check-input`
@OPCODE_5:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:81:7 in `check-input`
@OPCODE_6:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:81:16 in `check-input`
@OPCODE_7:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:82:5 in `check-input`
@OPCODE_8:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_swap
@target_0:

; ../../lib/prelude.fth:3:10 in `swap`
@OPCODE_1:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:3:13 in `swap`
@OPCODE_2:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; ../../lib/prelude.fth:3:19 in `swap`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:3:22 in `swap`
@OPCODE_4:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:3:28 in `swap`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_over
@target_0:

; ../../lib/prelude.fth:4:10 in `over`
@OPCODE_1:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:4:13 in `over`
@OPCODE_2:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; ../../lib/prelude.fth:4:19 in `over`
@OPCODE_3:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:4:25 in `over`
@OPCODE_4:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:4:28 in `over`
@OPCODE_5:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:4:34 in `over`
@OPCODE_6:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_dup
@target_0:

; ../../lib/prelude.fth:6:10 in `dup`
@OPCODE_1:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; ../../lib/prelude.fth:6:16 in `dup`
@OPCODE_2:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:6:22 in `dup`
@OPCODE_3:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:6:28 in `dup`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_2dup
@target_0:

; ../../lib/prelude.fth:8:10 in `2dup`
@OPCODE_1:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_1:

; ../../lib/prelude.fth:8:15 in `2dup`
@OPCODE_3:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_2:

; ../../lib/prelude.fth:8:20 in `2dup`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_invert
@target_0:

; ../../lib/prelude.fth:14:12 in `invert`
@OPCODE_1:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; ../../lib/prelude.fth:14:15 in `invert`
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

; ../../lib/prelude.fth:14:20 in `invert`
@OPCODE_3:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_negate
@target_0:

; ../../lib/prelude.fth:15:12 in `negate`
@OPCODE_1:   ; [c64_ir] Call("invert")
        jsr PAX_FN_invert

@target_1:

; ../../lib/prelude.fth:15:19 in `negate`
@OPCODE_3:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; ../../lib/prelude.fth:15:21 in `negate`
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

; ../../lib/prelude.fth:15:23 in `negate`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_2D
@target_0:

; ../../lib/prelude.fth:16:12 in `-`
@OPCODE_1:   ; [c64_ir] Call("negate")
        jsr PAX_FN_negate

@target_1:

; ../../lib/prelude.fth:16:19 in `-`
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

; ../../lib/prelude.fth:16:21 in `-`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_12B
@target_0:

; ../../lib/prelude.fth:18:8 in `1+`
@OPCODE_1:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; ../../lib/prelude.fth:18:10 in `1+`
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

; ../../lib/prelude.fth:18:12 in `1+`
@OPCODE_3:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_12D
@target_0:

; ../../lib/prelude.fth:19:8 in `1-`
@OPCODE_1:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; ../../lib/prelude.fth:19:11 in `1-`
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

; ../../lib/prelude.fth:19:13 in `1-`
@OPCODE_3:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_03D
@target_0:

; ../../lib/prelude.fth:21:8 in `0=`
@OPCODE_1:   ; [c64_ir] JumpIf0(2)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_2

@target_1:

; ../../lib/prelude.fth:21:11 in `0=`
@OPCODE_3:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; ../../lib/prelude.fth:21:13 in `0=`
@OPCODE_4:   ; [c64_ir] JumpElse(3)
    jmp @target_3

@target_2:

; ../../lib/prelude.fth:21:18 in `0=`
@OPCODE_6:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; ../../lib/prelude.fth:21:21 in `0=`
@OPCODE_7:   ; [c64_ir] JumpTarget(2)

@target_3:

; ../../lib/prelude.fth:21:26 in `0=`
@OPCODE_9:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_3D
@target_0:

; ../../lib/prelude.fth:22:8 in `=`
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

; ../../lib/prelude.fth:22:10 in `=`
@OPCODE_3:   ; [c64_ir] Call("0=")
        jsr PAX_FN_03D

@target_2:

; ../../lib/prelude.fth:22:13 in `=`
@OPCODE_5:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_loopimpl
@target_0:

; ../../lib/prelude.fth:33:12 in `loopimpl`
@OPCODE_1:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:33:15 in `loopimpl`
@OPCODE_2:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:33:18 in `loopimpl`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:33:21 in `loopimpl`
@OPCODE_4:   ; [c64_ir] Call("1+")
        jsr PAX_FN_12B

@target_1:

; ../../lib/prelude.fth:33:24 in `loopimpl`
@OPCODE_6:   ; [c64_ir] Call("2dup")
        jsr PAX_FN_2dup

@target_2:

; ../../lib/prelude.fth:33:29 in `loopimpl`
@OPCODE_8:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:33:32 in `loopimpl`
@OPCODE_9:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:33:35 in `loopimpl`
@OPCODE_10:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_3:

; ../../lib/prelude.fth:33:37 in `loopimpl`
@OPCODE_12:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_4:

; ../../lib/prelude.fth:33:42 in `loopimpl`
@OPCODE_14:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:33:45 in `loopimpl`
@OPCODE_15:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_i
@target_0:

; ../../lib/prelude.fth:38:5 in `i`
@OPCODE_1:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:38:8 in `i`
@OPCODE_2:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:38:11 in `i`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:38:14 in `i`
@OPCODE_4:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; ../../lib/prelude.fth:38:20 in `i`
@OPCODE_5:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:38:26 in `i`
@OPCODE_6:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:38:29 in `i`
@OPCODE_7:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:38:32 in `i`
@OPCODE_8:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:38:35 in `i`
@OPCODE_9:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:38:41 in `i`
@OPCODE_10:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_j
@target_0:

; ../../lib/prelude.fth:39:5 in `j`
@OPCODE_1:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:39:8 in `j`
@OPCODE_2:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:39:11 in `j`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:39:14 in `j`
@OPCODE_4:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:39:17 in `j`
@OPCODE_5:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:39:20 in `j`
@OPCODE_6:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; ../../lib/prelude.fth:39:26 in `j`
@OPCODE_7:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:39:32 in `j`
@OPCODE_8:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:39:35 in `j`
@OPCODE_9:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:39:38 in `j`
@OPCODE_10:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:39:41 in `j`
@OPCODE_11:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:39:44 in `j`
@OPCODE_12:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:39:47 in `j`
@OPCODE_13:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; ../../lib/prelude.fth:39:53 in `j`
@OPCODE_14:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_2A
@target_0:

; ../../lib/prelude.fth:44:5 in `*`
@OPCODE_1:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:44:8 in `*`
@OPCODE_2:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; ../../lib/prelude.fth:44:10 in `*`
@OPCODE_3:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:44:13 in `*`
@OPCODE_4:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; ../../lib/prelude.fth:44:15 in `*`
@OPCODE_5:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:44:15 in `*`
@OPCODE_6:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; ../../lib/prelude.fth:44:15 in `*`
@OPCODE_7:   ; [c64_ir] LoopTarget(0)

@target_1:

; ../../lib/prelude.fth:44:18 in `*`
@OPCODE_9:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_2:

; ../../lib/prelude.fth:44:23 in `*`
@OPCODE_11:   ; [c64_ir] Add
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

; ../../lib/prelude.fth:44:25 in `*`
@OPCODE_12:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_3:

; ../../lib/prelude.fth:44:25 in `*`
@OPCODE_14:   ; [c64_ir] LoopIf0(1)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1

@target_4:

; ../../lib/prelude.fth:44:25 in `*`
@OPCODE_16:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:44:25 in `*`
@OPCODE_17:   ; [c64_ir] Drop
    dex
    dex

; ../../lib/prelude.fth:44:25 in `*`
@OPCODE_18:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; ../../lib/prelude.fth:44:25 in `*`
@OPCODE_19:   ; [c64_ir] Drop
    dex
    dex

; ../../lib/prelude.fth:44:30 in `*`
@OPCODE_20:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_5:

; ../../lib/prelude.fth:44:35 in `*`
@OPCODE_22:   ; [c64_ir] Drop
    dex
    dex

; ../../lib/prelude.fth:44:40 in `*`
@OPCODE_23:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dindex
@target_0:

; ../../lib/prelude-c64.fth:24:5 in `draw-index`
@OPCODE_1:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; ../../lib/prelude-c64.fth:24:14 in `draw-index`
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

; ../../lib/prelude-c64.fth:24:16 in `draw-index`
@OPCODE_3:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; ../../lib/prelude-c64.fth:25:5 in `draw-index`
@OPCODE_4:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2D2x2
@target_0:

; sword_world.fth:6:5 in `draw-2x2`
@OPCODE_1:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:6:22 in `draw-2x2`
@OPCODE_2:   ; [c64_ir] PushLiteral(-16316)
    inx
    inx
    lda #68
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:6:31 in `draw-2x2`
@OPCODE_3:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:6:33 in `draw-2x2`
@OPCODE_4:   ; [c64_ir] Call("*")
        jsr NATIVE_FN_2A

@target_1:

; sword_world.fth:6:35 in `draw-2x2`
@OPCODE_6:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:6:44 in `draw-2x2`
@OPCODE_7:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:6:46 in `draw-2x2`
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

; sword_world.fth:7:5 in `draw-2x2`
@OPCODE_9:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_2:

; sword_world.fth:7:10 in `draw-2x2`
@OPCODE_11:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_3:

; sword_world.fth:7:15 in `draw-2x2`
@OPCODE_13:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_4:

; sword_world.fth:8:5 in `draw-2x2`
@OPCODE_15:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_5:

; sword_world.fth:8:10 in `draw-2x2`
@OPCODE_17:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_6:

; sword_world.fth:8:15 in `draw-2x2`
@OPCODE_19:   ; [c64_ir] Call("1+")
        jsr PAX_FN_12B

@target_7:

; sword_world.fth:8:18 in `draw-2x2`
@OPCODE_21:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_8:

; sword_world.fth:9:5 in `draw-2x2`
@OPCODE_23:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_9:

; sword_world.fth:9:10 in `draw-2x2`
@OPCODE_25:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_10:

; sword_world.fth:9:15 in `draw-2x2`
@OPCODE_27:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:9:32 in `draw-2x2`
@OPCODE_28:   ; [c64_ir] Add
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

; sword_world.fth:9:34 in `draw-2x2`
@OPCODE_29:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_11:

; sword_world.fth:10:5 in `draw-2x2`
@OPCODE_31:   ; [c64_ir] Call("swap")
        jsr PAX_FN_swap

@target_12:

; sword_world.fth:10:10 in `draw-2x2`
@OPCODE_33:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_13:

; sword_world.fth:10:15 in `draw-2x2`
@OPCODE_35:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:10:32 in `draw-2x2`
@OPCODE_36:   ; [c64_ir] Add
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

; sword_world.fth:10:34 in `draw-2x2`
@OPCODE_37:   ; [c64_ir] Call("1+")
        jsr PAX_FN_12B

@target_14:

; sword_world.fth:10:37 in `draw-2x2`
@OPCODE_39:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_15:

; sword_world.fth:11:5 in `draw-2x2`
@OPCODE_41:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:12:5 in `draw-2x2`
@OPCODE_42:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_draw2Dbackground
@target_0:

; sword_world.fth:15:5 in `draw-background`
@OPCODE_1:   ; [c64_ir] PushLiteral(10)
    inx
    inx
    lda #10
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:15:8 in `draw-background`
@OPCODE_2:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:15:10 in `draw-background`
@OPCODE_3:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:15:10 in `draw-background`
@OPCODE_4:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:15:10 in `draw-background`
@OPCODE_5:   ; [c64_ir] LoopTarget(0)

@target_1:

; sword_world.fth:16:9 in `draw-background`
@OPCODE_7:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_2:

; sword_world.fth:16:11 in `draw-background`
@OPCODE_9:   ; [c64_ir] PushLiteral(48)
    inx
    inx
    lda #48
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:16:14 in `draw-background`
@OPCODE_10:   ; [c64_ir] Add
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

; sword_world.fth:16:16 in `draw-background`
@OPCODE_11:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_3:

; sword_world.fth:16:18 in `draw-background`
@OPCODE_13:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:16:20 in `draw-background`
@OPCODE_14:   ; [c64_ir] Add
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

; sword_world.fth:16:22 in `draw-background`
@OPCODE_15:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_4:

; sword_world.fth:17:5 in `draw-background`
@OPCODE_17:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_5:

; sword_world.fth:17:5 in `draw-background`
@OPCODE_19:   ; [c64_ir] LoopIf0(1)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1

@target_6:

; sword_world.fth:17:5 in `draw-background`
@OPCODE_21:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:17:5 in `draw-background`
@OPCODE_22:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:17:5 in `draw-background`
@OPCODE_23:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:17:5 in `draw-background`
@OPCODE_24:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:18:5 in `draw-background`
@OPCODE_25:   ; [c64_ir] PushLiteral(6)
    inx
    inx
    lda #6
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:18:7 in `draw-background`
@OPCODE_26:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:18:9 in `draw-background`
@OPCODE_27:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:18:9 in `draw-background`
@OPCODE_28:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:18:9 in `draw-background`
@OPCODE_29:   ; [c64_ir] LoopTarget(6)

@target_7:

; sword_world.fth:19:9 in `draw-background`
@OPCODE_31:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_8:

; sword_world.fth:19:11 in `draw-background`
@OPCODE_33:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:19:13 in `draw-background`
@OPCODE_34:   ; [c64_ir] Add
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

; sword_world.fth:19:15 in `draw-background`
@OPCODE_35:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_9:

; sword_world.fth:19:17 in `draw-background`
@OPCODE_37:   ; [c64_ir] PushLiteral(12)
    inx
    inx
    lda #12
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:19:20 in `draw-background`
@OPCODE_38:   ; [c64_ir] Add
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

; sword_world.fth:19:22 in `draw-background`
@OPCODE_39:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_10:

; sword_world.fth:20:5 in `draw-background`
@OPCODE_41:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_11:

; sword_world.fth:20:5 in `draw-background`
@OPCODE_43:   ; [c64_ir] LoopIf0(7)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_7

@target_12:

; sword_world.fth:20:5 in `draw-background`
@OPCODE_45:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:20:5 in `draw-background`
@OPCODE_46:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:20:5 in `draw-background`
@OPCODE_47:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:20:5 in `draw-background`
@OPCODE_48:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:22:5 in `draw-background`
@OPCODE_49:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:22:22 in `draw-background`
@OPCODE_50:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:22:24 in `draw-background`
@OPCODE_51:   ; [c64_ir] Call("*")
        jsr NATIVE_FN_2A

@target_13:

; sword_world.fth:23:5 in `draw-background`
@OPCODE_53:   ; [c64_ir] PushLiteral(10)
    inx
    inx
    lda #10
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:23:8 in `draw-background`
@OPCODE_54:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:23:10 in `draw-background`
@OPCODE_55:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:23:10 in `draw-background`
@OPCODE_56:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:23:10 in `draw-background`
@OPCODE_57:   ; [c64_ir] LoopTarget(13)

@target_14:

; sword_world.fth:24:9 in `draw-background`
@OPCODE_59:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_15:

; sword_world.fth:24:11 in `draw-background`
@OPCODE_61:   ; [c64_ir] PushLiteral(48)
    inx
    inx
    lda #48
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:24:14 in `draw-background`
@OPCODE_62:   ; [c64_ir] Add
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

; sword_world.fth:24:16 in `draw-background`
@OPCODE_63:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_16:

; sword_world.fth:24:21 in `draw-background`
@OPCODE_65:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_17:

; sword_world.fth:25:9 in `draw-background`
@OPCODE_67:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:25:26 in `draw-background`
@OPCODE_68:   ; [c64_ir] Add
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

; sword_world.fth:26:5 in `draw-background`
@OPCODE_69:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_18:

; sword_world.fth:26:5 in `draw-background`
@OPCODE_71:   ; [c64_ir] LoopIf0(14)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_14

@target_19:

; sword_world.fth:26:5 in `draw-background`
@OPCODE_73:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:26:5 in `draw-background`
@OPCODE_74:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:26:5 in `draw-background`
@OPCODE_75:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:26:5 in `draw-background`
@OPCODE_76:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:27:5 in `draw-background`
@OPCODE_77:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:28:5 in `draw-background`
@OPCODE_78:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:28:22 in `draw-background`
@OPCODE_79:   ; [c64_ir] PushLiteral(12)
    inx
    inx
    lda #12
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:28:25 in `draw-background`
@OPCODE_80:   ; [c64_ir] Call("*")
        jsr NATIVE_FN_2A

@target_20:

; sword_world.fth:29:5 in `draw-background`
@OPCODE_82:   ; [c64_ir] PushLiteral(6)
    inx
    inx
    lda #6
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:29:7 in `draw-background`
@OPCODE_83:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:29:9 in `draw-background`
@OPCODE_84:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:29:9 in `draw-background`
@OPCODE_85:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:29:9 in `draw-background`
@OPCODE_86:   ; [c64_ir] LoopTarget(20)

@target_21:

; sword_world.fth:30:9 in `draw-background`
@OPCODE_88:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_22:

; sword_world.fth:30:11 in `draw-background`
@OPCODE_90:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:30:13 in `draw-background`
@OPCODE_91:   ; [c64_ir] Add
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

; sword_world.fth:30:15 in `draw-background`
@OPCODE_92:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_23:

; sword_world.fth:30:20 in `draw-background`
@OPCODE_94:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_24:

; sword_world.fth:31:9 in `draw-background`
@OPCODE_96:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:31:26 in `draw-background`
@OPCODE_97:   ; [c64_ir] Add
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

; sword_world.fth:32:5 in `draw-background`
@OPCODE_98:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_25:

; sword_world.fth:32:5 in `draw-background`
@OPCODE_100:   ; [c64_ir] LoopIf0(21)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_21

@target_26:

; sword_world.fth:32:5 in `draw-background`
@OPCODE_102:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:32:5 in `draw-background`
@OPCODE_103:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:32:5 in `draw-background`
@OPCODE_104:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:32:5 in `draw-background`
@OPCODE_105:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:33:5 in `draw-background`
@OPCODE_106:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:35:5 in `draw-background`
@OPCODE_107:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:35:7 in `draw-background`
@OPCODE_108:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:35:24 in `draw-background`
@OPCODE_109:   ; [c64_ir] Add
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

; sword_world.fth:35:26 in `draw-background`
@OPCODE_110:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:35:43 in `draw-background`
@OPCODE_111:   ; [c64_ir] Add
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

; sword_world.fth:36:5 in `draw-background`
@OPCODE_112:   ; [c64_ir] PushLiteral(16)
    inx
    inx
    lda #16
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:36:8 in `draw-background`
@OPCODE_113:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:36:10 in `draw-background`
@OPCODE_114:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:36:10 in `draw-background`
@OPCODE_115:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:36:10 in `draw-background`
@OPCODE_116:   ; [c64_ir] LoopTarget(26)

@target_27:

; sword_world.fth:37:9 in `draw-background`
@OPCODE_118:   ; [c64_ir] PushLiteral(16)
    inx
    inx
    lda #16
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:37:12 in `draw-background`
@OPCODE_119:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:37:14 in `draw-background`
@OPCODE_120:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:37:14 in `draw-background`
@OPCODE_121:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; sword_world.fth:37:14 in `draw-background`
@OPCODE_122:   ; [c64_ir] LoopTarget(27)

@target_28:

; sword_world.fth:38:13 in `draw-background`
@OPCODE_124:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_29:

; sword_world.fth:38:15 in `draw-background`
@OPCODE_126:   ; [c64_ir] Call("j")
        jsr PAX_FN_j

@target_30:

; sword_world.fth:38:17 in `draw-background`
@OPCODE_128:   ; [c64_ir] PushLiteral(16)
    inx
    inx
    lda #16
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:38:20 in `draw-background`
@OPCODE_129:   ; [c64_ir] Call("*")
        jsr NATIVE_FN_2A

@target_31:

; sword_world.fth:38:22 in `draw-background`
@OPCODE_131:   ; [c64_ir] Add
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

; sword_world.fth:39:13 in `draw-background`
@OPCODE_132:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_32:

; sword_world.fth:39:18 in `draw-background`
@OPCODE_134:   ; [c64_ir] Call("i")
        jsr PAX_FN_i

@target_33:

; sword_world.fth:39:20 in `draw-background`
@OPCODE_136:   ; [c64_ir] Add
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

; sword_world.fth:40:13 in `draw-background`
@OPCODE_137:   ; [c64_ir] Call("draw-index")
        jsr PAX_FN_draw2Dindex

@target_34:

; sword_world.fth:41:9 in `draw-background`
@OPCODE_139:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_35:

; sword_world.fth:41:9 in `draw-background`
@OPCODE_141:   ; [c64_ir] LoopIf0(28)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_28

@target_36:

; sword_world.fth:41:9 in `draw-background`
@OPCODE_143:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:41:9 in `draw-background`
@OPCODE_144:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:41:9 in `draw-background`
@OPCODE_145:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:41:9 in `draw-background`
@OPCODE_146:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:42:9 in `draw-background`
@OPCODE_147:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:42:26 in `draw-background`
@OPCODE_148:   ; [c64_ir] Add
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

; sword_world.fth:43:5 in `draw-background`
@OPCODE_149:   ; [c64_ir] Call("loopimpl")
        jsr PAX_FN_loopimpl

@target_37:

; sword_world.fth:43:5 in `draw-background`
@OPCODE_151:   ; [c64_ir] LoopIf0(27)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_27

@target_38:

; sword_world.fth:43:5 in `draw-background`
@OPCODE_153:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:43:5 in `draw-background`
@OPCODE_154:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:43:5 in `draw-background`
@OPCODE_155:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; sword_world.fth:43:5 in `draw-background`
@OPCODE_156:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:44:5 in `draw-background`
@OPCODE_157:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:45:5 in `draw-background`
@OPCODE_158:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_initialize
@target_0:

; sword_world.fth:48:5 in `initialize`
@OPCODE_1:   ; [c64_ir] Call("draw-background")
        jsr PAX_FN_draw2Dbackground

@target_1:

; sword_world.fth:49:5 in `initialize`
@OPCODE_3:   ; [c64_ir] PushLiteral(10)
    inx
    inx
    lda #10
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:49:8 in `initialize`
@OPCODE_4:   ; [c64_ir] PushLiteral(-16316)
    inx
    inx
    lda #68
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:49:17 in `initialize`
@OPCODE_5:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:50:5 in `initialize`
@OPCODE_6:   ; [c64_ir] PushLiteral(30)
    inx
    inx
    lda #30
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:50:8 in `initialize`
@OPCODE_7:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:50:17 in `initialize`
@OPCODE_8:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:55:5 in `initialize`
@OPCODE_9:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_go2Dup
@target_0:

; sword_world.fth:61:16 in `go-up`
@OPCODE_1:   ; [c64_ir] PushLiteral(-16316)
    inx
    inx
    lda #68
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:61:25 in `go-up`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:61:27 in `go-up`
@OPCODE_3:   ; [c64_ir] Call("1-")
        jsr PAX_FN_12D

@target_1:

; sword_world.fth:61:30 in `go-up`
@OPCODE_5:   ; [c64_ir] PushLiteral(-16316)
    inx
    inx
    lda #68
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:61:39 in `go-up`
@OPCODE_6:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:61:41 in `go-up`
@OPCODE_7:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_go2Ddown
@target_0:

; sword_world.fth:62:18 in `go-down`
@OPCODE_1:   ; [c64_ir] PushLiteral(-16316)
    inx
    inx
    lda #68
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:62:27 in `go-down`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:62:29 in `go-down`
@OPCODE_3:   ; [c64_ir] Call("1+")
        jsr PAX_FN_12B

@target_1:

; sword_world.fth:62:32 in `go-down`
@OPCODE_5:   ; [c64_ir] PushLiteral(-16316)
    inx
    inx
    lda #68
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:62:41 in `go-down`
@OPCODE_6:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:62:43 in `go-down`
@OPCODE_7:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_go2Dleft
@target_0:

; sword_world.fth:63:18 in `go-left`
@OPCODE_1:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:63:27 in `go-left`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:63:29 in `go-left`
@OPCODE_3:   ; [c64_ir] Call("1-")
        jsr PAX_FN_12D

@target_1:

; sword_world.fth:63:32 in `go-left`
@OPCODE_5:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:63:41 in `go-left`
@OPCODE_6:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:63:43 in `go-left`
@OPCODE_7:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_go2Dright
@target_0:

; sword_world.fth:64:19 in `go-right`
@OPCODE_1:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:64:28 in `go-right`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:64:30 in `go-right`
@OPCODE_3:   ; [c64_ir] Call("1+")
        jsr PAX_FN_12B

@target_1:

; sword_world.fth:64:33 in `go-right`
@OPCODE_5:   ; [c64_ir] PushLiteral(-16314)
    inx
    inx
    lda #70
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:64:42 in `go-right`
@OPCODE_6:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:64:44 in `go-right`
@OPCODE_7:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_change2Ddirection
@target_0:

; sword_world.fth:67:5 in `change-direction`
@OPCODE_1:   ; [c64_ir] Call("dup")
        jsr PAX_FN_dup

@target_1:

; sword_world.fth:68:5 in `change-direction`
@OPCODE_3:   ; [c64_ir] Call("0=")
        jsr PAX_FN_03D

@target_2:

; sword_world.fth:68:8 in `change-direction`
@OPCODE_5:   ; [c64_ir] JumpIf0(4)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_4

@target_3:

; sword_world.fth:68:11 in `change-direction`
@OPCODE_7:   ; [c64_ir] JumpElse(6)
    jmp @target_6

@target_4:

; sword_world.fth:69:9 in `change-direction`
@OPCODE_9:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:69:13 in `change-direction`
@OPCODE_10:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:69:17 in `change-direction`
@OPCODE_11:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:69:21 in `change-direction`
@OPCODE_12:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:69:25 in `change-direction`
@OPCODE_13:   ; [c64_ir] Call("draw-2x2")
        jsr PAX_FN_draw2D2x2

@target_5:

; sword_world.fth:70:5 in `change-direction`
@OPCODE_15:   ; [c64_ir] JumpTarget(5)

@target_6:

; sword_world.fth:71:5 in `change-direction`
@OPCODE_17:   ; [c64_ir] LoopTarget(6)

@target_7:

; sword_world.fth:72:9 in `change-direction`
@OPCODE_19:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:72:14 in `change-direction`
@OPCODE_20:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_8:

; sword_world.fth:72:14 in `change-direction`
@OPCODE_22:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_9:

; sword_world.fth:72:14 in `change-direction`
@OPCODE_24:   ; [c64_ir] JumpIf0(13)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_13

@target_10:

; sword_world.fth:72:17 in `change-direction`
@OPCODE_26:   ; [c64_ir] Call("go-left")
        jsr PAX_FN_go2Dleft

@target_11:

; sword_world.fth:72:25 in `change-direction`
@OPCODE_28:   ; [c64_ir] LoopLeave(32)
    jmp @target_32

@target_12:

; sword_world.fth:72:25 in `change-direction`
@OPCODE_30:   ; [c64_ir] JumpTarget(12)

@target_13:

; sword_world.fth:73:9 in `change-direction`
@OPCODE_32:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:73:12 in `change-direction`
@OPCODE_33:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_14:

; sword_world.fth:73:12 in `change-direction`
@OPCODE_35:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_15:

; sword_world.fth:73:12 in `change-direction`
@OPCODE_37:   ; [c64_ir] JumpIf0(19)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_19

@target_16:

; sword_world.fth:73:15 in `change-direction`
@OPCODE_39:   ; [c64_ir] Call("go-up")
        jsr PAX_FN_go2Dup

@target_17:

; sword_world.fth:73:21 in `change-direction`
@OPCODE_41:   ; [c64_ir] LoopLeave(32)
    jmp @target_32

@target_18:

; sword_world.fth:73:21 in `change-direction`
@OPCODE_43:   ; [c64_ir] JumpTarget(18)

@target_19:

; sword_world.fth:74:9 in `change-direction`
@OPCODE_45:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:74:15 in `change-direction`
@OPCODE_46:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_20:

; sword_world.fth:74:15 in `change-direction`
@OPCODE_48:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_21:

; sword_world.fth:74:15 in `change-direction`
@OPCODE_50:   ; [c64_ir] JumpIf0(25)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_25

@target_22:

; sword_world.fth:74:18 in `change-direction`
@OPCODE_52:   ; [c64_ir] Call("go-right")
        jsr PAX_FN_go2Dright

@target_23:

; sword_world.fth:74:27 in `change-direction`
@OPCODE_54:   ; [c64_ir] LoopLeave(32)
    jmp @target_32

@target_24:

; sword_world.fth:74:27 in `change-direction`
@OPCODE_56:   ; [c64_ir] JumpTarget(24)

@target_25:

; sword_world.fth:75:9 in `change-direction`
@OPCODE_58:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:75:14 in `change-direction`
@OPCODE_59:   ; [c64_ir] Call("over")
        jsr PAX_FN_over

@target_26:

; sword_world.fth:75:14 in `change-direction`
@OPCODE_61:   ; [c64_ir] Call("=")
        jsr PAX_FN_3D

@target_27:

; sword_world.fth:75:14 in `change-direction`
@OPCODE_63:   ; [c64_ir] JumpIf0(31)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_31

@target_28:

; sword_world.fth:75:17 in `change-direction`
@OPCODE_65:   ; [c64_ir] Call("go-down")
        jsr PAX_FN_go2Ddown

@target_29:

; sword_world.fth:75:25 in `change-direction`
@OPCODE_67:   ; [c64_ir] LoopLeave(32)
    jmp @target_32

@target_30:

; sword_world.fth:75:25 in `change-direction`
@OPCODE_69:   ; [c64_ir] JumpTarget(30)

@target_31:

; sword_world.fth:76:5 in `change-direction`
@OPCODE_71:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:76:5 in `change-direction`
@OPCODE_72:   ; [c64_ir] LoopIf0(7)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_7

@target_32:

; sword_world.fth:76:5 in `change-direction`
@OPCODE_74:   ; [c64_ir] Drop
    dex
    dex

; sword_world.fth:77:5 in `change-direction`
@OPCODE_75:   ; [c64_ir] Exit
    rts
.endproc





; function start

.proc PAX_FN_main
@target_0:

; sword_world.fth:58:1 in `main`
@OPCODE_1:   ; [c64_ir] PushLiteral(-16318)
    inx
    inx
    lda #66
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:58:13 in `main`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:58:15 in `main`
@OPCODE_3:   ; [c64_ir] Call("0=")
        jsr PAX_FN_03D

@target_1:

; sword_world.fth:58:18 in `main`
@OPCODE_5:   ; [c64_ir] JumpIf0(4)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_4

@target_2:

; sword_world.fth:58:21 in `main`
@OPCODE_7:   ; [c64_ir] Call("initialize")
        jsr PAX_FN_initialize

@target_3:

; sword_world.fth:58:32 in `main`
@OPCODE_9:   ; [c64_ir] JumpTarget(3)

@target_4:

; sword_world.fth:59:1 in `main`
@OPCODE_11:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:59:3 in `main`
@OPCODE_12:   ; [c64_ir] PushLiteral(-16318)
    inx
    inx
    lda #66
    sta $00,x
    lda #192
    sta $01,x

; sword_world.fth:59:15 in `main`
@OPCODE_13:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; sword_world.fth:85:1 in `main`
@OPCODE_14:   ; [c64_ir] Call("check-input")
        jsr PAX_FN_check2Dinput

@target_5:

; sword_world.fth:87:1 in `main`
@OPCODE_16:   ; [c64_ir] PushLiteral(5)
    inx
    inx
    lda #5
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:87:5 in `main`
@OPCODE_17:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:87:9 in `main`
@OPCODE_18:   ; [c64_ir] PushLiteral(3)
    inx
    inx
    lda #3
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:87:13 in `main`
@OPCODE_19:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; sword_world.fth:87:17 in `main`
@OPCODE_20:   ; [c64_ir] Call("draw-2x2")
        jsr PAX_FN_draw2D2x2

@target_6:

; :0:0 in ``
@OPCODE_22:   ; [c64_ir] Exit
    rts
.endproc





; function start


