.proc PAX_FN_main
@target_0:

; snake.fth:23:1 in `main`
@OPCODE_1:   ; [c64_ir] PushLiteral(500)
    inx
    inx
    lda #244
    sta $00,x
    lda #1
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_5:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_6:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_7:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_8:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_9:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_10:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
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

; <inline>:0:0 in `main`
@OPCODE_12:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_13:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:23:11 in `main`
@OPCODE_14:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:26:1 in `main`
@OPCODE_15:   ; [c64_ir] PushLiteral(500)
    inx
    inx
    lda #244
    sta $00,x
    lda #1
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_16:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_17:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_18:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_19:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_20:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_21:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_22:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_23:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_24:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_25:   ; [c64_ir] Add
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
@OPCODE_26:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_27:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:26:11 in `main`
@OPCODE_28:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:212:1 in `main`
@OPCODE_29:   ; [c64_ir] PushLiteral(-28672)
    inx
    inx
    lda #0
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:212:13 in `main`
@OPCODE_30:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_31:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_32:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_33:   ; [c64_ir] JumpIf0(2)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_2

@target_1:

; src/prelude.fth:21:11 in `0=`
@OPCODE_35:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_36:   ; [c64_ir] JumpElse(3)
    jmp @target_3

@target_2:

; src/prelude.fth:21:18 in `0=`
@OPCODE_38:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_39:   ; [c64_ir] JumpTarget(2)

@target_3:

; <inline>:0:0 in `main`
@OPCODE_41:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_42:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:212:18 in `main`
@OPCODE_43:   ; [c64_ir] JumpIf0(55)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_55

@target_4:

; <inline>:0:0 in `main`
@OPCODE_45:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_46:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_47:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_48:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:57:5 in `draw-background`
@OPCODE_49:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:58:5 in `draw-background`
@OPCODE_50:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:58:12 in `draw-background`
@OPCODE_51:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:58:14 in `draw-background`
@OPCODE_52:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:58:14 in `draw-background`
@OPCODE_53:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:58:14 in `draw-background`
@OPCODE_54:   ; [c64_ir] LoopTarget(4)

@target_5:

; snake.fth:59:9 in `draw-background`
@OPCODE_56:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:59:15 in `draw-background`
@OPCODE_57:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:59:17 in `draw-background`
@OPCODE_58:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:59:17 in `draw-background`
@OPCODE_59:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:59:17 in `draw-background`
@OPCODE_60:   ; [c64_ir] LoopTarget(5)

@target_6:

; snake.fth:60:13 in `draw-background`
@OPCODE_62:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_63:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_64:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_65:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_66:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_67:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_68:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_69:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_70:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_71:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_72:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_73:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_74:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_75:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_76:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_77:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_78:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_79:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_80:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_81:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_82:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_83:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_84:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:60:32 in `draw-background`
@OPCODE_85:   ; [c64_ir] Add
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
@OPCODE_86:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_87:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_88:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
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

; snake.fth:49:45 in `draw-index`
@OPCODE_90:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_91:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_92:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_93:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_94:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_95:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_96:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_97:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_98:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_99:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_100:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_101:   ; [c64_ir] Add
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
@OPCODE_102:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_103:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_104:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_105:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_106:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_107:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_108:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_109:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_110:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_111:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_112:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_113:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_114:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_115:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_116:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_117:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_118:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_119:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_120:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_121:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

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
@OPCODE_124:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_125:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_126:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_127:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_128:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_129:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_130:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_131:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_132:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_133:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

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

; src/prelude.fth:14:12 in `invert`
@OPCODE_136:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_137:   ; [c64_ir] Nand
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
@OPCODE_138:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_139:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_140:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_141:   ; [c64_ir] Add
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
@OPCODE_142:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_143:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_144:   ; [c64_ir] Add
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
@OPCODE_145:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_146:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_147:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_148:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_149:   ; [c64_ir] JumpIf0(8)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_8

@target_7:

; src/prelude.fth:21:11 in `0=`
@OPCODE_151:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_152:   ; [c64_ir] JumpElse(9)
    jmp @target_9

@target_8:

; src/prelude.fth:21:18 in `0=`
@OPCODE_154:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_155:   ; [c64_ir] JumpTarget(8)

@target_9:

; <inline>:0:0 in `main`
@OPCODE_157:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_158:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_159:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_160:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_161:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_162:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_163:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_164:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_165:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_166:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_167:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_168:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_169:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_170:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_171:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:61:9 in `draw-background`
@OPCODE_172:   ; [c64_ir] LoopIf0(6)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_6

@target_10:

; snake.fth:61:9 in `draw-background`
@OPCODE_174:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:61:9 in `draw-background`
@OPCODE_175:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:61:9 in `draw-background`
@OPCODE_176:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:61:9 in `draw-background`
@OPCODE_177:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:62:9 in `draw-background`
@OPCODE_178:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:62:15 in `draw-background`
@OPCODE_179:   ; [c64_ir] Add
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
@OPCODE_180:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_181:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_182:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_183:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_184:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_185:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_186:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_187:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_188:   ; [c64_ir] Add
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
@OPCODE_189:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_190:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_191:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_192:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_193:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_194:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_195:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_196:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_197:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_198:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_199:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_200:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_201:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_202:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_203:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_204:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_205:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_206:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_207:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_208:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_209:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_210:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_211:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_212:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_213:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_214:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_215:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_216:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_217:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_218:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_219:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_220:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_221:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_222:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_223:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_224:   ; [c64_ir] Nand
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
@OPCODE_225:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_226:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_227:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_228:   ; [c64_ir] Add
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
@OPCODE_229:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_230:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_231:   ; [c64_ir] Add
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
@OPCODE_232:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_233:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_234:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_235:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_236:   ; [c64_ir] JumpIf0(12)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_12

@target_11:

; src/prelude.fth:21:11 in `0=`
@OPCODE_238:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_239:   ; [c64_ir] JumpElse(13)
    jmp @target_13

@target_12:

; src/prelude.fth:21:18 in `0=`
@OPCODE_241:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_242:   ; [c64_ir] JumpTarget(12)

@target_13:

; <inline>:0:0 in `main`
@OPCODE_244:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_245:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_246:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_247:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_248:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_249:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_250:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_251:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_252:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_253:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_254:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_255:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_256:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_257:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_258:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:63:4 in `draw-background`
@OPCODE_259:   ; [c64_ir] LoopIf0(5)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_5

@target_14:

; snake.fth:63:4 in `draw-background`
@OPCODE_261:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:63:4 in `draw-background`
@OPCODE_262:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:63:4 in `draw-background`
@OPCODE_263:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:63:4 in `draw-background`
@OPCODE_264:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:64:4 in `draw-background`
@OPCODE_265:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_266:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_267:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_268:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_269:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:69:5 in `draw-walls`
@OPCODE_270:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:69:11 in `draw-walls`
@OPCODE_271:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:69:18 in `draw-walls`
@OPCODE_272:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_273:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_274:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_275:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_276:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_277:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_278:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_279:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_280:   ; [c64_ir] Nand
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
@OPCODE_281:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_282:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_283:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_284:   ; [c64_ir] Add
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
@OPCODE_285:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_286:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
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

; <inline>:0:0 in `main`
@OPCODE_288:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_289:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_290:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_291:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_292:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_293:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_294:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_295:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_296:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_297:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_298:   ; [c64_ir] LoopTarget(14)

@target_15:

; <inline>:0:0 in `main`
@OPCODE_300:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_301:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_302:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_303:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_304:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_305:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_306:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_307:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_308:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:23 in `*`
@OPCODE_309:   ; [c64_ir] Add
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
@OPCODE_310:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_311:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_312:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_313:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_314:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_315:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_316:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_317:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_318:   ; [c64_ir] Add
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
@OPCODE_319:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_320:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_321:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_322:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_323:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_324:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_325:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_326:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_327:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_328:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_329:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_330:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_331:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_332:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_333:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_334:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_335:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_336:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_337:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_338:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_339:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_340:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_341:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_342:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_343:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_344:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_345:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_346:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_347:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_348:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_349:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_350:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_351:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_352:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_353:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_354:   ; [c64_ir] Nand
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
@OPCODE_355:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_356:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_357:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_358:   ; [c64_ir] Add
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
@OPCODE_359:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_360:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_361:   ; [c64_ir] Add
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
@OPCODE_362:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_363:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_364:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_365:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_366:   ; [c64_ir] JumpIf0(17)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_17

@target_16:

; src/prelude.fth:21:11 in `0=`
@OPCODE_368:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_369:   ; [c64_ir] JumpElse(18)
    jmp @target_18

@target_17:

; src/prelude.fth:21:18 in `0=`
@OPCODE_371:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_372:   ; [c64_ir] JumpTarget(17)

@target_18:

; <inline>:0:0 in `main`
@OPCODE_374:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_375:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_376:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_377:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_378:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_379:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_380:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_381:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_382:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_383:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_384:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_385:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_386:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_387:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_388:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_389:   ; [c64_ir] LoopIf0(15)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_15

@target_19:

; src/prelude.fth:44:25 in `*`
@OPCODE_391:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_392:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_393:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_394:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_395:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_396:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_397:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_398:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_399:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_400:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_401:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_402:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:35 in `*`
@OPCODE_403:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_404:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_405:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:70:5 in `draw-walls`
@OPCODE_406:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:70:11 in `draw-walls`
@OPCODE_407:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:70:13 in `draw-walls`
@OPCODE_408:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:70:13 in `draw-walls`
@OPCODE_409:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:70:13 in `draw-walls`
@OPCODE_410:   ; [c64_ir] LoopTarget(19)

@target_20:

; snake.fth:71:9 in `draw-walls`
@OPCODE_412:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_413:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_414:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_415:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_416:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_417:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_418:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_419:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_420:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_421:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_422:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_423:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_424:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_425:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_426:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_427:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_428:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_429:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_430:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_431:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_432:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_433:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_434:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:71:21 in `draw-walls`
@OPCODE_435:   ; [c64_ir] Add
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
@OPCODE_436:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_437:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_438:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_439:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_440:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_441:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_442:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_443:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_444:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_445:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_446:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_447:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_448:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_449:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_450:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_451:   ; [c64_ir] Add
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
@OPCODE_452:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_453:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_454:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_455:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_456:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_457:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_458:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_459:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_460:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_461:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_462:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_463:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_464:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_465:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_466:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_467:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_468:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_469:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_470:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_471:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_472:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_473:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_474:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_475:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_476:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_477:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_478:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_479:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_480:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_481:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_482:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_483:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_484:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_485:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_486:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_487:   ; [c64_ir] Nand
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
@OPCODE_488:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_489:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_490:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_491:   ; [c64_ir] Add
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
@OPCODE_492:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_493:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
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

; <inline>:0:0 in `main`
@OPCODE_495:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_496:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_497:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_498:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_499:   ; [c64_ir] JumpIf0(22)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_22

@target_21:

; src/prelude.fth:21:11 in `0=`
@OPCODE_501:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_502:   ; [c64_ir] JumpElse(23)
    jmp @target_23

@target_22:

; src/prelude.fth:21:18 in `0=`
@OPCODE_504:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_505:   ; [c64_ir] JumpTarget(22)

@target_23:

; <inline>:0:0 in `main`
@OPCODE_507:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_508:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_509:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_510:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_511:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_512:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_513:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_514:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_515:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_516:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_517:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_518:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_519:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_520:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_521:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:72:5 in `draw-walls`
@OPCODE_522:   ; [c64_ir] LoopIf0(20)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_20

@target_24:

; snake.fth:72:5 in `draw-walls`
@OPCODE_524:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:72:5 in `draw-walls`
@OPCODE_525:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:72:5 in `draw-walls`
@OPCODE_526:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:72:5 in `draw-walls`
@OPCODE_527:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:73:5 in `draw-walls`
@OPCODE_528:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:76:5 in `draw-walls`
@OPCODE_529:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:76:11 in `draw-walls`
@OPCODE_530:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:76:13 in `draw-walls`
@OPCODE_531:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:76:13 in `draw-walls`
@OPCODE_532:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:76:13 in `draw-walls`
@OPCODE_533:   ; [c64_ir] LoopTarget(24)

@target_25:

; snake.fth:77:9 in `draw-walls`
@OPCODE_535:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_536:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_537:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_538:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_539:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_540:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_541:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_542:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_543:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_544:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_545:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_546:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_547:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_548:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_549:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_550:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_551:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_552:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_553:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_554:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_555:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_556:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_557:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_558:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_559:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_560:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_561:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_562:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_563:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_564:   ; [c64_ir] Add
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
@OPCODE_565:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_566:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_567:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_568:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_569:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_570:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_571:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_572:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_573:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_574:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_575:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_576:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_577:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_578:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_579:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_580:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_581:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_582:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_583:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_584:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_585:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_586:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_587:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_588:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_589:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_590:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_591:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_592:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_593:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_594:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_595:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_596:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_597:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_598:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_599:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_600:   ; [c64_ir] Nand
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
@OPCODE_601:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_602:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_603:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_604:   ; [c64_ir] Add
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
@OPCODE_605:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_606:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_607:   ; [c64_ir] Add
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
@OPCODE_608:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_609:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_610:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_611:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_612:   ; [c64_ir] JumpIf0(27)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_27

@target_26:

; src/prelude.fth:21:11 in `0=`
@OPCODE_614:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_615:   ; [c64_ir] JumpElse(28)
    jmp @target_28

@target_27:

; src/prelude.fth:21:18 in `0=`
@OPCODE_617:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_618:   ; [c64_ir] JumpTarget(27)

@target_28:

; <inline>:0:0 in `main`
@OPCODE_620:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_621:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_622:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_623:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_624:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_625:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_626:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_627:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_628:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_629:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_630:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_631:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_632:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_633:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_634:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:78:5 in `draw-walls`
@OPCODE_635:   ; [c64_ir] LoopIf0(25)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_25

@target_29:

; snake.fth:78:5 in `draw-walls`
@OPCODE_637:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:78:5 in `draw-walls`
@OPCODE_638:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:78:5 in `draw-walls`
@OPCODE_639:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:78:5 in `draw-walls`
@OPCODE_640:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:81:5 in `draw-walls`
@OPCODE_641:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:81:11 in `draw-walls`
@OPCODE_642:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_643:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_644:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_645:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_646:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_647:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_648:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_649:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_650:   ; [c64_ir] Nand
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
@OPCODE_651:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_652:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_653:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_654:   ; [c64_ir] Add
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
@OPCODE_655:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_656:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_657:   ; [c64_ir] Add
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
@OPCODE_658:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_659:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:82:5 in `draw-walls`
@OPCODE_660:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:82:12 in `draw-walls`
@OPCODE_661:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:82:14 in `draw-walls`
@OPCODE_662:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:82:14 in `draw-walls`
@OPCODE_663:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:82:14 in `draw-walls`
@OPCODE_664:   ; [c64_ir] LoopTarget(29)

@target_30:

; snake.fth:83:9 in `draw-walls`
@OPCODE_666:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_667:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_668:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_669:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_670:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_671:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_672:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_673:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_674:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_675:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_676:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_677:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_678:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_679:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_680:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_681:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_682:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:84:9 in `draw-walls`
@OPCODE_683:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:84:15 in `draw-walls`
@OPCODE_684:   ; [c64_ir] Add
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
@OPCODE_685:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_686:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_687:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_688:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_689:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_690:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_691:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_692:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_693:   ; [c64_ir] Add
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
@OPCODE_694:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_695:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_696:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_697:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_698:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_699:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_700:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_701:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_702:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_703:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_704:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_705:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_706:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_707:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_708:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_709:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_710:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_711:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_712:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_713:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_714:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_715:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_716:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_717:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_718:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_719:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_720:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_721:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_722:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_723:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_724:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_725:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_726:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_727:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_728:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_729:   ; [c64_ir] Nand
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
@OPCODE_730:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_731:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_732:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_733:   ; [c64_ir] Add
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
@OPCODE_734:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_735:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_736:   ; [c64_ir] Add
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
@OPCODE_737:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_738:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_739:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_740:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_741:   ; [c64_ir] JumpIf0(32)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_32

@target_31:

; src/prelude.fth:21:11 in `0=`
@OPCODE_743:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_744:   ; [c64_ir] JumpElse(33)
    jmp @target_33

@target_32:

; src/prelude.fth:21:18 in `0=`
@OPCODE_746:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_747:   ; [c64_ir] JumpTarget(32)

@target_33:

; <inline>:0:0 in `main`
@OPCODE_749:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_750:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_751:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_752:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_753:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_754:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_755:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_756:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_757:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_758:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_759:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_760:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_761:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_762:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_763:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:85:5 in `draw-walls`
@OPCODE_764:   ; [c64_ir] LoopIf0(30)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_30

@target_34:

; snake.fth:85:5 in `draw-walls`
@OPCODE_766:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:85:5 in `draw-walls`
@OPCODE_767:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:85:5 in `draw-walls`
@OPCODE_768:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:85:5 in `draw-walls`
@OPCODE_769:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:86:5 in `draw-walls`
@OPCODE_770:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:89:5 in `draw-walls`
@OPCODE_771:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:90:5 in `draw-walls`
@OPCODE_772:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:90:12 in `draw-walls`
@OPCODE_773:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:90:14 in `draw-walls`
@OPCODE_774:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:90:14 in `draw-walls`
@OPCODE_775:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:90:14 in `draw-walls`
@OPCODE_776:   ; [c64_ir] LoopTarget(34)

@target_35:

; snake.fth:91:9 in `draw-walls`
@OPCODE_778:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_779:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_780:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_781:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_782:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_783:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_784:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_785:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_786:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_787:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_788:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_789:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_790:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_791:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_792:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_793:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_794:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:92:9 in `draw-walls`
@OPCODE_795:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:92:15 in `draw-walls`
@OPCODE_796:   ; [c64_ir] Add
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
@OPCODE_797:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_798:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_799:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_800:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_801:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_802:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_803:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_804:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_805:   ; [c64_ir] Add
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
@OPCODE_806:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_807:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_808:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_809:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_810:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_811:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_812:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_813:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_814:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_815:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_816:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_817:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_818:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_819:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_820:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_821:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_822:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_823:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_824:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_825:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_826:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_827:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_828:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_829:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_830:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_831:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_832:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_833:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_834:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_835:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_836:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_837:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_838:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_839:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_840:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_841:   ; [c64_ir] Nand
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
@OPCODE_842:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_843:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_844:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_845:   ; [c64_ir] Add
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
@OPCODE_846:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_847:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_848:   ; [c64_ir] Add
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
@OPCODE_849:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_850:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_851:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_852:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_853:   ; [c64_ir] JumpIf0(37)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_37

@target_36:

; src/prelude.fth:21:11 in `0=`
@OPCODE_855:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_856:   ; [c64_ir] JumpElse(38)
    jmp @target_38

@target_37:

; src/prelude.fth:21:18 in `0=`
@OPCODE_858:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_859:   ; [c64_ir] JumpTarget(37)

@target_38:

; <inline>:0:0 in `main`
@OPCODE_861:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_862:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_863:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_864:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_865:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_866:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_867:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_868:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_869:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_870:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_871:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_872:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_873:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_874:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_875:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:93:5 in `draw-walls`
@OPCODE_876:   ; [c64_ir] LoopIf0(35)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_35

@target_39:

; snake.fth:93:5 in `draw-walls`
@OPCODE_878:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:93:5 in `draw-walls`
@OPCODE_879:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:93:5 in `draw-walls`
@OPCODE_880:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:93:5 in `draw-walls`
@OPCODE_881:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:94:5 in `draw-walls`
@OPCODE_882:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_883:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_884:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_885:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_886:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:98:3 in `initialize-snake`
@OPCODE_887:   ; [c64_ir] PushLiteral(16)
    inx
    inx
    lda #16
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:98:6 in `initialize-snake`
@OPCODE_888:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:98:13 in `initialize-snake`
@OPCODE_889:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:99:3 in `initialize-snake`
@OPCODE_890:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:99:10 in `initialize-snake`
@OPCODE_891:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:99:12 in `initialize-snake`
@OPCODE_892:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:99:14 in `initialize-snake`
@OPCODE_893:   ; [c64_ir] Add
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

; snake.fth:99:16 in `initialize-snake`
@OPCODE_894:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:99:18 in `initialize-snake`
@OPCODE_895:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:99:18 in `initialize-snake`
@OPCODE_896:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:99:18 in `initialize-snake`
@OPCODE_897:   ; [c64_ir] LoopTarget(39)

@target_40:

; snake.fth:100:5 in `initialize-snake`
@OPCODE_899:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_900:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_901:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_902:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_903:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_904:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_905:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_906:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_907:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_908:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_909:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_910:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_911:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_912:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_913:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_914:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_915:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_916:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_917:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_918:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_919:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_920:   ; [c64_ir] Nand
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
@OPCODE_921:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_922:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_923:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_924:   ; [c64_ir] Add
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
@OPCODE_925:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_926:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_927:   ; [c64_ir] Add
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
@OPCODE_928:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_929:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_930:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_931:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_932:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_933:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_934:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_935:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_936:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_937:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_938:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_939:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_940:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_941:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_942:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_943:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_944:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_945:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_946:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_947:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_948:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_949:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_950:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_951:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_952:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_953:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_954:   ; [c64_ir] Add
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
@OPCODE_955:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_956:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:42:9 in `snake-x`
@OPCODE_957:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:42:22 in `snake-x`
@OPCODE_958:   ; [c64_ir] Add
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
@OPCODE_959:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_960:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:100:21 in `initialize-snake`
@OPCODE_961:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:101:5 in `initialize-snake`
@OPCODE_962:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_963:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_964:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_965:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_966:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_967:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_968:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_969:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_970:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_971:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_972:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_973:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_974:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_975:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_976:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_977:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_978:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_979:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_980:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_981:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_982:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_983:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_984:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_985:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_986:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_987:   ; [c64_ir] Add
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
@OPCODE_988:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_989:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:45:9 in `snake-y`
@OPCODE_990:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:45:22 in `snake-y`
@OPCODE_991:   ; [c64_ir] Add
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
@OPCODE_992:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_993:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:101:17 in `initialize-snake`
@OPCODE_994:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_995:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_996:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_997:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_998:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_999:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

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

; src/prelude.fth:18:8 in `1+`
@OPCODE_1002:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1003:   ; [c64_ir] Add
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
@OPCODE_1004:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1005:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1006:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1007:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1008:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1009:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1010:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1011:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1012:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1013:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1014:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1015:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1016:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1017:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1018:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1019:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1020:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1021:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1022:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1023:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1024:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1025:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1026:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1027:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1028:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1029:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1030:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1031:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1032:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1033:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1034:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1035:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1036:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1037:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_1038:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1039:   ; [c64_ir] Nand
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
@OPCODE_1040:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1041:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_1042:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1043:   ; [c64_ir] Add
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
@OPCODE_1044:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1045:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_1046:   ; [c64_ir] Add
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
@OPCODE_1047:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1048:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1049:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1050:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_1051:   ; [c64_ir] JumpIf0(42)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_42

@target_41:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1053:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1054:   ; [c64_ir] JumpElse(43)
    jmp @target_43

@target_42:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1056:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1057:   ; [c64_ir] JumpTarget(42)

@target_43:

; <inline>:0:0 in `main`
@OPCODE_1059:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1060:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1061:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1062:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1063:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1064:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1065:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1066:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1067:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1068:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1069:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1070:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1071:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1072:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1073:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:102:3 in `initialize-snake`
@OPCODE_1074:   ; [c64_ir] LoopIf0(40)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_40

@target_44:

; snake.fth:102:3 in `initialize-snake`
@OPCODE_1076:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:102:3 in `initialize-snake`
@OPCODE_1077:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:102:3 in `initialize-snake`
@OPCODE_1078:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:102:3 in `initialize-snake`
@OPCODE_1079:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:103:3 in `initialize-snake`
@OPCODE_1080:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:103:9 in `initialize-snake`
@OPCODE_1081:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:103:19 in `initialize-snake`
@OPCODE_1082:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1083:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1084:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1085:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1086:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:107:21 in `initialize-apple`
@OPCODE_1087:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:107:23 in `initialize-apple`
@OPCODE_1088:   ; [c64_ir] PushLiteral(13)
    inx
    inx
    lda #13
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1089:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1090:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:105:22 in `set-apple-position`
@OPCODE_1091:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:105:30 in `set-apple-position`
@OPCODE_1092:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:105:32 in `set-apple-position`
@OPCODE_1093:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:105:40 in `set-apple-position`
@OPCODE_1094:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1095:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1096:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1097:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1098:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1099:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1100:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:110:3 in `draw-full-snake`
@OPCODE_1101:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:110:10 in `draw-full-snake`
@OPCODE_1102:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:110:12 in `draw-full-snake`
@OPCODE_1103:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:110:14 in `draw-full-snake`
@OPCODE_1104:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:110:14 in `draw-full-snake`
@OPCODE_1105:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:110:14 in `draw-full-snake`
@OPCODE_1106:   ; [c64_ir] LoopTarget(44)

@target_45:

; <inline>:0:0 in `main`
@OPCODE_1108:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1109:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_1110:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_1111:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1112:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1113:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_1114:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_1115:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_1116:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_1117:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_1118:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1119:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1120:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1121:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1122:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1123:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1124:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1125:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1126:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_1127:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1128:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1129:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1130:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1131:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_1132:   ; [c64_ir] Add
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
@OPCODE_1133:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1134:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:42:9 in `snake-x`
@OPCODE_1135:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:42:22 in `snake-x`
@OPCODE_1136:   ; [c64_ir] Add
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
@OPCODE_1137:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1138:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:111:15 in `draw-full-snake`
@OPCODE_1139:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1140:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1141:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_1142:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_1143:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_1144:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_1145:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_1146:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_1147:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_1148:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_1149:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_1150:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1151:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1152:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1153:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1154:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1155:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1156:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1157:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1158:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_1159:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1160:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1161:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1162:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1163:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_1164:   ; [c64_ir] Add
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
@OPCODE_1165:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1166:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:45:9 in `snake-y`
@OPCODE_1167:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:45:22 in `snake-y`
@OPCODE_1168:   ; [c64_ir] Add
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
@OPCODE_1169:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1170:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:111:27 in `draw-full-snake`
@OPCODE_1171:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1172:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1173:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:53:31 in `draw-snake-tile`
@OPCODE_1174:   ; [c64_ir] PushLiteral(232)
    inx
    inx
    lda #232
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1175:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1176:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1177:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1178:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1179:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1180:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1181:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1182:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1183:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1184:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1185:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_1186:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1187:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1188:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1189:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1190:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1191:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1192:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1193:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1194:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1195:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1196:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1197:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1198:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1199:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1200:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1201:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1202:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1203:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1204:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1205:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1206:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1207:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_1208:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1209:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1210:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1211:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1212:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1213:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1214:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1215:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1216:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1217:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1218:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1219:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1220:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1221:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1222:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1223:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1224:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1225:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_1226:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_1227:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_1228:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_1229:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_1230:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1231:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1232:   ; [c64_ir] LoopTarget(45)

@target_46:

; <inline>:0:0 in `main`
@OPCODE_1234:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1235:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1236:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1237:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1238:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1239:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1240:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1241:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1242:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:23 in `*`
@OPCODE_1243:   ; [c64_ir] Add
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
@OPCODE_1244:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1245:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_1246:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1247:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1248:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1249:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1250:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_1251:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1252:   ; [c64_ir] Add
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
@OPCODE_1253:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1254:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1255:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1256:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1257:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1258:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1259:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1260:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1261:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1262:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1263:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1264:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1265:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1266:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1267:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1268:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1269:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1270:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1271:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1272:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1273:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1274:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1275:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1276:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1277:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1278:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1279:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1280:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1281:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1282:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1283:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1284:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1285:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1286:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_1287:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1288:   ; [c64_ir] Nand
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
@OPCODE_1289:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1290:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_1291:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1292:   ; [c64_ir] Add
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
@OPCODE_1293:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1294:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_1295:   ; [c64_ir] Add
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
@OPCODE_1296:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1297:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1298:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1299:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_1300:   ; [c64_ir] JumpIf0(48)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_48

@target_47:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1302:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1303:   ; [c64_ir] JumpElse(49)
    jmp @target_49

@target_48:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1305:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1306:   ; [c64_ir] JumpTarget(48)

@target_49:

; <inline>:0:0 in `main`
@OPCODE_1308:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1309:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1310:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1311:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1312:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1313:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

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

; <inline>:0:0 in `main`
@OPCODE_1318:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1319:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1320:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

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

; src/prelude.fth:44:25 in `*`
@OPCODE_1323:   ; [c64_ir] LoopIf0(46)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_46

@target_50:

; src/prelude.fth:44:25 in `*`
@OPCODE_1325:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1326:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_1327:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1328:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1329:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1330:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1331:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1332:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1333:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1334:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1335:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1336:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:35 in `*`
@OPCODE_1337:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1338:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1339:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:48:39 in `convert-x-y`
@OPCODE_1340:   ; [c64_ir] Add
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

; <inline>:0:0 in `main`
@OPCODE_1343:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1344:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_1345:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_1346:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_1347:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1348:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1349:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1350:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1351:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1352:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1353:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1354:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1355:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_1356:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1357:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1358:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1359:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1360:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_1361:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1362:   ; [c64_ir] Add
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
@OPCODE_1363:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1364:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1365:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1366:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1367:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1368:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1369:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1370:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1371:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1372:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1373:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1374:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1375:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1376:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1377:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1378:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1379:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1380:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1381:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1382:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1383:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1384:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1385:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1386:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1387:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1388:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1389:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1390:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1391:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1392:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1393:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1394:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1395:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1396:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_1397:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1398:   ; [c64_ir] Nand
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
@OPCODE_1399:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1400:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_1401:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1402:   ; [c64_ir] Add
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
@OPCODE_1403:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1404:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
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

; <inline>:0:0 in `main`
@OPCODE_1406:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1407:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1408:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1409:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_1410:   ; [c64_ir] JumpIf0(52)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_52

@target_51:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1412:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1413:   ; [c64_ir] JumpElse(53)
    jmp @target_53

@target_52:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1415:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1416:   ; [c64_ir] JumpTarget(52)

@target_53:

; <inline>:0:0 in `main`
@OPCODE_1418:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1419:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1420:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1421:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1422:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1423:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1424:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1425:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1426:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1427:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1428:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1429:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1430:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1431:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1432:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:112:3 in `draw-full-snake`
@OPCODE_1433:   ; [c64_ir] LoopIf0(45)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_45

@target_54:

; snake.fth:112:3 in `draw-full-snake`
@OPCODE_1435:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:112:3 in `draw-full-snake`
@OPCODE_1436:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:112:3 in `draw-full-snake`
@OPCODE_1437:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:112:3 in `draw-full-snake`
@OPCODE_1438:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1439:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1440:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1441:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1442:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:212:32 in `main`
@OPCODE_1443:   ; [c64_ir] JumpTarget(54)

@target_55:

; snake.fth:213:1 in `main`
@OPCODE_1445:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:213:3 in `main`
@OPCODE_1446:   ; [c64_ir] PushLiteral(-28672)
    inx
    inx
    lda #0
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:213:15 in `main`
@OPCODE_1447:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1448:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1449:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:202:3 in `draw-snake-head-tail`
@OPCODE_1450:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1451:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1452:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1453:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1454:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1455:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1456:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_1457:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1458:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1459:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1460:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1461:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_1462:   ; [c64_ir] Add
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
@OPCODE_1463:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1464:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:42:9 in `snake-x`
@OPCODE_1465:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:42:22 in `snake-x`
@OPCODE_1466:   ; [c64_ir] Add
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
@OPCODE_1467:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1468:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:202:13 in `draw-snake-head-tail`
@OPCODE_1469:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:202:15 in `draw-snake-head-tail`
@OPCODE_1470:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1471:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1472:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1473:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1474:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1475:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1476:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_1477:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1478:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1479:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1480:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1481:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
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

; <inline>:0:0 in `main`
@OPCODE_1483:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1484:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:45:9 in `snake-y`
@OPCODE_1485:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:45:22 in `snake-y`
@OPCODE_1486:   ; [c64_ir] Add
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
@OPCODE_1487:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1488:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:202:25 in `draw-snake-head-tail`
@OPCODE_1489:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1490:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1491:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:53:31 in `draw-snake-tile`
@OPCODE_1492:   ; [c64_ir] PushLiteral(232)
    inx
    inx
    lda #232
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1493:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1494:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1495:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1496:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1497:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1498:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1499:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1500:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1501:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1502:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1503:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_1504:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1505:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1506:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1507:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1508:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1509:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1510:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1511:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1512:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1513:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1514:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1515:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1516:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1517:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1518:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1519:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1520:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1521:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1522:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1523:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1524:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1525:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_1526:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1527:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1528:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1529:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1530:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1531:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1532:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1533:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1534:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1535:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1536:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1537:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1538:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1539:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1540:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1541:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1542:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1543:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_1544:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_1545:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_1546:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_1547:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_1548:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1549:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1550:   ; [c64_ir] LoopTarget(55)

@target_56:

; <inline>:0:0 in `main`
@OPCODE_1552:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1553:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1554:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

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
@OPCODE_1557:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1558:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1559:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1560:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:23 in `*`
@OPCODE_1561:   ; [c64_ir] Add
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
@OPCODE_1562:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1563:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_1564:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1565:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1566:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1567:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1568:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_1569:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1570:   ; [c64_ir] Add
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
@OPCODE_1571:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1572:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1573:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1574:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1575:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1576:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1577:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1578:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1579:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1580:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1581:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1582:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1583:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1584:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1585:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1586:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1587:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1588:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1589:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1590:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1591:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1592:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1593:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1594:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1595:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1596:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1597:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1598:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1599:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1600:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1601:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1602:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1603:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1604:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_1605:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_1606:   ; [c64_ir] Nand
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
@OPCODE_1607:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1608:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_1609:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1610:   ; [c64_ir] Add
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
@OPCODE_1611:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1612:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_1613:   ; [c64_ir] Add
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
@OPCODE_1614:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1615:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1616:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1617:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_1618:   ; [c64_ir] JumpIf0(58)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_58

@target_57:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1620:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1621:   ; [c64_ir] JumpElse(59)
    jmp @target_59

@target_58:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1623:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1624:   ; [c64_ir] JumpTarget(58)

@target_59:

; <inline>:0:0 in `main`
@OPCODE_1626:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1627:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1628:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1629:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1630:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1631:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1632:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1633:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1634:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1635:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1636:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1637:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1638:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1639:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1640:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_1641:   ; [c64_ir] LoopIf0(56)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_56

@target_60:

; src/prelude.fth:44:25 in `*`
@OPCODE_1643:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1644:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_1645:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1646:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1647:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1648:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1649:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1650:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1651:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1652:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1653:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1654:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:35 in `*`
@OPCODE_1655:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1656:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1657:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:48:39 in `convert-x-y`
@OPCODE_1658:   ; [c64_ir] Add
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
@OPCODE_1659:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1660:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1661:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1662:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_1663:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_1664:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_1665:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1666:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1667:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1668:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1669:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1670:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1671:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:203:3 in `draw-snake-head-tail`
@OPCODE_1672:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:203:10 in `draw-snake-head-tail`
@OPCODE_1673:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1674:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1675:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1676:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1677:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1678:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1679:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_1680:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1681:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1682:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1683:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1684:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_1685:   ; [c64_ir] Add
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
@OPCODE_1686:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1687:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:42:9 in `snake-x`
@OPCODE_1688:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:42:22 in `snake-x`
@OPCODE_1689:   ; [c64_ir] Add
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
@OPCODE_1690:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1691:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:203:20 in `draw-snake-head-tail`
@OPCODE_1692:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:204:3 in `draw-snake-head-tail`
@OPCODE_1693:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:204:10 in `draw-snake-head-tail`
@OPCODE_1694:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1695:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1696:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1697:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1698:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1699:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1700:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_1701:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_1702:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_1703:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1704:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1705:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_1706:   ; [c64_ir] Add
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
@OPCODE_1707:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1708:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:45:9 in `snake-y`
@OPCODE_1709:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:45:22 in `snake-y`
@OPCODE_1710:   ; [c64_ir] Add
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
@OPCODE_1711:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1712:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:204:20 in `draw-snake-head-tail`
@OPCODE_1713:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1714:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1715:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:51:26 in `draw-white`
@OPCODE_1716:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1717:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1718:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1719:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1720:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1721:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1722:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1723:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1724:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1725:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1726:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1727:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_1728:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1729:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1730:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1731:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1732:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1733:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1734:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1735:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1736:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1737:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1738:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1739:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1740:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1741:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1742:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1743:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1744:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1745:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1746:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1747:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1748:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1749:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_1750:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1751:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1752:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1753:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1754:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1755:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1756:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1757:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1758:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1759:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1760:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1761:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1762:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1763:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1764:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1765:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1766:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1767:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_1768:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_1769:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_1770:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_1771:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_1772:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1773:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1774:   ; [c64_ir] LoopTarget(60)

@target_61:

; <inline>:0:0 in `main`
@OPCODE_1776:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1777:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1778:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1779:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1780:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1781:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1782:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1783:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1784:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:23 in `*`
@OPCODE_1785:   ; [c64_ir] Add
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
@OPCODE_1786:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1787:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_1788:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1789:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1790:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1791:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1792:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_1793:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1794:   ; [c64_ir] Add
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
@OPCODE_1795:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1796:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1797:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1798:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1799:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1800:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1801:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1802:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1803:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1804:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1805:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
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
@OPCODE_1808:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1809:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1810:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1811:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1812:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1813:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1814:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1815:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1816:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1817:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1818:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_1819:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_1820:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1821:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1822:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

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

; <inline>:0:0 in `main`
@OPCODE_1825:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1826:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1827:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1828:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

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

; <inline>:0:0 in `main`
@OPCODE_1831:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1832:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_1833:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_1834:   ; [c64_ir] Add
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
@OPCODE_1835:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1836:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_1837:   ; [c64_ir] Add
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
@OPCODE_1838:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1839:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1840:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1841:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_1842:   ; [c64_ir] JumpIf0(63)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_63

@target_62:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1844:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1845:   ; [c64_ir] JumpElse(64)
    jmp @target_64

@target_63:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1847:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1848:   ; [c64_ir] JumpTarget(63)

@target_64:

; <inline>:0:0 in `main`
@OPCODE_1850:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1851:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1852:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1853:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1854:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1855:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1856:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1857:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1858:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1859:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1860:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1861:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1862:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1863:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1864:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_1865:   ; [c64_ir] LoopIf0(61)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_61

@target_65:

; src/prelude.fth:44:25 in `*`
@OPCODE_1867:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1868:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_1869:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_1870:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1871:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1872:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1873:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1874:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1875:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1876:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1877:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1878:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:35 in `*`
@OPCODE_1879:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1880:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1881:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:48:39 in `convert-x-y`
@OPCODE_1882:   ; [c64_ir] Add
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
@OPCODE_1883:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1884:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1885:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1886:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_1887:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_1888:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_1889:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_1890:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1891:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1892:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1893:   ; [c64_ir] Drop
    dex
    dex

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

; <inline>:0:0 in `main`
@OPCODE_1898:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1899:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:208:3 in `draw-apple`
@OPCODE_1900:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:208:11 in `draw-apple`
@OPCODE_1901:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:208:13 in `draw-apple`
@OPCODE_1902:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:208:21 in `draw-apple`
@OPCODE_1903:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1904:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1905:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:54:31 in `draw-apple-tile`
@OPCODE_1906:   ; [c64_ir] PushLiteral(233)
    inx
    inx
    lda #233
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1907:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1908:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1909:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1910:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1911:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1912:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1913:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1914:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1915:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

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

; src/prelude.fth:5:18 in `rot`
@OPCODE_1918:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1919:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1920:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1921:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1922:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1923:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1924:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1925:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1926:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1927:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1928:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1929:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1930:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_1931:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1932:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1933:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1934:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1935:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1936:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1937:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1938:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1939:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_1940:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1941:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1942:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_1943:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_1944:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_1945:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_1946:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1947:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1948:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1949:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1950:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1951:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1952:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1953:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1954:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1955:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1956:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1957:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_1958:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_1959:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_1960:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_1961:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_1962:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1963:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_1964:   ; [c64_ir] LoopTarget(65)

@target_66:

; <inline>:0:0 in `main`
@OPCODE_1966:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1967:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1968:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1969:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1970:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1971:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1972:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1973:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1974:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:23 in `*`
@OPCODE_1975:   ; [c64_ir] Add
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
@OPCODE_1976:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1977:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_1978:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_1979:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_1980:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1981:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1982:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_1983:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_1984:   ; [c64_ir] Add
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
@OPCODE_1985:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1986:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1987:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1988:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_1989:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1990:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_1991:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_1992:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_1993:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_1994:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_1995:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1996:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1997:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_1998:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_1999:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_2000:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_2001:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_2002:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_2003:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_2004:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2005:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2006:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2007:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2008:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_2009:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_2010:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2011:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2012:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2013:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2014:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2015:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2016:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2017:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2018:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2019:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2020:   ; [c64_ir] Nand
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
@OPCODE_2021:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2022:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2023:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2024:   ; [c64_ir] Add
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
@OPCODE_2025:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2026:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2027:   ; [c64_ir] Add
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
@OPCODE_2028:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2029:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2030:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2031:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2032:   ; [c64_ir] JumpIf0(68)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_68

@target_67:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2034:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2035:   ; [c64_ir] JumpElse(69)
    jmp @target_69

@target_68:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2037:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2038:   ; [c64_ir] JumpTarget(68)

@target_69:

; <inline>:0:0 in `main`
@OPCODE_2040:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2041:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2042:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2043:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2044:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2045:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2046:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2047:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2048:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2049:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2050:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2051:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_2052:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2053:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2054:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_2055:   ; [c64_ir] LoopIf0(66)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_66

@target_70:

; src/prelude.fth:44:25 in `*`
@OPCODE_2057:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_2058:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_2059:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_2060:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2061:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2062:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2063:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2064:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2065:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2066:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2067:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2068:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:35 in `*`
@OPCODE_2069:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2070:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2071:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:48:39 in `convert-x-y`
@OPCODE_2072:   ; [c64_ir] Add
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
@OPCODE_2073:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2074:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2075:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2076:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_2077:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_2078:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_2079:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_2080:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2081:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2082:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2083:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2084:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2085:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2086:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2087:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2088:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2089:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:167:3 in `check-input`
@OPCODE_2090:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:167:12 in `check-input`
@OPCODE_2091:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2092:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2093:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:160:3 in `change-direction`
@OPCODE_2094:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2095:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2096:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_2097:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_2098:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_2099:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_2100:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_2101:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2102:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2103:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2104:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2105:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2106:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2107:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2108:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2109:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2110:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2111:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2112:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2113:   ; [c64_ir] Nand
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
@OPCODE_2114:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2115:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2116:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2117:   ; [c64_ir] Add
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
@OPCODE_2118:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2119:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2120:   ; [c64_ir] Add
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
@OPCODE_2121:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2122:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2123:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2124:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2125:   ; [c64_ir] JumpIf0(72)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_72

@target_71:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2127:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2128:   ; [c64_ir] JumpElse(73)
    jmp @target_73

@target_72:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2130:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2131:   ; [c64_ir] JumpTarget(72)

@target_73:

; <inline>:0:0 in `main`
@OPCODE_2133:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2134:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2135:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2136:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:160:15 in `change-direction`
@OPCODE_2137:   ; [c64_ir] JumpIf0(83)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_83

@target_74:

; <inline>:0:0 in `main`
@OPCODE_2139:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2140:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2141:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2142:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:150:16 in `is-vertical`
@OPCODE_2143:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:150:26 in `is-vertical`
@OPCODE_2144:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2145:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2146:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2147:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2148:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2149:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2150:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2151:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:151:3 in `is-vertical`
@OPCODE_2152:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2153:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2154:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2155:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2156:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2157:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2158:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2159:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2160:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2161:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2162:   ; [c64_ir] Nand
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
@OPCODE_2163:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2164:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2165:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2166:   ; [c64_ir] Add
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
@OPCODE_2167:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2168:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2169:   ; [c64_ir] Add
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
@OPCODE_2170:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2171:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2172:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2173:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2174:   ; [c64_ir] JumpIf0(76)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_76

@target_75:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2176:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2177:   ; [c64_ir] JumpElse(77)
    jmp @target_77

@target_76:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2179:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2180:   ; [c64_ir] JumpTarget(76)

@target_77:

; <inline>:0:0 in `main`
@OPCODE_2182:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2183:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2184:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2185:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2186:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2187:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2188:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2189:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2190:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2191:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2192:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2193:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:152:3 in `is-vertical`
@OPCODE_2194:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2195:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2196:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2197:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2198:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2199:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2200:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2201:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2202:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2203:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2204:   ; [c64_ir] Nand
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
@OPCODE_2205:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2206:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2207:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2208:   ; [c64_ir] Add
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
@OPCODE_2209:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2210:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2211:   ; [c64_ir] Add
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
@OPCODE_2212:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2213:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2214:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2215:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2216:   ; [c64_ir] JumpIf0(79)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_79

@target_78:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2218:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2219:   ; [c64_ir] JumpElse(80)
    jmp @target_80

@target_79:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2221:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2222:   ; [c64_ir] JumpTarget(79)

@target_80:

; <inline>:0:0 in `main`
@OPCODE_2224:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2225:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2226:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2227:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2228:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2229:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2230:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2231:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2232:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2233:   ; [c64_ir] Nand
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
@OPCODE_2234:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2235:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2236:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2237:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2238:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2239:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2240:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2241:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2242:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2243:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2244:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2245:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2246:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2247:   ; [c64_ir] Nand
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
@OPCODE_2248:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2249:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:26:27 in `or`
@OPCODE_2250:   ; [c64_ir] Nand
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
@OPCODE_2251:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2252:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2253:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2254:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:155:27 in `turn-left`
@OPCODE_2255:   ; [c64_ir] JumpIf0(82)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_82

@target_81:

; snake.fth:155:30 in `turn-left`
@OPCODE_2257:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:155:35 in `turn-left`
@OPCODE_2258:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:155:45 in `turn-left`
@OPCODE_2259:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:155:47 in `turn-left`
@OPCODE_2260:   ; [c64_ir] JumpTarget(81)

@target_82:

; <inline>:0:0 in `main`
@OPCODE_2262:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2263:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:160:28 in `change-direction`
@OPCODE_2264:   ; [c64_ir] JumpElse(125)
    jmp @target_125

@target_83:

; snake.fth:161:3 in `change-direction`
@OPCODE_2266:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2267:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2268:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_2269:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_2270:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_2271:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_2272:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_2273:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2274:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2275:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2276:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2277:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2278:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2279:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2280:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2281:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2282:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2283:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2284:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2285:   ; [c64_ir] Nand
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
@OPCODE_2286:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2287:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2288:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2289:   ; [c64_ir] Add
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
@OPCODE_2290:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2291:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2292:   ; [c64_ir] Add
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
@OPCODE_2293:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2294:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2295:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2296:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2297:   ; [c64_ir] JumpIf0(85)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_85

@target_84:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2299:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2300:   ; [c64_ir] JumpElse(86)
    jmp @target_86

@target_85:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2302:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2303:   ; [c64_ir] JumpTarget(85)

@target_86:

; <inline>:0:0 in `main`
@OPCODE_2305:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2306:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2307:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2308:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:161:13 in `change-direction`
@OPCODE_2309:   ; [c64_ir] JumpIf0(96)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_96

@target_87:

; <inline>:0:0 in `main`
@OPCODE_2311:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2312:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2313:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2314:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:146:18 in `is-horizontal`
@OPCODE_2315:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:146:28 in `is-horizontal`
@OPCODE_2316:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2317:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2318:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2319:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2320:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2321:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2322:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2323:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:147:3 in `is-horizontal`
@OPCODE_2324:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2325:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2326:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2327:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2328:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2329:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2330:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2331:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2332:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2333:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2334:   ; [c64_ir] Nand
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
@OPCODE_2335:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2336:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2337:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2338:   ; [c64_ir] Add
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
@OPCODE_2339:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2340:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2341:   ; [c64_ir] Add
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
@OPCODE_2342:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2343:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2344:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2345:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2346:   ; [c64_ir] JumpIf0(89)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_89

@target_88:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2348:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2349:   ; [c64_ir] JumpElse(90)
    jmp @target_90

@target_89:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2351:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2352:   ; [c64_ir] JumpTarget(89)

@target_90:

; <inline>:0:0 in `main`
@OPCODE_2354:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2355:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2356:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2357:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2358:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2359:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2360:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2361:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2362:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2363:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2364:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2365:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:148:3 in `is-horizontal`
@OPCODE_2366:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2367:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2368:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2369:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2370:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2371:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2372:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2373:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2374:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2375:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2376:   ; [c64_ir] Nand
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
@OPCODE_2377:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2378:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2379:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2380:   ; [c64_ir] Add
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
@OPCODE_2381:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2382:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2383:   ; [c64_ir] Add
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
@OPCODE_2384:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2385:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2386:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2387:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2388:   ; [c64_ir] JumpIf0(92)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_92

@target_91:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2390:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2391:   ; [c64_ir] JumpElse(93)
    jmp @target_93

@target_92:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2393:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2394:   ; [c64_ir] JumpTarget(92)

@target_93:

; <inline>:0:0 in `main`
@OPCODE_2396:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2397:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2398:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2399:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2400:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2401:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2402:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2403:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2404:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2405:   ; [c64_ir] Nand
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
@OPCODE_2406:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2407:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2408:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2409:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2410:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2411:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2412:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2413:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2414:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2415:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2416:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2417:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2418:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2419:   ; [c64_ir] Nand
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
@OPCODE_2420:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2421:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:26:27 in `or`
@OPCODE_2422:   ; [c64_ir] Nand
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
@OPCODE_2423:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2424:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2425:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2426:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:154:29 in `turn-up`
@OPCODE_2427:   ; [c64_ir] JumpIf0(95)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_95

@target_94:

; snake.fth:154:32 in `turn-up`
@OPCODE_2429:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:154:35 in `turn-up`
@OPCODE_2430:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:154:45 in `turn-up`
@OPCODE_2431:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:154:47 in `turn-up`
@OPCODE_2432:   ; [c64_ir] JumpTarget(94)

@target_95:

; <inline>:0:0 in `main`
@OPCODE_2434:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2435:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:161:24 in `change-direction`
@OPCODE_2436:   ; [c64_ir] JumpElse(124)
    jmp @target_124

@target_96:

; snake.fth:162:3 in `change-direction`
@OPCODE_2438:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2439:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2440:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_2441:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_2442:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_2443:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_2444:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_2445:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2446:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2447:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2448:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2449:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2450:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2451:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2452:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2453:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2454:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2455:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2456:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2457:   ; [c64_ir] Nand
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
@OPCODE_2458:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2459:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2460:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2461:   ; [c64_ir] Add
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
@OPCODE_2462:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2463:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2464:   ; [c64_ir] Add
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
@OPCODE_2465:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2466:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2467:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2468:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2469:   ; [c64_ir] JumpIf0(98)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_98

@target_97:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2471:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2472:   ; [c64_ir] JumpElse(99)
    jmp @target_99

@target_98:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2474:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2475:   ; [c64_ir] JumpTarget(98)

@target_99:

; <inline>:0:0 in `main`
@OPCODE_2477:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2478:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2479:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2480:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:162:16 in `change-direction`
@OPCODE_2481:   ; [c64_ir] JumpIf0(109)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_109

@target_100:

; <inline>:0:0 in `main`
@OPCODE_2483:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2484:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2485:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2486:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:150:16 in `is-vertical`
@OPCODE_2487:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:150:26 in `is-vertical`
@OPCODE_2488:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2489:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2490:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2491:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2492:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2493:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2494:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2495:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:151:3 in `is-vertical`
@OPCODE_2496:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2497:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2498:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2499:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2500:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2501:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2502:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2503:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2504:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2505:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2506:   ; [c64_ir] Nand
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
@OPCODE_2507:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2508:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2509:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2510:   ; [c64_ir] Add
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
@OPCODE_2511:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2512:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2513:   ; [c64_ir] Add
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
@OPCODE_2514:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2515:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2516:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2517:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2518:   ; [c64_ir] JumpIf0(102)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_102

@target_101:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2520:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2521:   ; [c64_ir] JumpElse(103)
    jmp @target_103

@target_102:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2523:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2524:   ; [c64_ir] JumpTarget(102)

@target_103:

; <inline>:0:0 in `main`
@OPCODE_2526:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2527:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2528:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2529:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2530:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2531:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2532:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2533:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2534:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2535:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2536:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2537:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:152:3 in `is-vertical`
@OPCODE_2538:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2539:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2540:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2541:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2542:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2543:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2544:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2545:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2546:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2547:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2548:   ; [c64_ir] Nand
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
@OPCODE_2549:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2550:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2551:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2552:   ; [c64_ir] Add
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
@OPCODE_2553:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2554:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2555:   ; [c64_ir] Add
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
@OPCODE_2556:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2557:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2558:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2559:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2560:   ; [c64_ir] JumpIf0(105)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_105

@target_104:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2562:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2563:   ; [c64_ir] JumpElse(106)
    jmp @target_106

@target_105:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2565:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2566:   ; [c64_ir] JumpTarget(105)

@target_106:

; <inline>:0:0 in `main`
@OPCODE_2568:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2569:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2570:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2571:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2572:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2573:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2574:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2575:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2576:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2577:   ; [c64_ir] Nand
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
@OPCODE_2578:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2579:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2580:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2581:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2582:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2583:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2584:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2585:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2586:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2587:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2588:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2589:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2590:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2591:   ; [c64_ir] Nand
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
@OPCODE_2592:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2593:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:26:27 in `or`
@OPCODE_2594:   ; [c64_ir] Nand
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
@OPCODE_2595:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2596:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2597:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2598:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:157:27 in `turn-right`
@OPCODE_2599:   ; [c64_ir] JumpIf0(108)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_108

@target_107:

; snake.fth:157:30 in `turn-right`
@OPCODE_2601:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:157:36 in `turn-right`
@OPCODE_2602:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:157:46 in `turn-right`
@OPCODE_2603:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:157:48 in `turn-right`
@OPCODE_2604:   ; [c64_ir] JumpTarget(107)

@target_108:

; <inline>:0:0 in `main`
@OPCODE_2606:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2607:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:162:30 in `change-direction`
@OPCODE_2608:   ; [c64_ir] JumpElse(123)
    jmp @target_123

@target_109:

; snake.fth:163:3 in `change-direction`
@OPCODE_2610:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2611:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2612:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_2613:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_2614:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_2615:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_2616:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_2617:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2618:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2619:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2620:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2621:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2622:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2623:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2624:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2625:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2626:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2627:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2628:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2629:   ; [c64_ir] Nand
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
@OPCODE_2630:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2631:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2632:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2633:   ; [c64_ir] Add
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
@OPCODE_2634:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2635:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2636:   ; [c64_ir] Add
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
@OPCODE_2637:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2638:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2639:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2640:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2641:   ; [c64_ir] JumpIf0(111)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_111

@target_110:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2643:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2644:   ; [c64_ir] JumpElse(112)
    jmp @target_112

@target_111:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2646:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2647:   ; [c64_ir] JumpTarget(111)

@target_112:

; <inline>:0:0 in `main`
@OPCODE_2649:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2650:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2651:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2652:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:163:15 in `change-direction`
@OPCODE_2653:   ; [c64_ir] JumpIf0(122)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_122

@target_113:

; <inline>:0:0 in `main`
@OPCODE_2655:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2656:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2657:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2658:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:146:18 in `is-horizontal`
@OPCODE_2659:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:146:28 in `is-horizontal`
@OPCODE_2660:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2661:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2662:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2663:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2664:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2665:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2666:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2667:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:147:3 in `is-horizontal`
@OPCODE_2668:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2669:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2670:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2671:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2672:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2673:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2674:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2675:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2676:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2677:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2678:   ; [c64_ir] Nand
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
@OPCODE_2679:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2680:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2681:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2682:   ; [c64_ir] Add
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
@OPCODE_2683:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2684:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2685:   ; [c64_ir] Add
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
@OPCODE_2686:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2687:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2688:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2689:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2690:   ; [c64_ir] JumpIf0(115)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_115

@target_114:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2692:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2693:   ; [c64_ir] JumpElse(116)
    jmp @target_116

@target_115:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2695:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2696:   ; [c64_ir] JumpTarget(115)

@target_116:

; <inline>:0:0 in `main`
@OPCODE_2698:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2699:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2700:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2701:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2702:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2703:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2704:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2705:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2706:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2707:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2708:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2709:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:148:3 in `is-horizontal`
@OPCODE_2710:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2711:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2712:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2713:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2714:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2715:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2716:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2717:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2718:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2719:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2720:   ; [c64_ir] Nand
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
@OPCODE_2721:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2722:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2723:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2724:   ; [c64_ir] Add
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
@OPCODE_2725:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2726:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2727:   ; [c64_ir] Add
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
@OPCODE_2728:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2729:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2730:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2731:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_2732:   ; [c64_ir] JumpIf0(118)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_118

@target_117:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2734:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2735:   ; [c64_ir] JumpElse(119)
    jmp @target_119

@target_118:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2737:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2738:   ; [c64_ir] JumpTarget(118)

@target_119:

; <inline>:0:0 in `main`
@OPCODE_2740:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2741:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2742:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2743:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2744:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2745:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2746:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2747:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2748:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2749:   ; [c64_ir] Nand
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
@OPCODE_2750:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2751:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2752:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2753:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2754:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2755:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2756:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2757:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2758:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2759:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2760:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2761:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2762:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2763:   ; [c64_ir] Nand
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
@OPCODE_2764:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2765:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:26:27 in `or`
@OPCODE_2766:   ; [c64_ir] Nand
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
@OPCODE_2767:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2768:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2769:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2770:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:156:29 in `turn-down`
@OPCODE_2771:   ; [c64_ir] JumpIf0(121)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_121

@target_120:

; snake.fth:156:32 in `turn-down`
@OPCODE_2773:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:156:37 in `turn-down`
@OPCODE_2774:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:156:47 in `turn-down`
@OPCODE_2775:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:156:49 in `turn-down`
@OPCODE_2776:   ; [c64_ir] JumpTarget(120)

@target_121:

; <inline>:0:0 in `main`
@OPCODE_2778:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2779:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:164:3 in `change-direction`
@OPCODE_2780:   ; [c64_ir] JumpTarget(121)

@target_122:

; snake.fth:164:8 in `change-direction`
@OPCODE_2782:   ; [c64_ir] JumpTarget(122)

@target_123:

; snake.fth:164:13 in `change-direction`
@OPCODE_2784:   ; [c64_ir] JumpTarget(123)

@target_124:

; snake.fth:164:18 in `change-direction`
@OPCODE_2786:   ; [c64_ir] JumpTarget(124)

@target_125:

; snake.fth:164:23 in `change-direction`
@OPCODE_2788:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2789:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2790:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:168:3 in `check-input`
@OPCODE_2791:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:168:5 in `check-input`
@OPCODE_2792:   ; [c64_ir] PushLiteral(126)
    inx
    inx
    lda #126
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:168:14 in `check-input`
@OPCODE_2793:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_2794:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2795:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2796:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2797:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:140:3 in `move-snake-tail`
@OPCODE_2798:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; snake.fth:140:6 in `move-snake-tail`
@OPCODE_2799:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:140:13 in `move-snake-tail`
@OPCODE_2800:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:140:15 in `move-snake-tail`
@OPCODE_2801:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:140:15 in `move-snake-tail`
@OPCODE_2802:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:140:15 in `move-snake-tail`
@OPCODE_2803:   ; [c64_ir] LoopTarget(125)

@target_126:

; <inline>:0:0 in `main`
@OPCODE_2805:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2806:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_2807:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_2808:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_2809:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_2810:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_2811:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_2812:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_2813:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_2814:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_2815:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2816:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2817:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:141:9 in `move-snake-tail`
@OPCODE_2818:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2819:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2820:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_2821:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_2822:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_2823:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_2824:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_2825:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_2826:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_2827:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_2828:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_2829:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2830:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2831:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2832:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2833:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2834:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2835:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2836:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2837:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2838:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2839:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2840:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2841:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2842:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_2843:   ; [c64_ir] Add
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
@OPCODE_2844:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2845:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:42:9 in `snake-x`
@OPCODE_2846:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:42:22 in `snake-x`
@OPCODE_2847:   ; [c64_ir] Add
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
@OPCODE_2848:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2849:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:141:24 in `move-snake-tail`
@OPCODE_2850:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2851:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2852:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_2853:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_2854:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_2855:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_2856:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_2857:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_2858:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_2859:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_2860:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_2861:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2862:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2863:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:141:28 in `move-snake-tail`
@OPCODE_2864:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:141:30 in `move-snake-tail`
@OPCODE_2865:   ; [c64_ir] Add
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
@OPCODE_2866:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2867:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2868:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2869:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2870:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2871:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2872:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2873:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2874:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2875:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2876:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_2877:   ; [c64_ir] Add
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
@OPCODE_2878:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2879:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:42:9 in `snake-x`
@OPCODE_2880:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:42:22 in `snake-x`
@OPCODE_2881:   ; [c64_ir] Add
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
@OPCODE_2882:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2883:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:141:40 in `move-snake-tail`
@OPCODE_2884:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_2885:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2886:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_2887:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_2888:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_2889:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_2890:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_2891:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_2892:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_2893:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_2894:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_2895:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2896:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2897:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2898:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2899:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2900:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2901:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2902:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2903:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2904:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2905:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2906:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2907:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2908:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_2909:   ; [c64_ir] Add
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
@OPCODE_2910:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2911:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:45:9 in `snake-y`
@OPCODE_2912:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:45:22 in `snake-y`
@OPCODE_2913:   ; [c64_ir] Add
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
@OPCODE_2914:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2915:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:142:17 in `move-snake-tail`
@OPCODE_2916:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2917:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2918:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:5 in `i`
@OPCODE_2919:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:8 in `i`
@OPCODE_2920:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:11 in `i`
@OPCODE_2921:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:38:14 in `i`
@OPCODE_2922:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:38:20 in `i`
@OPCODE_2923:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:38:26 in `i`
@OPCODE_2924:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:29 in `i`
@OPCODE_2925:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:32 in `i`
@OPCODE_2926:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:38:35 in `i`
@OPCODE_2927:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2928:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2929:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:142:21 in `move-snake-tail`
@OPCODE_2930:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:142:23 in `move-snake-tail`
@OPCODE_2931:   ; [c64_ir] Add
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
@OPCODE_2932:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2933:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2934:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2935:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2936:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2937:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_2938:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_2939:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_2940:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2941:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2942:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:41:13 in `cells`
@OPCODE_2943:   ; [c64_ir] Add
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
@OPCODE_2944:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2945:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:45:9 in `snake-y`
@OPCODE_2946:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:45:22 in `snake-y`
@OPCODE_2947:   ; [c64_ir] Add
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
@OPCODE_2948:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2949:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:142:33 in `move-snake-tail`
@OPCODE_2950:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:143:3 in `move-snake-tail`
@OPCODE_2951:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2952:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2953:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:35:13 in `-loopimpl`
@OPCODE_2954:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2955:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2956:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2957:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2958:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2959:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2960:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2961:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2962:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:35:21 in `-loopimpl`
@OPCODE_2963:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2964:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2965:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2966:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2967:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2968:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2969:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2970:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2971:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:35:29 in `-loopimpl`
@OPCODE_2972:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2973:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2974:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_2975:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_2976:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_2977:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_2978:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2979:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2980:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2981:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2982:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2983:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2984:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_2985:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2986:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_2987:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_2988:   ; [c64_ir] Nand
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
@OPCODE_2989:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2990:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_2991:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_2992:   ; [c64_ir] Add
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
@OPCODE_2993:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2994:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_2995:   ; [c64_ir] Add
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
@OPCODE_2996:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2997:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_2998:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_2999:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3000:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3001:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3002:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3003:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3004:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3005:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3006:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3007:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3008:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3009:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3010:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3011:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3012:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3013:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3014:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3015:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3016:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3017:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3018:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3019:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:35:44 in `-loopimpl`
@OPCODE_3020:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:35:47 in `-loopimpl`
@OPCODE_3021:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3022:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3023:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3024:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3025:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3026:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3027:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3028:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3029:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3030:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3031:   ; [c64_ir] Nand
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
@OPCODE_3032:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3033:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3034:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3035:   ; [c64_ir] Add
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
@OPCODE_3036:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3037:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3038:   ; [c64_ir] Add
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
@OPCODE_3039:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3040:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3041:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3042:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3043:   ; [c64_ir] JumpIf0(128)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_128

@target_127:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3045:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3046:   ; [c64_ir] JumpElse(129)
    jmp @target_129

@target_128:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3048:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3049:   ; [c64_ir] JumpTarget(128)

@target_129:

; <inline>:0:0 in `main`
@OPCODE_3051:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3052:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3053:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3054:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3055:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3056:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3057:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3058:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3059:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3060:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3061:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3062:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:35:57 in `-loopimpl`
@OPCODE_3063:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3064:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3065:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:143:5 in `move-snake-tail`
@OPCODE_3066:   ; [c64_ir] LoopIf0(126)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_126

@target_130:

; snake.fth:143:5 in `move-snake-tail`
@OPCODE_3068:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:143:5 in `move-snake-tail`
@OPCODE_3069:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:143:5 in `move-snake-tail`
@OPCODE_3070:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; snake.fth:143:5 in `move-snake-tail`
@OPCODE_3071:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3072:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3073:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3074:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3075:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:131:20 in `move-snake-head`
@OPCODE_3076:   ; [c64_ir] PushLiteral(-26660)
    inx
    inx
    lda #220
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:131:30 in `move-snake-head`
@OPCODE_3077:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:132:3 in `move-snake-head`
@OPCODE_3078:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3079:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3080:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3081:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3082:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3083:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3084:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3085:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3086:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3087:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3088:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3089:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3090:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3091:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3092:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3093:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3094:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3095:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3096:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3097:   ; [c64_ir] Nand
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
@OPCODE_3098:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3099:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3100:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3101:   ; [c64_ir] Add
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
@OPCODE_3102:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3103:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3104:   ; [c64_ir] Add
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
@OPCODE_3105:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3106:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3107:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3108:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3109:   ; [c64_ir] JumpIf0(132)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_132

@target_131:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3111:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3112:   ; [c64_ir] JumpElse(133)
    jmp @target_133

@target_132:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3114:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3115:   ; [c64_ir] JumpTarget(132)

@target_133:

; <inline>:0:0 in `main`
@OPCODE_3117:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3118:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3119:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3120:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:132:16 in `move-snake-head`
@OPCODE_3121:   ; [c64_ir] JumpIf0(135)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_135

@target_134:

; <inline>:0:0 in `main`
@OPCODE_3123:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3124:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:127:14 in `move-left`
@OPCODE_3125:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; snake.fth:127:17 in `move-left`
@OPCODE_3126:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3127:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3128:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3129:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3130:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_3131:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_3132:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_3133:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3134:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3135:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:20:12 in `+!`
@OPCODE_3136:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:20:15 in `+!`
@OPCODE_3137:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_3138:   ; [c64_ir] Add
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
@OPCODE_3139:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_3140:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_3141:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3142:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3143:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3144:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:132:29 in `move-snake-head`
@OPCODE_3145:   ; [c64_ir] JumpElse(153)
    jmp @target_153

@target_135:

; snake.fth:133:3 in `move-snake-head`
@OPCODE_3147:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3148:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3149:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3150:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3151:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3152:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3153:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3154:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3155:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3156:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3157:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3158:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3159:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3160:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3161:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3162:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3163:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3164:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3165:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3166:   ; [c64_ir] Nand
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
@OPCODE_3167:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3168:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3169:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3170:   ; [c64_ir] Add
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
@OPCODE_3171:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3172:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3173:   ; [c64_ir] Add
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
@OPCODE_3174:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3175:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3176:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3177:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3178:   ; [c64_ir] JumpIf0(137)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_137

@target_136:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3180:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3181:   ; [c64_ir] JumpElse(138)
    jmp @target_138

@target_137:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3183:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3184:   ; [c64_ir] JumpTarget(137)

@target_138:

; <inline>:0:0 in `main`
@OPCODE_3186:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3187:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3188:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3189:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:133:16 in `move-snake-head`
@OPCODE_3190:   ; [c64_ir] JumpIf0(140)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_140

@target_139:

; <inline>:0:0 in `main`
@OPCODE_3192:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3193:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:126:12 in `move-up`
@OPCODE_3194:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; snake.fth:126:15 in `move-up`
@OPCODE_3195:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3196:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3197:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3198:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3199:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_3200:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_3201:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_3202:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3203:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3204:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:20:12 in `+!`
@OPCODE_3205:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:20:15 in `+!`
@OPCODE_3206:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_3207:   ; [c64_ir] Add
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
@OPCODE_3208:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_3209:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_3210:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3211:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3212:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3213:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:133:27 in `move-snake-head`
@OPCODE_3214:   ; [c64_ir] JumpElse(152)
    jmp @target_152

@target_140:

; snake.fth:134:3 in `move-snake-head`
@OPCODE_3216:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3217:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3218:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3219:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3220:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3221:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3222:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3223:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3224:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3225:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3226:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3227:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3228:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3229:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3230:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3231:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3232:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3233:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3234:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3235:   ; [c64_ir] Nand
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
@OPCODE_3236:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3237:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3238:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3239:   ; [c64_ir] Add
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
@OPCODE_3240:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3241:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3242:   ; [c64_ir] Add
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
@OPCODE_3243:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3244:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3245:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3246:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3247:   ; [c64_ir] JumpIf0(142)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_142

@target_141:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3249:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3250:   ; [c64_ir] JumpElse(143)
    jmp @target_143

@target_142:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3252:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3253:   ; [c64_ir] JumpTarget(142)

@target_143:

; <inline>:0:0 in `main`
@OPCODE_3255:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3256:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3257:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3258:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:134:16 in `move-snake-head`
@OPCODE_3259:   ; [c64_ir] JumpIf0(145)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_145

@target_144:

; <inline>:0:0 in `main`
@OPCODE_3261:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3262:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:129:15 in `move-right`
@OPCODE_3263:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:129:17 in `move-right`
@OPCODE_3264:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3265:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3266:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3267:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3268:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_3269:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_3270:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_3271:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3272:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3273:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:20:12 in `+!`
@OPCODE_3274:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:20:15 in `+!`
@OPCODE_3275:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_3276:   ; [c64_ir] Add
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
@OPCODE_3277:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_3278:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_3279:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3280:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3281:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3282:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:134:30 in `move-snake-head`
@OPCODE_3283:   ; [c64_ir] JumpElse(151)
    jmp @target_151

@target_145:

; snake.fth:135:3 in `move-snake-head`
@OPCODE_3285:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3286:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3287:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3288:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3289:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3290:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3291:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3292:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3293:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3294:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3295:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3296:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3297:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3298:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3299:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3300:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3301:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3302:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3303:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3304:   ; [c64_ir] Nand
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
@OPCODE_3305:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3306:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3307:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3308:   ; [c64_ir] Add
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
@OPCODE_3309:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3310:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3311:   ; [c64_ir] Add
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
@OPCODE_3312:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3313:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3314:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3315:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3316:   ; [c64_ir] JumpIf0(147)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_147

@target_146:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3318:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3319:   ; [c64_ir] JumpElse(148)
    jmp @target_148

@target_147:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3321:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3322:   ; [c64_ir] JumpTarget(147)

@target_148:

; <inline>:0:0 in `main`
@OPCODE_3324:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3325:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3326:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3327:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:135:16 in `move-snake-head`
@OPCODE_3328:   ; [c64_ir] JumpIf0(150)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_150

@target_149:

; <inline>:0:0 in `main`
@OPCODE_3330:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3331:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:128:14 in `move-down`
@OPCODE_3332:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:128:16 in `move-down`
@OPCODE_3333:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3334:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3335:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3336:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3337:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_3338:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_3339:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_3340:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3341:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3342:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:20:12 in `+!`
@OPCODE_3343:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:20:15 in `+!`
@OPCODE_3344:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_3345:   ; [c64_ir] Add
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
@OPCODE_3346:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_3347:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_3348:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3349:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3350:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3351:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:136:3 in `move-snake-head`
@OPCODE_3352:   ; [c64_ir] JumpTarget(149)

@target_150:

; snake.fth:136:8 in `move-snake-head`
@OPCODE_3354:   ; [c64_ir] JumpTarget(150)

@target_151:

; snake.fth:136:13 in `move-snake-head`
@OPCODE_3356:   ; [c64_ir] JumpTarget(151)

@target_152:

; snake.fth:136:18 in `move-snake-head`
@OPCODE_3358:   ; [c64_ir] JumpTarget(152)

@target_153:

; snake.fth:136:23 in `move-snake-head`
@OPCODE_3360:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3361:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3362:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3363:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3364:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:184:3 in `check-apple`
@OPCODE_3365:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:184:16 in `check-apple`
@OPCODE_3366:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:184:18 in `check-apple`
@OPCODE_3367:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:184:26 in `check-apple`
@OPCODE_3368:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3369:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3370:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3371:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3372:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3373:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3374:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3375:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3376:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3377:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3378:   ; [c64_ir] Nand
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
@OPCODE_3379:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3380:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3381:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3382:   ; [c64_ir] Add
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
@OPCODE_3383:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3384:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3385:   ; [c64_ir] Add
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
@OPCODE_3386:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3387:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3388:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3389:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3390:   ; [c64_ir] JumpIf0(155)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_155

@target_154:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3392:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3393:   ; [c64_ir] JumpElse(156)
    jmp @target_156

@target_155:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3395:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3396:   ; [c64_ir] JumpTarget(155)

@target_156:

; <inline>:0:0 in `main`
@OPCODE_3398:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3399:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3400:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3401:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:185:3 in `check-apple`
@OPCODE_3402:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:185:16 in `check-apple`
@OPCODE_3403:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:185:18 in `check-apple`
@OPCODE_3404:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:185:26 in `check-apple`
@OPCODE_3405:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3406:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3407:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3408:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3409:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3410:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3411:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3412:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3413:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3414:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3415:   ; [c64_ir] Nand
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
@OPCODE_3416:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3417:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3418:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3419:   ; [c64_ir] Add
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
@OPCODE_3420:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3421:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3422:   ; [c64_ir] Add
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
@OPCODE_3423:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3424:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3425:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3426:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3427:   ; [c64_ir] JumpIf0(158)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_158

@target_157:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3429:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3430:   ; [c64_ir] JumpElse(159)
    jmp @target_159

@target_158:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3432:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3433:   ; [c64_ir] JumpTarget(158)

@target_159:

; <inline>:0:0 in `main`
@OPCODE_3435:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3436:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3437:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3438:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3439:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3440:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:28:9 in `and`
@OPCODE_3441:   ; [c64_ir] Nand
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
@OPCODE_3442:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3443:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3444:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3445:   ; [c64_ir] Nand
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
@OPCODE_3446:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3447:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3448:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3449:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:186:7 in `check-apple`
@OPCODE_3450:   ; [c64_ir] JumpIf0(182)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_182

@target_160:

; <inline>:0:0 in `main`
@OPCODE_3452:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3453:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:177:3 in `move-apple`
@OPCODE_3454:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:177:11 in `move-apple`
@OPCODE_3455:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:177:13 in `move-apple`
@OPCODE_3456:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:177:21 in `move-apple`
@OPCODE_3457:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3458:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3459:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:51:26 in `draw-white`
@OPCODE_3460:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3461:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3462:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_3463:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3464:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3465:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3466:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3467:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3468:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3469:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3470:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3471:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_3472:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3473:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3474:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3475:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3476:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3477:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3478:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3479:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3480:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3481:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3482:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3483:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3484:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_3485:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3486:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3487:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3488:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3489:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3490:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3491:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3492:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3493:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_3494:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3495:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3496:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3497:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3498:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3499:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3500:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3501:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3502:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3503:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3504:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3505:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3506:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3507:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3508:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:48:34 in `convert-x-y`
@OPCODE_3509:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3510:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3511:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_3512:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_3513:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_3514:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_3515:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_3516:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_3517:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_3518:   ; [c64_ir] LoopTarget(160)

@target_161:

; <inline>:0:0 in `main`
@OPCODE_3520:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3521:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3522:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3523:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3524:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3525:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3526:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3527:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3528:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:23 in `*`
@OPCODE_3529:   ; [c64_ir] Add
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
@OPCODE_3530:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3531:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_3532:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_3533:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_3534:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3535:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3536:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_3537:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_3538:   ; [c64_ir] Add
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
@OPCODE_3539:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3540:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3541:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3542:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3543:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3544:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3545:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3546:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3547:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3548:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3549:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3550:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3551:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3552:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3553:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3554:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3555:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3556:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3557:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3558:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3559:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3560:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3561:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3562:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_3563:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_3564:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3565:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3566:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3567:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3568:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3569:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3570:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3571:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3572:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3573:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3574:   ; [c64_ir] Nand
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
@OPCODE_3575:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3576:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3577:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3578:   ; [c64_ir] Add
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
@OPCODE_3579:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3580:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3581:   ; [c64_ir] Add
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
@OPCODE_3582:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3583:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3584:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3585:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_3586:   ; [c64_ir] JumpIf0(163)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_163

@target_162:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3588:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3589:   ; [c64_ir] JumpElse(164)
    jmp @target_164

@target_163:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3591:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3592:   ; [c64_ir] JumpTarget(163)

@target_164:

; <inline>:0:0 in `main`
@OPCODE_3594:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3595:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3596:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3597:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3598:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3599:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3600:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3601:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3602:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3603:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3604:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3605:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_3606:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3607:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3608:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_3609:   ; [c64_ir] LoopIf0(161)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_161

@target_165:

; src/prelude.fth:44:25 in `*`
@OPCODE_3611:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_3612:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_3613:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_3614:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3615:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3616:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3617:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3618:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3619:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3620:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3621:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3622:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:35 in `*`
@OPCODE_3623:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3624:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3625:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:48:39 in `convert-x-y`
@OPCODE_3626:   ; [c64_ir] Add
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
@OPCODE_3627:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3628:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3629:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3630:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:49:34 in `draw-index`
@OPCODE_3631:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:49:43 in `draw-index`
@OPCODE_3632:   ; [c64_ir] Add
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

; snake.fth:49:45 in `draw-index`
@OPCODE_3633:   ; [c64_ir] Store8
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_3634:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3635:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3636:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3637:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3638:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3639:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3640:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3641:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:172:3 in `random-x-position`
@OPCODE_3642:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:172:9 in `random-x-position`
@OPCODE_3643:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3644:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3645:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3646:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3647:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3648:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3649:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3650:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3651:   ; [c64_ir] Nand
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
@OPCODE_3652:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3653:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3654:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3655:   ; [c64_ir] Add
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
@OPCODE_3656:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3657:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3658:   ; [c64_ir] Add
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
@OPCODE_3659:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3660:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3661:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3662:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:8:10 in `random`
@OPCODE_3663:   ; [c64_ir] PushLiteral(127)
    inx
    inx
    lda #127
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:8:26 in `random`
@OPCODE_3664:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:8:28 in `random`
@OPCODE_3665:   ; [c64_ir] PushLiteral(255)
    inx
    inx
    lda #255
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3666:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3667:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:28:9 in `and`
@OPCODE_3668:   ; [c64_ir] Nand
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
@OPCODE_3669:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3670:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3671:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3672:   ; [c64_ir] Nand
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
@OPCODE_3673:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3674:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3675:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3676:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3677:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3678:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3679:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3680:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3681:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3682:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3683:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3684:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3685:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3686:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:48:34 in `%`
@OPCODE_3687:   ; [c64_ir] LoopTarget(165)

@target_166:

; <inline>:0:0 in `main`
@OPCODE_3689:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3690:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3691:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3692:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3693:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3694:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3695:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3696:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3697:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3698:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3699:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3700:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3701:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3702:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3703:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3704:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3705:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3706:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3707:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3708:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3709:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3710:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3711:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3712:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3713:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3714:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3715:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3716:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3717:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3718:   ; [c64_ir] Nand
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
@OPCODE_3719:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3720:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3721:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3722:   ; [c64_ir] Add
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
@OPCODE_3723:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3724:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3725:   ; [c64_ir] Add
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
@OPCODE_3726:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3727:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3728:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3729:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_3730:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_3731:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_3732:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3733:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3734:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3735:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3736:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:47:8 in `0<`
@OPCODE_3737:   ; [c64_ir] PushLiteral(-32768)
    inx
    inx
    lda #0
    sta $00,x
    lda #128
    sta $01,x

; src/prelude.fth:47:14 in `0<`
@OPCODE_3738:   ; [c64_ir] Nand
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
@OPCODE_3739:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3740:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3741:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3742:   ; [c64_ir] Nand
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
@OPCODE_3743:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3744:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:47:26 in `0<`
@OPCODE_3745:   ; [c64_ir] JumpIf0(168)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_168

@target_167:

; src/prelude.fth:47:29 in `0<`
@OPCODE_3747:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:47:32 in `0<`
@OPCODE_3748:   ; [c64_ir] JumpElse(169)
    jmp @target_169

@target_168:

; src/prelude.fth:47:37 in `0<`
@OPCODE_3750:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:47:39 in `0<`
@OPCODE_3751:   ; [c64_ir] JumpTarget(168)

@target_169:

; <inline>:0:0 in `main`
@OPCODE_3753:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3754:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:54 in `%`
@OPCODE_3755:   ; [c64_ir] JumpIf0(171)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_171

@target_170:

; src/prelude.fth:48:57 in `%`
@OPCODE_3757:   ; [c64_ir] Add
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
@OPCODE_3758:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:48:62 in `%`
@OPCODE_3759:   ; [c64_ir] JumpElse(172)
    jmp @target_172

@target_171:

; <inline>:0:0 in `main`
@OPCODE_3761:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3762:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_3763:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3764:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3765:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3766:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3767:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3768:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3769:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3770:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3771:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_3772:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3773:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3774:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3775:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3776:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3777:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3778:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3779:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3780:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3781:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3782:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:71 in `%`
@OPCODE_3783:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3784:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3785:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3786:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3787:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3788:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3789:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3790:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3791:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:81 in `%`
@OPCODE_3792:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:48:83 in `%`
@OPCODE_3793:   ; [c64_ir] JumpTarget(171)

@target_172:

; src/prelude.fth:48:88 in `%`
@OPCODE_3795:   ; [c64_ir] LoopIf0(166)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_166

@target_173:

; <inline>:0:0 in `main`
@OPCODE_3797:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3798:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3799:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3800:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3801:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3802:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3803:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3804:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:99 in `%`
@OPCODE_3805:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3806:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3807:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3808:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3809:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:172:20 in `random-x-position`
@OPCODE_3810:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:172:22 in `random-x-position`
@OPCODE_3811:   ; [c64_ir] Add
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
@OPCODE_3812:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3813:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3814:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3815:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:174:3 in `random-y-position`
@OPCODE_3816:   ; [c64_ir] PushLiteral(25)
    inx
    inx
    lda #25
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:174:10 in `random-y-position`
@OPCODE_3817:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3818:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3819:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3820:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3821:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3822:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3823:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3824:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3825:   ; [c64_ir] Nand
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
@OPCODE_3826:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3827:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3828:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3829:   ; [c64_ir] Add
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
@OPCODE_3830:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3831:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3832:   ; [c64_ir] Add
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
@OPCODE_3833:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3834:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3835:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3836:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:8:10 in `random`
@OPCODE_3837:   ; [c64_ir] PushLiteral(127)
    inx
    inx
    lda #127
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:8:26 in `random`
@OPCODE_3838:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:8:28 in `random`
@OPCODE_3839:   ; [c64_ir] PushLiteral(255)
    inx
    inx
    lda #255
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3840:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3841:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:28:9 in `and`
@OPCODE_3842:   ; [c64_ir] Nand
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
@OPCODE_3843:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3844:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3845:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3846:   ; [c64_ir] Nand
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
@OPCODE_3847:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3848:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3849:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3850:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3851:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3852:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3853:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3854:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3855:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3856:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3857:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3858:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3859:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3860:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:48:34 in `%`
@OPCODE_3861:   ; [c64_ir] LoopTarget(173)

@target_174:

; <inline>:0:0 in `main`
@OPCODE_3863:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3864:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3865:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3866:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3867:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3868:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3869:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3870:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3871:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3872:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3873:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3874:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3875:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_3876:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_3877:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_3878:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_3879:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_3880:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3881:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3882:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3883:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3884:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3885:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3886:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3887:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3888:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3889:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3890:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3891:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3892:   ; [c64_ir] Nand
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
@OPCODE_3893:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3894:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_3895:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_3896:   ; [c64_ir] Add
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
@OPCODE_3897:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3898:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_3899:   ; [c64_ir] Add
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
@OPCODE_3900:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3901:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3902:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3903:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_3904:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_3905:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_3906:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3907:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3908:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3909:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3910:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:47:8 in `0<`
@OPCODE_3911:   ; [c64_ir] PushLiteral(-32768)
    inx
    inx
    lda #0
    sta $00,x
    lda #128
    sta $01,x

; src/prelude.fth:47:14 in `0<`
@OPCODE_3912:   ; [c64_ir] Nand
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
@OPCODE_3913:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3914:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_3915:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_3916:   ; [c64_ir] Nand
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
@OPCODE_3917:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3918:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:47:26 in `0<`
@OPCODE_3919:   ; [c64_ir] JumpIf0(176)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_176

@target_175:

; src/prelude.fth:47:29 in `0<`
@OPCODE_3921:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:47:32 in `0<`
@OPCODE_3922:   ; [c64_ir] JumpElse(177)
    jmp @target_177

@target_176:

; src/prelude.fth:47:37 in `0<`
@OPCODE_3924:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:47:39 in `0<`
@OPCODE_3925:   ; [c64_ir] JumpTarget(176)

@target_177:

; <inline>:0:0 in `main`
@OPCODE_3927:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3928:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:54 in `%`
@OPCODE_3929:   ; [c64_ir] JumpIf0(179)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_179

@target_178:

; src/prelude.fth:48:57 in `%`
@OPCODE_3931:   ; [c64_ir] Add
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
@OPCODE_3932:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:48:62 in `%`
@OPCODE_3933:   ; [c64_ir] JumpElse(180)
    jmp @target_180

@target_179:

; <inline>:0:0 in `main`
@OPCODE_3935:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3936:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:10 in `rot`
@OPCODE_3937:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_3938:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3939:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3940:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3941:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3942:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3943:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3944:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3945:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:5:18 in `rot`
@OPCODE_3946:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3947:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3948:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3949:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3950:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3951:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3952:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3953:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3954:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3955:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3956:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:71 in `%`
@OPCODE_3957:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3958:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3959:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3960:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3961:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3962:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3963:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3964:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3965:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:81 in `%`
@OPCODE_3966:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:48:83 in `%`
@OPCODE_3967:   ; [c64_ir] JumpTarget(179)

@target_180:

; src/prelude.fth:48:88 in `%`
@OPCODE_3969:   ; [c64_ir] LoopIf0(174)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_174

@target_181:

; <inline>:0:0 in `main`
@OPCODE_3971:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3972:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_3973:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_3974:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_3975:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_3976:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3977:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3978:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:99 in `%`
@OPCODE_3979:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3980:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3981:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3982:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3983:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:174:21 in `random-y-position`
@OPCODE_3984:   ; [c64_ir] PushLiteral(2)
    inx
    inx
    lda #2
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:174:23 in `random-y-position`
@OPCODE_3985:   ; [c64_ir] Add
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
@OPCODE_3986:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3987:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3988:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3989:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:105:22 in `set-apple-position`
@OPCODE_3990:   ; [c64_ir] PushLiteral(-26664)
    inx
    inx
    lda #216
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:105:30 in `set-apple-position`
@OPCODE_3991:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:105:32 in `set-apple-position`
@OPCODE_3992:   ; [c64_ir] PushLiteral(-26662)
    inx
    inx
    lda #218
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:105:40 in `set-apple-position`
@OPCODE_3993:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_3994:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3995:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3996:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3997:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_3998:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_3999:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:181:15 in `grow-snake`
@OPCODE_4000:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:181:17 in `grow-snake`
@OPCODE_4001:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4002:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4003:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4004:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4005:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:6:10 in `dup`
@OPCODE_4006:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:6:16 in `dup`
@OPCODE_4007:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:6:22 in `dup`
@OPCODE_4008:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4009:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4010:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:20:12 in `+!`
@OPCODE_4011:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:20:15 in `+!`
@OPCODE_4012:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:20:17 in `+!`
@OPCODE_4013:   ; [c64_ir] Add
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
@OPCODE_4014:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:20:22 in `+!`
@OPCODE_4015:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; <inline>:0:0 in `main`
@OPCODE_4016:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4017:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4018:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4019:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:189:3 in `check-apple`
@OPCODE_4020:   ; [c64_ir] JumpTarget(181)

@target_182:

; <inline>:0:0 in `main`
@OPCODE_4022:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4023:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4024:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4025:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:193:3 in `check-collision`
@OPCODE_4026:   ; [c64_ir] PushLiteral(-28668)
    inx
    inx
    lda #4
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:193:16 in `check-collision`
@OPCODE_4027:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:193:18 in `check-collision`
@OPCODE_4028:   ; [c64_ir] PushLiteral(-27666)
    inx
    inx
    lda #238
    sta $00,x
    lda #147
    sta $01,x

; snake.fth:193:31 in `check-collision`
@OPCODE_4029:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4030:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4031:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; snake.fth:48:34 in `convert-x-y`
@OPCODE_4032:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4033:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4034:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:5 in `*`
@OPCODE_4035:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:8 in `*`
@OPCODE_4036:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:10 in `*`
@OPCODE_4037:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:13 in `*`
@OPCODE_4038:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:44:15 in `*`
@OPCODE_4039:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_4040:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:44:15 in `*`
@OPCODE_4041:   ; [c64_ir] LoopTarget(182)

@target_183:

; <inline>:0:0 in `main`
@OPCODE_4043:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4044:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_4045:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_4046:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_4047:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_4048:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_4049:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4050:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4051:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:23 in `*`
@OPCODE_4052:   ; [c64_ir] Add
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
@OPCODE_4053:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4054:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:12 in `loopimpl`
@OPCODE_4055:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:15 in `loopimpl`
@OPCODE_4056:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:33:18 in `loopimpl`
@OPCODE_4057:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4058:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4059:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:18:8 in `1+`
@OPCODE_4060:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:18:10 in `1+`
@OPCODE_4061:   ; [c64_ir] Add
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
@OPCODE_4062:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4063:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4064:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4065:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4066:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4067:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_4068:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_4069:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_4070:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_4071:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_4072:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4073:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4074:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4075:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4076:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:10 in `over`
@OPCODE_4077:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:4:13 in `over`
@OPCODE_4078:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:4:19 in `over`
@OPCODE_4079:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; src/prelude.fth:4:25 in `over`
@OPCODE_4080:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:4:28 in `over`
@OPCODE_4081:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4082:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4083:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4084:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4085:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:29 in `loopimpl`
@OPCODE_4086:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:32 in `loopimpl`
@OPCODE_4087:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4088:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4089:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4090:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4091:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4092:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4093:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4094:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4095:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_4096:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_4097:   ; [c64_ir] Nand
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
@OPCODE_4098:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4099:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_4100:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_4101:   ; [c64_ir] Add
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
@OPCODE_4102:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4103:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_4104:   ; [c64_ir] Add
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
@OPCODE_4105:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4106:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4107:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4108:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_4109:   ; [c64_ir] JumpIf0(185)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_185

@target_184:

; src/prelude.fth:21:11 in `0=`
@OPCODE_4111:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_4112:   ; [c64_ir] JumpElse(186)
    jmp @target_186

@target_185:

; src/prelude.fth:21:18 in `0=`
@OPCODE_4114:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_4115:   ; [c64_ir] JumpTarget(185)

@target_186:

; <inline>:0:0 in `main`
@OPCODE_4117:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4118:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4119:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4120:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4121:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4122:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_4123:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_4124:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_4125:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_4126:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4127:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4128:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_4129:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4130:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4131:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_4132:   ; [c64_ir] LoopIf0(183)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_183

@target_187:

; src/prelude.fth:44:25 in `*`
@OPCODE_4134:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_4135:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:25 in `*`
@OPCODE_4136:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:44:25 in `*`
@OPCODE_4137:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4138:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4139:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:10 in `swap`
@OPCODE_4140:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:3:13 in `swap`
@OPCODE_4141:   ; [c64_ir] TempStore
    dex
    dex
    lda $03,x
    sta TEMP_PAX2
    lda $02,x
    sta TEMP_PAX1

; src/prelude.fth:3:19 in `swap`
@OPCODE_4142:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:3:22 in `swap`
@OPCODE_4143:   ; [c64_ir] TempLoad
    inx
    inx
    lda TEMP_PAX1
    sta $00,x
    lda TEMP_PAX2
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4144:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4145:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:35 in `*`
@OPCODE_4146:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4147:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4148:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:48:39 in `convert-x-y`
@OPCODE_4149:   ; [c64_ir] Add
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
@OPCODE_4150:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4151:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:196:15 in `check-collision`
@OPCODE_4152:   ; [c64_ir] PushLiteral(1024)
    inx
    inx
    lda #0
    sta $00,x
    lda #4
    sta $01,x

; snake.fth:196:24 in `check-collision`
@OPCODE_4153:   ; [c64_ir] Add
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

; snake.fth:196:26 in `check-collision`
@OPCODE_4154:   ; [c64_ir] Load8
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:199:3 in `check-collision`
@OPCODE_4155:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4156:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4157:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4158:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4159:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4160:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4161:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; <inline>:0:0 in `main`
@OPCODE_4162:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4163:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:14:12 in `invert`
@OPCODE_4164:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:14:15 in `invert`
@OPCODE_4165:   ; [c64_ir] Nand
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
@OPCODE_4166:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4167:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:15:19 in `negate`
@OPCODE_4168:   ; [c64_ir] PushLiteral(1)
    inx
    inx
    lda #1
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:15:21 in `negate`
@OPCODE_4169:   ; [c64_ir] Add
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
@OPCODE_4170:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4171:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:16:19 in `-`
@OPCODE_4172:   ; [c64_ir] Add
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
@OPCODE_4173:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4174:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4175:   ; [c64_ir] PushLiteral(7777)
    inx
    inx
    lda #97
    sta $00,x
    lda #30
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4176:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:21:8 in `0=`
@OPCODE_4177:   ; [c64_ir] JumpIf0(189)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_189

@target_188:

; src/prelude.fth:21:11 in `0=`
@OPCODE_4179:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_4180:   ; [c64_ir] JumpElse(190)
    jmp @target_190

@target_189:

; src/prelude.fth:21:18 in `0=`
@OPCODE_4182:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_4183:   ; [c64_ir] JumpTarget(189)

@target_190:

; <inline>:0:0 in `main`
@OPCODE_4185:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4186:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4187:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4188:   ; [c64_ir] Drop
    dex
    dex

; <inline>:0:0 in `main`
@OPCODE_4189:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; <inline>:0:0 in `main`
@OPCODE_4190:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:224:1 in `main`
@OPCODE_4191:   ; [c64_ir] JumpIf0(192)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_192

@target_191:

; snake.fth:224:4 in `main`
@OPCODE_4193:   ; [c64_ir] JumpElse(193)
    jmp @target_193

@target_192:

; snake.fth:224:9 in `main`
@OPCODE_4195:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:224:11 in `main`
@OPCODE_4196:   ; [c64_ir] PushLiteral(-28672)
    inx
    inx
    lda #0
    sta $00,x
    lda #144
    sta $01,x

; snake.fth:224:23 in `main`
@OPCODE_4197:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:224:25 in `main`
@OPCODE_4198:   ; [c64_ir] JumpTarget(192)

@target_193:

; :0:0 in ``
@OPCODE_4200:   ; [c64_ir] Exit
    rts
.endproc





; function start


