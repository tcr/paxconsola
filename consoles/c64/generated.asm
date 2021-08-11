@target_0:

; snake.pax:205:1 in `main`
@OPCODE_1:   ; [c64_ir] PushLiteral(-28672)
    inx
    inx
    lda #0
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:205:13 in `main`
@OPCODE_2:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:8 in `0=`
@OPCODE_3:   ; [c64_ir] JumpIf0(2)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_2

@target_1:

; src/prelude.fth:21:11 in `0=`
@OPCODE_5:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_6:   ; [c64_ir] JumpElse(3)
    jmp @target_3

@target_2:

; src/prelude.fth:21:18 in `0=`
@OPCODE_8:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_9:   ; [c64_ir] JumpTarget(2)

@target_3:

; snake.pax:205:18 in `main`
@OPCODE_11:   ; [c64_ir] JumpIf0(55)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_55

@target_4:

; <inline>:0:0 in `main`
@OPCODE_13:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_14:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_15:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_16:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:57:5 in `draw-background`
@OPCODE_17:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:58:5 in `draw-background`
@OPCODE_18:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:58:12 in `draw-background`
@OPCODE_19:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:58:14 in `draw-background`
@OPCODE_20:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:58:14 in `draw-background`
@OPCODE_21:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:58:14 in `draw-background`
@OPCODE_22:   ; [c64_ir] LoopTarget(4)

@target_5:

; snake.pax:59:9 in `draw-background`
@OPCODE_24:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:59:15 in `draw-background`
@OPCODE_25:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:59:17 in `draw-background`
@OPCODE_26:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:59:17 in `draw-background`
@OPCODE_27:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:59:17 in `draw-background`
@OPCODE_28:   ; [c64_ir] LoopTarget(5)

@target_6:

; src/prelude.fth:4:13 in `over`
@OPCODE_30:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_31:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_32:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_33:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_34:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_35:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_36:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_37:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_38:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_39:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_40:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:60:32 in `draw-background`
@OPCODE_41:   ; [c64_ir] Add
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

; snake.pax:49:34 in `draw-index`
@OPCODE_42:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_43:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_44:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_45:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_46:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_47:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_48:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_49:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_50:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_51:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_52:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_53:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_54:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_55:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_56:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_57:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_58:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_59:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_60:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_61:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_62:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_63:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_64:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_65:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_66:   ; [c64_ir] JumpIf0(8)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_8

@target_7:

; src/prelude.fth:21:11 in `0=`
@OPCODE_68:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_69:   ; [c64_ir] JumpElse(9)
    jmp @target_9

@target_8:

; src/prelude.fth:21:18 in `0=`
@OPCODE_71:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_72:   ; [c64_ir] JumpTarget(8)

@target_9:

; src/prelude.fth:3:10 in `swap`
@OPCODE_74:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_75:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:61:9 in `draw-background`
@OPCODE_76:   ; [c64_ir] LoopIf0(6)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_6

@target_10:

; snake.pax:61:9 in `draw-background`
@OPCODE_78:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:61:9 in `draw-background`
@OPCODE_79:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:61:9 in `draw-background`
@OPCODE_80:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:61:9 in `draw-background`
@OPCODE_81:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:62:9 in `draw-background`
@OPCODE_82:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:62:15 in `draw-background`
@OPCODE_83:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_84:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_85:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_86:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_87:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_88:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_89:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_90:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_91:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_92:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_93:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_94:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_95:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_96:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_97:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_98:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_99:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_100:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_101:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_102:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_103:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_104:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_105:   ; [c64_ir] JumpIf0(12)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_12

@target_11:

; src/prelude.fth:21:11 in `0=`
@OPCODE_107:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_108:   ; [c64_ir] JumpElse(13)
    jmp @target_13

@target_12:

; src/prelude.fth:21:18 in `0=`
@OPCODE_110:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_111:   ; [c64_ir] JumpTarget(12)

@target_13:

; src/prelude.fth:3:10 in `swap`
@OPCODE_113:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_114:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:63:4 in `draw-background`
@OPCODE_115:   ; [c64_ir] LoopIf0(5)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_5

@target_14:

; snake.pax:63:4 in `draw-background`
@OPCODE_117:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:63:4 in `draw-background`
@OPCODE_118:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:63:4 in `draw-background`
@OPCODE_119:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:63:4 in `draw-background`
@OPCODE_120:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:64:4 in `draw-background`
@OPCODE_121:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_122:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_123:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_124:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_125:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:69:5 in `draw-walls`
@OPCODE_126:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:69:11 in `draw-walls`
@OPCODE_127:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:69:18 in `draw-walls`
@OPCODE_128:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_129:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_130:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_131:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_132:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_133:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_134:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_135:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_136:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_137:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_138:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_139:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_140:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_141:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_142:   ; [c64_ir] LoopTarget(14)

@target_15:

; src/prelude.fth:4:10 in `over`
@OPCODE_144:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_145:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_146:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_147:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_148:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:44:23 in `*`
@OPCODE_149:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_150:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_151:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_152:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_153:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_154:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_155:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_156:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_157:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_158:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_159:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_160:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_161:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_162:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_163:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_164:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_165:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_166:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_167:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_168:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_169:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_170:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_171:   ; [c64_ir] JumpIf0(17)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_17

@target_16:

; src/prelude.fth:21:11 in `0=`
@OPCODE_173:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_174:   ; [c64_ir] JumpElse(18)
    jmp @target_18

@target_17:

; src/prelude.fth:21:18 in `0=`
@OPCODE_176:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_177:   ; [c64_ir] JumpTarget(17)

@target_18:

; src/prelude.fth:3:10 in `swap`
@OPCODE_179:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_180:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_181:   ; [c64_ir] LoopIf0(15)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_15

@target_19:

; src/prelude.fth:44:25 in `*`
@OPCODE_183:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_184:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_185:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_186:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:3:10 in `swap`
@OPCODE_187:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_188:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_189:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_190:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_191:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:70:5 in `draw-walls`
@OPCODE_192:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:70:11 in `draw-walls`
@OPCODE_193:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:70:13 in `draw-walls`
@OPCODE_194:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:70:13 in `draw-walls`
@OPCODE_195:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:70:13 in `draw-walls`
@OPCODE_196:   ; [c64_ir] LoopTarget(19)

@target_20:

; src/prelude.fth:4:13 in `over`
@OPCODE_198:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_199:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_200:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_201:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_202:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_203:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_204:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_205:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_206:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_207:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_208:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:71:21 in `draw-walls`
@OPCODE_209:   ; [c64_ir] Add
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

; snake.pax:49:34 in `draw-index`
@OPCODE_210:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_211:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_212:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_213:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_214:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_215:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_216:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_217:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_218:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_219:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_220:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_221:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_222:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_223:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_224:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_225:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_226:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_227:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_228:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_229:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_230:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_231:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_232:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_233:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_234:   ; [c64_ir] JumpIf0(22)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_22

@target_21:

; src/prelude.fth:21:11 in `0=`
@OPCODE_236:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_237:   ; [c64_ir] JumpElse(23)
    jmp @target_23

@target_22:

; src/prelude.fth:21:18 in `0=`
@OPCODE_239:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_240:   ; [c64_ir] JumpTarget(22)

@target_23:

; src/prelude.fth:3:10 in `swap`
@OPCODE_242:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_243:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:72:5 in `draw-walls`
@OPCODE_244:   ; [c64_ir] LoopIf0(20)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_20

@target_24:

; snake.pax:72:5 in `draw-walls`
@OPCODE_246:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:72:5 in `draw-walls`
@OPCODE_247:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:72:5 in `draw-walls`
@OPCODE_248:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:72:5 in `draw-walls`
@OPCODE_249:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:73:5 in `draw-walls`
@OPCODE_250:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:74:5 in `draw-walls`
@OPCODE_251:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:74:11 in `draw-walls`
@OPCODE_252:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:74:13 in `draw-walls`
@OPCODE_253:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:74:13 in `draw-walls`
@OPCODE_254:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:74:13 in `draw-walls`
@OPCODE_255:   ; [c64_ir] LoopTarget(24)

@target_25:

; snake.pax:75:9 in `draw-walls`
@OPCODE_257:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_258:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_259:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_260:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_261:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_262:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_263:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_264:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:49:34 in `draw-index`
@OPCODE_265:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_266:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_267:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_268:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_269:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_270:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_271:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_272:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_273:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_274:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_275:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_276:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_277:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_278:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_279:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_280:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_281:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_282:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_283:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_284:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_285:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_286:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_287:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_288:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_289:   ; [c64_ir] JumpIf0(27)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_27

@target_26:

; src/prelude.fth:21:11 in `0=`
@OPCODE_291:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_292:   ; [c64_ir] JumpElse(28)
    jmp @target_28

@target_27:

; src/prelude.fth:21:18 in `0=`
@OPCODE_294:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_295:   ; [c64_ir] JumpTarget(27)

@target_28:

; src/prelude.fth:3:10 in `swap`
@OPCODE_297:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_298:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:76:5 in `draw-walls`
@OPCODE_299:   ; [c64_ir] LoopIf0(25)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_25

@target_29:

; snake.pax:76:5 in `draw-walls`
@OPCODE_301:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:76:5 in `draw-walls`
@OPCODE_302:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:76:5 in `draw-walls`
@OPCODE_303:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:76:5 in `draw-walls`
@OPCODE_304:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:78:5 in `draw-walls`
@OPCODE_305:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:78:11 in `draw-walls`
@OPCODE_306:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_307:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_308:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_309:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_310:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_311:   ; [c64_ir] Add
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

; snake.pax:79:5 in `draw-walls`
@OPCODE_312:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:79:12 in `draw-walls`
@OPCODE_313:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:79:14 in `draw-walls`
@OPCODE_314:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:79:14 in `draw-walls`
@OPCODE_315:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:79:14 in `draw-walls`
@OPCODE_316:   ; [c64_ir] LoopTarget(29)

@target_30:

; src/prelude.fth:4:13 in `over`
@OPCODE_318:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_319:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_320:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_321:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:49:34 in `draw-index`
@OPCODE_322:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_323:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_324:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:81:9 in `draw-walls`
@OPCODE_325:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:81:15 in `draw-walls`
@OPCODE_326:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_327:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_328:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_329:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_330:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_331:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_332:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_333:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_334:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_335:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_336:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_337:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_338:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_339:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_340:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_341:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_342:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_343:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_344:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_345:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_346:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_347:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_348:   ; [c64_ir] JumpIf0(32)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_32

@target_31:

; src/prelude.fth:21:11 in `0=`
@OPCODE_350:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_351:   ; [c64_ir] JumpElse(33)
    jmp @target_33

@target_32:

; src/prelude.fth:21:18 in `0=`
@OPCODE_353:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_354:   ; [c64_ir] JumpTarget(32)

@target_33:

; src/prelude.fth:3:10 in `swap`
@OPCODE_356:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_357:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:82:5 in `draw-walls`
@OPCODE_358:   ; [c64_ir] LoopIf0(30)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_30

@target_34:

; snake.pax:82:5 in `draw-walls`
@OPCODE_360:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:82:5 in `draw-walls`
@OPCODE_361:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:82:5 in `draw-walls`
@OPCODE_362:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:82:5 in `draw-walls`
@OPCODE_363:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:83:5 in `draw-walls`
@OPCODE_364:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:84:5 in `draw-walls`
@OPCODE_365:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:84:12 in `draw-walls`
@OPCODE_366:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:84:14 in `draw-walls`
@OPCODE_367:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:84:14 in `draw-walls`
@OPCODE_368:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:84:14 in `draw-walls`
@OPCODE_369:   ; [c64_ir] LoopTarget(34)

@target_35:

; src/prelude.fth:4:13 in `over`
@OPCODE_371:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_372:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_373:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_374:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:49:34 in `draw-index`
@OPCODE_375:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_376:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_377:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:86:9 in `draw-walls`
@OPCODE_378:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:86:15 in `draw-walls`
@OPCODE_379:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_380:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_381:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_382:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_383:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_384:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_385:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_386:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_387:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_388:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_389:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_390:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_391:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_392:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_393:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_394:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_395:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_396:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_397:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_398:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_399:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_400:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_401:   ; [c64_ir] JumpIf0(37)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_37

@target_36:

; src/prelude.fth:21:11 in `0=`
@OPCODE_403:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_404:   ; [c64_ir] JumpElse(38)
    jmp @target_38

@target_37:

; src/prelude.fth:21:18 in `0=`
@OPCODE_406:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_407:   ; [c64_ir] JumpTarget(37)

@target_38:

; src/prelude.fth:3:10 in `swap`
@OPCODE_409:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_410:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:87:5 in `draw-walls`
@OPCODE_411:   ; [c64_ir] LoopIf0(35)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_35

@target_39:

; snake.pax:87:5 in `draw-walls`
@OPCODE_413:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:87:5 in `draw-walls`
@OPCODE_414:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:87:5 in `draw-walls`
@OPCODE_415:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:87:5 in `draw-walls`
@OPCODE_416:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_417:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_418:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_419:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_420:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:91:3 in `initialize-snake`
@OPCODE_421:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:91:5 in `initialize-snake`
@OPCODE_422:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:91:12 in `initialize-snake`
@OPCODE_423:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:92:3 in `initialize-snake`
@OPCODE_424:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:92:10 in `initialize-snake`
@OPCODE_425:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:92:12 in `initialize-snake`
@OPCODE_426:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:92:14 in `initialize-snake`
@OPCODE_427:   ; [c64_ir] Add
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

; snake.pax:92:16 in `initialize-snake`
@OPCODE_428:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:92:18 in `initialize-snake`
@OPCODE_429:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:92:18 in `initialize-snake`
@OPCODE_430:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:92:18 in `initialize-snake`
@OPCODE_431:   ; [c64_ir] LoopTarget(39)

@target_40:

; snake.pax:93:5 in `initialize-snake`
@OPCODE_433:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_434:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_435:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_436:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_437:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_438:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_439:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_440:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_441:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_442:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_443:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_444:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_445:   ; [c64_ir] Add
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

; src/prelude.fth:38:8 in `i`
@OPCODE_446:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_447:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_448:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_449:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_450:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_451:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_452:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_453:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_454:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_455:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_456:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_457:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:42:22 in `snake-x`
@OPCODE_458:   ; [c64_ir] Add
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

; snake.pax:93:21 in `initialize-snake`
@OPCODE_459:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:94:5 in `initialize-snake`
@OPCODE_460:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_461:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_462:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_463:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_464:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_465:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_466:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_467:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_468:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_469:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_470:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_471:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_472:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:45:22 in `snake-y`
@OPCODE_473:   ; [c64_ir] Add
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

; snake.pax:94:17 in `initialize-snake`
@OPCODE_474:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_475:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_476:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_477:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_478:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_479:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_480:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_481:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_482:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_483:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_484:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_485:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_486:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_487:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_488:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_489:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_490:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_491:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_492:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_493:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_494:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_495:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_496:   ; [c64_ir] JumpIf0(42)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_42

@target_41:

; src/prelude.fth:21:11 in `0=`
@OPCODE_498:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_499:   ; [c64_ir] JumpElse(43)
    jmp @target_43

@target_42:

; src/prelude.fth:21:18 in `0=`
@OPCODE_501:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_502:   ; [c64_ir] JumpTarget(42)

@target_43:

; src/prelude.fth:3:10 in `swap`
@OPCODE_504:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_505:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:95:3 in `initialize-snake`
@OPCODE_506:   ; [c64_ir] LoopIf0(40)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_40

@target_44:

; snake.pax:95:3 in `initialize-snake`
@OPCODE_508:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:95:3 in `initialize-snake`
@OPCODE_509:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:95:3 in `initialize-snake`
@OPCODE_510:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:95:3 in `initialize-snake`
@OPCODE_511:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:96:3 in `initialize-snake`
@OPCODE_512:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:96:9 in `initialize-snake`
@OPCODE_513:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:96:19 in `initialize-snake`
@OPCODE_514:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_515:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_516:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:100:21 in `initialize-apple`
@OPCODE_517:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:100:23 in `initialize-apple`
@OPCODE_518:   ; [c64_ir] PushLiteral(13)
    inx
    inx
    lda #13
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:98:22 in `set-apple-position`
@OPCODE_519:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:98:30 in `set-apple-position`
@OPCODE_520:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:98:32 in `set-apple-position`
@OPCODE_521:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:98:40 in `set-apple-position`
@OPCODE_522:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_523:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_524:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:103:3 in `draw-full-snake`
@OPCODE_525:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:103:10 in `draw-full-snake`
@OPCODE_526:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:103:12 in `draw-full-snake`
@OPCODE_527:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:103:14 in `draw-full-snake`
@OPCODE_528:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:103:14 in `draw-full-snake`
@OPCODE_529:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:103:14 in `draw-full-snake`
@OPCODE_530:   ; [c64_ir] LoopTarget(44)

@target_45:

; src/prelude.fth:38:8 in `i`
@OPCODE_532:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_533:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_534:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_535:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_536:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_537:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_538:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_539:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_540:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_541:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_542:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_543:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:42:22 in `snake-x`
@OPCODE_544:   ; [c64_ir] Add
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

; snake.pax:104:15 in `draw-full-snake`
@OPCODE_545:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_546:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_547:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_548:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_549:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_550:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_551:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_552:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_553:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_554:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_555:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_556:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_557:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:45:22 in `snake-y`
@OPCODE_558:   ; [c64_ir] Add
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

; snake.pax:104:27 in `draw-full-snake`
@OPCODE_559:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_560:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_561:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_562:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_563:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_564:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_565:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:3:13 in `swap`
@OPCODE_566:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:22 in `swap`
@OPCODE_567:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:10 in `rot`
@OPCODE_568:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_569:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_570:   ; [c64_ir] PushLiteral(232)
    inx
    inx
    lda #232
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_571:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_572:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_573:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_574:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_575:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_576:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_577:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_578:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_579:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_580:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_581:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_582:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_583:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_584:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_585:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_586:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_587:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_588:   ; [c64_ir] LoopTarget(45)

@target_46:

; src/prelude.fth:4:10 in `over`
@OPCODE_590:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_591:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_592:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_593:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_594:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:44:23 in `*`
@OPCODE_595:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_596:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_597:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_598:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_599:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_600:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_601:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_602:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_603:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_604:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_605:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_606:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_607:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_608:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_609:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_610:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_611:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_612:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_613:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_614:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_615:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_616:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_617:   ; [c64_ir] JumpIf0(48)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_48

@target_47:

; src/prelude.fth:21:11 in `0=`
@OPCODE_619:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_620:   ; [c64_ir] JumpElse(49)
    jmp @target_49

@target_48:

; src/prelude.fth:21:18 in `0=`
@OPCODE_622:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_623:   ; [c64_ir] JumpTarget(48)

@target_49:

; src/prelude.fth:3:10 in `swap`
@OPCODE_625:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_626:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_627:   ; [c64_ir] LoopIf0(46)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_46

@target_50:

; src/prelude.fth:44:25 in `*`
@OPCODE_629:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_630:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_631:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_632:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:3:10 in `swap`
@OPCODE_633:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_634:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_635:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_636:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_637:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:48:39 in `convert-x-y`
@OPCODE_638:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_639:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_640:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:49:34 in `draw-index`
@OPCODE_641:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_642:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_643:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_644:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_645:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_646:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_647:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_648:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_649:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_650:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_651:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_652:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_653:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_654:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_655:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_656:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_657:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_658:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_659:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_660:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_661:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_662:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_663:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_664:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_665:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_666:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_667:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_668:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_669:   ; [c64_ir] JumpIf0(52)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_52

@target_51:

; src/prelude.fth:21:11 in `0=`
@OPCODE_671:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_672:   ; [c64_ir] JumpElse(53)
    jmp @target_53

@target_52:

; src/prelude.fth:21:18 in `0=`
@OPCODE_674:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_675:   ; [c64_ir] JumpTarget(52)

@target_53:

; src/prelude.fth:3:10 in `swap`
@OPCODE_677:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_678:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:105:3 in `draw-full-snake`
@OPCODE_679:   ; [c64_ir] LoopIf0(45)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_45

@target_54:

; snake.pax:105:3 in `draw-full-snake`
@OPCODE_681:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:105:3 in `draw-full-snake`
@OPCODE_682:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:105:3 in `draw-full-snake`
@OPCODE_683:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:105:3 in `draw-full-snake`
@OPCODE_684:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_685:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_686:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_687:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_688:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:205:32 in `main`
@OPCODE_689:   ; [c64_ir] JumpTarget(54)

@target_55:

; snake.pax:206:1 in `main`
@OPCODE_691:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:206:3 in `main`
@OPCODE_692:   ; [c64_ir] PushLiteral(-28672)
    inx
    inx
    lda #0
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:206:15 in `main`
@OPCODE_693:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_694:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_695:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:16 in `dup`
@OPCODE_696:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_697:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_698:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_699:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:42:22 in `snake-x`
@OPCODE_700:   ; [c64_ir] Add
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

; snake.pax:195:13 in `draw-snake-head-tail`
@OPCODE_701:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:16 in `dup`
@OPCODE_702:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_703:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_704:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_705:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:45:22 in `snake-y`
@OPCODE_706:   ; [c64_ir] Add
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

; snake.pax:195:25 in `draw-snake-head-tail`
@OPCODE_707:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_708:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_709:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_710:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_711:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_712:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_713:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:3:13 in `swap`
@OPCODE_714:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:22 in `swap`
@OPCODE_715:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:10 in `rot`
@OPCODE_716:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_717:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_718:   ; [c64_ir] PushLiteral(232)
    inx
    inx
    lda #232
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_719:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_720:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_721:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_722:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_723:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_724:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_725:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_726:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_727:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_728:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_729:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_730:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_731:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_732:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_733:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_734:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_735:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_736:   ; [c64_ir] LoopTarget(55)

@target_56:

; src/prelude.fth:4:10 in `over`
@OPCODE_738:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_739:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_740:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_741:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_742:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:44:23 in `*`
@OPCODE_743:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_744:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_745:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_746:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_747:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_748:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_749:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_750:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_751:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_752:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_753:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_754:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_755:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_756:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_757:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_758:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_759:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_760:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_761:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_762:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_763:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_764:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_765:   ; [c64_ir] JumpIf0(58)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_58

@target_57:

; src/prelude.fth:21:11 in `0=`
@OPCODE_767:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_768:   ; [c64_ir] JumpElse(59)
    jmp @target_59

@target_58:

; src/prelude.fth:21:18 in `0=`
@OPCODE_770:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_771:   ; [c64_ir] JumpTarget(58)

@target_59:

; src/prelude.fth:3:10 in `swap`
@OPCODE_773:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_774:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_775:   ; [c64_ir] LoopIf0(56)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_56

@target_60:

; src/prelude.fth:44:25 in `*`
@OPCODE_777:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_778:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_779:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_780:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:3:10 in `swap`
@OPCODE_781:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_782:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_783:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_784:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_785:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:48:39 in `convert-x-y`
@OPCODE_786:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_787:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_788:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:49:34 in `draw-index`
@OPCODE_789:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_790:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_791:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_792:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_793:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_794:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_795:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:196:3 in `draw-snake-head-tail`
@OPCODE_796:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:196:10 in `draw-snake-head-tail`
@OPCODE_797:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_798:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_799:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_800:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_801:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_802:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:42:22 in `snake-x`
@OPCODE_803:   ; [c64_ir] Add
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

; snake.pax:196:20 in `draw-snake-head-tail`
@OPCODE_804:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:197:3 in `draw-snake-head-tail`
@OPCODE_805:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:197:10 in `draw-snake-head-tail`
@OPCODE_806:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_807:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_808:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_809:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_810:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_811:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:45:22 in `snake-y`
@OPCODE_812:   ; [c64_ir] Add
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

; snake.pax:197:20 in `draw-snake-head-tail`
@OPCODE_813:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_814:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_815:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_816:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_817:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_818:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_819:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:3:13 in `swap`
@OPCODE_820:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:22 in `swap`
@OPCODE_821:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:10 in `rot`
@OPCODE_822:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_823:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_824:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_825:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_826:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_827:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_828:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_829:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_830:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_831:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_832:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_833:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_834:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_835:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_836:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_837:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_838:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_839:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_840:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_841:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_842:   ; [c64_ir] LoopTarget(60)

@target_61:

; src/prelude.fth:4:10 in `over`
@OPCODE_844:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_845:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_846:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_847:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_848:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:44:23 in `*`
@OPCODE_849:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_850:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_851:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_852:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_853:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_854:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_855:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_856:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_857:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_858:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_859:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_860:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_861:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_862:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_863:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_864:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_865:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_866:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_867:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_868:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_869:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_870:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_871:   ; [c64_ir] JumpIf0(63)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_63

@target_62:

; src/prelude.fth:21:11 in `0=`
@OPCODE_873:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_874:   ; [c64_ir] JumpElse(64)
    jmp @target_64

@target_63:

; src/prelude.fth:21:18 in `0=`
@OPCODE_876:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_877:   ; [c64_ir] JumpTarget(63)

@target_64:

; src/prelude.fth:3:10 in `swap`
@OPCODE_879:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_880:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_881:   ; [c64_ir] LoopIf0(61)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_61

@target_65:

; src/prelude.fth:44:25 in `*`
@OPCODE_883:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_884:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_885:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_886:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:3:10 in `swap`
@OPCODE_887:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_888:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_889:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_890:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_891:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:48:39 in `convert-x-y`
@OPCODE_892:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_893:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_894:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:49:34 in `draw-index`
@OPCODE_895:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_896:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_897:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_898:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_899:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_900:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_901:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_902:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_903:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_904:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_905:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:201:3 in `draw-apple`
@OPCODE_906:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:201:11 in `draw-apple`
@OPCODE_907:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:201:13 in `draw-apple`
@OPCODE_908:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:201:21 in `draw-apple`
@OPCODE_909:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_910:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_911:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_912:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_913:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_914:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_915:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:3:13 in `swap`
@OPCODE_916:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:22 in `swap`
@OPCODE_917:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:10 in `rot`
@OPCODE_918:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_919:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_920:   ; [c64_ir] PushLiteral(233)
    inx
    inx
    lda #233
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_921:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_922:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_923:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_924:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_925:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_926:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_927:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_928:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_929:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_930:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_931:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_932:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_933:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_934:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_935:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_936:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_937:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_938:   ; [c64_ir] LoopTarget(65)

@target_66:

; src/prelude.fth:4:10 in `over`
@OPCODE_940:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_941:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_942:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_943:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_944:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:44:23 in `*`
@OPCODE_945:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_946:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_947:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_948:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_949:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_950:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_951:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_952:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_953:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_954:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_955:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_956:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_957:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_958:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_959:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_960:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_961:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_962:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_963:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_964:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_965:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_966:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_967:   ; [c64_ir] JumpIf0(68)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_68

@target_67:

; src/prelude.fth:21:11 in `0=`
@OPCODE_969:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_970:   ; [c64_ir] JumpElse(69)
    jmp @target_69

@target_68:

; src/prelude.fth:21:18 in `0=`
@OPCODE_972:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_973:   ; [c64_ir] JumpTarget(68)

@target_69:

; src/prelude.fth:3:10 in `swap`
@OPCODE_975:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_976:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_977:   ; [c64_ir] LoopIf0(66)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_66

@target_70:

; src/prelude.fth:44:25 in `*`
@OPCODE_979:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_980:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_981:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_982:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:3:10 in `swap`
@OPCODE_983:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_984:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_985:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_986:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_987:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:48:39 in `convert-x-y`
@OPCODE_988:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_989:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_990:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:49:34 in `draw-index`
@OPCODE_991:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_992:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_993:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_994:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_995:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_996:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_997:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_998:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_999:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1000:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1001:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:160:3 in `check-input`
@OPCODE_1002:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:160:12 in `check-input`
@OPCODE_1003:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1004:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1005:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1006:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1007:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1008:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1009:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1010:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1011:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1012:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1013:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1014:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1015:   ; [c64_ir] JumpIf0(72)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_72

@target_71:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1017:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1018:   ; [c64_ir] JumpElse(73)
    jmp @target_73

@target_72:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1020:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1021:   ; [c64_ir] JumpTarget(72)

@target_73:

; snake.pax:153:15 in `change-direction`
@OPCODE_1023:   ; [c64_ir] JumpIf0(83)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_83

@target_74:

; <inline>:0:0 in `main`
@OPCODE_1025:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1026:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1027:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1028:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:143:16 in `is-vertical`
@OPCODE_1029:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:143:26 in `is-vertical`
@OPCODE_1030:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_1031:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1032:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1033:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:144:3 in `is-vertical`
@OPCODE_1034:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1035:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1036:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1037:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1038:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1039:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1040:   ; [c64_ir] JumpIf0(76)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_76

@target_75:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1042:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1043:   ; [c64_ir] JumpElse(77)
    jmp @target_77

@target_76:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1045:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1046:   ; [c64_ir] JumpTarget(76)

@target_77:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1048:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1049:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1050:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1051:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:145:3 in `is-vertical`
@OPCODE_1052:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1053:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1054:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1055:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1056:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1057:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1058:   ; [c64_ir] JumpIf0(79)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_79

@target_78:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1060:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1061:   ; [c64_ir] JumpElse(80)
    jmp @target_80

@target_79:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1063:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1064:   ; [c64_ir] JumpTarget(79)

@target_80:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1066:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1067:   ; [c64_ir] Nand
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

; src/prelude.fth:3:10 in `swap`
@OPCODE_1068:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1069:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1070:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1071:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1072:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1073:   ; [c64_ir] Nand
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

; src/prelude.fth:26:27 in `or`
@OPCODE_1074:   ; [c64_ir] Nand
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

; <inline>:0:0 in `main`
@OPCODE_1075:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1076:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:148:27 in `turn-left`
@OPCODE_1077:   ; [c64_ir] JumpIf0(82)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_82

@target_81:

; snake.pax:148:30 in `turn-left`
@OPCODE_1079:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:148:35 in `turn-left`
@OPCODE_1080:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:148:45 in `turn-left`
@OPCODE_1081:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:148:47 in `turn-left`
@OPCODE_1082:   ; [c64_ir] JumpTarget(81)

@target_82:

; <inline>:0:0 in `main`
@OPCODE_1084:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1085:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:153:28 in `change-direction`
@OPCODE_1086:   ; [c64_ir] JumpElse(125)
    jmp @target_125

@target_83:

; src/prelude.fth:4:13 in `over`
@OPCODE_1088:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1089:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1090:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1091:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1092:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1093:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1094:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1095:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1096:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1097:   ; [c64_ir] JumpIf0(85)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_85

@target_84:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1099:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1100:   ; [c64_ir] JumpElse(86)
    jmp @target_86

@target_85:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1102:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1103:   ; [c64_ir] JumpTarget(85)

@target_86:

; snake.pax:154:13 in `change-direction`
@OPCODE_1105:   ; [c64_ir] JumpIf0(96)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_96

@target_87:

; <inline>:0:0 in `main`
@OPCODE_1107:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1108:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1109:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1110:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:139:18 in `is-horizontal`
@OPCODE_1111:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:139:28 in `is-horizontal`
@OPCODE_1112:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_1113:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1114:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1115:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:140:3 in `is-horizontal`
@OPCODE_1116:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1117:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1118:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1119:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1120:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1121:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1122:   ; [c64_ir] JumpIf0(89)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_89

@target_88:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1124:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1125:   ; [c64_ir] JumpElse(90)
    jmp @target_90

@target_89:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1127:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1128:   ; [c64_ir] JumpTarget(89)

@target_90:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1130:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1131:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1132:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1133:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:141:3 in `is-horizontal`
@OPCODE_1134:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1135:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1136:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1137:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1138:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1139:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1140:   ; [c64_ir] JumpIf0(92)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_92

@target_91:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1142:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1143:   ; [c64_ir] JumpElse(93)
    jmp @target_93

@target_92:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1145:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1146:   ; [c64_ir] JumpTarget(92)

@target_93:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1148:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1149:   ; [c64_ir] Nand
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

; src/prelude.fth:3:10 in `swap`
@OPCODE_1150:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1151:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1152:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1153:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1154:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1155:   ; [c64_ir] Nand
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

; src/prelude.fth:26:27 in `or`
@OPCODE_1156:   ; [c64_ir] Nand
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

; <inline>:0:0 in `main`
@OPCODE_1157:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1158:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:147:29 in `turn-up`
@OPCODE_1159:   ; [c64_ir] JumpIf0(95)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_95

@target_94:

; snake.pax:147:32 in `turn-up`
@OPCODE_1161:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:147:35 in `turn-up`
@OPCODE_1162:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:147:45 in `turn-up`
@OPCODE_1163:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:147:47 in `turn-up`
@OPCODE_1164:   ; [c64_ir] JumpTarget(94)

@target_95:

; <inline>:0:0 in `main`
@OPCODE_1166:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1167:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:154:24 in `change-direction`
@OPCODE_1168:   ; [c64_ir] JumpElse(124)
    jmp @target_124

@target_96:

; src/prelude.fth:4:13 in `over`
@OPCODE_1170:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1171:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1172:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1173:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1174:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1175:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1176:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1177:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1178:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1179:   ; [c64_ir] JumpIf0(98)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_98

@target_97:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1181:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1182:   ; [c64_ir] JumpElse(99)
    jmp @target_99

@target_98:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1184:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1185:   ; [c64_ir] JumpTarget(98)

@target_99:

; snake.pax:155:16 in `change-direction`
@OPCODE_1187:   ; [c64_ir] JumpIf0(109)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_109

@target_100:

; <inline>:0:0 in `main`
@OPCODE_1189:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1190:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1191:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1192:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:143:16 in `is-vertical`
@OPCODE_1193:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:143:26 in `is-vertical`
@OPCODE_1194:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_1195:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1196:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1197:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:144:3 in `is-vertical`
@OPCODE_1198:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1199:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1200:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1201:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1202:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1203:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1204:   ; [c64_ir] JumpIf0(102)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_102

@target_101:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1206:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1207:   ; [c64_ir] JumpElse(103)
    jmp @target_103

@target_102:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1209:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1210:   ; [c64_ir] JumpTarget(102)

@target_103:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1212:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1213:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1214:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1215:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:145:3 in `is-vertical`
@OPCODE_1216:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1217:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1218:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1219:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1220:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1221:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1222:   ; [c64_ir] JumpIf0(105)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_105

@target_104:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1224:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1225:   ; [c64_ir] JumpElse(106)
    jmp @target_106

@target_105:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1227:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1228:   ; [c64_ir] JumpTarget(105)

@target_106:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1230:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1231:   ; [c64_ir] Nand
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

; src/prelude.fth:3:10 in `swap`
@OPCODE_1232:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1233:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1234:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1235:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1236:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1237:   ; [c64_ir] Nand
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

; src/prelude.fth:26:27 in `or`
@OPCODE_1238:   ; [c64_ir] Nand
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

; <inline>:0:0 in `main`
@OPCODE_1239:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1240:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:150:27 in `turn-right`
@OPCODE_1241:   ; [c64_ir] JumpIf0(108)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_108

@target_107:

; snake.pax:150:30 in `turn-right`
@OPCODE_1243:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:150:36 in `turn-right`
@OPCODE_1244:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:150:46 in `turn-right`
@OPCODE_1245:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:150:48 in `turn-right`
@OPCODE_1246:   ; [c64_ir] JumpTarget(107)

@target_108:

; <inline>:0:0 in `main`
@OPCODE_1248:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1249:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:155:30 in `change-direction`
@OPCODE_1250:   ; [c64_ir] JumpElse(123)
    jmp @target_123

@target_109:

; src/prelude.fth:4:13 in `over`
@OPCODE_1252:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1253:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1254:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1255:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1256:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1257:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1258:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1259:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1260:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1261:   ; [c64_ir] JumpIf0(111)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_111

@target_110:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1263:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1264:   ; [c64_ir] JumpElse(112)
    jmp @target_112

@target_111:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1266:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1267:   ; [c64_ir] JumpTarget(111)

@target_112:

; snake.pax:156:15 in `change-direction`
@OPCODE_1269:   ; [c64_ir] JumpIf0(122)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_122

@target_113:

; <inline>:0:0 in `main`
@OPCODE_1271:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1272:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1273:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1274:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:139:18 in `is-horizontal`
@OPCODE_1275:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:139:28 in `is-horizontal`
@OPCODE_1276:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_1277:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1278:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1279:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:140:3 in `is-horizontal`
@OPCODE_1280:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1281:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1282:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1283:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1284:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1285:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1286:   ; [c64_ir] JumpIf0(115)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_115

@target_114:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1288:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1289:   ; [c64_ir] JumpElse(116)
    jmp @target_116

@target_115:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1291:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1292:   ; [c64_ir] JumpTarget(115)

@target_116:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1294:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1295:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1296:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1297:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:141:3 in `is-horizontal`
@OPCODE_1298:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1299:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1300:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1301:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1302:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1303:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1304:   ; [c64_ir] JumpIf0(118)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_118

@target_117:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1306:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1307:   ; [c64_ir] JumpElse(119)
    jmp @target_119

@target_118:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1309:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1310:   ; [c64_ir] JumpTarget(118)

@target_119:

; src/prelude.fth:14:12 in `invert`
@OPCODE_1312:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1313:   ; [c64_ir] Nand
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

; src/prelude.fth:3:10 in `swap`
@OPCODE_1314:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1315:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1316:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1317:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1318:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1319:   ; [c64_ir] Nand
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

; src/prelude.fth:26:27 in `or`
@OPCODE_1320:   ; [c64_ir] Nand
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

; <inline>:0:0 in `main`
@OPCODE_1321:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1322:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:149:29 in `turn-down`
@OPCODE_1323:   ; [c64_ir] JumpIf0(121)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_121

@target_120:

; snake.pax:149:32 in `turn-down`
@OPCODE_1325:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:149:37 in `turn-down`
@OPCODE_1326:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:149:47 in `turn-down`
@OPCODE_1327:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:149:49 in `turn-down`
@OPCODE_1328:   ; [c64_ir] JumpTarget(120)

@target_121:

; <inline>:0:0 in `main`
@OPCODE_1330:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1331:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:157:3 in `change-direction`
@OPCODE_1332:   ; [c64_ir] JumpTarget(121)

@target_122:

; snake.pax:157:8 in `change-direction`
@OPCODE_1334:   ; [c64_ir] JumpTarget(122)

@target_123:

; snake.pax:157:13 in `change-direction`
@OPCODE_1336:   ; [c64_ir] JumpTarget(123)

@target_124:

; snake.pax:157:18 in `change-direction`
@OPCODE_1338:   ; [c64_ir] JumpTarget(124)

@target_125:

; snake.pax:157:23 in `change-direction`
@OPCODE_1340:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1341:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1342:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:161:3 in `check-input`
@OPCODE_1343:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:161:5 in `check-input`
@OPCODE_1344:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:161:14 in `check-input`
@OPCODE_1345:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1346:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1347:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1348:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1349:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:133:3 in `move-snake-tail`
@OPCODE_1350:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; snake.pax:133:6 in `move-snake-tail`
@OPCODE_1351:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:133:13 in `move-snake-tail`
@OPCODE_1352:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:133:15 in `move-snake-tail`
@OPCODE_1353:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:133:15 in `move-snake-tail`
@OPCODE_1354:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:133:15 in `move-snake-tail`
@OPCODE_1355:   ; [c64_ir] LoopTarget(125)

@target_126:

; src/prelude.fth:38:8 in `i`
@OPCODE_1357:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1358:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1359:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_1360:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_1361:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_1362:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:8 in `i`
@OPCODE_1363:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1364:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1365:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_1366:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_1367:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_1368:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_1369:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_1370:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1371:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1372:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_1373:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_1374:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:42:22 in `snake-x`
@OPCODE_1375:   ; [c64_ir] Add
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

; snake.pax:134:24 in `move-snake-tail`
@OPCODE_1376:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_1377:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1378:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1379:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_1380:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_1381:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_1382:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_1383:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:134:28 in `move-snake-tail`
@OPCODE_1384:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:134:30 in `move-snake-tail`
@OPCODE_1385:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1386:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1387:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1388:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_1389:   ; [c64_ir] Add
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

; snake.pax:42:9 in `snake-x`
@OPCODE_1390:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:42:22 in `snake-x`
@OPCODE_1391:   ; [c64_ir] Add
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

; snake.pax:134:40 in `move-snake-tail`
@OPCODE_1392:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; src/prelude.fth:38:8 in `i`
@OPCODE_1393:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1394:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1395:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_1396:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_1397:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_1398:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_1399:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:10 in `dup`
@OPCODE_1400:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1401:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1402:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_1403:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_1404:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:45:22 in `snake-y`
@OPCODE_1405:   ; [c64_ir] Add
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

; snake.pax:135:17 in `move-snake-tail`
@OPCODE_1406:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_1407:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1408:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1409:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_1410:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_1411:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_1412:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_1413:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; snake.pax:135:21 in `move-snake-tail`
@OPCODE_1414:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:135:23 in `move-snake-tail`
@OPCODE_1415:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1416:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1417:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1418:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:41:13 in `cells`
@OPCODE_1419:   ; [c64_ir] Add
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

; snake.pax:45:9 in `snake-y`
@OPCODE_1420:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:45:22 in `snake-y`
@OPCODE_1421:   ; [c64_ir] Add
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

; snake.pax:135:33 in `move-snake-tail`
@OPCODE_1422:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; src/prelude.fth:35:21 in `-loopimpl`
@OPCODE_1423:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1424:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_1425:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:35:29 in `-loopimpl`
@OPCODE_1426:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1427:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_1428:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1429:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1430:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1431:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1432:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1433:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1434:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_1435:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1436:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1437:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1438:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1439:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_1440:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1441:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1442:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1443:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1444:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:35:44 in `-loopimpl`
@OPCODE_1445:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:35:47 in `-loopimpl`
@OPCODE_1446:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_1447:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1448:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1449:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1450:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1451:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1452:   ; [c64_ir] JumpIf0(128)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_128

@target_127:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1454:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1455:   ; [c64_ir] JumpElse(129)
    jmp @target_129

@target_128:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1457:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1458:   ; [c64_ir] JumpTarget(128)

@target_129:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1460:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_1461:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:136:5 in `move-snake-tail`
@OPCODE_1462:   ; [c64_ir] LoopIf0(126)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_126

@target_130:

; snake.pax:136:5 in `move-snake-tail`
@OPCODE_1464:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:136:5 in `move-snake-tail`
@OPCODE_1465:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:136:5 in `move-snake-tail`
@OPCODE_1466:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.pax:136:5 in `move-snake-tail`
@OPCODE_1467:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1468:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1469:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1470:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1471:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:124:20 in `move-snake-head`
@OPCODE_1472:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:124:30 in `move-snake-head`
@OPCODE_1473:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:13 in `over`
@OPCODE_1474:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1475:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1476:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1477:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1478:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1479:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1480:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1481:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1482:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1483:   ; [c64_ir] JumpIf0(132)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_132

@target_131:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1485:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1486:   ; [c64_ir] JumpElse(133)
    jmp @target_133

@target_132:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1488:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1489:   ; [c64_ir] JumpTarget(132)

@target_133:

; snake.pax:125:16 in `move-snake-head`
@OPCODE_1491:   ; [c64_ir] JumpIf0(135)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_135

@target_134:

; snake.pax:120:14 in `move-left`
@OPCODE_1493:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:6:16 in `dup`
@OPCODE_1494:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; src/prelude.fth:20:15 in `+!`
@OPCODE_1495:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_1496:   ; [c64_ir] Add
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
@OPCODE_1497:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_1498:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:125:29 in `move-snake-head`
@OPCODE_1499:   ; [c64_ir] JumpElse(153)
    jmp @target_153

@target_135:

; src/prelude.fth:4:13 in `over`
@OPCODE_1501:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1502:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1503:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1504:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1505:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1506:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1507:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1508:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1509:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1510:   ; [c64_ir] JumpIf0(137)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_137

@target_136:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1512:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1513:   ; [c64_ir] JumpElse(138)
    jmp @target_138

@target_137:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1515:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1516:   ; [c64_ir] JumpTarget(137)

@target_138:

; snake.pax:126:16 in `move-snake-head`
@OPCODE_1518:   ; [c64_ir] JumpIf0(140)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_140

@target_139:

; snake.pax:119:12 in `move-up`
@OPCODE_1520:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:6:16 in `dup`
@OPCODE_1521:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; src/prelude.fth:20:15 in `+!`
@OPCODE_1522:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_1523:   ; [c64_ir] Add
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
@OPCODE_1524:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_1525:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:126:27 in `move-snake-head`
@OPCODE_1526:   ; [c64_ir] JumpElse(152)
    jmp @target_152

@target_140:

; src/prelude.fth:4:13 in `over`
@OPCODE_1528:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1529:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1530:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1531:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1532:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1533:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1534:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1535:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1536:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1537:   ; [c64_ir] JumpIf0(142)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_142

@target_141:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1539:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1540:   ; [c64_ir] JumpElse(143)
    jmp @target_143

@target_142:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1542:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1543:   ; [c64_ir] JumpTarget(142)

@target_143:

; snake.pax:127:16 in `move-snake-head`
@OPCODE_1545:   ; [c64_ir] JumpIf0(145)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_145

@target_144:

; snake.pax:122:15 in `move-right`
@OPCODE_1547:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:16 in `dup`
@OPCODE_1548:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; src/prelude.fth:20:15 in `+!`
@OPCODE_1549:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_1550:   ; [c64_ir] Add
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
@OPCODE_1551:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_1552:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:127:30 in `move-snake-head`
@OPCODE_1553:   ; [c64_ir] JumpElse(151)
    jmp @target_151

@target_145:

; src/prelude.fth:4:13 in `over`
@OPCODE_1555:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1556:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1557:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1558:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1559:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1560:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1561:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1562:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1563:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1564:   ; [c64_ir] JumpIf0(147)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_147

@target_146:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1566:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1567:   ; [c64_ir] JumpElse(148)
    jmp @target_148

@target_147:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1569:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1570:   ; [c64_ir] JumpTarget(147)

@target_148:

; snake.pax:128:16 in `move-snake-head`
@OPCODE_1572:   ; [c64_ir] JumpIf0(150)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_150

@target_149:

; snake.pax:121:14 in `move-down`
@OPCODE_1574:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:16 in `dup`
@OPCODE_1575:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; src/prelude.fth:20:15 in `+!`
@OPCODE_1576:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_1577:   ; [c64_ir] Add
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
@OPCODE_1578:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_1579:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:129:3 in `move-snake-head`
@OPCODE_1580:   ; [c64_ir] JumpTarget(149)

@target_150:

; snake.pax:129:8 in `move-snake-head`
@OPCODE_1582:   ; [c64_ir] JumpTarget(150)

@target_151:

; snake.pax:129:13 in `move-snake-head`
@OPCODE_1584:   ; [c64_ir] JumpTarget(151)

@target_152:

; snake.pax:129:18 in `move-snake-head`
@OPCODE_1586:   ; [c64_ir] JumpTarget(152)

@target_153:

; snake.pax:129:23 in `move-snake-head`
@OPCODE_1588:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1589:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1590:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1591:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1592:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:177:3 in `check-apple`
@OPCODE_1593:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:177:16 in `check-apple`
@OPCODE_1594:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:177:18 in `check-apple`
@OPCODE_1595:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:177:26 in `check-apple`
@OPCODE_1596:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1597:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1598:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1599:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1600:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1601:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1602:   ; [c64_ir] JumpIf0(155)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_155

@target_154:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1604:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1605:   ; [c64_ir] JumpElse(156)
    jmp @target_156

@target_155:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1607:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1608:   ; [c64_ir] JumpTarget(155)

@target_156:

; snake.pax:178:3 in `check-apple`
@OPCODE_1610:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:178:16 in `check-apple`
@OPCODE_1611:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:178:18 in `check-apple`
@OPCODE_1612:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:178:26 in `check-apple`
@OPCODE_1613:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1614:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1615:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1616:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1617:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1618:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1619:   ; [c64_ir] JumpIf0(158)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_158

@target_157:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1621:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1622:   ; [c64_ir] JumpElse(159)
    jmp @target_159

@target_158:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1624:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1625:   ; [c64_ir] JumpTarget(158)

@target_159:

; src/prelude.fth:28:9 in `and`
@OPCODE_1627:   ; [c64_ir] Nand
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

; src/prelude.fth:14:12 in `invert`
@OPCODE_1628:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1629:   ; [c64_ir] Nand
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

; snake.pax:179:7 in `check-apple`
@OPCODE_1630:   ; [c64_ir] JumpIf0(182)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_182

@target_160:

; <inline>:0:0 in `main`
@OPCODE_1632:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1633:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:170:3 in `move-apple`
@OPCODE_1634:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:170:11 in `move-apple`
@OPCODE_1635:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:170:13 in `move-apple`
@OPCODE_1636:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:170:21 in `move-apple`
@OPCODE_1637:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1638:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1639:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1640:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1641:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1642:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1643:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:3:13 in `swap`
@OPCODE_1644:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:22 in `swap`
@OPCODE_1645:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:10 in `rot`
@OPCODE_1646:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1647:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1648:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1649:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_1650:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1651:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1652:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1653:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1654:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1655:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1656:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1657:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1658:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1659:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1660:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_1661:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_1662:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_1663:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_1664:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1665:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1666:   ; [c64_ir] LoopTarget(160)

@target_161:

; src/prelude.fth:4:10 in `over`
@OPCODE_1668:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1669:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1670:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1671:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1672:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:44:23 in `*`
@OPCODE_1673:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1674:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1675:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_1676:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1677:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_1678:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1679:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1680:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1681:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1682:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_1683:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1684:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1685:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1686:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1687:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1688:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1689:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_1690:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1691:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1692:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1693:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1694:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1695:   ; [c64_ir] JumpIf0(163)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_163

@target_162:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1697:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1698:   ; [c64_ir] JumpElse(164)
    jmp @target_164

@target_163:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1700:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1701:   ; [c64_ir] JumpTarget(163)

@target_164:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1703:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_1704:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1705:   ; [c64_ir] LoopIf0(161)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_161

@target_165:

; src/prelude.fth:44:25 in `*`
@OPCODE_1707:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1708:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_1709:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1710:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:3:10 in `swap`
@OPCODE_1711:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1712:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1713:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1714:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1715:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:48:39 in `convert-x-y`
@OPCODE_1716:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1717:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1718:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:49:34 in `draw-index`
@OPCODE_1719:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:49:43 in `draw-index`
@OPCODE_1720:   ; [c64_ir] Add
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

; snake.pax:49:45 in `draw-index`
@OPCODE_1721:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1722:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1723:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1724:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1725:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1726:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1727:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:165:3 in `random-x-position`
@OPCODE_1728:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:165:9 in `random-x-position`
@OPCODE_1729:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1730:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1731:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1732:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1733:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1734:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1735:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1736:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:8:10 in `random`
@OPCODE_1737:   ; [c64_ir] PushLiteral(127)
    inx
    inx
    lda #127
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:8:26 in `random`
@OPCODE_1738:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:8:28 in `random`
@OPCODE_1739:   ; [c64_ir] PushLiteral(255)
    inx
    inx
    lda #255
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:28:9 in `and`
@OPCODE_1740:   ; [c64_ir] Nand
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

; src/prelude.fth:14:12 in `invert`
@OPCODE_1741:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1742:   ; [c64_ir] Nand
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

; src/prelude.fth:3:10 in `swap`
@OPCODE_1743:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1744:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1745:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1746:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1747:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1748:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:48:34 in `%`
@OPCODE_1749:   ; [c64_ir] LoopTarget(165)

@target_166:

; src/prelude.fth:4:10 in `over`
@OPCODE_1751:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1752:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1753:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1754:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1755:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_1756:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1757:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1758:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1759:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1760:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1761:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1762:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1763:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1764:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1765:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1766:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1767:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1768:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:47:8 in `0<`
@OPCODE_1769:   ; [c64_ir] PushLiteral(-32768)
    inx
    inx
    lda #0
    sta $00,x
    lda #128
    sta $01,x

; src/prelude.fth:47:14 in `0<`
@OPCODE_1770:   ; [c64_ir] Nand
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

; src/prelude.fth:14:12 in `invert`
@OPCODE_1771:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1772:   ; [c64_ir] Nand
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

; src/prelude.fth:47:26 in `0<`
@OPCODE_1773:   ; [c64_ir] JumpIf0(168)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_168

@target_167:

; src/prelude.fth:47:29 in `0<`
@OPCODE_1775:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:47:32 in `0<`
@OPCODE_1776:   ; [c64_ir] JumpElse(169)
    jmp @target_169

@target_168:

; src/prelude.fth:47:37 in `0<`
@OPCODE_1778:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:47:39 in `0<`
@OPCODE_1779:   ; [c64_ir] JumpTarget(168)

@target_169:

; src/prelude.fth:48:54 in `%`
@OPCODE_1781:   ; [c64_ir] JumpIf0(171)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_171

@target_170:

; src/prelude.fth:48:57 in `%`
@OPCODE_1783:   ; [c64_ir] Add
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
@OPCODE_1784:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:48:62 in `%`
@OPCODE_1785:   ; [c64_ir] JumpElse(172)
    jmp @target_172

@target_171:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1787:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1788:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1789:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1790:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_1791:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1792:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_1793:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1794:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1795:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1796:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1797:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:48:81 in `%`
@OPCODE_1798:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:48:83 in `%`
@OPCODE_1799:   ; [c64_ir] JumpTarget(171)

@target_172:

; src/prelude.fth:48:88 in `%`
@OPCODE_1801:   ; [c64_ir] LoopIf0(166)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_166

@target_173:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1803:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1804:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1805:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1806:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1807:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1808:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1809:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:165:20 in `random-x-position`
@OPCODE_1810:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:165:22 in `random-x-position`
@OPCODE_1811:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1812:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1813:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1814:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1815:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:167:3 in `random-y-position`
@OPCODE_1816:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:167:10 in `random-y-position`
@OPCODE_1817:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1818:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1819:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1820:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1821:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1822:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1823:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1824:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:8:10 in `random`
@OPCODE_1825:   ; [c64_ir] PushLiteral(127)
    inx
    inx
    lda #127
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:8:26 in `random`
@OPCODE_1826:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:8:28 in `random`
@OPCODE_1827:   ; [c64_ir] PushLiteral(255)
    inx
    inx
    lda #255
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:28:9 in `and`
@OPCODE_1828:   ; [c64_ir] Nand
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

; src/prelude.fth:14:12 in `invert`
@OPCODE_1829:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1830:   ; [c64_ir] Nand
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

; src/prelude.fth:3:10 in `swap`
@OPCODE_1831:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1832:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1833:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1834:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1835:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1836:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:48:34 in `%`
@OPCODE_1837:   ; [c64_ir] LoopTarget(173)

@target_174:

; src/prelude.fth:4:10 in `over`
@OPCODE_1839:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1840:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1841:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1842:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1843:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_1844:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1845:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1846:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1847:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1848:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1849:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1850:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1851:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1852:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1853:   ; [c64_ir] Add
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

; src/prelude.fth:6:10 in `dup`
@OPCODE_1854:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1855:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1856:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:47:8 in `0<`
@OPCODE_1857:   ; [c64_ir] PushLiteral(-32768)
    inx
    inx
    lda #0
    sta $00,x
    lda #128
    sta $01,x

; src/prelude.fth:47:14 in `0<`
@OPCODE_1858:   ; [c64_ir] Nand
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

; src/prelude.fth:14:12 in `invert`
@OPCODE_1859:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1860:   ; [c64_ir] Nand
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

; src/prelude.fth:47:26 in `0<`
@OPCODE_1861:   ; [c64_ir] JumpIf0(176)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_176

@target_175:

; src/prelude.fth:47:29 in `0<`
@OPCODE_1863:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:47:32 in `0<`
@OPCODE_1864:   ; [c64_ir] JumpElse(177)
    jmp @target_177

@target_176:

; src/prelude.fth:47:37 in `0<`
@OPCODE_1866:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:47:39 in `0<`
@OPCODE_1867:   ; [c64_ir] JumpTarget(176)

@target_177:

; src/prelude.fth:48:54 in `%`
@OPCODE_1869:   ; [c64_ir] JumpIf0(179)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_179

@target_178:

; src/prelude.fth:48:57 in `%`
@OPCODE_1871:   ; [c64_ir] Add
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
@OPCODE_1872:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:48:62 in `%`
@OPCODE_1873:   ; [c64_ir] JumpElse(180)
    jmp @target_180

@target_179:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1875:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1876:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1877:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1878:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:18 in `rot`
@OPCODE_1879:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1880:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_1881:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:10 in `swap`
@OPCODE_1882:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1883:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1884:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1885:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:48:81 in `%`
@OPCODE_1886:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:48:83 in `%`
@OPCODE_1887:   ; [c64_ir] JumpTarget(179)

@target_180:

; src/prelude.fth:48:88 in `%`
@OPCODE_1889:   ; [c64_ir] LoopIf0(174)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_174

@target_181:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1891:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1892:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1893:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1894:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1895:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1896:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1897:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:167:21 in `random-y-position`
@OPCODE_1898:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:167:23 in `random-y-position`
@OPCODE_1899:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1900:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1901:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:98:22 in `set-apple-position`
@OPCODE_1902:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:98:30 in `set-apple-position`
@OPCODE_1903:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:98:32 in `set-apple-position`
@OPCODE_1904:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.pax:98:40 in `set-apple-position`
@OPCODE_1905:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1906:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1907:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:174:15 in `grow-snake`
@OPCODE_1908:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:6:16 in `dup`
@OPCODE_1909:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; src/prelude.fth:20:15 in `+!`
@OPCODE_1910:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_1911:   ; [c64_ir] Add
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
@OPCODE_1912:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_1913:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:182:3 in `check-apple`
@OPCODE_1914:   ; [c64_ir] JumpTarget(181)

@target_182:

; <inline>:0:0 in `main`
@OPCODE_1916:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1917:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1918:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1919:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.pax:186:3 in `check-collision`
@OPCODE_1920:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:186:16 in `check-collision`
@OPCODE_1921:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:186:18 in `check-collision`
@OPCODE_1922:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.pax:186:31 in `check-collision`
@OPCODE_1923:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1924:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1925:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1926:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1927:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_1928:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_1929:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_1930:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_1931:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1932:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1933:   ; [c64_ir] LoopTarget(182)

@target_183:

; src/prelude.fth:4:10 in `over`
@OPCODE_1935:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1936:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1937:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1938:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1939:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:44:23 in `*`
@OPCODE_1940:   ; [c64_ir] Add
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

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1941:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1942:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:18:8 in `1+`
@OPCODE_1943:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1944:   ; [c64_ir] Add
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

; src/prelude.fth:4:10 in `over`
@OPCODE_1945:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1946:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1947:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1948:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1949:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:10 in `over`
@OPCODE_1950:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1951:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1952:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1953:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1954:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1955:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1956:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_1957:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1958:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1959:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1960:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1961:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1962:   ; [c64_ir] JumpIf0(185)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_185

@target_184:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1964:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1965:   ; [c64_ir] JumpElse(186)
    jmp @target_186

@target_185:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1967:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1968:   ; [c64_ir] JumpTarget(185)

@target_186:

; src/prelude.fth:3:10 in `swap`
@OPCODE_1970:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:19 in `swap`
@OPCODE_1971:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1972:   ; [c64_ir] LoopIf0(183)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_183

@target_187:

; src/prelude.fth:44:25 in `*`
@OPCODE_1974:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1975:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_1976:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1977:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:3:10 in `swap`
@OPCODE_1978:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1979:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1980:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1981:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1982:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:48:39 in `convert-x-y`
@OPCODE_1983:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1984:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1985:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:189:15 in `check-collision`
@OPCODE_1986:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.pax:189:24 in `check-collision`
@OPCODE_1987:   ; [c64_ir] Add
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

; snake.pax:189:26 in `check-collision`
@OPCODE_1988:   ; [c64_ir] Load8
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:192:3 in `check-collision`
@OPCODE_1989:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:14:12 in `invert`
@OPCODE_1990:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1991:   ; [c64_ir] Nand
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

; src/prelude.fth:15:19 in `negate`
@OPCODE_1992:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1993:   ; [c64_ir] Add
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

; src/prelude.fth:16:19 in `-`
@OPCODE_1994:   ; [c64_ir] Add
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

; src/prelude.fth:21:8 in `0=`
@OPCODE_1995:   ; [c64_ir] JumpIf0(189)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_189

@target_188:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1997:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1998:   ; [c64_ir] JumpElse(190)
    jmp @target_190

@target_189:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2000:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2001:   ; [c64_ir] JumpTarget(189)

@target_190:

; <inline>:0:0 in `main`
@OPCODE_2003:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2004:   ; [c64_ir] Drop
    dex
    dex

; snake.pax:217:1 in `main`
@OPCODE_2005:   ; [c64_ir] JumpIf0(192)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_192

@target_191:

; snake.pax:217:4 in `main`
@OPCODE_2007:   ; [c64_ir] JumpElse(193)
    jmp @target_193

@target_192:

; snake.pax:217:9 in `main`
@OPCODE_2009:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.pax:217:11 in `main`
@OPCODE_2010:   ; [c64_ir] PushLiteral(-28672)
    inx
    inx
    lda #0
    sta $00,x
    lda #144
    sta $01,x

; snake.pax:217:23 in `main`
@OPCODE_2011:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.pax:217:25 in `main`
@OPCODE_2012:   ; [c64_ir] JumpTarget(192)

@target_193:

; :0:0 in ``
@OPCODE_2014:   ; [c64_ir] Exit
    ;rts






; function start


