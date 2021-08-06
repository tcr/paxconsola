@target_0:

; snake.pax:199:1 in `main`
@OPCODE_1:   ; [c64_ir] PushLiteral(-28672)
    pha
    tya
    pha
    ldy #144
    lda #0

; snake.pax:199:13 in `main`
@OPCODE_2:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:21:8 in `0=`
@OPCODE_3:   ; [c64_ir] JumpIf0(2)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_2

    lda TEMP2

@target_1:

; src/prelude.fth:21:11 in `0=`
@OPCODE_5:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_6:   ; [c64_ir] JumpElse(3)
    jmp @target_3

@target_2:

; src/prelude.fth:21:18 in `0=`
@OPCODE_8:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_9:   ; [c64_ir] JumpTarget(2)

@target_3:

; snake.pax:199:18 in `main`
@OPCODE_11:   ; [c64_ir] JumpIf0(45)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_45

    lda TEMP2

@target_4:

; <inline>:0:0 in `main`
@OPCODE_13:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_14:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_15:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_16:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:57:5 in `draw-background`
@OPCODE_17:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:58:5 in `draw-background`
@OPCODE_18:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

; snake.pax:58:12 in `draw-background`
@OPCODE_19:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:58:14 in `draw-background`
@OPCODE_20:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:58:14 in `draw-background`
@OPCODE_21:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:58:14 in `draw-background`
@OPCODE_22:   ; [c64_ir] LoopTarget(4)

@target_5:

; snake.pax:59:9 in `draw-background`
@OPCODE_24:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:59:15 in `draw-background`
@OPCODE_25:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:59:17 in `draw-background`
@OPCODE_26:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:59:17 in `draw-background`
@OPCODE_27:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:59:17 in `draw-background`
@OPCODE_28:   ; [c64_ir] LoopTarget(5)

@target_6:

; src/prelude.fth:4:13 in `over`
@OPCODE_30:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_31:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_32:   ; [c64_ir] PushLiteral(32)
    pha
    tya
    pha
    ldy #0
    lda #32

; src/prelude.fth:4:28 in `over`
@OPCODE_33:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:8 in `i`
@OPCODE_34:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_35:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_36:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_37:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_38:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_39:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_40:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:60:32 in `draw-background`
@OPCODE_41:   ; [c64_ir] Add
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

; snake.pax:49:34 in `draw-index`
@OPCODE_42:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_43:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_44:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_45:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_46:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_47:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_48:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_49:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_50:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_51:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_52:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_53:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_54:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_55:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_56:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_57:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_58:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_59:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_60:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_61:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_62:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_63:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_64:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_65:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_66:   ; [c64_ir] JumpIf0(8)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_8

    lda TEMP2

@target_7:

; src/prelude.fth:21:11 in `0=`
@OPCODE_68:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_69:   ; [c64_ir] JumpElse(9)
    jmp @target_9

@target_8:

; src/prelude.fth:21:18 in `0=`
@OPCODE_71:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_72:   ; [c64_ir] JumpTarget(8)

@target_9:

; src/prelude.fth:3:10 in `swap`
@OPCODE_74:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_75:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:61:9 in `draw-background`
@OPCODE_76:   ; [c64_ir] LoopIf0(6)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_6

    lda TEMP2

@target_10:

; snake.pax:61:9 in `draw-background`
@OPCODE_78:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:61:9 in `draw-background`
@OPCODE_79:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:61:9 in `draw-background`
@OPCODE_80:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:61:9 in `draw-background`
@OPCODE_81:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:62:9 in `draw-background`
@OPCODE_82:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:62:15 in `draw-background`
@OPCODE_83:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_84:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_85:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_86:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_87:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_88:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_89:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_90:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_91:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_92:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_93:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_94:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_95:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_96:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_97:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_98:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_99:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_100:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_101:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_102:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_103:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_104:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_105:   ; [c64_ir] JumpIf0(12)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_12

    lda TEMP2

@target_11:

; src/prelude.fth:21:11 in `0=`
@OPCODE_107:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_108:   ; [c64_ir] JumpElse(13)
    jmp @target_13

@target_12:

; src/prelude.fth:21:18 in `0=`
@OPCODE_110:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_111:   ; [c64_ir] JumpTarget(12)

@target_13:

; src/prelude.fth:3:10 in `swap`
@OPCODE_113:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_114:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:63:4 in `draw-background`
@OPCODE_115:   ; [c64_ir] LoopIf0(5)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_5

    lda TEMP2

@target_14:

; snake.pax:63:4 in `draw-background`
@OPCODE_117:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:63:4 in `draw-background`
@OPCODE_118:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:63:4 in `draw-background`
@OPCODE_119:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:63:4 in `draw-background`
@OPCODE_120:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:64:4 in `draw-background`
@OPCODE_121:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_122:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_123:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_124:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_125:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:69:5 in `draw-walls`
@OPCODE_126:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:69:11 in `draw-walls`
@OPCODE_127:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

; snake.pax:69:18 in `draw-walls`
@OPCODE_128:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:14:12 in `invert`
@OPCODE_129:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_130:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_131:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_132:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_133:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_134:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_135:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:5 in `*`
@OPCODE_136:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:8 in `*`
@OPCODE_137:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:10 in `*`
@OPCODE_138:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:13 in `*`
@OPCODE_139:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:15 in `*`
@OPCODE_140:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_141:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_142:   ; [c64_ir] LoopTarget(14)

@target_15:

; src/prelude.fth:4:10 in `over`
@OPCODE_144:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_145:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_146:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_147:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_148:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:44:23 in `*`
@OPCODE_149:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_150:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_151:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_152:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_153:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_154:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_155:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_156:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_157:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_158:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_159:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_160:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_161:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_162:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_163:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_164:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_165:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_166:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_167:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_168:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_169:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_170:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_171:   ; [c64_ir] JumpIf0(17)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_17

    lda TEMP2

@target_16:

; src/prelude.fth:21:11 in `0=`
@OPCODE_173:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_174:   ; [c64_ir] JumpElse(18)
    jmp @target_18

@target_17:

; src/prelude.fth:21:18 in `0=`
@OPCODE_176:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_177:   ; [c64_ir] JumpTarget(17)

@target_18:

; src/prelude.fth:3:10 in `swap`
@OPCODE_179:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_180:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_181:   ; [c64_ir] LoopIf0(15)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_15

    lda TEMP2

@target_19:

; src/prelude.fth:44:25 in `*`
@OPCODE_183:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_184:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:44:25 in `*`
@OPCODE_185:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_186:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_187:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_188:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_189:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_190:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_191:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:70:5 in `draw-walls`
@OPCODE_192:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:70:11 in `draw-walls`
@OPCODE_193:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:70:13 in `draw-walls`
@OPCODE_194:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:70:13 in `draw-walls`
@OPCODE_195:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:70:13 in `draw-walls`
@OPCODE_196:   ; [c64_ir] LoopTarget(19)

@target_20:

; src/prelude.fth:4:13 in `over`
@OPCODE_198:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_199:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_200:   ; [c64_ir] PushLiteral(230)
    pha
    tya
    pha
    ldy #0
    lda #230

; src/prelude.fth:4:28 in `over`
@OPCODE_201:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:8 in `i`
@OPCODE_202:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_203:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_204:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_205:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_206:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_207:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_208:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:71:21 in `draw-walls`
@OPCODE_209:   ; [c64_ir] Add
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

; snake.pax:49:34 in `draw-index`
@OPCODE_210:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_211:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_212:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_213:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_214:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_215:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_216:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_217:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_218:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_219:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_220:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_221:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_222:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_223:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_224:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_225:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_226:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_227:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_228:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_229:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_230:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_231:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_232:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_233:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_234:   ; [c64_ir] JumpIf0(22)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_22

    lda TEMP2

@target_21:

; src/prelude.fth:21:11 in `0=`
@OPCODE_236:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_237:   ; [c64_ir] JumpElse(23)
    jmp @target_23

@target_22:

; src/prelude.fth:21:18 in `0=`
@OPCODE_239:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_240:   ; [c64_ir] JumpTarget(22)

@target_23:

; src/prelude.fth:3:10 in `swap`
@OPCODE_242:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_243:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:72:5 in `draw-walls`
@OPCODE_244:   ; [c64_ir] LoopIf0(20)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_20

    lda TEMP2

@target_24:

; snake.pax:72:5 in `draw-walls`
@OPCODE_246:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:72:5 in `draw-walls`
@OPCODE_247:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:72:5 in `draw-walls`
@OPCODE_248:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:72:5 in `draw-walls`
@OPCODE_249:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:73:5 in `draw-walls`
@OPCODE_250:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:74:5 in `draw-walls`
@OPCODE_251:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:74:11 in `draw-walls`
@OPCODE_252:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:74:13 in `draw-walls`
@OPCODE_253:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:74:13 in `draw-walls`
@OPCODE_254:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:74:13 in `draw-walls`
@OPCODE_255:   ; [c64_ir] LoopTarget(24)

@target_25:

; snake.pax:75:9 in `draw-walls`
@OPCODE_257:   ; [c64_ir] PushLiteral(230)
    pha
    tya
    pha
    ldy #0
    lda #230

; src/prelude.fth:38:8 in `i`
@OPCODE_258:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_259:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_260:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_261:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_262:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_263:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_264:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:49:34 in `draw-index`
@OPCODE_265:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_266:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_267:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_268:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_269:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_270:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_271:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_272:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_273:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_274:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_275:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_276:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_277:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_278:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_279:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_280:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_281:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_282:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_283:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_284:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_285:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_286:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_287:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_288:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_289:   ; [c64_ir] JumpIf0(27)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_27

    lda TEMP2

@target_26:

; src/prelude.fth:21:11 in `0=`
@OPCODE_291:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_292:   ; [c64_ir] JumpElse(28)
    jmp @target_28

@target_27:

; src/prelude.fth:21:18 in `0=`
@OPCODE_294:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_295:   ; [c64_ir] JumpTarget(27)

@target_28:

; src/prelude.fth:3:10 in `swap`
@OPCODE_297:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_298:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:76:5 in `draw-walls`
@OPCODE_299:   ; [c64_ir] LoopIf0(25)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_25

    lda TEMP2

@target_29:

; snake.pax:76:5 in `draw-walls`
@OPCODE_301:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:76:5 in `draw-walls`
@OPCODE_302:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:76:5 in `draw-walls`
@OPCODE_303:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:76:5 in `draw-walls`
@OPCODE_304:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:78:5 in `draw-walls`
@OPCODE_305:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:78:11 in `draw-walls`
@OPCODE_306:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:14:12 in `invert`
@OPCODE_307:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_308:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_309:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_310:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_311:   ; [c64_ir] Add
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

; snake.pax:79:5 in `draw-walls`
@OPCODE_312:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

; snake.pax:79:12 in `draw-walls`
@OPCODE_313:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:79:14 in `draw-walls`
@OPCODE_314:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:79:14 in `draw-walls`
@OPCODE_315:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:79:14 in `draw-walls`
@OPCODE_316:   ; [c64_ir] LoopTarget(29)

@target_30:

; src/prelude.fth:4:13 in `over`
@OPCODE_318:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_319:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_320:   ; [c64_ir] PushLiteral(230)
    pha
    tya
    pha
    ldy #0
    lda #230

; src/prelude.fth:4:28 in `over`
@OPCODE_321:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:49:34 in `draw-index`
@OPCODE_322:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_323:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_324:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:81:9 in `draw-walls`
@OPCODE_325:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:81:15 in `draw-walls`
@OPCODE_326:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_327:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_328:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_329:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_330:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_331:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_332:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_333:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_334:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_335:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_336:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_337:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_338:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_339:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_340:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_341:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_342:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_343:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_344:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_345:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_346:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_347:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_348:   ; [c64_ir] JumpIf0(32)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_32

    lda TEMP2

@target_31:

; src/prelude.fth:21:11 in `0=`
@OPCODE_350:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_351:   ; [c64_ir] JumpElse(33)
    jmp @target_33

@target_32:

; src/prelude.fth:21:18 in `0=`
@OPCODE_353:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_354:   ; [c64_ir] JumpTarget(32)

@target_33:

; src/prelude.fth:3:10 in `swap`
@OPCODE_356:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_357:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:82:5 in `draw-walls`
@OPCODE_358:   ; [c64_ir] LoopIf0(30)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_30

    lda TEMP2

@target_34:

; snake.pax:82:5 in `draw-walls`
@OPCODE_360:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:82:5 in `draw-walls`
@OPCODE_361:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:82:5 in `draw-walls`
@OPCODE_362:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:82:5 in `draw-walls`
@OPCODE_363:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:83:5 in `draw-walls`
@OPCODE_364:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:84:5 in `draw-walls`
@OPCODE_365:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

; snake.pax:84:12 in `draw-walls`
@OPCODE_366:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:84:14 in `draw-walls`
@OPCODE_367:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:84:14 in `draw-walls`
@OPCODE_368:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:84:14 in `draw-walls`
@OPCODE_369:   ; [c64_ir] LoopTarget(34)

@target_35:

; src/prelude.fth:4:13 in `over`
@OPCODE_371:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_372:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_373:   ; [c64_ir] PushLiteral(230)
    pha
    tya
    pha
    ldy #0
    lda #230

; src/prelude.fth:4:28 in `over`
@OPCODE_374:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:49:34 in `draw-index`
@OPCODE_375:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_376:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_377:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:86:9 in `draw-walls`
@OPCODE_378:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:86:15 in `draw-walls`
@OPCODE_379:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_380:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_381:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_382:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_383:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_384:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_385:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_386:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_387:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_388:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_389:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_390:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_391:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_392:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_393:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_394:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_395:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_396:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_397:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_398:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_399:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_400:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_401:   ; [c64_ir] JumpIf0(37)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_37

    lda TEMP2

@target_36:

; src/prelude.fth:21:11 in `0=`
@OPCODE_403:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_404:   ; [c64_ir] JumpElse(38)
    jmp @target_38

@target_37:

; src/prelude.fth:21:18 in `0=`
@OPCODE_406:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_407:   ; [c64_ir] JumpTarget(37)

@target_38:

; src/prelude.fth:3:10 in `swap`
@OPCODE_409:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_410:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:87:5 in `draw-walls`
@OPCODE_411:   ; [c64_ir] LoopIf0(35)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_35

    lda TEMP2

@target_39:

; snake.pax:87:5 in `draw-walls`
@OPCODE_413:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:87:5 in `draw-walls`
@OPCODE_414:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:87:5 in `draw-walls`
@OPCODE_415:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:87:5 in `draw-walls`
@OPCODE_416:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_417:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_418:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_419:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_420:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:91:3 in `initialize-snake`
@OPCODE_421:   ; [c64_ir] PushLiteral(4)
    pha
    tya
    pha
    ldy #0
    lda #4

; snake.pax:91:5 in `initialize-snake`
@OPCODE_422:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; snake.pax:91:12 in `initialize-snake`
@OPCODE_423:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:92:3 in `initialize-snake`
@OPCODE_424:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; snake.pax:92:10 in `initialize-snake`
@OPCODE_425:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:92:12 in `initialize-snake`
@OPCODE_426:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; snake.pax:92:14 in `initialize-snake`
@OPCODE_427:   ; [c64_ir] Add
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

; snake.pax:92:16 in `initialize-snake`
@OPCODE_428:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:92:18 in `initialize-snake`
@OPCODE_429:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:92:18 in `initialize-snake`
@OPCODE_430:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:92:18 in `initialize-snake`
@OPCODE_431:   ; [c64_ir] LoopTarget(39)

@target_40:

; snake.pax:93:5 in `initialize-snake`
@OPCODE_433:   ; [c64_ir] PushLiteral(8)
    pha
    tya
    pha
    ldy #0
    lda #8

; src/prelude.fth:38:8 in `i`
@OPCODE_434:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_435:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_436:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_437:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_438:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_439:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_440:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_441:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_442:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_443:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_444:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_445:   ; [c64_ir] Add
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

; src/prelude.fth:38:8 in `i`
@OPCODE_446:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_447:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_448:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_449:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_450:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_451:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_452:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:10 in `dup`
@OPCODE_453:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_454:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_455:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_456:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_457:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; snake.pax:42:22 in `snake-x`
@OPCODE_458:   ; [c64_ir] Add
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

; snake.pax:93:21 in `initialize-snake`
@OPCODE_459:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:94:5 in `initialize-snake`
@OPCODE_460:   ; [c64_ir] PushLiteral(8)
    pha
    tya
    pha
    ldy #0
    lda #8

; src/prelude.fth:38:8 in `i`
@OPCODE_461:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_462:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_463:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_464:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_465:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_466:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_467:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:10 in `dup`
@OPCODE_468:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_469:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_470:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_471:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_472:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; snake.pax:45:22 in `snake-y`
@OPCODE_473:   ; [c64_ir] Add
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

; snake.pax:94:17 in `initialize-snake`
@OPCODE_474:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_475:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_476:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_477:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_478:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_479:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_480:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_481:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_482:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_483:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_484:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_485:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_486:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_487:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_488:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_489:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_490:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_491:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_492:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_493:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_494:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_495:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_496:   ; [c64_ir] JumpIf0(42)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_42

    lda TEMP2

@target_41:

; src/prelude.fth:21:11 in `0=`
@OPCODE_498:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_499:   ; [c64_ir] JumpElse(43)
    jmp @target_43

@target_42:

; src/prelude.fth:21:18 in `0=`
@OPCODE_501:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_502:   ; [c64_ir] JumpTarget(42)

@target_43:

; src/prelude.fth:3:10 in `swap`
@OPCODE_504:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_505:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:95:3 in `initialize-snake`
@OPCODE_506:   ; [c64_ir] LoopIf0(40)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_40

    lda TEMP2

@target_44:

; snake.pax:95:3 in `initialize-snake`
@OPCODE_508:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:95:3 in `initialize-snake`
@OPCODE_509:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:95:3 in `initialize-snake`
@OPCODE_510:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:95:3 in `initialize-snake`
@OPCODE_511:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:96:3 in `initialize-snake`
@OPCODE_512:   ; [c64_ir] PushLiteral(39)
    pha
    tya
    pha
    ldy #0
    lda #39

; snake.pax:96:9 in `initialize-snake`
@OPCODE_513:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:96:19 in `initialize-snake`
@OPCODE_514:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_515:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_516:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:100:21 in `initialize-apple`
@OPCODE_517:   ; [c64_ir] PushLiteral(8)
    pha
    tya
    pha
    ldy #0
    lda #8

; snake.pax:100:23 in `initialize-apple`
@OPCODE_518:   ; [c64_ir] PushLiteral(13)
    pha
    tya
    pha
    ldy #0
    lda #13

; snake.pax:98:22 in `set-apple-position`
@OPCODE_519:   ; [c64_ir] PushLiteral(-26664)
    pha
    tya
    pha
    ldy #151
    lda #216

; snake.pax:98:30 in `set-apple-position`
@OPCODE_520:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:98:32 in `set-apple-position`
@OPCODE_521:   ; [c64_ir] PushLiteral(-26662)
    pha
    tya
    pha
    ldy #151
    lda #218

; snake.pax:98:40 in `set-apple-position`
@OPCODE_522:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_523:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_524:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:199:32 in `main`
@OPCODE_525:   ; [c64_ir] JumpTarget(44)

@target_45:

; snake.pax:200:1 in `main`
@OPCODE_527:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; snake.pax:200:3 in `main`
@OPCODE_528:   ; [c64_ir] PushLiteral(-28672)
    pha
    tya
    pha
    ldy #144
    lda #0

; snake.pax:200:15 in `main`
@OPCODE_529:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_530:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_531:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:187:3 in `draw-snake`
@OPCODE_532:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; snake.pax:187:10 in `draw-snake`
@OPCODE_533:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:187:12 in `draw-snake`
@OPCODE_534:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:187:14 in `draw-snake`
@OPCODE_535:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:187:14 in `draw-snake`
@OPCODE_536:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:187:14 in `draw-snake`
@OPCODE_537:   ; [c64_ir] LoopTarget(45)

@target_46:

; src/prelude.fth:38:8 in `i`
@OPCODE_539:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_540:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_541:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_542:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_543:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_544:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_545:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:10 in `dup`
@OPCODE_546:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_547:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_548:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_549:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_550:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; snake.pax:42:22 in `snake-x`
@OPCODE_551:   ; [c64_ir] Add
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

; snake.pax:188:15 in `draw-snake`
@OPCODE_552:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:38:8 in `i`
@OPCODE_553:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_554:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_555:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_556:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_557:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_558:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_559:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:10 in `dup`
@OPCODE_560:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_561:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_562:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_563:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_564:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; snake.pax:45:22 in `snake-y`
@OPCODE_565:   ; [c64_ir] Add
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

; snake.pax:188:27 in `draw-snake`
@OPCODE_566:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; <inline>:0:0 in `main`
@OPCODE_567:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_568:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_569:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_570:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_571:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_572:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:3:13 in `swap`
@OPCODE_573:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:22 in `swap`
@OPCODE_574:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:10 in `rot`
@OPCODE_575:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_576:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_577:   ; [c64_ir] PushLiteral(232)
    pha
    tya
    pha
    ldy #0
    lda #232

; src/prelude.fth:3:22 in `swap`
@OPCODE_578:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:18 in `rot`
@OPCODE_579:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_580:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_581:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_582:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_583:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; <inline>:0:0 in `main`
@OPCODE_584:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_585:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_586:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_587:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_588:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_589:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:8 in `*`
@OPCODE_590:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:10 in `*`
@OPCODE_591:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:44:13 in `*`
@OPCODE_592:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:15 in `*`
@OPCODE_593:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_594:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_595:   ; [c64_ir] LoopTarget(46)

@target_47:

; src/prelude.fth:4:10 in `over`
@OPCODE_597:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_598:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_599:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_600:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_601:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:44:23 in `*`
@OPCODE_602:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_603:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_604:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_605:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_606:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_607:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_608:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_609:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_610:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_611:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_612:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_613:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_614:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_615:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_616:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_617:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_618:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_619:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_620:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_621:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_622:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_623:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_624:   ; [c64_ir] JumpIf0(49)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_49

    lda TEMP2

@target_48:

; src/prelude.fth:21:11 in `0=`
@OPCODE_626:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_627:   ; [c64_ir] JumpElse(50)
    jmp @target_50

@target_49:

; src/prelude.fth:21:18 in `0=`
@OPCODE_629:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_630:   ; [c64_ir] JumpTarget(49)

@target_50:

; src/prelude.fth:3:10 in `swap`
@OPCODE_632:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_633:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_634:   ; [c64_ir] LoopIf0(47)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_47

    lda TEMP2

@target_51:

; src/prelude.fth:44:25 in `*`
@OPCODE_636:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_637:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:44:25 in `*`
@OPCODE_638:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_639:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_640:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_641:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_642:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_643:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_644:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:48:39 in `convert-x-y`
@OPCODE_645:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_646:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_647:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:49:34 in `draw-index`
@OPCODE_648:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_649:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_650:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_651:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_652:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_653:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_654:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_655:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_656:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_657:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_658:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_659:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_660:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_661:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_662:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_663:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_664:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_665:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_666:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_667:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_668:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_669:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_670:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_671:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_672:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_673:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_674:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_675:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_676:   ; [c64_ir] JumpIf0(53)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_53

    lda TEMP2

@target_52:

; src/prelude.fth:21:11 in `0=`
@OPCODE_678:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_679:   ; [c64_ir] JumpElse(54)
    jmp @target_54

@target_53:

; src/prelude.fth:21:18 in `0=`
@OPCODE_681:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_682:   ; [c64_ir] JumpTarget(53)

@target_54:

; src/prelude.fth:3:10 in `swap`
@OPCODE_684:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_685:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:189:3 in `draw-snake`
@OPCODE_686:   ; [c64_ir] LoopIf0(46)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_46

    lda TEMP2

@target_55:

; snake.pax:189:3 in `draw-snake`
@OPCODE_688:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:189:3 in `draw-snake`
@OPCODE_689:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:189:3 in `draw-snake`
@OPCODE_690:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:189:3 in `draw-snake`
@OPCODE_691:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:190:3 in `draw-snake`
@OPCODE_692:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; snake.pax:190:10 in `draw-snake`
@OPCODE_693:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:6:10 in `dup`
@OPCODE_694:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_695:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_696:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_697:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_698:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; snake.pax:42:22 in `snake-x`
@OPCODE_699:   ; [c64_ir] Add
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

; snake.pax:190:20 in `draw-snake`
@OPCODE_700:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:191:3 in `draw-snake`
@OPCODE_701:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; snake.pax:191:10 in `draw-snake`
@OPCODE_702:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:6:10 in `dup`
@OPCODE_703:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_704:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_705:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_706:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_707:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; snake.pax:45:22 in `snake-y`
@OPCODE_708:   ; [c64_ir] Add
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

; snake.pax:191:20 in `draw-snake`
@OPCODE_709:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; <inline>:0:0 in `main`
@OPCODE_710:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_711:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_712:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_713:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_714:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_715:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:3:13 in `swap`
@OPCODE_716:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:22 in `swap`
@OPCODE_717:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:10 in `rot`
@OPCODE_718:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_719:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_720:   ; [c64_ir] PushLiteral(32)
    pha
    tya
    pha
    ldy #0
    lda #32

; src/prelude.fth:3:22 in `swap`
@OPCODE_721:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:18 in `rot`
@OPCODE_722:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_723:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_724:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_725:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_726:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; <inline>:0:0 in `main`
@OPCODE_727:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_728:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_729:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_730:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_731:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_732:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:8 in `*`
@OPCODE_733:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:10 in `*`
@OPCODE_734:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:44:13 in `*`
@OPCODE_735:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:15 in `*`
@OPCODE_736:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_737:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_738:   ; [c64_ir] LoopTarget(55)

@target_56:

; src/prelude.fth:4:10 in `over`
@OPCODE_740:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_741:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_742:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_743:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_744:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:44:23 in `*`
@OPCODE_745:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_746:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_747:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_748:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_749:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_750:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_751:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_752:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_753:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_754:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_755:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_756:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_757:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_758:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_759:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_760:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_761:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_762:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_763:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_764:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_765:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_766:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_767:   ; [c64_ir] JumpIf0(58)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_58

    lda TEMP2

@target_57:

; src/prelude.fth:21:11 in `0=`
@OPCODE_769:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_770:   ; [c64_ir] JumpElse(59)
    jmp @target_59

@target_58:

; src/prelude.fth:21:18 in `0=`
@OPCODE_772:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_773:   ; [c64_ir] JumpTarget(58)

@target_59:

; src/prelude.fth:3:10 in `swap`
@OPCODE_775:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_776:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_777:   ; [c64_ir] LoopIf0(56)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_56

    lda TEMP2

@target_60:

; src/prelude.fth:44:25 in `*`
@OPCODE_779:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_780:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:44:25 in `*`
@OPCODE_781:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_782:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_783:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_784:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_785:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_786:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_787:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:48:39 in `convert-x-y`
@OPCODE_788:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_789:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_790:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:49:34 in `draw-index`
@OPCODE_791:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_792:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_793:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_794:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_795:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_796:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_797:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_798:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_799:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_800:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_801:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:195:3 in `draw-apple`
@OPCODE_802:   ; [c64_ir] PushLiteral(-26664)
    pha
    tya
    pha
    ldy #151
    lda #216

; snake.pax:195:11 in `draw-apple`
@OPCODE_803:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:195:13 in `draw-apple`
@OPCODE_804:   ; [c64_ir] PushLiteral(-26662)
    pha
    tya
    pha
    ldy #151
    lda #218

; snake.pax:195:21 in `draw-apple`
@OPCODE_805:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; <inline>:0:0 in `main`
@OPCODE_806:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_807:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_808:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_809:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_810:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_811:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:3:13 in `swap`
@OPCODE_812:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:22 in `swap`
@OPCODE_813:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:10 in `rot`
@OPCODE_814:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_815:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_816:   ; [c64_ir] PushLiteral(233)
    pha
    tya
    pha
    ldy #0
    lda #233

; src/prelude.fth:3:22 in `swap`
@OPCODE_817:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:18 in `rot`
@OPCODE_818:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_819:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_820:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_821:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_822:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; <inline>:0:0 in `main`
@OPCODE_823:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_824:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_825:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_826:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_827:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_828:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:8 in `*`
@OPCODE_829:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:10 in `*`
@OPCODE_830:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:44:13 in `*`
@OPCODE_831:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:15 in `*`
@OPCODE_832:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_833:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_834:   ; [c64_ir] LoopTarget(60)

@target_61:

; src/prelude.fth:4:10 in `over`
@OPCODE_836:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_837:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_838:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_839:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_840:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:44:23 in `*`
@OPCODE_841:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_842:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_843:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_844:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_845:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_846:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_847:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_848:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_849:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_850:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_851:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_852:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_853:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_854:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_855:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_856:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_857:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_858:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_859:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_860:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_861:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_862:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_863:   ; [c64_ir] JumpIf0(63)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_63

    lda TEMP2

@target_62:

; src/prelude.fth:21:11 in `0=`
@OPCODE_865:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_866:   ; [c64_ir] JumpElse(64)
    jmp @target_64

@target_63:

; src/prelude.fth:21:18 in `0=`
@OPCODE_868:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_869:   ; [c64_ir] JumpTarget(63)

@target_64:

; src/prelude.fth:3:10 in `swap`
@OPCODE_871:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_872:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_873:   ; [c64_ir] LoopIf0(61)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_61

    lda TEMP2

@target_65:

; src/prelude.fth:44:25 in `*`
@OPCODE_875:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_876:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:44:25 in `*`
@OPCODE_877:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_878:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_879:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_880:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_881:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_882:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_883:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:48:39 in `convert-x-y`
@OPCODE_884:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_885:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_886:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:49:34 in `draw-index`
@OPCODE_887:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_888:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_889:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_890:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_891:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_892:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_893:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_894:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_895:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_896:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_897:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:152:3 in `check-input`
@OPCODE_898:   ; [c64_ir] PushLiteral(126)
    pha
    tya
    pha
    ldy #0
    lda #126

; snake.pax:152:12 in `check-input`
@OPCODE_899:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; <inline>:0:0 in `main`
@OPCODE_900:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_901:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_902:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_903:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_904:   ; [c64_ir] PushLiteral(37)
    pha
    tya
    pha
    ldy #0
    lda #37

; src/prelude.fth:4:28 in `over`
@OPCODE_905:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_906:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_907:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_908:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_909:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_910:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_911:   ; [c64_ir] JumpIf0(67)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_67

    lda TEMP2

@target_66:

; src/prelude.fth:21:11 in `0=`
@OPCODE_913:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_914:   ; [c64_ir] JumpElse(68)
    jmp @target_68

@target_67:

; src/prelude.fth:21:18 in `0=`
@OPCODE_916:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_917:   ; [c64_ir] JumpTarget(67)

@target_68:

; snake.pax:145:15 in `change-direction`
@OPCODE_919:   ; [c64_ir] JumpIf0(78)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_78

    lda TEMP2

@target_69:

; <inline>:0:0 in `main`
@OPCODE_921:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_922:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_923:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_924:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:135:16 in `is-vertical`
@OPCODE_925:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:135:26 in `is-vertical`
@OPCODE_926:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:6:10 in `dup`
@OPCODE_927:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_928:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_929:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:136:3 in `is-vertical`
@OPCODE_930:   ; [c64_ir] PushLiteral(38)
    pha
    tya
    pha
    ldy #0
    lda #38

; src/prelude.fth:14:12 in `invert`
@OPCODE_931:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_932:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_933:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_934:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_935:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_936:   ; [c64_ir] JumpIf0(71)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_71

    lda TEMP2

@target_70:

; src/prelude.fth:21:11 in `0=`
@OPCODE_938:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_939:   ; [c64_ir] JumpElse(72)
    jmp @target_72

@target_71:

; src/prelude.fth:21:18 in `0=`
@OPCODE_941:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_942:   ; [c64_ir] JumpTarget(71)

@target_72:

; src/prelude.fth:3:10 in `swap`
@OPCODE_944:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_945:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_946:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_947:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:137:3 in `is-vertical`
@OPCODE_948:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:14:12 in `invert`
@OPCODE_949:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_950:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_951:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_952:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_953:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_954:   ; [c64_ir] JumpIf0(74)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_74

    lda TEMP2

@target_73:

; src/prelude.fth:21:11 in `0=`
@OPCODE_956:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_957:   ; [c64_ir] JumpElse(75)
    jmp @target_75

@target_74:

; src/prelude.fth:21:18 in `0=`
@OPCODE_959:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_960:   ; [c64_ir] JumpTarget(74)

@target_75:

; src/prelude.fth:14:12 in `invert`
@OPCODE_962:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_963:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:3:10 in `swap`
@OPCODE_964:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_965:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_966:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_967:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_968:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_969:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:26:27 in `or`
@OPCODE_970:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; <inline>:0:0 in `main`
@OPCODE_971:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_972:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:140:27 in `turn-left`
@OPCODE_973:   ; [c64_ir] JumpIf0(77)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_77

    lda TEMP2

@target_76:

; snake.pax:140:30 in `turn-left`
@OPCODE_975:   ; [c64_ir] PushLiteral(37)
    pha
    tya
    pha
    ldy #0
    lda #37

; snake.pax:140:35 in `turn-left`
@OPCODE_976:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:140:45 in `turn-left`
@OPCODE_977:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:140:47 in `turn-left`
@OPCODE_978:   ; [c64_ir] JumpTarget(76)

@target_77:

; <inline>:0:0 in `main`
@OPCODE_980:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_981:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:145:28 in `change-direction`
@OPCODE_982:   ; [c64_ir] JumpElse(120)
    jmp @target_120

@target_78:

; src/prelude.fth:4:13 in `over`
@OPCODE_984:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_985:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_986:   ; [c64_ir] PushLiteral(38)
    pha
    tya
    pha
    ldy #0
    lda #38

; src/prelude.fth:4:28 in `over`
@OPCODE_987:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_988:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_989:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_990:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_991:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_992:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_993:   ; [c64_ir] JumpIf0(80)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_80

    lda TEMP2

@target_79:

; src/prelude.fth:21:11 in `0=`
@OPCODE_995:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_996:   ; [c64_ir] JumpElse(81)
    jmp @target_81

@target_80:

; src/prelude.fth:21:18 in `0=`
@OPCODE_998:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_999:   ; [c64_ir] JumpTarget(80)

@target_81:

; snake.pax:146:13 in `change-direction`
@OPCODE_1001:   ; [c64_ir] JumpIf0(91)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_91

    lda TEMP2

@target_82:

; <inline>:0:0 in `main`
@OPCODE_1003:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1004:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1005:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1006:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:131:18 in `is-horizontal`
@OPCODE_1007:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:131:28 in `is-horizontal`
@OPCODE_1008:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:6:10 in `dup`
@OPCODE_1009:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1010:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1011:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:132:3 in `is-horizontal`
@OPCODE_1012:   ; [c64_ir] PushLiteral(37)
    pha
    tya
    pha
    ldy #0
    lda #37

; src/prelude.fth:14:12 in `invert`
@OPCODE_1013:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1014:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1015:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1016:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1017:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1018:   ; [c64_ir] JumpIf0(84)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_84

    lda TEMP2

@target_83:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1020:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1021:   ; [c64_ir] JumpElse(85)
    jmp @target_85

@target_84:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1023:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1024:   ; [c64_ir] JumpTarget(84)

@target_85:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1026:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1027:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1028:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1029:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:133:3 in `is-horizontal`
@OPCODE_1030:   ; [c64_ir] PushLiteral(39)
    pha
    tya
    pha
    ldy #0
    lda #39

; src/prelude.fth:14:12 in `invert`
@OPCODE_1031:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1032:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1033:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1034:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1035:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1036:   ; [c64_ir] JumpIf0(87)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_87

    lda TEMP2

@target_86:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1038:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1039:   ; [c64_ir] JumpElse(88)
    jmp @target_88

@target_87:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1041:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1042:   ; [c64_ir] JumpTarget(87)

@target_88:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1044:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1045:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:3:10 in `swap`
@OPCODE_1046:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1047:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1048:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1049:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1050:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1051:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:26:27 in `or`
@OPCODE_1052:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; <inline>:0:0 in `main`
@OPCODE_1053:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1054:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:139:29 in `turn-up`
@OPCODE_1055:   ; [c64_ir] JumpIf0(90)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_90

    lda TEMP2

@target_89:

; snake.pax:139:32 in `turn-up`
@OPCODE_1057:   ; [c64_ir] PushLiteral(38)
    pha
    tya
    pha
    ldy #0
    lda #38

; snake.pax:139:35 in `turn-up`
@OPCODE_1058:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:139:45 in `turn-up`
@OPCODE_1059:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:139:47 in `turn-up`
@OPCODE_1060:   ; [c64_ir] JumpTarget(89)

@target_90:

; <inline>:0:0 in `main`
@OPCODE_1062:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1063:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:146:24 in `change-direction`
@OPCODE_1064:   ; [c64_ir] JumpElse(119)
    jmp @target_119

@target_91:

; src/prelude.fth:4:13 in `over`
@OPCODE_1066:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1067:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1068:   ; [c64_ir] PushLiteral(39)
    pha
    tya
    pha
    ldy #0
    lda #39

; src/prelude.fth:4:28 in `over`
@OPCODE_1069:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1070:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1071:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1072:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1073:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1074:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1075:   ; [c64_ir] JumpIf0(93)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_93

    lda TEMP2

@target_92:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1077:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1078:   ; [c64_ir] JumpElse(94)
    jmp @target_94

@target_93:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1080:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1081:   ; [c64_ir] JumpTarget(93)

@target_94:

; snake.pax:147:16 in `change-direction`
@OPCODE_1083:   ; [c64_ir] JumpIf0(104)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_104

    lda TEMP2

@target_95:

; <inline>:0:0 in `main`
@OPCODE_1085:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1086:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1087:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1088:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:135:16 in `is-vertical`
@OPCODE_1089:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:135:26 in `is-vertical`
@OPCODE_1090:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:6:10 in `dup`
@OPCODE_1091:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1092:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1093:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:136:3 in `is-vertical`
@OPCODE_1094:   ; [c64_ir] PushLiteral(38)
    pha
    tya
    pha
    ldy #0
    lda #38

; src/prelude.fth:14:12 in `invert`
@OPCODE_1095:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1096:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1097:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1098:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1099:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1100:   ; [c64_ir] JumpIf0(97)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_97

    lda TEMP2

@target_96:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1102:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1103:   ; [c64_ir] JumpElse(98)
    jmp @target_98

@target_97:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1105:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1106:   ; [c64_ir] JumpTarget(97)

@target_98:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1108:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1109:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1110:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1111:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:137:3 in `is-vertical`
@OPCODE_1112:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:14:12 in `invert`
@OPCODE_1113:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1114:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1115:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1116:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1117:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1118:   ; [c64_ir] JumpIf0(100)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_100

    lda TEMP2

@target_99:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1120:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1121:   ; [c64_ir] JumpElse(101)
    jmp @target_101

@target_100:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1123:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1124:   ; [c64_ir] JumpTarget(100)

@target_101:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1126:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1127:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:3:10 in `swap`
@OPCODE_1128:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1129:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1130:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1131:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1132:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1133:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:26:27 in `or`
@OPCODE_1134:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; <inline>:0:0 in `main`
@OPCODE_1135:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1136:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:142:27 in `turn-right`
@OPCODE_1137:   ; [c64_ir] JumpIf0(103)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_103

    lda TEMP2

@target_102:

; snake.pax:142:30 in `turn-right`
@OPCODE_1139:   ; [c64_ir] PushLiteral(39)
    pha
    tya
    pha
    ldy #0
    lda #39

; snake.pax:142:36 in `turn-right`
@OPCODE_1140:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:142:46 in `turn-right`
@OPCODE_1141:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:142:48 in `turn-right`
@OPCODE_1142:   ; [c64_ir] JumpTarget(102)

@target_103:

; <inline>:0:0 in `main`
@OPCODE_1144:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1145:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:147:30 in `change-direction`
@OPCODE_1146:   ; [c64_ir] JumpElse(118)
    jmp @target_118

@target_104:

; src/prelude.fth:4:13 in `over`
@OPCODE_1148:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1149:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1150:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:4:28 in `over`
@OPCODE_1151:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1152:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1153:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1154:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1155:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1156:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1157:   ; [c64_ir] JumpIf0(106)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_106

    lda TEMP2

@target_105:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1159:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1160:   ; [c64_ir] JumpElse(107)
    jmp @target_107

@target_106:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1162:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1163:   ; [c64_ir] JumpTarget(106)

@target_107:

; snake.pax:148:15 in `change-direction`
@OPCODE_1165:   ; [c64_ir] JumpIf0(117)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_117

    lda TEMP2

@target_108:

; <inline>:0:0 in `main`
@OPCODE_1167:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1168:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1169:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1170:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:131:18 in `is-horizontal`
@OPCODE_1171:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:131:28 in `is-horizontal`
@OPCODE_1172:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:6:10 in `dup`
@OPCODE_1173:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1174:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1175:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:132:3 in `is-horizontal`
@OPCODE_1176:   ; [c64_ir] PushLiteral(37)
    pha
    tya
    pha
    ldy #0
    lda #37

; src/prelude.fth:14:12 in `invert`
@OPCODE_1177:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1178:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1179:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1180:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1181:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1182:   ; [c64_ir] JumpIf0(110)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_110

    lda TEMP2

@target_109:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1184:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1185:   ; [c64_ir] JumpElse(111)
    jmp @target_111

@target_110:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1187:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1188:   ; [c64_ir] JumpTarget(110)

@target_111:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1190:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1191:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1192:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1193:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:133:3 in `is-horizontal`
@OPCODE_1194:   ; [c64_ir] PushLiteral(39)
    pha
    tya
    pha
    ldy #0
    lda #39

; src/prelude.fth:14:12 in `invert`
@OPCODE_1195:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1196:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1197:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1198:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1199:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1200:   ; [c64_ir] JumpIf0(113)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_113

    lda TEMP2

@target_112:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1202:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1203:   ; [c64_ir] JumpElse(114)
    jmp @target_114

@target_113:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1205:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1206:   ; [c64_ir] JumpTarget(113)

@target_114:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1208:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1209:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:3:10 in `swap`
@OPCODE_1210:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1211:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1212:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1213:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1214:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1215:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:26:27 in `or`
@OPCODE_1216:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; <inline>:0:0 in `main`
@OPCODE_1217:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1218:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:141:29 in `turn-down`
@OPCODE_1219:   ; [c64_ir] JumpIf0(116)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_116

    lda TEMP2

@target_115:

; snake.pax:141:32 in `turn-down`
@OPCODE_1221:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:141:37 in `turn-down`
@OPCODE_1222:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:141:47 in `turn-down`
@OPCODE_1223:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:141:49 in `turn-down`
@OPCODE_1224:   ; [c64_ir] JumpTarget(115)

@target_116:

; <inline>:0:0 in `main`
@OPCODE_1226:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1227:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:149:3 in `change-direction`
@OPCODE_1228:   ; [c64_ir] JumpTarget(116)

@target_117:

; snake.pax:149:8 in `change-direction`
@OPCODE_1230:   ; [c64_ir] JumpTarget(117)

@target_118:

; snake.pax:149:13 in `change-direction`
@OPCODE_1232:   ; [c64_ir] JumpTarget(118)

@target_119:

; snake.pax:149:18 in `change-direction`
@OPCODE_1234:   ; [c64_ir] JumpTarget(119)

@target_120:

; snake.pax:149:23 in `change-direction`
@OPCODE_1236:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1237:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1238:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:153:3 in `check-input`
@OPCODE_1239:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:153:5 in `check-input`
@OPCODE_1240:   ; [c64_ir] PushLiteral(126)
    pha
    tya
    pha
    ldy #0
    lda #126

; snake.pax:153:14 in `check-input`
@OPCODE_1241:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1242:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1243:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1244:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1245:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:125:3 in `move-snake-tail`
@OPCODE_1246:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; snake.pax:125:6 in `move-snake-tail`
@OPCODE_1247:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; snake.pax:125:13 in `move-snake-tail`
@OPCODE_1248:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:125:15 in `move-snake-tail`
@OPCODE_1249:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:125:15 in `move-snake-tail`
@OPCODE_1250:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:125:15 in `move-snake-tail`
@OPCODE_1251:   ; [c64_ir] LoopTarget(120)

@target_121:

; src/prelude.fth:38:8 in `i`
@OPCODE_1253:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1254:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1255:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_1256:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_1257:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_1258:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:8 in `i`
@OPCODE_1259:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1260:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1261:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_1262:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_1263:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_1264:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_1265:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:10 in `dup`
@OPCODE_1266:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1267:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1268:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_1269:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_1270:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; snake.pax:42:22 in `snake-x`
@OPCODE_1271:   ; [c64_ir] Add
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

; snake.pax:126:24 in `move-snake-tail`
@OPCODE_1272:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:38:8 in `i`
@OPCODE_1273:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1274:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1275:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_1276:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_1277:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_1278:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_1279:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:126:28 in `move-snake-tail`
@OPCODE_1280:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; snake.pax:126:30 in `move-snake-tail`
@OPCODE_1281:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1282:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1283:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1284:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_1285:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_1286:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; snake.pax:42:22 in `snake-x`
@OPCODE_1287:   ; [c64_ir] Add
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

; snake.pax:126:40 in `move-snake-tail`
@OPCODE_1288:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; src/prelude.fth:38:8 in `i`
@OPCODE_1289:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1290:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1291:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_1292:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_1293:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_1294:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_1295:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:10 in `dup`
@OPCODE_1296:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1297:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1298:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_1299:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_1300:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; snake.pax:45:22 in `snake-y`
@OPCODE_1301:   ; [c64_ir] Add
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

; snake.pax:127:17 in `move-snake-tail`
@OPCODE_1302:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:38:8 in `i`
@OPCODE_1303:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1304:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1305:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:38:20 in `i`
@OPCODE_1306:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:38:26 in `i`
@OPCODE_1307:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:29 in `i`
@OPCODE_1308:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:38:35 in `i`
@OPCODE_1309:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; snake.pax:127:21 in `move-snake-tail`
@OPCODE_1310:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; snake.pax:127:23 in `move-snake-tail`
@OPCODE_1311:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1312:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1313:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1314:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:41:13 in `cells`
@OPCODE_1315:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_1316:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; snake.pax:45:22 in `snake-y`
@OPCODE_1317:   ; [c64_ir] Add
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

; snake.pax:127:33 in `move-snake-tail`
@OPCODE_1318:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; src/prelude.fth:35:21 in `-loopimpl`
@OPCODE_1319:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1320:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1321:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:35:29 in `-loopimpl`
@OPCODE_1322:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1323:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1324:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1325:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:14:12 in `invert`
@OPCODE_1326:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1327:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1328:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1329:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1330:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_1331:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1332:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1333:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1334:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1335:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_1336:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1337:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1338:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1339:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1340:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:35:44 in `-loopimpl`
@OPCODE_1341:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:35:47 in `-loopimpl`
@OPCODE_1342:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_1343:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1344:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1345:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1346:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1347:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1348:   ; [c64_ir] JumpIf0(123)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_123

    lda TEMP2

@target_122:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1350:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1351:   ; [c64_ir] JumpElse(124)
    jmp @target_124

@target_123:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1353:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1354:   ; [c64_ir] JumpTarget(123)

@target_124:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1356:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1357:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:128:5 in `move-snake-tail`
@OPCODE_1358:   ; [c64_ir] LoopIf0(121)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_121

    lda TEMP2

@target_125:

; snake.pax:128:5 in `move-snake-tail`
@OPCODE_1360:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:128:5 in `move-snake-tail`
@OPCODE_1361:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:128:5 in `move-snake-tail`
@OPCODE_1362:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; snake.pax:128:5 in `move-snake-tail`
@OPCODE_1363:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1364:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1365:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1366:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1367:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:116:20 in `move-snake-head`
@OPCODE_1368:   ; [c64_ir] PushLiteral(-26660)
    pha
    tya
    pha
    ldy #151
    lda #220

; snake.pax:116:30 in `move-snake-head`
@OPCODE_1369:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:4:13 in `over`
@OPCODE_1370:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1371:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1372:   ; [c64_ir] PushLiteral(37)
    pha
    tya
    pha
    ldy #0
    lda #37

; src/prelude.fth:4:28 in `over`
@OPCODE_1373:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1374:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1375:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1376:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1377:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1378:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1379:   ; [c64_ir] JumpIf0(127)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_127

    lda TEMP2

@target_126:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1381:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1382:   ; [c64_ir] JumpElse(128)
    jmp @target_128

@target_127:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1384:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1385:   ; [c64_ir] JumpTarget(127)

@target_128:

; snake.pax:117:16 in `move-snake-head`
@OPCODE_1387:   ; [c64_ir] JumpIf0(130)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_130

    lda TEMP2

@target_129:

; snake.pax:112:14 in `move-left`
@OPCODE_1389:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:6:16 in `dup`
@OPCODE_1390:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; src/prelude.fth:20:15 in `+!`
@OPCODE_1391:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:20:17 in `+!`
@OPCODE_1392:   ; [c64_ir] Add
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

; src/prelude.fth:20:19 in `+!`
@OPCODE_1393:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; src/prelude.fth:20:22 in `+!`
@OPCODE_1394:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:117:29 in `move-snake-head`
@OPCODE_1395:   ; [c64_ir] JumpElse(148)
    jmp @target_148

@target_130:

; src/prelude.fth:4:13 in `over`
@OPCODE_1397:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1398:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1399:   ; [c64_ir] PushLiteral(38)
    pha
    tya
    pha
    ldy #0
    lda #38

; src/prelude.fth:4:28 in `over`
@OPCODE_1400:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1401:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1402:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1403:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1404:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1405:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1406:   ; [c64_ir] JumpIf0(132)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_132

    lda TEMP2

@target_131:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1408:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1409:   ; [c64_ir] JumpElse(133)
    jmp @target_133

@target_132:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1411:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1412:   ; [c64_ir] JumpTarget(132)

@target_133:

; snake.pax:118:16 in `move-snake-head`
@OPCODE_1414:   ; [c64_ir] JumpIf0(135)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_135

    lda TEMP2

@target_134:

; snake.pax:111:12 in `move-up`
@OPCODE_1416:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:6:16 in `dup`
@OPCODE_1417:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; src/prelude.fth:20:15 in `+!`
@OPCODE_1418:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:20:17 in `+!`
@OPCODE_1419:   ; [c64_ir] Add
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

; src/prelude.fth:20:19 in `+!`
@OPCODE_1420:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; src/prelude.fth:20:22 in `+!`
@OPCODE_1421:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:118:27 in `move-snake-head`
@OPCODE_1422:   ; [c64_ir] JumpElse(147)
    jmp @target_147

@target_135:

; src/prelude.fth:4:13 in `over`
@OPCODE_1424:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1425:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1426:   ; [c64_ir] PushLiteral(39)
    pha
    tya
    pha
    ldy #0
    lda #39

; src/prelude.fth:4:28 in `over`
@OPCODE_1427:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1428:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1429:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1430:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1431:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1432:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1433:   ; [c64_ir] JumpIf0(137)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_137

    lda TEMP2

@target_136:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1435:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1436:   ; [c64_ir] JumpElse(138)
    jmp @target_138

@target_137:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1438:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1439:   ; [c64_ir] JumpTarget(137)

@target_138:

; snake.pax:119:16 in `move-snake-head`
@OPCODE_1441:   ; [c64_ir] JumpIf0(140)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_140

    lda TEMP2

@target_139:

; snake.pax:114:15 in `move-right`
@OPCODE_1443:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1444:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; src/prelude.fth:20:15 in `+!`
@OPCODE_1445:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:20:17 in `+!`
@OPCODE_1446:   ; [c64_ir] Add
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

; src/prelude.fth:20:19 in `+!`
@OPCODE_1447:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; src/prelude.fth:20:22 in `+!`
@OPCODE_1448:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:119:30 in `move-snake-head`
@OPCODE_1449:   ; [c64_ir] JumpElse(146)
    jmp @target_146

@target_140:

; src/prelude.fth:4:13 in `over`
@OPCODE_1451:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1452:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1453:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:4:28 in `over`
@OPCODE_1454:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1455:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1456:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1457:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1458:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1459:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1460:   ; [c64_ir] JumpIf0(142)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_142

    lda TEMP2

@target_141:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1462:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1463:   ; [c64_ir] JumpElse(143)
    jmp @target_143

@target_142:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1465:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1466:   ; [c64_ir] JumpTarget(142)

@target_143:

; snake.pax:120:16 in `move-snake-head`
@OPCODE_1468:   ; [c64_ir] JumpIf0(145)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_145

    lda TEMP2

@target_144:

; snake.pax:113:14 in `move-down`
@OPCODE_1470:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1471:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; src/prelude.fth:20:15 in `+!`
@OPCODE_1472:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:20:17 in `+!`
@OPCODE_1473:   ; [c64_ir] Add
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

; src/prelude.fth:20:19 in `+!`
@OPCODE_1474:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; src/prelude.fth:20:22 in `+!`
@OPCODE_1475:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:121:3 in `move-snake-head`
@OPCODE_1476:   ; [c64_ir] JumpTarget(144)

@target_145:

; snake.pax:121:8 in `move-snake-head`
@OPCODE_1478:   ; [c64_ir] JumpTarget(145)

@target_146:

; snake.pax:121:13 in `move-snake-head`
@OPCODE_1480:   ; [c64_ir] JumpTarget(146)

@target_147:

; snake.pax:121:18 in `move-snake-head`
@OPCODE_1482:   ; [c64_ir] JumpTarget(147)

@target_148:

; snake.pax:121:23 in `move-snake-head`
@OPCODE_1484:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1485:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1486:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1487:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1488:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:169:3 in `check-apple`
@OPCODE_1489:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; snake.pax:169:16 in `check-apple`
@OPCODE_1490:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:169:18 in `check-apple`
@OPCODE_1491:   ; [c64_ir] PushLiteral(-26664)
    pha
    tya
    pha
    ldy #151
    lda #216

; snake.pax:169:26 in `check-apple`
@OPCODE_1492:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:14:12 in `invert`
@OPCODE_1493:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1494:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1495:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1496:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1497:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1498:   ; [c64_ir] JumpIf0(150)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_150

    lda TEMP2

@target_149:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1500:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1501:   ; [c64_ir] JumpElse(151)
    jmp @target_151

@target_150:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1503:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1504:   ; [c64_ir] JumpTarget(150)

@target_151:

; snake.pax:170:3 in `check-apple`
@OPCODE_1506:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; snake.pax:170:16 in `check-apple`
@OPCODE_1507:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:170:18 in `check-apple`
@OPCODE_1508:   ; [c64_ir] PushLiteral(-26662)
    pha
    tya
    pha
    ldy #151
    lda #218

; snake.pax:170:26 in `check-apple`
@OPCODE_1509:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:14:12 in `invert`
@OPCODE_1510:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1511:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1512:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1513:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1514:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1515:   ; [c64_ir] JumpIf0(153)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_153

    lda TEMP2

@target_152:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1517:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1518:   ; [c64_ir] JumpElse(154)
    jmp @target_154

@target_153:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1520:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1521:   ; [c64_ir] JumpTarget(153)

@target_154:

; src/prelude.fth:28:9 in `and`
@OPCODE_1523:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:14:12 in `invert`
@OPCODE_1524:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1525:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; snake.pax:171:7 in `check-apple`
@OPCODE_1526:   ; [c64_ir] JumpIf0(177)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_177

    lda TEMP2

@target_155:

; <inline>:0:0 in `main`
@OPCODE_1528:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1529:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:162:3 in `move-apple`
@OPCODE_1530:   ; [c64_ir] PushLiteral(-26664)
    pha
    tya
    pha
    ldy #151
    lda #216

; snake.pax:162:11 in `move-apple`
@OPCODE_1531:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:162:13 in `move-apple`
@OPCODE_1532:   ; [c64_ir] PushLiteral(-26662)
    pha
    tya
    pha
    ldy #151
    lda #218

; snake.pax:162:21 in `move-apple`
@OPCODE_1533:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; <inline>:0:0 in `main`
@OPCODE_1534:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1535:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_1536:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1537:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1538:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1539:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:3:13 in `swap`
@OPCODE_1540:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:22 in `swap`
@OPCODE_1541:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:10 in `rot`
@OPCODE_1542:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1543:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1544:   ; [c64_ir] PushLiteral(32)
    pha
    tya
    pha
    ldy #0
    lda #32

; src/prelude.fth:3:22 in `swap`
@OPCODE_1545:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:5:18 in `rot`
@OPCODE_1546:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1547:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1548:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1549:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1550:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; <inline>:0:0 in `main`
@OPCODE_1551:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1552:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1553:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1554:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1555:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1556:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:8 in `*`
@OPCODE_1557:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:10 in `*`
@OPCODE_1558:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:44:13 in `*`
@OPCODE_1559:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:15 in `*`
@OPCODE_1560:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_1561:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_1562:   ; [c64_ir] LoopTarget(155)

@target_156:

; src/prelude.fth:4:10 in `over`
@OPCODE_1564:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1565:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1566:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1567:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1568:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:44:23 in `*`
@OPCODE_1569:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1570:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1571:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_1572:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_1573:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_1574:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1575:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1576:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1577:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1578:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_1579:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1580:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1581:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1582:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1583:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1584:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1585:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_1586:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1587:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1588:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1589:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1590:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1591:   ; [c64_ir] JumpIf0(158)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_158

    lda TEMP2

@target_157:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1593:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1594:   ; [c64_ir] JumpElse(159)
    jmp @target_159

@target_158:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1596:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1597:   ; [c64_ir] JumpTarget(158)

@target_159:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1599:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1600:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1601:   ; [c64_ir] LoopIf0(156)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_156

    lda TEMP2

@target_160:

; src/prelude.fth:44:25 in `*`
@OPCODE_1603:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1604:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:44:25 in `*`
@OPCODE_1605:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1606:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_1607:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1608:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1609:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1610:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1611:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:48:39 in `convert-x-y`
@OPCODE_1612:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1613:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1614:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:49:34 in `draw-index`
@OPCODE_1615:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:49:43 in `draw-index`
@OPCODE_1616:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_1617:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1618:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1619:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1620:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1621:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1622:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1623:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:157:3 in `random-x-position`
@OPCODE_1624:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; snake.pax:157:9 in `random-x-position`
@OPCODE_1625:   ; [c64_ir] PushLiteral(4)
    pha
    tya
    pha
    ldy #0
    lda #4

; src/prelude.fth:14:12 in `invert`
@OPCODE_1626:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1627:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1628:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1629:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1630:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1631:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1632:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:8:10 in `random`
@OPCODE_1633:   ; [c64_ir] PushLiteral(127)
    pha
    tya
    pha
    ldy #0
    lda #127

; snake.pax:8:26 in `random`
@OPCODE_1634:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:8:28 in `random`
@OPCODE_1635:   ; [c64_ir] PushLiteral(255)
    pha
    tya
    pha
    ldy #0
    lda #255

; src/prelude.fth:28:9 in `and`
@OPCODE_1636:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:14:12 in `invert`
@OPCODE_1637:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1638:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:3:10 in `swap`
@OPCODE_1639:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1640:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1641:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1642:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; <inline>:0:0 in `main`
@OPCODE_1643:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1644:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:48:34 in `%`
@OPCODE_1645:   ; [c64_ir] LoopTarget(160)

@target_161:

; src/prelude.fth:4:10 in `over`
@OPCODE_1647:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1648:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1649:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1650:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1651:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_1652:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1653:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1654:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1655:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1656:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1657:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1658:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1659:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1660:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1661:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1662:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1663:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1664:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:47:8 in `0<`
@OPCODE_1665:   ; [c64_ir] PushLiteral(-32768)
    pha
    tya
    pha
    ldy #128
    lda #0

; src/prelude.fth:47:14 in `0<`
@OPCODE_1666:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:14:12 in `invert`
@OPCODE_1667:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1668:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:47:26 in `0<`
@OPCODE_1669:   ; [c64_ir] JumpIf0(163)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_163

    lda TEMP2

@target_162:

; src/prelude.fth:47:29 in `0<`
@OPCODE_1671:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:47:32 in `0<`
@OPCODE_1672:   ; [c64_ir] JumpElse(164)
    jmp @target_164

@target_163:

; src/prelude.fth:47:37 in `0<`
@OPCODE_1674:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:47:39 in `0<`
@OPCODE_1675:   ; [c64_ir] JumpTarget(163)

@target_164:

; src/prelude.fth:48:54 in `%`
@OPCODE_1677:   ; [c64_ir] JumpIf0(166)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_166

    lda TEMP2

@target_165:

; src/prelude.fth:48:57 in `%`
@OPCODE_1679:   ; [c64_ir] Add
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

; src/prelude.fth:48:59 in `%`
@OPCODE_1680:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:48:62 in `%`
@OPCODE_1681:   ; [c64_ir] JumpElse(167)
    jmp @target_167

@target_166:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1683:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_1684:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1685:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1686:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_1687:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1688:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1689:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1690:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1691:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1692:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1693:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:48:81 in `%`
@OPCODE_1694:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:48:83 in `%`
@OPCODE_1695:   ; [c64_ir] JumpTarget(166)

@target_167:

; src/prelude.fth:48:88 in `%`
@OPCODE_1697:   ; [c64_ir] LoopIf0(161)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_161

    lda TEMP2

@target_168:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1699:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1700:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1701:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1702:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1703:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1704:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1705:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:157:20 in `random-x-position`
@OPCODE_1706:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

; snake.pax:157:22 in `random-x-position`
@OPCODE_1707:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1708:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1709:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1710:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1711:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:159:3 in `random-y-position`
@OPCODE_1712:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

; snake.pax:159:10 in `random-y-position`
@OPCODE_1713:   ; [c64_ir] PushLiteral(4)
    pha
    tya
    pha
    ldy #0
    lda #4

; src/prelude.fth:14:12 in `invert`
@OPCODE_1714:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1715:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1716:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1717:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1718:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1719:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1720:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:8:10 in `random`
@OPCODE_1721:   ; [c64_ir] PushLiteral(127)
    pha
    tya
    pha
    ldy #0
    lda #127

; snake.pax:8:26 in `random`
@OPCODE_1722:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:8:28 in `random`
@OPCODE_1723:   ; [c64_ir] PushLiteral(255)
    pha
    tya
    pha
    ldy #0
    lda #255

; src/prelude.fth:28:9 in `and`
@OPCODE_1724:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:14:12 in `invert`
@OPCODE_1725:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1726:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:3:10 in `swap`
@OPCODE_1727:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1728:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1729:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1730:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; <inline>:0:0 in `main`
@OPCODE_1731:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1732:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:48:34 in `%`
@OPCODE_1733:   ; [c64_ir] LoopTarget(168)

@target_169:

; src/prelude.fth:4:10 in `over`
@OPCODE_1735:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1736:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1737:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1738:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1739:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_1740:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1741:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1742:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1743:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1744:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:14:12 in `invert`
@OPCODE_1745:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1746:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1747:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1748:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1749:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1750:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:6:16 in `dup`
@OPCODE_1751:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:6:22 in `dup`
@OPCODE_1752:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:47:8 in `0<`
@OPCODE_1753:   ; [c64_ir] PushLiteral(-32768)
    pha
    tya
    pha
    ldy #128
    lda #0

; src/prelude.fth:47:14 in `0<`
@OPCODE_1754:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:14:12 in `invert`
@OPCODE_1755:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1756:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:47:26 in `0<`
@OPCODE_1757:   ; [c64_ir] JumpIf0(171)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_171

    lda TEMP2

@target_170:

; src/prelude.fth:47:29 in `0<`
@OPCODE_1759:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:47:32 in `0<`
@OPCODE_1760:   ; [c64_ir] JumpElse(172)
    jmp @target_172

@target_171:

; src/prelude.fth:47:37 in `0<`
@OPCODE_1762:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:47:39 in `0<`
@OPCODE_1763:   ; [c64_ir] JumpTarget(171)

@target_172:

; src/prelude.fth:48:54 in `%`
@OPCODE_1765:   ; [c64_ir] JumpIf0(174)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_174

    lda TEMP2

@target_173:

; src/prelude.fth:48:57 in `%`
@OPCODE_1767:   ; [c64_ir] Add
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

; src/prelude.fth:48:59 in `%`
@OPCODE_1768:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:48:62 in `%`
@OPCODE_1769:   ; [c64_ir] JumpElse(175)
    jmp @target_175

@target_174:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1771:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_1772:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1773:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1774:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_1775:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1776:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1777:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1778:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1779:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1780:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1781:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:48:81 in `%`
@OPCODE_1782:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:48:83 in `%`
@OPCODE_1783:   ; [c64_ir] JumpTarget(174)

@target_175:

; src/prelude.fth:48:88 in `%`
@OPCODE_1785:   ; [c64_ir] LoopIf0(169)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_169

    lda TEMP2

@target_176:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1787:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1788:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1789:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1790:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1791:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1792:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1793:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:159:21 in `random-y-position`
@OPCODE_1794:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

; snake.pax:159:23 in `random-y-position`
@OPCODE_1795:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1796:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1797:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:98:22 in `set-apple-position`
@OPCODE_1798:   ; [c64_ir] PushLiteral(-26664)
    pha
    tya
    pha
    ldy #151
    lda #216

; snake.pax:98:30 in `set-apple-position`
@OPCODE_1799:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:98:32 in `set-apple-position`
@OPCODE_1800:   ; [c64_ir] PushLiteral(-26662)
    pha
    tya
    pha
    ldy #151
    lda #218

; snake.pax:98:40 in `set-apple-position`
@OPCODE_1801:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1802:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1803:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:166:15 in `grow-snake`
@OPCODE_1804:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1805:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; src/prelude.fth:20:15 in `+!`
@OPCODE_1806:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; src/prelude.fth:20:17 in `+!`
@OPCODE_1807:   ; [c64_ir] Add
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

; src/prelude.fth:20:19 in `+!`
@OPCODE_1808:   ; [c64_ir] PushLiteral(-26658)
    pha
    tya
    pha
    ldy #151
    lda #222

; src/prelude.fth:20:22 in `+!`
@OPCODE_1809:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:174:3 in `check-apple`
@OPCODE_1810:   ; [c64_ir] JumpTarget(176)

@target_177:

; <inline>:0:0 in `main`
@OPCODE_1812:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1813:   ; [c64_ir] Drop
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1814:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1815:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; snake.pax:178:3 in `check-collision`
@OPCODE_1816:   ; [c64_ir] PushLiteral(-28668)
    pha
    tya
    pha
    ldy #144
    lda #4

; snake.pax:178:16 in `check-collision`
@OPCODE_1817:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:178:18 in `check-collision`
@OPCODE_1818:   ; [c64_ir] PushLiteral(-27666)
    pha
    tya
    pha
    ldy #147
    lda #238

; snake.pax:178:31 in `check-collision`
@OPCODE_1819:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; <inline>:0:0 in `main`
@OPCODE_1820:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1821:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; <inline>:0:0 in `main`
@OPCODE_1822:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

; <inline>:0:0 in `main`
@OPCODE_1823:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:8 in `*`
@OPCODE_1824:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:10 in `*`
@OPCODE_1825:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

; src/prelude.fth:44:13 in `*`
@OPCODE_1826:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:44:15 in `*`
@OPCODE_1827:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_1828:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:44:15 in `*`
@OPCODE_1829:   ; [c64_ir] LoopTarget(177)

@target_178:

; src/prelude.fth:4:10 in `over`
@OPCODE_1831:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1832:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1833:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1834:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1835:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:44:23 in `*`
@OPCODE_1836:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1837:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1838:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_1839:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:18:10 in `1+`
@OPCODE_1840:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_1841:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1842:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1843:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1844:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1845:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:10 in `over`
@OPCODE_1846:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:4:13 in `over`
@OPCODE_1847:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:4:19 in `over`
@OPCODE_1848:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:4:25 in `over`
@OPCODE_1849:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1850:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1851:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1852:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:14:12 in `invert`
@OPCODE_1853:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1854:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1855:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1856:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1857:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1858:   ; [c64_ir] JumpIf0(180)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_180

    lda TEMP2

@target_179:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1860:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1861:   ; [c64_ir] JumpElse(181)
    jmp @target_181

@target_180:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1863:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1864:   ; [c64_ir] JumpTarget(180)

@target_181:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1866:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1867:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1868:   ; [c64_ir] LoopIf0(178)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_178

    lda TEMP2

@target_182:

; src/prelude.fth:44:25 in `*`
@OPCODE_1870:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1871:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:44:25 in `*`
@OPCODE_1872:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1873:   ; [c64_ir] Drop
    pla
    tay
    pla

; src/prelude.fth:3:10 in `swap`
@OPCODE_1874:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

; src/prelude.fth:3:13 in `swap`
@OPCODE_1875:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

; src/prelude.fth:3:19 in `swap`
@OPCODE_1876:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1877:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1878:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:48:39 in `convert-x-y`
@OPCODE_1879:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1880:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1881:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:181:15 in `check-collision`
@OPCODE_1882:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

; snake.pax:181:24 in `check-collision`
@OPCODE_1883:   ; [c64_ir] Add
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

; snake.pax:181:26 in `check-collision`
@OPCODE_1884:   ; [c64_ir] Load8
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

; snake.pax:184:3 in `check-collision`
@OPCODE_1885:   ; [c64_ir] PushLiteral(32)
    pha
    tya
    pha
    ldy #0
    lda #32

; src/prelude.fth:14:12 in `invert`
@OPCODE_1886:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:14:15 in `invert`
@OPCODE_1887:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

; src/prelude.fth:15:19 in `negate`
@OPCODE_1888:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

; src/prelude.fth:15:21 in `negate`
@OPCODE_1889:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1890:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1891:   ; [c64_ir] JumpIf0(184)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_184

    lda TEMP2

@target_183:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1893:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; src/prelude.fth:21:13 in `0=`
@OPCODE_1894:   ; [c64_ir] JumpElse(185)
    jmp @target_185

@target_184:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1896:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

; src/prelude.fth:21:21 in `0=`
@OPCODE_1897:   ; [c64_ir] JumpTarget(184)

@target_185:

; <inline>:0:0 in `main`
@OPCODE_1899:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

; <inline>:0:0 in `main`
@OPCODE_1900:   ; [c64_ir] Drop
    pla
    tay
    pla

; snake.pax:210:1 in `main`
@OPCODE_1901:   ; [c64_ir] JumpIf0(187)
    sta TEMP
    tya
    ora TEMP
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_187

    lda TEMP2

@target_186:

; snake.pax:210:4 in `main`
@OPCODE_1903:   ; [c64_ir] JumpElse(188)
    jmp @target_188

@target_187:

; snake.pax:210:9 in `main`
@OPCODE_1905:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

; snake.pax:210:11 in `main`
@OPCODE_1906:   ; [c64_ir] PushLiteral(-28672)
    pha
    tya
    pha
    ldy #144
    lda #0

; snake.pax:210:23 in `main`
@OPCODE_1907:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

; snake.pax:210:25 in `main`
@OPCODE_1908:   ; [c64_ir] JumpTarget(187)

@target_188:

; :0:0 in ``
@OPCODE_1910:   ; [c64_ir] Exit
    ;rts






; function start


