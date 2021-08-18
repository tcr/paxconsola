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

; snake.fth:23:5 in `main`
@OPCODE_2:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_1:

; src/prelude.fth:41:9 in `cells`
@OPCODE_4:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_2:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_9:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_3:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_12:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_4:

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

; snake.fth:26:5 in `main`
@OPCODE_16:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_5:

; src/prelude.fth:41:9 in `cells`
@OPCODE_18:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_6:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_23:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_7:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_26:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_8:

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

; snake.fth:212:15 in `main`
@OPCODE_31:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_9:

; src/prelude.fth:21:8 in `0=`
@OPCODE_33:   ; [c64_ir] JumpIf0(11)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_11

@target_10:

; src/prelude.fth:21:11 in `0=`
@OPCODE_35:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_36:   ; [c64_ir] JumpElse(12)
    jmp @target_12

@target_11:

; src/prelude.fth:21:18 in `0=`
@OPCODE_38:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_39:   ; [c64_ir] JumpTarget(11)

@target_12:

; src/prelude.fth:21:26 in `0=`
@OPCODE_41:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_13:

; snake.fth:212:18 in `main`
@OPCODE_43:   ; [c64_ir] JumpIf0(407)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_407

@target_14:

; snake.fth:212:21 in `main`
@OPCODE_45:   ; [c64_ir] InlineCall("initialize")
    ; inline call(initialize)
    pha
    pha

@target_15:

; snake.fth:116:3 in `initialize`
@OPCODE_47:   ; [c64_ir] InlineCall("draw-background")
    ; inline call(draw-background)
    pha
    pha

@target_16:

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
@OPCODE_54:   ; [c64_ir] LoopTarget(16)

@target_17:

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
@OPCODE_60:   ; [c64_ir] LoopTarget(17)

@target_18:

; snake.fth:60:13 in `draw-background`
@OPCODE_62:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:60:25 in `draw-background`
@OPCODE_63:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_19:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_70:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_20:

; snake.fth:60:30 in `draw-background`
@OPCODE_72:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_21:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_83:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_22:

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

; snake.fth:60:34 in `draw-background`
@OPCODE_86:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_23:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_91:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_24:

; snake.fth:61:9 in `draw-background`
@OPCODE_93:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_25:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_98:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_26:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_102:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_27:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_104:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_28:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_106:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_29:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_113:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_30:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_115:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_31:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_122:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_32:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_124:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_33:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_128:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_34:

; src/prelude.fth:22:8 in `=`
@OPCODE_130:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_35:

; src/prelude.fth:16:12 in `-`
@OPCODE_132:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_36:

; src/prelude.fth:15:12 in `negate`
@OPCODE_134:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_37:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_138:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_38:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_142:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_39:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_145:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_40:

; src/prelude.fth:22:10 in `=`
@OPCODE_147:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_41:

; src/prelude.fth:21:8 in `0=`
@OPCODE_149:   ; [c64_ir] JumpIf0(43)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_43

@target_42:

; src/prelude.fth:21:11 in `0=`
@OPCODE_151:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_152:   ; [c64_ir] JumpElse(44)
    jmp @target_44

@target_43:

; src/prelude.fth:21:18 in `0=`
@OPCODE_154:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_155:   ; [c64_ir] JumpTarget(43)

@target_44:

; src/prelude.fth:21:26 in `0=`
@OPCODE_157:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_45:

; src/prelude.fth:22:13 in `=`
@OPCODE_159:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_46:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_161:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_47:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_167:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_48:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_169:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_170:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_49:

; snake.fth:61:9 in `draw-background`
@OPCODE_172:   ; [c64_ir] LoopIf0(18)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_18

@target_50:

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

; snake.fth:63:4 in `draw-background`
@OPCODE_180:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_51:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_185:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_52:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_189:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_53:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_191:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_54:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_193:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_55:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_200:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_56:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_202:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_57:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_209:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_58:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_211:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_59:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_215:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_60:

; src/prelude.fth:22:8 in `=`
@OPCODE_217:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_61:

; src/prelude.fth:16:12 in `-`
@OPCODE_219:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_62:

; src/prelude.fth:15:12 in `negate`
@OPCODE_221:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_63:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_225:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_64:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_229:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_65:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_232:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_66:

; src/prelude.fth:22:10 in `=`
@OPCODE_234:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_67:

; src/prelude.fth:21:8 in `0=`
@OPCODE_236:   ; [c64_ir] JumpIf0(69)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_69

@target_68:

; src/prelude.fth:21:11 in `0=`
@OPCODE_238:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_239:   ; [c64_ir] JumpElse(70)
    jmp @target_70

@target_69:

; src/prelude.fth:21:18 in `0=`
@OPCODE_241:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_242:   ; [c64_ir] JumpTarget(69)

@target_70:

; src/prelude.fth:21:26 in `0=`
@OPCODE_244:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_71:

; src/prelude.fth:22:13 in `=`
@OPCODE_246:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_72:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_248:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_73:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_254:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_74:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_256:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_257:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_75:

; snake.fth:63:4 in `draw-background`
@OPCODE_259:   ; [c64_ir] LoopIf0(17)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_17

@target_76:

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

; snake.fth:65:4 in `draw-background`
@OPCODE_266:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_77:

; snake.fth:117:3 in `initialize`
@OPCODE_268:   ; [c64_ir] InlineCall("draw-walls")
    ; inline call(draw-walls)
    pha
    pha

@target_78:

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

; snake.fth:69:20 in `draw-walls`
@OPCODE_273:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_79:

; src/prelude.fth:16:12 in `-`
@OPCODE_275:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_80:

; src/prelude.fth:15:12 in `negate`
@OPCODE_277:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_81:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_281:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_82:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_285:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_83:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_288:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_84:

; snake.fth:69:22 in `draw-walls`
@OPCODE_290:   ; [c64_ir] InlineCall("*")
    ; inline call(*)
    pha
    pha

@target_85:

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
@OPCODE_298:   ; [c64_ir] LoopTarget(85)

@target_86:

; src/prelude.fth:44:18 in `*`
@OPCODE_300:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_87:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_307:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_88:

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

; src/prelude.fth:44:25 in `*`
@OPCODE_310:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_89:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_315:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_90:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_319:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_91:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_321:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_92:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_323:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_93:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_330:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_94:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_332:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_95:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_339:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_96:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_341:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_97:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_345:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_98:

; src/prelude.fth:22:8 in `=`
@OPCODE_347:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_99:

; src/prelude.fth:16:12 in `-`
@OPCODE_349:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_100:

; src/prelude.fth:15:12 in `negate`
@OPCODE_351:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_101:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_355:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_102:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_359:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_103:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_362:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_104:

; src/prelude.fth:22:10 in `=`
@OPCODE_364:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_105:

; src/prelude.fth:21:8 in `0=`
@OPCODE_366:   ; [c64_ir] JumpIf0(107)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_107

@target_106:

; src/prelude.fth:21:11 in `0=`
@OPCODE_368:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_369:   ; [c64_ir] JumpElse(108)
    jmp @target_108

@target_107:

; src/prelude.fth:21:18 in `0=`
@OPCODE_371:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_372:   ; [c64_ir] JumpTarget(107)

@target_108:

; src/prelude.fth:21:26 in `0=`
@OPCODE_374:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_109:

; src/prelude.fth:22:13 in `=`
@OPCODE_376:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_110:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_378:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_111:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_384:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_112:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_386:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_387:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_113:

; src/prelude.fth:44:25 in `*`
@OPCODE_389:   ; [c64_ir] LoopIf0(86)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_86

@target_114:

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

; src/prelude.fth:44:30 in `*`
@OPCODE_395:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_115:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_401:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_116:

; src/prelude.fth:44:35 in `*`
@OPCODE_403:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:40 in `*`
@OPCODE_404:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_117:

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
@OPCODE_410:   ; [c64_ir] LoopTarget(117)

@target_118:

; snake.fth:71:9 in `draw-walls`
@OPCODE_412:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:71:14 in `draw-walls`
@OPCODE_413:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_119:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_420:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_120:

; snake.fth:71:19 in `draw-walls`
@OPCODE_422:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_121:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_433:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_122:

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

; snake.fth:71:23 in `draw-walls`
@OPCODE_436:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_123:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_441:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_124:

; snake.fth:72:5 in `draw-walls`
@OPCODE_443:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_125:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_448:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_126:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_452:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_127:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_454:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_128:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_456:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_129:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_463:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_130:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_465:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_131:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_472:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_132:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_474:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_133:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_478:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_134:

; src/prelude.fth:22:8 in `=`
@OPCODE_480:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_135:

; src/prelude.fth:16:12 in `-`
@OPCODE_482:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_136:

; src/prelude.fth:15:12 in `negate`
@OPCODE_484:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_137:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_488:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_138:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_492:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_139:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_495:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_140:

; src/prelude.fth:22:10 in `=`
@OPCODE_497:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_141:

; src/prelude.fth:21:8 in `0=`
@OPCODE_499:   ; [c64_ir] JumpIf0(143)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_143

@target_142:

; src/prelude.fth:21:11 in `0=`
@OPCODE_501:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_502:   ; [c64_ir] JumpElse(144)
    jmp @target_144

@target_143:

; src/prelude.fth:21:18 in `0=`
@OPCODE_504:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_505:   ; [c64_ir] JumpTarget(143)

@target_144:

; src/prelude.fth:21:26 in `0=`
@OPCODE_507:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_145:

; src/prelude.fth:22:13 in `=`
@OPCODE_509:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_146:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_511:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_147:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_517:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_148:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_519:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_520:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_149:

; snake.fth:72:5 in `draw-walls`
@OPCODE_522:   ; [c64_ir] LoopIf0(118)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_118

@target_150:

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
@OPCODE_533:   ; [c64_ir] LoopTarget(150)

@target_151:

; snake.fth:77:9 in `draw-walls`
@OPCODE_535:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:77:14 in `draw-walls`
@OPCODE_536:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_152:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_547:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_153:

; snake.fth:77:16 in `draw-walls`
@OPCODE_549:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_154:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_554:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_155:

; snake.fth:78:5 in `draw-walls`
@OPCODE_556:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_156:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_561:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_157:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_565:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_158:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_567:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_159:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_569:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_160:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_576:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_161:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_578:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_162:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_585:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_163:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_587:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_164:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_591:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_165:

; src/prelude.fth:22:8 in `=`
@OPCODE_593:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_166:

; src/prelude.fth:16:12 in `-`
@OPCODE_595:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_167:

; src/prelude.fth:15:12 in `negate`
@OPCODE_597:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_168:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_601:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_169:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_605:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_170:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_608:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_171:

; src/prelude.fth:22:10 in `=`
@OPCODE_610:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_172:

; src/prelude.fth:21:8 in `0=`
@OPCODE_612:   ; [c64_ir] JumpIf0(174)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_174

@target_173:

; src/prelude.fth:21:11 in `0=`
@OPCODE_614:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_615:   ; [c64_ir] JumpElse(175)
    jmp @target_175

@target_174:

; src/prelude.fth:21:18 in `0=`
@OPCODE_617:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_618:   ; [c64_ir] JumpTarget(174)

@target_175:

; src/prelude.fth:21:26 in `0=`
@OPCODE_620:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_176:

; src/prelude.fth:22:13 in `=`
@OPCODE_622:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_177:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_624:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_178:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_630:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_179:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_632:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_633:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_180:

; snake.fth:78:5 in `draw-walls`
@OPCODE_635:   ; [c64_ir] LoopIf0(151)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_151

@target_181:

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

; snake.fth:81:13 in `draw-walls`
@OPCODE_643:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_182:

; src/prelude.fth:16:12 in `-`
@OPCODE_645:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_183:

; src/prelude.fth:15:12 in `negate`
@OPCODE_647:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_184:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_651:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_185:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_655:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_186:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_658:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_187:

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
@OPCODE_664:   ; [c64_ir] LoopTarget(187)

@target_188:

; snake.fth:83:9 in `draw-walls`
@OPCODE_666:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:83:14 in `draw-walls`
@OPCODE_667:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_189:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_674:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_190:

; snake.fth:83:19 in `draw-walls`
@OPCODE_676:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_191:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_681:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_192:

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

; snake.fth:85:5 in `draw-walls`
@OPCODE_685:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_193:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_690:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_194:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_694:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_195:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_696:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_196:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_698:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_197:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_705:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_198:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_707:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_199:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_714:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_200:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_716:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_201:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_720:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_202:

; src/prelude.fth:22:8 in `=`
@OPCODE_722:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_203:

; src/prelude.fth:16:12 in `-`
@OPCODE_724:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_204:

; src/prelude.fth:15:12 in `negate`
@OPCODE_726:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_205:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_730:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_206:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_734:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_207:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_737:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_208:

; src/prelude.fth:22:10 in `=`
@OPCODE_739:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_209:

; src/prelude.fth:21:8 in `0=`
@OPCODE_741:   ; [c64_ir] JumpIf0(211)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_211

@target_210:

; src/prelude.fth:21:11 in `0=`
@OPCODE_743:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_744:   ; [c64_ir] JumpElse(212)
    jmp @target_212

@target_211:

; src/prelude.fth:21:18 in `0=`
@OPCODE_746:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_747:   ; [c64_ir] JumpTarget(211)

@target_212:

; src/prelude.fth:21:26 in `0=`
@OPCODE_749:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_213:

; src/prelude.fth:22:13 in `=`
@OPCODE_751:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_214:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_753:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_215:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_759:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_216:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_761:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_762:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_217:

; snake.fth:85:5 in `draw-walls`
@OPCODE_764:   ; [c64_ir] LoopIf0(188)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_188

@target_218:

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
@OPCODE_776:   ; [c64_ir] LoopTarget(218)

@target_219:

; snake.fth:91:9 in `draw-walls`
@OPCODE_778:   ; [c64_ir] PushLiteral(230)
    inx
    inx
    lda #230
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:91:14 in `draw-walls`
@OPCODE_779:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_220:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_786:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_221:

; snake.fth:91:19 in `draw-walls`
@OPCODE_788:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_222:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_793:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_223:

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

; snake.fth:93:5 in `draw-walls`
@OPCODE_797:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_224:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_802:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_225:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_806:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_226:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_808:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_227:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_810:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_228:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_817:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_229:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_819:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_230:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_826:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_231:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_828:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_232:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_832:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_233:

; src/prelude.fth:22:8 in `=`
@OPCODE_834:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_234:

; src/prelude.fth:16:12 in `-`
@OPCODE_836:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_235:

; src/prelude.fth:15:12 in `negate`
@OPCODE_838:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_236:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_842:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_237:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_846:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_238:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_849:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_239:

; src/prelude.fth:22:10 in `=`
@OPCODE_851:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_240:

; src/prelude.fth:21:8 in `0=`
@OPCODE_853:   ; [c64_ir] JumpIf0(242)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_242

@target_241:

; src/prelude.fth:21:11 in `0=`
@OPCODE_855:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_856:   ; [c64_ir] JumpElse(243)
    jmp @target_243

@target_242:

; src/prelude.fth:21:18 in `0=`
@OPCODE_858:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_859:   ; [c64_ir] JumpTarget(242)

@target_243:

; src/prelude.fth:21:26 in `0=`
@OPCODE_861:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_244:

; src/prelude.fth:22:13 in `=`
@OPCODE_863:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_245:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_865:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_246:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_871:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_247:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_873:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_874:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_248:

; snake.fth:93:5 in `draw-walls`
@OPCODE_876:   ; [c64_ir] LoopIf0(219)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_219

@target_249:

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

; snake.fth:95:5 in `draw-walls`
@OPCODE_883:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_250:

; snake.fth:118:3 in `initialize`
@OPCODE_885:   ; [c64_ir] InlineCall("initialize-snake")
    ; inline call(initialize-snake)
    pha
    pha

@target_251:

; snake.fth:98:3 in `initialize-snake`
@OPCODE_887:   ; [c64_ir] PushLiteral(4)
    inx
    inx
    lda #4
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:98:5 in `initialize-snake`
@OPCODE_888:   ; [c64_ir] PushLiteral(-26658)
    inx
    inx
    lda #222
    sta $00,x
    lda #151
    sta $01,x

; snake.fth:98:12 in `initialize-snake`
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
@OPCODE_897:   ; [c64_ir] LoopTarget(251)

@target_252:

; snake.fth:100:5 in `initialize-snake`
@OPCODE_899:   ; [c64_ir] PushLiteral(8)
    inx
    inx
    lda #8
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:100:7 in `initialize-snake`
@OPCODE_900:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_253:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_911:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_254:

; snake.fth:100:9 in `initialize-snake`
@OPCODE_913:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_255:

; src/prelude.fth:16:12 in `-`
@OPCODE_915:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_256:

; src/prelude.fth:15:12 in `negate`
@OPCODE_917:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_257:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_921:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_258:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_925:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_259:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_928:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_260:

; snake.fth:100:11 in `initialize-snake`
@OPCODE_930:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_261:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_941:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_262:

; snake.fth:100:13 in `initialize-snake`
@OPCODE_943:   ; [c64_ir] InlineCall("snake-x")
    ; inline call(snake-x)
    pha
    pha

@target_263:

; snake.fth:42:3 in `snake-x`
@OPCODE_945:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_264:

; src/prelude.fth:41:9 in `cells`
@OPCODE_947:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_265:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_952:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_266:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_955:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_267:

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

; snake.fth:42:24 in `snake-x`
@OPCODE_959:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_268:

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

; snake.fth:101:7 in `initialize-snake`
@OPCODE_963:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_269:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_974:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_270:

; snake.fth:101:9 in `initialize-snake`
@OPCODE_976:   ; [c64_ir] InlineCall("snake-y")
    ; inline call(snake-y)
    pha
    pha

@target_271:

; snake.fth:45:3 in `snake-y`
@OPCODE_978:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_272:

; src/prelude.fth:41:9 in `cells`
@OPCODE_980:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_273:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_985:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_274:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_988:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_275:

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

; snake.fth:45:24 in `snake-y`
@OPCODE_992:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_276:

; snake.fth:101:17 in `initialize-snake`
@OPCODE_994:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:102:3 in `initialize-snake`
@OPCODE_995:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_277:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_1000:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_278:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_1004:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_279:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_1006:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_280:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_1008:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_281:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1015:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_282:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_1017:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_283:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1024:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_284:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_1026:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_285:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_1030:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_286:

; src/prelude.fth:22:8 in `=`
@OPCODE_1032:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_287:

; src/prelude.fth:16:12 in `-`
@OPCODE_1034:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_288:

; src/prelude.fth:15:12 in `negate`
@OPCODE_1036:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_289:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_1040:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_290:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_1044:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_291:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_1047:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_292:

; src/prelude.fth:22:10 in `=`
@OPCODE_1049:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_293:

; src/prelude.fth:21:8 in `0=`
@OPCODE_1051:   ; [c64_ir] JumpIf0(295)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_295

@target_294:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1053:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1054:   ; [c64_ir] JumpElse(296)
    jmp @target_296

@target_295:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1056:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1057:   ; [c64_ir] JumpTarget(295)

@target_296:

; src/prelude.fth:21:26 in `0=`
@OPCODE_1059:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_297:

; src/prelude.fth:22:13 in `=`
@OPCODE_1061:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_298:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_1063:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_299:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1069:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_300:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1071:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_1072:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_301:

; snake.fth:102:3 in `initialize-snake`
@OPCODE_1074:   ; [c64_ir] LoopIf0(252)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_252

@target_302:

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

; snake.fth:103:21 in `initialize-snake`
@OPCODE_1083:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_303:

; snake.fth:119:3 in `initialize`
@OPCODE_1085:   ; [c64_ir] InlineCall("initialize-apple")
    ; inline call(initialize-apple)
    pha
    pha

@target_304:

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

; snake.fth:107:26 in `initialize-apple`
@OPCODE_1089:   ; [c64_ir] InlineCall("set-apple-position")
    ; inline call(set-apple-position)
    pha
    pha

@target_305:

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

; snake.fth:105:42 in `set-apple-position`
@OPCODE_1095:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_306:

; snake.fth:107:45 in `initialize-apple`
@OPCODE_1097:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_307:

; snake.fth:120:3 in `initialize`
@OPCODE_1099:   ; [c64_ir] InlineCall("draw-full-snake")
    ; inline call(draw-full-snake)
    pha
    pha

@target_308:

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
@OPCODE_1106:   ; [c64_ir] LoopTarget(308)

@target_309:

; snake.fth:111:5 in `draw-full-snake`
@OPCODE_1108:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_310:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_1119:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_311:

; snake.fth:111:7 in `draw-full-snake`
@OPCODE_1121:   ; [c64_ir] InlineCall("snake-x")
    ; inline call(snake-x)
    pha
    pha

@target_312:

; snake.fth:42:3 in `snake-x`
@OPCODE_1123:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_313:

; src/prelude.fth:41:9 in `cells`
@OPCODE_1125:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_314:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_1130:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_315:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_1133:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_316:

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

; snake.fth:42:24 in `snake-x`
@OPCODE_1137:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_317:

; snake.fth:111:15 in `draw-full-snake`
@OPCODE_1139:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:111:17 in `draw-full-snake`
@OPCODE_1140:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_318:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_1151:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_319:

; snake.fth:111:19 in `draw-full-snake`
@OPCODE_1153:   ; [c64_ir] InlineCall("snake-y")
    ; inline call(snake-y)
    pha
    pha

@target_320:

; snake.fth:45:3 in `snake-y`
@OPCODE_1155:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_321:

; src/prelude.fth:41:9 in `cells`
@OPCODE_1157:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_322:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_1162:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_323:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_1165:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_324:

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

; snake.fth:45:24 in `snake-y`
@OPCODE_1169:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_325:

; snake.fth:111:27 in `draw-full-snake`
@OPCODE_1171:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:111:29 in `draw-full-snake`
@OPCODE_1172:   ; [c64_ir] InlineCall("draw-snake-tile")
    ; inline call(draw-snake-tile)
    pha
    pha

@target_326:

; snake.fth:53:31 in `draw-snake-tile`
@OPCODE_1174:   ; [c64_ir] PushLiteral(232)
    inx
    inx
    lda #232
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:53:36 in `draw-snake-tile`
@OPCODE_1175:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_327:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1177:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1178:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_328:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1184:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_329:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1186:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1187:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_330:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1193:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_331:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1195:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_332:

; snake.fth:53:40 in `draw-snake-tile`
@OPCODE_1197:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_333:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1199:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1200:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_334:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1206:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_335:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1208:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1209:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_336:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1215:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_337:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1217:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_338:

; snake.fth:53:44 in `draw-snake-tile`
@OPCODE_1219:   ; [c64_ir] InlineCall("draw")
    ; inline call(draw)
    pha
    pha

@target_339:

; snake.fth:50:26 in `draw`
@OPCODE_1221:   ; [c64_ir] InlineCall("convert-x-y")
    ; inline call(convert-x-y)
    pha
    pha

@target_340:

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1223:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:48:37 in `convert-x-y`
@OPCODE_1224:   ; [c64_ir] InlineCall("*")
    ; inline call(*)
    pha
    pha

@target_341:

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
@OPCODE_1232:   ; [c64_ir] LoopTarget(341)

@target_342:

; src/prelude.fth:44:18 in `*`
@OPCODE_1234:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_343:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1241:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_344:

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

; src/prelude.fth:44:25 in `*`
@OPCODE_1244:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_345:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_1249:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_346:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_1253:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_347:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_1255:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_348:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_1257:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_349:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1264:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_350:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_1266:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_351:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1273:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_352:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_1275:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_353:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_1279:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_354:

; src/prelude.fth:22:8 in `=`
@OPCODE_1281:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_355:

; src/prelude.fth:16:12 in `-`
@OPCODE_1283:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_356:

; src/prelude.fth:15:12 in `negate`
@OPCODE_1285:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_357:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_1289:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_358:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_1293:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_359:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_1296:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_360:

; src/prelude.fth:22:10 in `=`
@OPCODE_1298:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_361:

; src/prelude.fth:21:8 in `0=`
@OPCODE_1300:   ; [c64_ir] JumpIf0(363)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_363

@target_362:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1302:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1303:   ; [c64_ir] JumpElse(364)
    jmp @target_364

@target_363:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1305:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1306:   ; [c64_ir] JumpTarget(363)

@target_364:

; src/prelude.fth:21:26 in `0=`
@OPCODE_1308:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_365:

; src/prelude.fth:22:13 in `=`
@OPCODE_1310:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_366:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_1312:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_367:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1318:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_368:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1320:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_1321:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_369:

; src/prelude.fth:44:25 in `*`
@OPCODE_1323:   ; [c64_ir] LoopIf0(342)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_342

@target_370:

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

; src/prelude.fth:44:30 in `*`
@OPCODE_1329:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_371:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1335:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_372:

; src/prelude.fth:44:35 in `*`
@OPCODE_1337:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:40 in `*`
@OPCODE_1338:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_373:

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

; snake.fth:48:41 in `convert-x-y`
@OPCODE_1341:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_374:

; snake.fth:50:38 in `draw`
@OPCODE_1343:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_375:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_1348:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_376:

; snake.fth:50:49 in `draw`
@OPCODE_1350:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_377:

; snake.fth:53:49 in `draw-snake-tile`
@OPCODE_1352:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_378:

; snake.fth:112:3 in `draw-full-snake`
@OPCODE_1354:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_379:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_1359:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_380:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_1363:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_381:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_1365:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_382:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_1367:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_383:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1374:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_384:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_1376:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_385:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1383:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_386:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_1385:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_387:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_1389:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_388:

; src/prelude.fth:22:8 in `=`
@OPCODE_1391:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_389:

; src/prelude.fth:16:12 in `-`
@OPCODE_1393:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_390:

; src/prelude.fth:15:12 in `negate`
@OPCODE_1395:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_391:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_1399:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_392:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_1403:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_393:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_1406:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_394:

; src/prelude.fth:22:10 in `=`
@OPCODE_1408:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_395:

; src/prelude.fth:21:8 in `0=`
@OPCODE_1410:   ; [c64_ir] JumpIf0(397)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_397

@target_396:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1412:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1413:   ; [c64_ir] JumpElse(398)
    jmp @target_398

@target_397:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1415:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1416:   ; [c64_ir] JumpTarget(397)

@target_398:

; src/prelude.fth:21:26 in `0=`
@OPCODE_1418:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_399:

; src/prelude.fth:22:13 in `=`
@OPCODE_1420:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_400:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_1422:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_401:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1428:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_402:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1430:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_1431:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_403:

; snake.fth:112:3 in `draw-full-snake`
@OPCODE_1433:   ; [c64_ir] LoopIf0(309)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_309

@target_404:

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

; snake.fth:113:3 in `draw-full-snake`
@OPCODE_1439:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_405:

; snake.fth:121:3 in `initialize`
@OPCODE_1441:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_406:

; snake.fth:212:32 in `main`
@OPCODE_1443:   ; [c64_ir] JumpTarget(406)

@target_407:

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

; snake.fth:216:1 in `main`
@OPCODE_1448:   ; [c64_ir] InlineCall("draw-snake-head-tail")
    ; inline call(draw-snake-head-tail)
    pha
    pha

@target_408:

; snake.fth:202:3 in `draw-snake-head-tail`
@OPCODE_1450:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:202:5 in `draw-snake-head-tail`
@OPCODE_1451:   ; [c64_ir] InlineCall("snake-x")
    ; inline call(snake-x)
    pha
    pha

@target_409:

; snake.fth:42:3 in `snake-x`
@OPCODE_1453:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_410:

; src/prelude.fth:41:9 in `cells`
@OPCODE_1455:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_411:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_1460:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_412:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_1463:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_413:

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

; snake.fth:42:24 in `snake-x`
@OPCODE_1467:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_414:

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

; snake.fth:202:17 in `draw-snake-head-tail`
@OPCODE_1471:   ; [c64_ir] InlineCall("snake-y")
    ; inline call(snake-y)
    pha
    pha

@target_415:

; snake.fth:45:3 in `snake-y`
@OPCODE_1473:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_416:

; src/prelude.fth:41:9 in `cells`
@OPCODE_1475:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_417:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_1480:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_418:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_1483:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_419:

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

; snake.fth:45:24 in `snake-y`
@OPCODE_1487:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_420:

; snake.fth:202:25 in `draw-snake-head-tail`
@OPCODE_1489:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:202:27 in `draw-snake-head-tail`
@OPCODE_1490:   ; [c64_ir] InlineCall("draw-snake-tile")
    ; inline call(draw-snake-tile)
    pha
    pha

@target_421:

; snake.fth:53:31 in `draw-snake-tile`
@OPCODE_1492:   ; [c64_ir] PushLiteral(232)
    inx
    inx
    lda #232
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:53:36 in `draw-snake-tile`
@OPCODE_1493:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_422:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1495:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1496:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_423:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1502:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_424:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1504:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1505:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_425:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1511:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_426:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1513:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_427:

; snake.fth:53:40 in `draw-snake-tile`
@OPCODE_1515:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_428:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1517:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1518:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_429:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1524:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_430:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1526:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1527:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_431:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1533:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_432:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1535:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_433:

; snake.fth:53:44 in `draw-snake-tile`
@OPCODE_1537:   ; [c64_ir] InlineCall("draw")
    ; inline call(draw)
    pha
    pha

@target_434:

; snake.fth:50:26 in `draw`
@OPCODE_1539:   ; [c64_ir] InlineCall("convert-x-y")
    ; inline call(convert-x-y)
    pha
    pha

@target_435:

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1541:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:48:37 in `convert-x-y`
@OPCODE_1542:   ; [c64_ir] InlineCall("*")
    ; inline call(*)
    pha
    pha

@target_436:

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
@OPCODE_1550:   ; [c64_ir] LoopTarget(436)

@target_437:

; src/prelude.fth:44:18 in `*`
@OPCODE_1552:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_438:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1559:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_439:

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

; src/prelude.fth:44:25 in `*`
@OPCODE_1562:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_440:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_1567:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_441:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_1571:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_442:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_1573:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_443:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_1575:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_444:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1582:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_445:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_1584:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_446:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1591:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_447:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_1593:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_448:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_1597:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_449:

; src/prelude.fth:22:8 in `=`
@OPCODE_1599:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_450:

; src/prelude.fth:16:12 in `-`
@OPCODE_1601:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_451:

; src/prelude.fth:15:12 in `negate`
@OPCODE_1603:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_452:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_1607:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_453:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_1611:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_454:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_1614:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_455:

; src/prelude.fth:22:10 in `=`
@OPCODE_1616:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_456:

; src/prelude.fth:21:8 in `0=`
@OPCODE_1618:   ; [c64_ir] JumpIf0(458)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_458

@target_457:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1620:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1621:   ; [c64_ir] JumpElse(459)
    jmp @target_459

@target_458:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1623:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1624:   ; [c64_ir] JumpTarget(458)

@target_459:

; src/prelude.fth:21:26 in `0=`
@OPCODE_1626:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_460:

; src/prelude.fth:22:13 in `=`
@OPCODE_1628:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_461:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_1630:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_462:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1636:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_463:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1638:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_1639:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_464:

; src/prelude.fth:44:25 in `*`
@OPCODE_1641:   ; [c64_ir] LoopIf0(437)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_437

@target_465:

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

; src/prelude.fth:44:30 in `*`
@OPCODE_1647:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_466:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1653:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_467:

; src/prelude.fth:44:35 in `*`
@OPCODE_1655:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:40 in `*`
@OPCODE_1656:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_468:

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

; snake.fth:48:41 in `convert-x-y`
@OPCODE_1659:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_469:

; snake.fth:50:38 in `draw`
@OPCODE_1661:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_470:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_1666:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_471:

; snake.fth:50:49 in `draw`
@OPCODE_1668:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_472:

; snake.fth:53:49 in `draw-snake-tile`
@OPCODE_1670:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_473:

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

; snake.fth:203:12 in `draw-snake-head-tail`
@OPCODE_1674:   ; [c64_ir] InlineCall("snake-x")
    ; inline call(snake-x)
    pha
    pha

@target_474:

; snake.fth:42:3 in `snake-x`
@OPCODE_1676:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_475:

; src/prelude.fth:41:9 in `cells`
@OPCODE_1678:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_476:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_1683:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_477:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_1686:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_478:

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

; snake.fth:42:24 in `snake-x`
@OPCODE_1690:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_479:

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

; snake.fth:204:12 in `draw-snake-head-tail`
@OPCODE_1695:   ; [c64_ir] InlineCall("snake-y")
    ; inline call(snake-y)
    pha
    pha

@target_480:

; snake.fth:45:3 in `snake-y`
@OPCODE_1697:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_481:

; src/prelude.fth:41:9 in `cells`
@OPCODE_1699:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_482:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_1704:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_483:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_1707:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_484:

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

; snake.fth:45:24 in `snake-y`
@OPCODE_1711:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_485:

; snake.fth:204:20 in `draw-snake-head-tail`
@OPCODE_1713:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:205:3 in `draw-snake-head-tail`
@OPCODE_1714:   ; [c64_ir] InlineCall("draw-white")
    ; inline call(draw-white)
    pha
    pha

@target_486:

; snake.fth:51:26 in `draw-white`
@OPCODE_1716:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:51:38 in `draw-white`
@OPCODE_1717:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_487:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1719:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1720:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_488:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1726:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_489:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1728:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1729:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_490:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1735:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_491:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1737:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_492:

; snake.fth:51:42 in `draw-white`
@OPCODE_1739:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_493:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1741:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1742:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_494:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1748:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_495:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1750:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1751:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_496:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1757:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_497:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1759:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_498:

; snake.fth:51:46 in `draw-white`
@OPCODE_1761:   ; [c64_ir] InlineCall("draw")
    ; inline call(draw)
    pha
    pha

@target_499:

; snake.fth:50:26 in `draw`
@OPCODE_1763:   ; [c64_ir] InlineCall("convert-x-y")
    ; inline call(convert-x-y)
    pha
    pha

@target_500:

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1765:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:48:37 in `convert-x-y`
@OPCODE_1766:   ; [c64_ir] InlineCall("*")
    ; inline call(*)
    pha
    pha

@target_501:

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
@OPCODE_1774:   ; [c64_ir] LoopTarget(501)

@target_502:

; src/prelude.fth:44:18 in `*`
@OPCODE_1776:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_503:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1783:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_504:

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

; src/prelude.fth:44:25 in `*`
@OPCODE_1786:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_505:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_1791:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_506:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_1795:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_507:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_1797:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_508:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_1799:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_509:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1806:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_510:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_1808:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_511:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1815:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_512:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_1817:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_513:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_1821:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_514:

; src/prelude.fth:22:8 in `=`
@OPCODE_1823:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_515:

; src/prelude.fth:16:12 in `-`
@OPCODE_1825:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_516:

; src/prelude.fth:15:12 in `negate`
@OPCODE_1827:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_517:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_1831:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_518:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_1835:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_519:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_1838:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_520:

; src/prelude.fth:22:10 in `=`
@OPCODE_1840:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_521:

; src/prelude.fth:21:8 in `0=`
@OPCODE_1842:   ; [c64_ir] JumpIf0(523)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_523

@target_522:

; src/prelude.fth:21:11 in `0=`
@OPCODE_1844:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_1845:   ; [c64_ir] JumpElse(524)
    jmp @target_524

@target_523:

; src/prelude.fth:21:18 in `0=`
@OPCODE_1847:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_1848:   ; [c64_ir] JumpTarget(523)

@target_524:

; src/prelude.fth:21:26 in `0=`
@OPCODE_1850:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_525:

; src/prelude.fth:22:13 in `=`
@OPCODE_1852:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_526:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_1854:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_527:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1860:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_528:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_1862:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_1863:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_529:

; src/prelude.fth:44:25 in `*`
@OPCODE_1865:   ; [c64_ir] LoopIf0(502)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_502

@target_530:

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

; src/prelude.fth:44:30 in `*`
@OPCODE_1871:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_531:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1877:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_532:

; src/prelude.fth:44:35 in `*`
@OPCODE_1879:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:40 in `*`
@OPCODE_1880:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_533:

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

; snake.fth:48:41 in `convert-x-y`
@OPCODE_1883:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_534:

; snake.fth:50:38 in `draw`
@OPCODE_1885:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_535:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_1890:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_536:

; snake.fth:50:49 in `draw`
@OPCODE_1892:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_537:

; snake.fth:51:51 in `draw-white`
@OPCODE_1894:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_538:

; snake.fth:205:14 in `draw-snake-head-tail`
@OPCODE_1896:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_539:

; snake.fth:217:1 in `main`
@OPCODE_1898:   ; [c64_ir] InlineCall("draw-apple")
    ; inline call(draw-apple)
    pha
    pha

@target_540:

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

; snake.fth:208:23 in `draw-apple`
@OPCODE_1904:   ; [c64_ir] InlineCall("draw-apple-tile")
    ; inline call(draw-apple-tile)
    pha
    pha

@target_541:

; snake.fth:54:31 in `draw-apple-tile`
@OPCODE_1906:   ; [c64_ir] PushLiteral(233)
    inx
    inx
    lda #233
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:54:36 in `draw-apple-tile`
@OPCODE_1907:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_542:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1909:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1910:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_543:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1916:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_544:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1918:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1919:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_545:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1925:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_546:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1927:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_547:

; snake.fth:54:40 in `draw-apple-tile`
@OPCODE_1929:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_548:

; src/prelude.fth:5:10 in `rot`
@OPCODE_1931:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_1932:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_549:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1938:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_550:

; src/prelude.fth:5:18 in `rot`
@OPCODE_1940:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_1941:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_551:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_1947:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_552:

; src/prelude.fth:5:26 in `rot`
@OPCODE_1949:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_553:

; snake.fth:54:44 in `draw-apple-tile`
@OPCODE_1951:   ; [c64_ir] InlineCall("draw")
    ; inline call(draw)
    pha
    pha

@target_554:

; snake.fth:50:26 in `draw`
@OPCODE_1953:   ; [c64_ir] InlineCall("convert-x-y")
    ; inline call(convert-x-y)
    pha
    pha

@target_555:

; snake.fth:48:34 in `convert-x-y`
@OPCODE_1955:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:48:37 in `convert-x-y`
@OPCODE_1956:   ; [c64_ir] InlineCall("*")
    ; inline call(*)
    pha
    pha

@target_556:

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
@OPCODE_1964:   ; [c64_ir] LoopTarget(556)

@target_557:

; src/prelude.fth:44:18 in `*`
@OPCODE_1966:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_558:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1973:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_559:

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

; src/prelude.fth:44:25 in `*`
@OPCODE_1976:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_560:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_1981:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_561:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_1985:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_562:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_1987:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_563:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_1989:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_564:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_1996:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_565:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_1998:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_566:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_2005:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_567:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_2007:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_568:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_2011:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_569:

; src/prelude.fth:22:8 in `=`
@OPCODE_2013:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_570:

; src/prelude.fth:16:12 in `-`
@OPCODE_2015:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_571:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2017:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_572:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2021:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_573:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2025:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_574:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2028:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_575:

; src/prelude.fth:22:10 in `=`
@OPCODE_2030:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_576:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2032:   ; [c64_ir] JumpIf0(578)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_578

@target_577:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2034:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2035:   ; [c64_ir] JumpElse(579)
    jmp @target_579

@target_578:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2037:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2038:   ; [c64_ir] JumpTarget(578)

@target_579:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2040:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_580:

; src/prelude.fth:22:13 in `=`
@OPCODE_2042:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_581:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_2044:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_582:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2050:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_583:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_2052:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_2053:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_584:

; src/prelude.fth:44:25 in `*`
@OPCODE_2055:   ; [c64_ir] LoopIf0(557)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_557

@target_585:

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

; src/prelude.fth:44:30 in `*`
@OPCODE_2061:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_586:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2067:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_587:

; src/prelude.fth:44:35 in `*`
@OPCODE_2069:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:40 in `*`
@OPCODE_2070:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_588:

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

; snake.fth:48:41 in `convert-x-y`
@OPCODE_2073:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_589:

; snake.fth:50:38 in `draw`
@OPCODE_2075:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_590:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_2080:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_591:

; snake.fth:50:49 in `draw`
@OPCODE_2082:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_592:

; snake.fth:54:49 in `draw-apple-tile`
@OPCODE_2084:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_593:

; snake.fth:208:39 in `draw-apple`
@OPCODE_2086:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_594:

; snake.fth:218:1 in `main`
@OPCODE_2088:   ; [c64_ir] InlineCall("check-input")
    ; inline call(check-input)
    pha
    pha

@target_595:

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

; snake.fth:167:14 in `check-input`
@OPCODE_2092:   ; [c64_ir] InlineCall("change-direction")
    ; inline call(change-direction)
    pha
    pha

@target_596:

; snake.fth:160:3 in `change-direction`
@OPCODE_2094:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:160:8 in `change-direction`
@OPCODE_2095:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_597:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_2102:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_598:

; snake.fth:160:13 in `change-direction`
@OPCODE_2104:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_599:

; src/prelude.fth:22:8 in `=`
@OPCODE_2106:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_600:

; src/prelude.fth:16:12 in `-`
@OPCODE_2108:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_601:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2110:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_602:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2114:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_603:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2118:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_604:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2121:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_605:

; src/prelude.fth:22:10 in `=`
@OPCODE_2123:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_606:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2125:   ; [c64_ir] JumpIf0(608)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_608

@target_607:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2127:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2128:   ; [c64_ir] JumpElse(609)
    jmp @target_609

@target_608:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2130:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2131:   ; [c64_ir] JumpTarget(608)

@target_609:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2133:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_610:

; src/prelude.fth:22:13 in `=`
@OPCODE_2135:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_611:

; snake.fth:160:15 in `change-direction`
@OPCODE_2137:   ; [c64_ir] JumpIf0(657)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_657

@target_612:

; snake.fth:160:18 in `change-direction`
@OPCODE_2139:   ; [c64_ir] InlineCall("turn-left")
    ; inline call(turn-left)
    pha
    pha

@target_613:

; snake.fth:155:15 in `turn-left`
@OPCODE_2141:   ; [c64_ir] InlineCall("is-vertical")
    ; inline call(is-vertical)
    pha
    pha

@target_614:

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

; snake.fth:150:28 in `is-vertical`
@OPCODE_2145:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_615:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2150:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_616:

; snake.fth:151:3 in `is-vertical`
@OPCODE_2152:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:151:6 in `is-vertical`
@OPCODE_2153:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_617:

; src/prelude.fth:22:8 in `=`
@OPCODE_2155:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_618:

; src/prelude.fth:16:12 in `-`
@OPCODE_2157:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_619:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2159:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_620:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2163:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_621:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2167:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_622:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2170:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_623:

; src/prelude.fth:22:10 in `=`
@OPCODE_2172:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_624:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2174:   ; [c64_ir] JumpIf0(626)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_626

@target_625:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2176:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2177:   ; [c64_ir] JumpElse(627)
    jmp @target_627

@target_626:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2179:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2180:   ; [c64_ir] JumpTarget(626)

@target_627:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2182:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_628:

; src/prelude.fth:22:13 in `=`
@OPCODE_2184:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_629:

; snake.fth:151:8 in `is-vertical`
@OPCODE_2186:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_630:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2192:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_631:

; snake.fth:152:3 in `is-vertical`
@OPCODE_2194:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:152:8 in `is-vertical`
@OPCODE_2195:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_632:

; src/prelude.fth:22:8 in `=`
@OPCODE_2197:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_633:

; src/prelude.fth:16:12 in `-`
@OPCODE_2199:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_634:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2201:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_635:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2205:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_636:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2209:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_637:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2212:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_638:

; src/prelude.fth:22:10 in `=`
@OPCODE_2214:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_639:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2216:   ; [c64_ir] JumpIf0(641)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_641

@target_640:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2218:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2219:   ; [c64_ir] JumpElse(642)
    jmp @target_642

@target_641:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2221:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2222:   ; [c64_ir] JumpTarget(641)

@target_642:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2224:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_643:

; src/prelude.fth:22:13 in `=`
@OPCODE_2226:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_644:

; snake.fth:152:10 in `is-vertical`
@OPCODE_2228:   ; [c64_ir] InlineCall("or")
    ; inline call(or)
    pha
    pha

@target_645:

; src/prelude.fth:26:8 in `or`
@OPCODE_2230:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_646:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2234:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_647:

; src/prelude.fth:26:15 in `or`
@OPCODE_2236:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_648:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2242:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_649:

; src/prelude.fth:26:20 in `or`
@OPCODE_2244:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_650:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2248:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_651:

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

; src/prelude.fth:26:32 in `or`
@OPCODE_2251:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_652:

; snake.fth:152:13 in `is-vertical`
@OPCODE_2253:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_653:

; snake.fth:155:27 in `turn-left`
@OPCODE_2255:   ; [c64_ir] JumpIf0(655)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_655

@target_654:

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
@OPCODE_2260:   ; [c64_ir] JumpTarget(654)

@target_655:

; snake.fth:155:52 in `turn-left`
@OPCODE_2262:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_656:

; snake.fth:160:28 in `change-direction`
@OPCODE_2264:   ; [c64_ir] JumpElse(843)
    jmp @target_843

@target_657:

; snake.fth:161:3 in `change-direction`
@OPCODE_2266:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:161:6 in `change-direction`
@OPCODE_2267:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_658:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_2274:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_659:

; snake.fth:161:11 in `change-direction`
@OPCODE_2276:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_660:

; src/prelude.fth:22:8 in `=`
@OPCODE_2278:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_661:

; src/prelude.fth:16:12 in `-`
@OPCODE_2280:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_662:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2282:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_663:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2286:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_664:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2290:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_665:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2293:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_666:

; src/prelude.fth:22:10 in `=`
@OPCODE_2295:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_667:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2297:   ; [c64_ir] JumpIf0(669)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_669

@target_668:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2299:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2300:   ; [c64_ir] JumpElse(670)
    jmp @target_670

@target_669:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2302:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2303:   ; [c64_ir] JumpTarget(669)

@target_670:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2305:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_671:

; src/prelude.fth:22:13 in `=`
@OPCODE_2307:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_672:

; snake.fth:161:13 in `change-direction`
@OPCODE_2309:   ; [c64_ir] JumpIf0(718)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_718

@target_673:

; snake.fth:161:16 in `change-direction`
@OPCODE_2311:   ; [c64_ir] InlineCall("turn-up")
    ; inline call(turn-up)
    pha
    pha

@target_674:

; snake.fth:154:15 in `turn-up`
@OPCODE_2313:   ; [c64_ir] InlineCall("is-horizontal")
    ; inline call(is-horizontal)
    pha
    pha

@target_675:

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

; snake.fth:146:30 in `is-horizontal`
@OPCODE_2317:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_676:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2322:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_677:

; snake.fth:147:3 in `is-horizontal`
@OPCODE_2324:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:147:8 in `is-horizontal`
@OPCODE_2325:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_678:

; src/prelude.fth:22:8 in `=`
@OPCODE_2327:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_679:

; src/prelude.fth:16:12 in `-`
@OPCODE_2329:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_680:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2331:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_681:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2335:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_682:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2339:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_683:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2342:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_684:

; src/prelude.fth:22:10 in `=`
@OPCODE_2344:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_685:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2346:   ; [c64_ir] JumpIf0(687)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_687

@target_686:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2348:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2349:   ; [c64_ir] JumpElse(688)
    jmp @target_688

@target_687:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2351:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2352:   ; [c64_ir] JumpTarget(687)

@target_688:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2354:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_689:

; src/prelude.fth:22:13 in `=`
@OPCODE_2356:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_690:

; snake.fth:147:10 in `is-horizontal`
@OPCODE_2358:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_691:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2364:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_692:

; snake.fth:148:3 in `is-horizontal`
@OPCODE_2366:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:148:9 in `is-horizontal`
@OPCODE_2367:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_693:

; src/prelude.fth:22:8 in `=`
@OPCODE_2369:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_694:

; src/prelude.fth:16:12 in `-`
@OPCODE_2371:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_695:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2373:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_696:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2377:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_697:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2381:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_698:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2384:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_699:

; src/prelude.fth:22:10 in `=`
@OPCODE_2386:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_700:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2388:   ; [c64_ir] JumpIf0(702)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_702

@target_701:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2390:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2391:   ; [c64_ir] JumpElse(703)
    jmp @target_703

@target_702:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2393:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2394:   ; [c64_ir] JumpTarget(702)

@target_703:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2396:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_704:

; src/prelude.fth:22:13 in `=`
@OPCODE_2398:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_705:

; snake.fth:148:11 in `is-horizontal`
@OPCODE_2400:   ; [c64_ir] InlineCall("or")
    ; inline call(or)
    pha
    pha

@target_706:

; src/prelude.fth:26:8 in `or`
@OPCODE_2402:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_707:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2406:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_708:

; src/prelude.fth:26:15 in `or`
@OPCODE_2408:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_709:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2414:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_710:

; src/prelude.fth:26:20 in `or`
@OPCODE_2416:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_711:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2420:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_712:

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

; src/prelude.fth:26:32 in `or`
@OPCODE_2423:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_713:

; snake.fth:148:14 in `is-horizontal`
@OPCODE_2425:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_714:

; snake.fth:154:29 in `turn-up`
@OPCODE_2427:   ; [c64_ir] JumpIf0(716)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_716

@target_715:

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
@OPCODE_2432:   ; [c64_ir] JumpTarget(715)

@target_716:

; snake.fth:154:52 in `turn-up`
@OPCODE_2434:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_717:

; snake.fth:161:24 in `change-direction`
@OPCODE_2436:   ; [c64_ir] JumpElse(842)
    jmp @target_842

@target_718:

; snake.fth:162:3 in `change-direction`
@OPCODE_2438:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:162:9 in `change-direction`
@OPCODE_2439:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_719:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_2446:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_720:

; snake.fth:162:14 in `change-direction`
@OPCODE_2448:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_721:

; src/prelude.fth:22:8 in `=`
@OPCODE_2450:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_722:

; src/prelude.fth:16:12 in `-`
@OPCODE_2452:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_723:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2454:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_724:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2458:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_725:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2462:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_726:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2465:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_727:

; src/prelude.fth:22:10 in `=`
@OPCODE_2467:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_728:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2469:   ; [c64_ir] JumpIf0(730)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_730

@target_729:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2471:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2472:   ; [c64_ir] JumpElse(731)
    jmp @target_731

@target_730:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2474:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2475:   ; [c64_ir] JumpTarget(730)

@target_731:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2477:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_732:

; src/prelude.fth:22:13 in `=`
@OPCODE_2479:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_733:

; snake.fth:162:16 in `change-direction`
@OPCODE_2481:   ; [c64_ir] JumpIf0(779)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_779

@target_734:

; snake.fth:162:19 in `change-direction`
@OPCODE_2483:   ; [c64_ir] InlineCall("turn-right")
    ; inline call(turn-right)
    pha
    pha

@target_735:

; snake.fth:157:15 in `turn-right`
@OPCODE_2485:   ; [c64_ir] InlineCall("is-vertical")
    ; inline call(is-vertical)
    pha
    pha

@target_736:

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

; snake.fth:150:28 in `is-vertical`
@OPCODE_2489:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_737:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2494:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_738:

; snake.fth:151:3 in `is-vertical`
@OPCODE_2496:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:151:6 in `is-vertical`
@OPCODE_2497:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_739:

; src/prelude.fth:22:8 in `=`
@OPCODE_2499:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_740:

; src/prelude.fth:16:12 in `-`
@OPCODE_2501:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_741:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2503:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_742:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2507:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_743:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2511:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_744:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2514:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_745:

; src/prelude.fth:22:10 in `=`
@OPCODE_2516:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_746:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2518:   ; [c64_ir] JumpIf0(748)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_748

@target_747:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2520:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2521:   ; [c64_ir] JumpElse(749)
    jmp @target_749

@target_748:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2523:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2524:   ; [c64_ir] JumpTarget(748)

@target_749:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2526:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_750:

; src/prelude.fth:22:13 in `=`
@OPCODE_2528:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_751:

; snake.fth:151:8 in `is-vertical`
@OPCODE_2530:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_752:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2536:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_753:

; snake.fth:152:3 in `is-vertical`
@OPCODE_2538:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:152:8 in `is-vertical`
@OPCODE_2539:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_754:

; src/prelude.fth:22:8 in `=`
@OPCODE_2541:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_755:

; src/prelude.fth:16:12 in `-`
@OPCODE_2543:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_756:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2545:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_757:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2549:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_758:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2553:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_759:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2556:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_760:

; src/prelude.fth:22:10 in `=`
@OPCODE_2558:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_761:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2560:   ; [c64_ir] JumpIf0(763)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_763

@target_762:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2562:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2563:   ; [c64_ir] JumpElse(764)
    jmp @target_764

@target_763:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2565:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2566:   ; [c64_ir] JumpTarget(763)

@target_764:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2568:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_765:

; src/prelude.fth:22:13 in `=`
@OPCODE_2570:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_766:

; snake.fth:152:10 in `is-vertical`
@OPCODE_2572:   ; [c64_ir] InlineCall("or")
    ; inline call(or)
    pha
    pha

@target_767:

; src/prelude.fth:26:8 in `or`
@OPCODE_2574:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_768:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2578:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_769:

; src/prelude.fth:26:15 in `or`
@OPCODE_2580:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_770:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2586:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_771:

; src/prelude.fth:26:20 in `or`
@OPCODE_2588:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_772:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2592:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_773:

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

; src/prelude.fth:26:32 in `or`
@OPCODE_2595:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_774:

; snake.fth:152:13 in `is-vertical`
@OPCODE_2597:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_775:

; snake.fth:157:27 in `turn-right`
@OPCODE_2599:   ; [c64_ir] JumpIf0(777)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_777

@target_776:

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
@OPCODE_2604:   ; [c64_ir] JumpTarget(776)

@target_777:

; snake.fth:157:53 in `turn-right`
@OPCODE_2606:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_778:

; snake.fth:162:30 in `change-direction`
@OPCODE_2608:   ; [c64_ir] JumpElse(841)
    jmp @target_841

@target_779:

; snake.fth:163:3 in `change-direction`
@OPCODE_2610:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:163:8 in `change-direction`
@OPCODE_2611:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_780:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_2618:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_781:

; snake.fth:163:13 in `change-direction`
@OPCODE_2620:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_782:

; src/prelude.fth:22:8 in `=`
@OPCODE_2622:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_783:

; src/prelude.fth:16:12 in `-`
@OPCODE_2624:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_784:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2626:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_785:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2630:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_786:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2634:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_787:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2637:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_788:

; src/prelude.fth:22:10 in `=`
@OPCODE_2639:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_789:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2641:   ; [c64_ir] JumpIf0(791)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_791

@target_790:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2643:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2644:   ; [c64_ir] JumpElse(792)
    jmp @target_792

@target_791:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2646:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2647:   ; [c64_ir] JumpTarget(791)

@target_792:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2649:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_793:

; src/prelude.fth:22:13 in `=`
@OPCODE_2651:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_794:

; snake.fth:163:15 in `change-direction`
@OPCODE_2653:   ; [c64_ir] JumpIf0(840)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_840

@target_795:

; snake.fth:163:18 in `change-direction`
@OPCODE_2655:   ; [c64_ir] InlineCall("turn-down")
    ; inline call(turn-down)
    pha
    pha

@target_796:

; snake.fth:156:15 in `turn-down`
@OPCODE_2657:   ; [c64_ir] InlineCall("is-horizontal")
    ; inline call(is-horizontal)
    pha
    pha

@target_797:

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

; snake.fth:146:30 in `is-horizontal`
@OPCODE_2661:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_798:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2666:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_799:

; snake.fth:147:3 in `is-horizontal`
@OPCODE_2668:   ; [c64_ir] PushLiteral(37)
    inx
    inx
    lda #37
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:147:8 in `is-horizontal`
@OPCODE_2669:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_800:

; src/prelude.fth:22:8 in `=`
@OPCODE_2671:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_801:

; src/prelude.fth:16:12 in `-`
@OPCODE_2673:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_802:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2675:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_803:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2679:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_804:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2683:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_805:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2686:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_806:

; src/prelude.fth:22:10 in `=`
@OPCODE_2688:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_807:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2690:   ; [c64_ir] JumpIf0(809)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_809

@target_808:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2692:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2693:   ; [c64_ir] JumpElse(810)
    jmp @target_810

@target_809:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2695:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2696:   ; [c64_ir] JumpTarget(809)

@target_810:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2698:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_811:

; src/prelude.fth:22:13 in `=`
@OPCODE_2700:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_812:

; snake.fth:147:10 in `is-horizontal`
@OPCODE_2702:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_813:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2708:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_814:

; snake.fth:148:3 in `is-horizontal`
@OPCODE_2710:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:148:9 in `is-horizontal`
@OPCODE_2711:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_815:

; src/prelude.fth:22:8 in `=`
@OPCODE_2713:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_816:

; src/prelude.fth:16:12 in `-`
@OPCODE_2715:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_817:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2717:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_818:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2721:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_819:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2725:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_820:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2728:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_821:

; src/prelude.fth:22:10 in `=`
@OPCODE_2730:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_822:

; src/prelude.fth:21:8 in `0=`
@OPCODE_2732:   ; [c64_ir] JumpIf0(824)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_824

@target_823:

; src/prelude.fth:21:11 in `0=`
@OPCODE_2734:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_2735:   ; [c64_ir] JumpElse(825)
    jmp @target_825

@target_824:

; src/prelude.fth:21:18 in `0=`
@OPCODE_2737:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_2738:   ; [c64_ir] JumpTarget(824)

@target_825:

; src/prelude.fth:21:26 in `0=`
@OPCODE_2740:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_826:

; src/prelude.fth:22:13 in `=`
@OPCODE_2742:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_827:

; snake.fth:148:11 in `is-horizontal`
@OPCODE_2744:   ; [c64_ir] InlineCall("or")
    ; inline call(or)
    pha
    pha

@target_828:

; src/prelude.fth:26:8 in `or`
@OPCODE_2746:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_829:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2750:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_830:

; src/prelude.fth:26:15 in `or`
@OPCODE_2752:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_831:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2758:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_832:

; src/prelude.fth:26:20 in `or`
@OPCODE_2760:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_833:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2764:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_834:

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

; src/prelude.fth:26:32 in `or`
@OPCODE_2767:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_835:

; snake.fth:148:14 in `is-horizontal`
@OPCODE_2769:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_836:

; snake.fth:156:29 in `turn-down`
@OPCODE_2771:   ; [c64_ir] JumpIf0(838)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_838

@target_837:

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
@OPCODE_2776:   ; [c64_ir] JumpTarget(837)

@target_838:

; snake.fth:156:54 in `turn-down`
@OPCODE_2778:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_839:

; snake.fth:164:3 in `change-direction`
@OPCODE_2780:   ; [c64_ir] JumpTarget(839)

@target_840:

; snake.fth:164:8 in `change-direction`
@OPCODE_2782:   ; [c64_ir] JumpTarget(840)

@target_841:

; snake.fth:164:13 in `change-direction`
@OPCODE_2784:   ; [c64_ir] JumpTarget(841)

@target_842:

; snake.fth:164:18 in `change-direction`
@OPCODE_2786:   ; [c64_ir] JumpTarget(842)

@target_843:

; snake.fth:164:23 in `change-direction`
@OPCODE_2788:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:164:28 in `change-direction`
@OPCODE_2789:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_844:

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

; snake.fth:168:16 in `check-input`
@OPCODE_2794:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_845:

; snake.fth:219:1 in `main`
@OPCODE_2796:   ; [c64_ir] InlineCall("move-snake-tail")
    ; inline call(move-snake-tail)
    pha
    pha

@target_846:

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
@OPCODE_2803:   ; [c64_ir] LoopTarget(846)

@target_847:

; snake.fth:141:7 in `move-snake-tail`
@OPCODE_2805:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_848:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_2816:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_849:

; snake.fth:141:9 in `move-snake-tail`
@OPCODE_2818:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:141:14 in `move-snake-tail`
@OPCODE_2819:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_850:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_2830:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_851:

; snake.fth:141:16 in `move-snake-tail`
@OPCODE_2832:   ; [c64_ir] InlineCall("snake-x")
    ; inline call(snake-x)
    pha
    pha

@target_852:

; snake.fth:42:3 in `snake-x`
@OPCODE_2834:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_853:

; src/prelude.fth:41:9 in `cells`
@OPCODE_2836:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_854:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2841:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_855:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_2844:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_856:

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

; snake.fth:42:24 in `snake-x`
@OPCODE_2848:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_857:

; snake.fth:141:24 in `move-snake-tail`
@OPCODE_2850:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:141:26 in `move-snake-tail`
@OPCODE_2851:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_858:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_2862:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_859:

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

; snake.fth:141:32 in `move-snake-tail`
@OPCODE_2866:   ; [c64_ir] InlineCall("snake-x")
    ; inline call(snake-x)
    pha
    pha

@target_860:

; snake.fth:42:3 in `snake-x`
@OPCODE_2868:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_861:

; src/prelude.fth:41:9 in `cells`
@OPCODE_2870:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_862:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2875:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_863:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_2878:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_864:

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

; snake.fth:42:24 in `snake-x`
@OPCODE_2882:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_865:

; snake.fth:141:40 in `move-snake-tail`
@OPCODE_2884:   ; [c64_ir] Store
    dex
    dex
    dex
    dex
    lda $02,x
    sta ($04,x)
    ; TODO high byte

; snake.fth:142:7 in `move-snake-tail`
@OPCODE_2885:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_866:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_2896:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_867:

; snake.fth:142:9 in `move-snake-tail`
@OPCODE_2898:   ; [c64_ir] InlineCall("snake-y")
    ; inline call(snake-y)
    pha
    pha

@target_868:

; snake.fth:45:3 in `snake-y`
@OPCODE_2900:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_869:

; src/prelude.fth:41:9 in `cells`
@OPCODE_2902:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_870:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2907:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_871:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_2910:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_872:

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

; snake.fth:45:24 in `snake-y`
@OPCODE_2914:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_873:

; snake.fth:142:17 in `move-snake-tail`
@OPCODE_2916:   ; [c64_ir] Load
    lda ($00,x)
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:142:19 in `move-snake-tail`
@OPCODE_2917:   ; [c64_ir] InlineCall("i")
    ; inline call(i)
    pha
    pha

@target_874:

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

; src/prelude.fth:38:41 in `i`
@OPCODE_2928:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_875:

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

; snake.fth:142:25 in `move-snake-tail`
@OPCODE_2932:   ; [c64_ir] InlineCall("snake-y")
    ; inline call(snake-y)
    pha
    pha

@target_876:

; snake.fth:45:3 in `snake-y`
@OPCODE_2934:   ; [c64_ir] InlineCall("cells")
    ; inline call(cells)
    pha
    pha

@target_877:

; src/prelude.fth:41:9 in `cells`
@OPCODE_2936:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_878:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_2941:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_879:

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

; src/prelude.fth:41:15 in `cells`
@OPCODE_2944:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_880:

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

; snake.fth:45:24 in `snake-y`
@OPCODE_2948:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_881:

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

; snake.fth:143:5 in `move-snake-tail`
@OPCODE_2952:   ; [c64_ir] InlineCall("-loopimpl")
    ; inline call(-loopimpl)
    pha
    pha

@target_882:

; src/prelude.fth:35:13 in `-loopimpl`
@OPCODE_2954:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:35:16 in `-loopimpl`
@OPCODE_2955:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_883:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2961:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_884:

; src/prelude.fth:35:21 in `-loopimpl`
@OPCODE_2963:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:35:24 in `-loopimpl`
@OPCODE_2964:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_885:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2970:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_886:

; src/prelude.fth:35:29 in `-loopimpl`
@OPCODE_2972:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:35:32 in `-loopimpl`
@OPCODE_2973:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_887:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_2979:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_888:

; src/prelude.fth:35:37 in `-loopimpl`
@OPCODE_2981:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_889:

; src/prelude.fth:16:12 in `-`
@OPCODE_2983:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_890:

; src/prelude.fth:15:12 in `negate`
@OPCODE_2985:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_891:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_2989:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_892:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_2993:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_893:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_2996:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_894:

; src/prelude.fth:35:39 in `-loopimpl`
@OPCODE_2998:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_895:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_3000:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_896:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3007:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_897:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_3009:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_898:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3016:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_899:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_3018:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_900:

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

; src/prelude.fth:35:50 in `-loopimpl`
@OPCODE_3022:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_901:

; src/prelude.fth:22:8 in `=`
@OPCODE_3024:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_902:

; src/prelude.fth:16:12 in `-`
@OPCODE_3026:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_903:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3028:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_904:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3032:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_905:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3036:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_906:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3039:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_907:

; src/prelude.fth:22:10 in `=`
@OPCODE_3041:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_908:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3043:   ; [c64_ir] JumpIf0(910)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_910

@target_909:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3045:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3046:   ; [c64_ir] JumpElse(911)
    jmp @target_911

@target_910:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3048:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3049:   ; [c64_ir] JumpTarget(910)

@target_911:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3051:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_912:

; src/prelude.fth:22:13 in `=`
@OPCODE_3053:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_913:

; src/prelude.fth:35:52 in `-loopimpl`
@OPCODE_3055:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_914:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3061:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_915:

; src/prelude.fth:35:57 in `-loopimpl`
@OPCODE_3063:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:35:60 in `-loopimpl`
@OPCODE_3064:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_916:

; snake.fth:143:5 in `move-snake-tail`
@OPCODE_3066:   ; [c64_ir] LoopIf0(847)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_847

@target_917:

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

; snake.fth:144:3 in `move-snake-tail`
@OPCODE_3072:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_918:

; snake.fth:220:1 in `main`
@OPCODE_3074:   ; [c64_ir] InlineCall("move-snake-head")
    ; inline call(move-snake-head)
    pha
    pha

@target_919:

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

; snake.fth:132:8 in `move-snake-head`
@OPCODE_3079:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_920:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3086:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_921:

; snake.fth:132:14 in `move-snake-head`
@OPCODE_3088:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_922:

; src/prelude.fth:22:8 in `=`
@OPCODE_3090:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_923:

; src/prelude.fth:16:12 in `-`
@OPCODE_3092:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_924:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3094:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_925:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3098:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_926:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3102:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_927:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3105:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_928:

; src/prelude.fth:22:10 in `=`
@OPCODE_3107:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_929:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3109:   ; [c64_ir] JumpIf0(931)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_931

@target_930:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3111:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3112:   ; [c64_ir] JumpElse(932)
    jmp @target_932

@target_931:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3114:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3115:   ; [c64_ir] JumpTarget(931)

@target_932:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3117:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_933:

; src/prelude.fth:22:13 in `=`
@OPCODE_3119:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_934:

; snake.fth:132:16 in `move-snake-head`
@OPCODE_3121:   ; [c64_ir] JumpIf0(942)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_942

@target_935:

; snake.fth:132:19 in `move-snake-head`
@OPCODE_3123:   ; [c64_ir] InlineCall("move-left")
    ; inline call(move-left)
    pha
    pha

@target_936:

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

; snake.fth:127:30 in `move-left`
@OPCODE_3127:   ; [c64_ir] InlineCall("+!")
    ; inline call(+!)
    pha
    pha

@target_937:

; src/prelude.fth:20:8 in `+!`
@OPCODE_3129:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_938:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_3134:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_939:

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

; src/prelude.fth:20:24 in `+!`
@OPCODE_3141:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_940:

; snake.fth:127:33 in `move-left`
@OPCODE_3143:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_941:

; snake.fth:132:29 in `move-snake-head`
@OPCODE_3145:   ; [c64_ir] JumpElse(1014)
    jmp @target_1014

@target_942:

; snake.fth:133:3 in `move-snake-head`
@OPCODE_3147:   ; [c64_ir] PushLiteral(38)
    inx
    inx
    lda #38
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:133:6 in `move-snake-head`
@OPCODE_3148:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_943:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3155:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_944:

; snake.fth:133:14 in `move-snake-head`
@OPCODE_3157:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_945:

; src/prelude.fth:22:8 in `=`
@OPCODE_3159:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_946:

; src/prelude.fth:16:12 in `-`
@OPCODE_3161:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_947:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3163:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_948:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3167:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_949:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3171:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_950:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3174:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_951:

; src/prelude.fth:22:10 in `=`
@OPCODE_3176:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_952:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3178:   ; [c64_ir] JumpIf0(954)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_954

@target_953:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3180:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3181:   ; [c64_ir] JumpElse(955)
    jmp @target_955

@target_954:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3183:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3184:   ; [c64_ir] JumpTarget(954)

@target_955:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3186:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_956:

; src/prelude.fth:22:13 in `=`
@OPCODE_3188:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_957:

; snake.fth:133:16 in `move-snake-head`
@OPCODE_3190:   ; [c64_ir] JumpIf0(965)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_965

@target_958:

; snake.fth:133:19 in `move-snake-head`
@OPCODE_3192:   ; [c64_ir] InlineCall("move-up")
    ; inline call(move-up)
    pha
    pha

@target_959:

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

; snake.fth:126:28 in `move-up`
@OPCODE_3196:   ; [c64_ir] InlineCall("+!")
    ; inline call(+!)
    pha
    pha

@target_960:

; src/prelude.fth:20:8 in `+!`
@OPCODE_3198:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_961:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_3203:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_962:

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

; src/prelude.fth:20:24 in `+!`
@OPCODE_3210:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_963:

; snake.fth:126:31 in `move-up`
@OPCODE_3212:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_964:

; snake.fth:133:27 in `move-snake-head`
@OPCODE_3214:   ; [c64_ir] JumpElse(1013)
    jmp @target_1013

@target_965:

; snake.fth:134:3 in `move-snake-head`
@OPCODE_3216:   ; [c64_ir] PushLiteral(39)
    inx
    inx
    lda #39
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:134:9 in `move-snake-head`
@OPCODE_3217:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_966:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3224:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_967:

; snake.fth:134:14 in `move-snake-head`
@OPCODE_3226:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_968:

; src/prelude.fth:22:8 in `=`
@OPCODE_3228:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_969:

; src/prelude.fth:16:12 in `-`
@OPCODE_3230:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_970:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3232:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_971:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3236:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_972:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3240:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_973:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3243:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_974:

; src/prelude.fth:22:10 in `=`
@OPCODE_3245:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_975:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3247:   ; [c64_ir] JumpIf0(977)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_977

@target_976:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3249:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3250:   ; [c64_ir] JumpElse(978)
    jmp @target_978

@target_977:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3252:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3253:   ; [c64_ir] JumpTarget(977)

@target_978:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3255:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_979:

; src/prelude.fth:22:13 in `=`
@OPCODE_3257:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_980:

; snake.fth:134:16 in `move-snake-head`
@OPCODE_3259:   ; [c64_ir] JumpIf0(988)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_988

@target_981:

; snake.fth:134:19 in `move-snake-head`
@OPCODE_3261:   ; [c64_ir] InlineCall("move-right")
    ; inline call(move-right)
    pha
    pha

@target_982:

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

; snake.fth:129:30 in `move-right`
@OPCODE_3265:   ; [c64_ir] InlineCall("+!")
    ; inline call(+!)
    pha
    pha

@target_983:

; src/prelude.fth:20:8 in `+!`
@OPCODE_3267:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_984:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_3272:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_985:

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

; src/prelude.fth:20:24 in `+!`
@OPCODE_3279:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_986:

; snake.fth:129:33 in `move-right`
@OPCODE_3281:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_987:

; snake.fth:134:30 in `move-snake-head`
@OPCODE_3283:   ; [c64_ir] JumpElse(1012)
    jmp @target_1012

@target_988:

; snake.fth:135:3 in `move-snake-head`
@OPCODE_3285:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:135:8 in `move-snake-head`
@OPCODE_3286:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_989:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3293:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_990:

; snake.fth:135:14 in `move-snake-head`
@OPCODE_3295:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_991:

; src/prelude.fth:22:8 in `=`
@OPCODE_3297:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_992:

; src/prelude.fth:16:12 in `-`
@OPCODE_3299:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_993:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3301:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_994:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3305:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_995:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3309:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_996:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3312:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_997:

; src/prelude.fth:22:10 in `=`
@OPCODE_3314:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_998:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3316:   ; [c64_ir] JumpIf0(1000)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1000

@target_999:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3318:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3319:   ; [c64_ir] JumpElse(1001)
    jmp @target_1001

@target_1000:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3321:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3322:   ; [c64_ir] JumpTarget(1000)

@target_1001:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3324:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1002:

; src/prelude.fth:22:13 in `=`
@OPCODE_3326:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1003:

; snake.fth:135:16 in `move-snake-head`
@OPCODE_3328:   ; [c64_ir] JumpIf0(1011)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1011

@target_1004:

; snake.fth:135:19 in `move-snake-head`
@OPCODE_3330:   ; [c64_ir] InlineCall("move-down")
    ; inline call(move-down)
    pha
    pha

@target_1005:

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

; snake.fth:128:29 in `move-down`
@OPCODE_3334:   ; [c64_ir] InlineCall("+!")
    ; inline call(+!)
    pha
    pha

@target_1006:

; src/prelude.fth:20:8 in `+!`
@OPCODE_3336:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_1007:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_3341:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1008:

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

; src/prelude.fth:20:24 in `+!`
@OPCODE_3348:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1009:

; snake.fth:128:32 in `move-down`
@OPCODE_3350:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1010:

; snake.fth:136:3 in `move-snake-head`
@OPCODE_3352:   ; [c64_ir] JumpTarget(1010)

@target_1011:

; snake.fth:136:8 in `move-snake-head`
@OPCODE_3354:   ; [c64_ir] JumpTarget(1011)

@target_1012:

; snake.fth:136:13 in `move-snake-head`
@OPCODE_3356:   ; [c64_ir] JumpTarget(1012)

@target_1013:

; snake.fth:136:18 in `move-snake-head`
@OPCODE_3358:   ; [c64_ir] JumpTarget(1013)

@target_1014:

; snake.fth:136:23 in `move-snake-head`
@OPCODE_3360:   ; [c64_ir] Drop
    dex
    dex

; snake.fth:136:28 in `move-snake-head`
@OPCODE_3361:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1015:

; snake.fth:221:1 in `main`
@OPCODE_3363:   ; [c64_ir] InlineCall("check-apple")
    ; inline call(check-apple)
    pha
    pha

@target_1016:

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

; snake.fth:184:28 in `check-apple`
@OPCODE_3369:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_1017:

; src/prelude.fth:22:8 in `=`
@OPCODE_3371:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1018:

; src/prelude.fth:16:12 in `-`
@OPCODE_3373:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1019:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3375:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1020:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3379:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1021:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3383:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1022:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3386:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1023:

; src/prelude.fth:22:10 in `=`
@OPCODE_3388:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_1024:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3390:   ; [c64_ir] JumpIf0(1026)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1026

@target_1025:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3392:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3393:   ; [c64_ir] JumpElse(1027)
    jmp @target_1027

@target_1026:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3395:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3396:   ; [c64_ir] JumpTarget(1026)

@target_1027:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3398:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1028:

; src/prelude.fth:22:13 in `=`
@OPCODE_3400:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1029:

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

; snake.fth:185:28 in `check-apple`
@OPCODE_3406:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_1030:

; src/prelude.fth:22:8 in `=`
@OPCODE_3408:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1031:

; src/prelude.fth:16:12 in `-`
@OPCODE_3410:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1032:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3412:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1033:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3416:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1034:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3420:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1035:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3423:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1036:

; src/prelude.fth:22:10 in `=`
@OPCODE_3425:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_1037:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3427:   ; [c64_ir] JumpIf0(1039)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1039

@target_1038:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3429:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3430:   ; [c64_ir] JumpElse(1040)
    jmp @target_1040

@target_1039:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3432:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3433:   ; [c64_ir] JumpTarget(1039)

@target_1040:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3435:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1041:

; src/prelude.fth:22:13 in `=`
@OPCODE_3437:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1042:

; snake.fth:186:3 in `check-apple`
@OPCODE_3439:   ; [c64_ir] InlineCall("and")
    ; inline call(and)
    pha
    pha

@target_1043:

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

; src/prelude.fth:28:14 in `and`
@OPCODE_3442:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1044:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3446:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1045:

; src/prelude.fth:28:21 in `and`
@OPCODE_3448:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1046:

; snake.fth:186:7 in `check-apple`
@OPCODE_3450:   ; [c64_ir] JumpIf0(1219)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1219

@target_1047:

; snake.fth:187:5 in `check-apple`
@OPCODE_3452:   ; [c64_ir] InlineCall("move-apple")
    ; inline call(move-apple)
    pha
    pha

@target_1048:

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

; snake.fth:177:23 in `move-apple`
@OPCODE_3458:   ; [c64_ir] InlineCall("draw-white")
    ; inline call(draw-white)
    pha
    pha

@target_1049:

; snake.fth:51:26 in `draw-white`
@OPCODE_3460:   ; [c64_ir] PushLiteral(32)
    inx
    inx
    lda #32
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:51:38 in `draw-white`
@OPCODE_3461:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_1050:

; src/prelude.fth:5:10 in `rot`
@OPCODE_3463:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_3464:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1051:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3470:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1052:

; src/prelude.fth:5:18 in `rot`
@OPCODE_3472:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_3473:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1053:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3479:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1054:

; src/prelude.fth:5:26 in `rot`
@OPCODE_3481:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1055:

; snake.fth:51:42 in `draw-white`
@OPCODE_3483:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_1056:

; src/prelude.fth:5:10 in `rot`
@OPCODE_3485:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_3486:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1057:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3492:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1058:

; src/prelude.fth:5:18 in `rot`
@OPCODE_3494:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_3495:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1059:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3501:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1060:

; src/prelude.fth:5:26 in `rot`
@OPCODE_3503:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1061:

; snake.fth:51:46 in `draw-white`
@OPCODE_3505:   ; [c64_ir] InlineCall("draw")
    ; inline call(draw)
    pha
    pha

@target_1062:

; snake.fth:50:26 in `draw`
@OPCODE_3507:   ; [c64_ir] InlineCall("convert-x-y")
    ; inline call(convert-x-y)
    pha
    pha

@target_1063:

; snake.fth:48:34 in `convert-x-y`
@OPCODE_3509:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:48:37 in `convert-x-y`
@OPCODE_3510:   ; [c64_ir] InlineCall("*")
    ; inline call(*)
    pha
    pha

@target_1064:

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
@OPCODE_3518:   ; [c64_ir] LoopTarget(1064)

@target_1065:

; src/prelude.fth:44:18 in `*`
@OPCODE_3520:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1066:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3527:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1067:

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

; src/prelude.fth:44:25 in `*`
@OPCODE_3530:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_1068:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_3535:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_1069:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_3539:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1070:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_3541:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_1071:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_3543:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1072:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3550:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1073:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_3552:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1074:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3559:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1075:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_3561:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1076:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_3565:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_1077:

; src/prelude.fth:22:8 in `=`
@OPCODE_3567:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1078:

; src/prelude.fth:16:12 in `-`
@OPCODE_3569:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1079:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3571:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1080:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3575:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1081:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3579:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1082:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3582:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1083:

; src/prelude.fth:22:10 in `=`
@OPCODE_3584:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_1084:

; src/prelude.fth:21:8 in `0=`
@OPCODE_3586:   ; [c64_ir] JumpIf0(1086)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1086

@target_1085:

; src/prelude.fth:21:11 in `0=`
@OPCODE_3588:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_3589:   ; [c64_ir] JumpElse(1087)
    jmp @target_1087

@target_1086:

; src/prelude.fth:21:18 in `0=`
@OPCODE_3591:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_3592:   ; [c64_ir] JumpTarget(1086)

@target_1087:

; src/prelude.fth:21:26 in `0=`
@OPCODE_3594:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1088:

; src/prelude.fth:22:13 in `=`
@OPCODE_3596:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1089:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_3598:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1090:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3604:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1091:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_3606:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_3607:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1092:

; src/prelude.fth:44:25 in `*`
@OPCODE_3609:   ; [c64_ir] LoopIf0(1065)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1065

@target_1093:

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

; src/prelude.fth:44:30 in `*`
@OPCODE_3615:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1094:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3621:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1095:

; src/prelude.fth:44:35 in `*`
@OPCODE_3623:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:40 in `*`
@OPCODE_3624:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1096:

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

; snake.fth:48:41 in `convert-x-y`
@OPCODE_3627:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1097:

; snake.fth:50:38 in `draw`
@OPCODE_3629:   ; [c64_ir] InlineCall("draw-index")
    ; inline call(draw-index)
    pha
    pha

@target_1098:

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

; snake.fth:49:48 in `draw-index`
@OPCODE_3634:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1099:

; snake.fth:50:49 in `draw`
@OPCODE_3636:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1100:

; snake.fth:51:51 in `draw-white`
@OPCODE_3638:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1101:

; snake.fth:178:3 in `move-apple`
@OPCODE_3640:   ; [c64_ir] InlineCall("random-x-position")
    ; inline call(random-x-position)
    pha
    pha

@target_1102:

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

; snake.fth:172:11 in `random-x-position`
@OPCODE_3644:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1103:

; src/prelude.fth:16:12 in `-`
@OPCODE_3646:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1104:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3648:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1105:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3652:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1106:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3656:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1107:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3659:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1108:

; snake.fth:172:13 in `random-x-position`
@OPCODE_3661:   ; [c64_ir] InlineCall("random")
    ; inline call(random)
    pha
    pha

@target_1109:

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

; snake.fth:8:32 in `random`
@OPCODE_3666:   ; [c64_ir] InlineCall("and")
    ; inline call(and)
    pha
    pha

@target_1110:

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

; src/prelude.fth:28:14 in `and`
@OPCODE_3669:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1111:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3673:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1112:

; src/prelude.fth:28:21 in `and`
@OPCODE_3675:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1113:

; snake.fth:8:36 in `random`
@OPCODE_3677:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1114:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3683:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1115:

; snake.fth:8:41 in `random`
@OPCODE_3685:   ; [c64_ir] InlineCall("%")
    ; inline call(%)
    pha
    pha

@target_1116:

; src/prelude.fth:48:34 in `%`
@OPCODE_3687:   ; [c64_ir] LoopTarget(1116)

@target_1117:

; src/prelude.fth:48:40 in `%`
@OPCODE_3689:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_1118:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_3691:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1119:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3698:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1120:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_3700:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1121:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3707:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1122:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_3709:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1123:

; src/prelude.fth:48:45 in `%`
@OPCODE_3711:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1124:

; src/prelude.fth:16:12 in `-`
@OPCODE_3713:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1125:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3715:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1126:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3719:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1127:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3723:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1128:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3726:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1129:

; src/prelude.fth:48:47 in `%`
@OPCODE_3728:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_1130:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_3733:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1131:

; src/prelude.fth:48:51 in `%`
@OPCODE_3735:   ; [c64_ir] InlineCall("0<")
    ; inline call(0<)
    pha
    pha

@target_1132:

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

; src/prelude.fth:47:19 in `0<`
@OPCODE_3739:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1133:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3743:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1134:

; src/prelude.fth:47:26 in `0<`
@OPCODE_3745:   ; [c64_ir] JumpIf0(1136)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1136

@target_1135:

; src/prelude.fth:47:29 in `0<`
@OPCODE_3747:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:47:32 in `0<`
@OPCODE_3748:   ; [c64_ir] JumpElse(1137)
    jmp @target_1137

@target_1136:

; src/prelude.fth:47:37 in `0<`
@OPCODE_3750:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:47:39 in `0<`
@OPCODE_3751:   ; [c64_ir] JumpTarget(1136)

@target_1137:

; src/prelude.fth:47:44 in `0<`
@OPCODE_3753:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1138:

; src/prelude.fth:48:54 in `%`
@OPCODE_3755:   ; [c64_ir] JumpIf0(1140)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1140

@target_1139:

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
@OPCODE_3759:   ; [c64_ir] JumpElse(1149)
    jmp @target_1149

@target_1140:

; src/prelude.fth:48:67 in `%`
@OPCODE_3761:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_1141:

; src/prelude.fth:5:10 in `rot`
@OPCODE_3763:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_3764:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1142:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3770:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1143:

; src/prelude.fth:5:18 in `rot`
@OPCODE_3772:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_3773:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1144:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3779:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1145:

; src/prelude.fth:5:26 in `rot`
@OPCODE_3781:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1146:

; src/prelude.fth:48:71 in `%`
@OPCODE_3783:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:76 in `%`
@OPCODE_3784:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1147:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3790:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1148:

; src/prelude.fth:48:81 in `%`
@OPCODE_3792:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:48:83 in `%`
@OPCODE_3793:   ; [c64_ir] JumpTarget(1148)

@target_1149:

; src/prelude.fth:48:88 in `%`
@OPCODE_3795:   ; [c64_ir] LoopIf0(1117)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1117

@target_1150:

; src/prelude.fth:48:94 in `%`
@OPCODE_3797:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1151:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3803:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1152:

; src/prelude.fth:48:99 in `%`
@OPCODE_3805:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:104 in `%`
@OPCODE_3806:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1153:

; snake.fth:8:43 in `random`
@OPCODE_3808:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1154:

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

; snake.fth:172:24 in `random-x-position`
@OPCODE_3812:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1155:

; snake.fth:178:21 in `move-apple`
@OPCODE_3814:   ; [c64_ir] InlineCall("random-y-position")
    ; inline call(random-y-position)
    pha
    pha

@target_1156:

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

; snake.fth:174:12 in `random-y-position`
@OPCODE_3818:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1157:

; src/prelude.fth:16:12 in `-`
@OPCODE_3820:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1158:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3822:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1159:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3826:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1160:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3830:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1161:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3833:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1162:

; snake.fth:174:14 in `random-y-position`
@OPCODE_3835:   ; [c64_ir] InlineCall("random")
    ; inline call(random)
    pha
    pha

@target_1163:

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

; snake.fth:8:32 in `random`
@OPCODE_3840:   ; [c64_ir] InlineCall("and")
    ; inline call(and)
    pha
    pha

@target_1164:

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

; src/prelude.fth:28:14 in `and`
@OPCODE_3843:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1165:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3847:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1166:

; src/prelude.fth:28:21 in `and`
@OPCODE_3849:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1167:

; snake.fth:8:36 in `random`
@OPCODE_3851:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1168:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3857:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1169:

; snake.fth:8:41 in `random`
@OPCODE_3859:   ; [c64_ir] InlineCall("%")
    ; inline call(%)
    pha
    pha

@target_1170:

; src/prelude.fth:48:34 in `%`
@OPCODE_3861:   ; [c64_ir] LoopTarget(1170)

@target_1171:

; src/prelude.fth:48:40 in `%`
@OPCODE_3863:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_1172:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_3865:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1173:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3872:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1174:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_3874:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1175:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_3881:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1176:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_3883:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1177:

; src/prelude.fth:48:45 in `%`
@OPCODE_3885:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1178:

; src/prelude.fth:16:12 in `-`
@OPCODE_3887:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1179:

; src/prelude.fth:15:12 in `negate`
@OPCODE_3889:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1180:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3893:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1181:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_3897:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1182:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_3900:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1183:

; src/prelude.fth:48:47 in `%`
@OPCODE_3902:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_1184:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_3907:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1185:

; src/prelude.fth:48:51 in `%`
@OPCODE_3909:   ; [c64_ir] InlineCall("0<")
    ; inline call(0<)
    pha
    pha

@target_1186:

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

; src/prelude.fth:47:19 in `0<`
@OPCODE_3913:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1187:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_3917:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1188:

; src/prelude.fth:47:26 in `0<`
@OPCODE_3919:   ; [c64_ir] JumpIf0(1190)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1190

@target_1189:

; src/prelude.fth:47:29 in `0<`
@OPCODE_3921:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:47:32 in `0<`
@OPCODE_3922:   ; [c64_ir] JumpElse(1191)
    jmp @target_1191

@target_1190:

; src/prelude.fth:47:37 in `0<`
@OPCODE_3924:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:47:39 in `0<`
@OPCODE_3925:   ; [c64_ir] JumpTarget(1190)

@target_1191:

; src/prelude.fth:47:44 in `0<`
@OPCODE_3927:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1192:

; src/prelude.fth:48:54 in `%`
@OPCODE_3929:   ; [c64_ir] JumpIf0(1194)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1194

@target_1193:

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
@OPCODE_3933:   ; [c64_ir] JumpElse(1203)
    jmp @target_1203

@target_1194:

; src/prelude.fth:48:67 in `%`
@OPCODE_3935:   ; [c64_ir] InlineCall("rot")
    ; inline call(rot)
    pha
    pha

@target_1195:

; src/prelude.fth:5:10 in `rot`
@OPCODE_3937:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:5:13 in `rot`
@OPCODE_3938:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1196:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3944:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1197:

; src/prelude.fth:5:18 in `rot`
@OPCODE_3946:   ; [c64_ir] AltPop
    inx
    inx
    pla
    sta $00,x
    pla
    sta $01,x

; src/prelude.fth:5:21 in `rot`
@OPCODE_3947:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1198:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3953:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1199:

; src/prelude.fth:5:26 in `rot`
@OPCODE_3955:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1200:

; src/prelude.fth:48:71 in `%`
@OPCODE_3957:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:76 in `%`
@OPCODE_3958:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1201:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3964:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1202:

; src/prelude.fth:48:81 in `%`
@OPCODE_3966:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:48:83 in `%`
@OPCODE_3967:   ; [c64_ir] JumpTarget(1202)

@target_1203:

; src/prelude.fth:48:88 in `%`
@OPCODE_3969:   ; [c64_ir] LoopIf0(1171)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1171

@target_1204:

; src/prelude.fth:48:94 in `%`
@OPCODE_3971:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1205:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_3977:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1206:

; src/prelude.fth:48:99 in `%`
@OPCODE_3979:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:48:104 in `%`
@OPCODE_3980:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1207:

; snake.fth:8:43 in `random`
@OPCODE_3982:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1208:

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

; snake.fth:174:25 in `random-y-position`
@OPCODE_3986:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1209:

; snake.fth:179:3 in `move-apple`
@OPCODE_3988:   ; [c64_ir] InlineCall("set-apple-position")
    ; inline call(set-apple-position)
    pha
    pha

@target_1210:

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

; snake.fth:105:42 in `set-apple-position`
@OPCODE_3994:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1211:

; snake.fth:179:22 in `move-apple`
@OPCODE_3996:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1212:

; snake.fth:188:5 in `check-apple`
@OPCODE_3998:   ; [c64_ir] InlineCall("grow-snake")
    ; inline call(grow-snake)
    pha
    pha

@target_1213:

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

; snake.fth:181:24 in `grow-snake`
@OPCODE_4002:   ; [c64_ir] InlineCall("+!")
    ; inline call(+!)
    pha
    pha

@target_1214:

; src/prelude.fth:20:8 in `+!`
@OPCODE_4004:   ; [c64_ir] InlineCall("dup")
    ; inline call(dup)
    pha
    pha

@target_1215:

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

; src/prelude.fth:6:28 in `dup`
@OPCODE_4009:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1216:

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

; src/prelude.fth:20:24 in `+!`
@OPCODE_4016:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1217:

; snake.fth:181:27 in `grow-snake`
@OPCODE_4018:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1218:

; snake.fth:189:3 in `check-apple`
@OPCODE_4020:   ; [c64_ir] JumpTarget(1218)

@target_1219:

; snake.fth:189:8 in `check-apple`
@OPCODE_4022:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1220:

; snake.fth:223:1 in `main`
@OPCODE_4024:   ; [c64_ir] InlineCall("check-collision")
    ; inline call(check-collision)
    pha
    pha

@target_1221:

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

; snake.fth:196:3 in `check-collision`
@OPCODE_4030:   ; [c64_ir] InlineCall("convert-x-y")
    ; inline call(convert-x-y)
    pha
    pha

@target_1222:

; snake.fth:48:34 in `convert-x-y`
@OPCODE_4032:   ; [c64_ir] PushLiteral(40)
    inx
    inx
    lda #40
    sta $00,x
    lda #0
    sta $01,x

; snake.fth:48:37 in `convert-x-y`
@OPCODE_4033:   ; [c64_ir] InlineCall("*")
    ; inline call(*)
    pha
    pha

@target_1223:

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
@OPCODE_4041:   ; [c64_ir] LoopTarget(1223)

@target_1224:

; src/prelude.fth:44:18 in `*`
@OPCODE_4043:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1225:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_4050:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1226:

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

; src/prelude.fth:44:25 in `*`
@OPCODE_4053:   ; [c64_ir] InlineCall("loopimpl")
    ; inline call(loopimpl)
    pha
    pha

@target_1227:

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

; src/prelude.fth:33:21 in `loopimpl`
@OPCODE_4058:   ; [c64_ir] InlineCall("1+")
    ; inline call(1+)
    pha
    pha

@target_1228:

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

; src/prelude.fth:18:12 in `1+`
@OPCODE_4062:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1229:

; src/prelude.fth:33:24 in `loopimpl`
@OPCODE_4064:   ; [c64_ir] InlineCall("2dup")
    ; inline call(2dup)
    pha
    pha

@target_1230:

; src/prelude.fth:8:10 in `2dup`
@OPCODE_4066:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1231:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_4073:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1232:

; src/prelude.fth:8:15 in `2dup`
@OPCODE_4075:   ; [c64_ir] InlineCall("over")
    ; inline call(over)
    pha
    pha

@target_1233:

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

; src/prelude.fth:4:34 in `over`
@OPCODE_4082:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1234:

; src/prelude.fth:8:20 in `2dup`
@OPCODE_4084:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1235:

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

; src/prelude.fth:33:35 in `loopimpl`
@OPCODE_4088:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_1236:

; src/prelude.fth:22:8 in `=`
@OPCODE_4090:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1237:

; src/prelude.fth:16:12 in `-`
@OPCODE_4092:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1238:

; src/prelude.fth:15:12 in `negate`
@OPCODE_4094:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1239:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_4098:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1240:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_4102:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1241:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_4105:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1242:

; src/prelude.fth:22:10 in `=`
@OPCODE_4107:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_1243:

; src/prelude.fth:21:8 in `0=`
@OPCODE_4109:   ; [c64_ir] JumpIf0(1245)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1245

@target_1244:

; src/prelude.fth:21:11 in `0=`
@OPCODE_4111:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_4112:   ; [c64_ir] JumpElse(1246)
    jmp @target_1246

@target_1245:

; src/prelude.fth:21:18 in `0=`
@OPCODE_4114:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_4115:   ; [c64_ir] JumpTarget(1245)

@target_1246:

; src/prelude.fth:21:26 in `0=`
@OPCODE_4117:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1247:

; src/prelude.fth:22:13 in `=`
@OPCODE_4119:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1248:

; src/prelude.fth:33:37 in `loopimpl`
@OPCODE_4121:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1249:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_4127:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1250:

; src/prelude.fth:33:42 in `loopimpl`
@OPCODE_4129:   ; [c64_ir] AltPush
    dex
    dex
    lda $03,x
    pha
    lda $02,x
    pha

; src/prelude.fth:33:45 in `loopimpl`
@OPCODE_4130:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1251:

; src/prelude.fth:44:25 in `*`
@OPCODE_4132:   ; [c64_ir] LoopIf0(1224)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1224

@target_1252:

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

; src/prelude.fth:44:30 in `*`
@OPCODE_4138:   ; [c64_ir] InlineCall("swap")
    ; inline call(swap)
    pha
    pha

@target_1253:

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

; src/prelude.fth:3:28 in `swap`
@OPCODE_4144:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1254:

; src/prelude.fth:44:35 in `*`
@OPCODE_4146:   ; [c64_ir] Drop
    dex
    dex

; src/prelude.fth:44:40 in `*`
@OPCODE_4147:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1255:

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

; snake.fth:48:41 in `convert-x-y`
@OPCODE_4150:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1256:

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

; snake.fth:199:15 in `check-collision`
@OPCODE_4156:   ; [c64_ir] InlineCall("=")
    ; inline call(=)
    pha
    pha

@target_1257:

; src/prelude.fth:22:8 in `=`
@OPCODE_4158:   ; [c64_ir] InlineCall("-")
    ; inline call(-)
    pha
    pha

@target_1258:

; src/prelude.fth:16:12 in `-`
@OPCODE_4160:   ; [c64_ir] InlineCall("negate")
    ; inline call(negate)
    pha
    pha

@target_1259:

; src/prelude.fth:15:12 in `negate`
@OPCODE_4162:   ; [c64_ir] InlineCall("invert")
    ; inline call(invert)
    pha
    pha

@target_1260:

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

; src/prelude.fth:14:20 in `invert`
@OPCODE_4166:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1261:

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

; src/prelude.fth:15:23 in `negate`
@OPCODE_4170:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1262:

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

; src/prelude.fth:16:21 in `-`
@OPCODE_4173:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1263:

; src/prelude.fth:22:10 in `=`
@OPCODE_4175:   ; [c64_ir] InlineCall("0=")
    ; inline call(0=)
    pha
    pha

@target_1264:

; src/prelude.fth:21:8 in `0=`
@OPCODE_4177:   ; [c64_ir] JumpIf0(1266)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1266

@target_1265:

; src/prelude.fth:21:11 in `0=`
@OPCODE_4179:   ; [c64_ir] PushLiteral(0)
    inx
    inx
    lda #0
    sta $00,x
    lda #0
    sta $01,x

; src/prelude.fth:21:13 in `0=`
@OPCODE_4180:   ; [c64_ir] JumpElse(1267)
    jmp @target_1267

@target_1266:

; src/prelude.fth:21:18 in `0=`
@OPCODE_4182:   ; [c64_ir] PushLiteral(-1)
    inx
    inx
    lda #255
    sta $00,x
    lda #255
    sta $01,x

; src/prelude.fth:21:21 in `0=`
@OPCODE_4183:   ; [c64_ir] JumpTarget(1266)

@target_1267:

; src/prelude.fth:21:26 in `0=`
@OPCODE_4185:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1268:

; src/prelude.fth:22:13 in `=`
@OPCODE_4187:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1269:

; snake.fth:199:17 in `check-collision`
@OPCODE_4189:   ; [c64_ir] InlineExit
    ; inline exit
    pla
    pla

@target_1270:

; snake.fth:224:1 in `main`
@OPCODE_4191:   ; [c64_ir] JumpIf0(1272)
    dex
    dex
    lda $02,x
    ora $03,x
    bne *+5
    jmp @target_1272

@target_1271:

; snake.fth:224:4 in `main`
@OPCODE_4193:   ; [c64_ir] JumpElse(1273)
    jmp @target_1273

@target_1272:

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
@OPCODE_4198:   ; [c64_ir] JumpTarget(1272)

@target_1273:

; :0:0 in ``
@OPCODE_4200:   ; [c64_ir] Exit
    rts
.endproc





; function start


