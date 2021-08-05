@target_0:

@OPCODE_1:   ; [c64_ir] PushLiteral(64)
    pha
    tya
    pha
    ldy #0
    lda #64

@OPCODE_2:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_3:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_4:   ; [c64_ir] PushLiteral(280)
    pha
    tya
    pha
    ldy #1
    lda #24

@OPCODE_5:   ; [c64_ir] PushLiteral(22)
    pha
    tya
    pha
    ldy #0
    lda #22

@OPCODE_6:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_7:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_8:   ; [c64_ir] LoopTarget(0)

@target_1:

@OPCODE_10:   ; [c64_ir] PushLiteral(211)
    pha
    tya
    pha
    ldy #0
    lda #211

@OPCODE_11:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_12:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_13:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_14:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_15:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_16:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_17:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_18:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_19:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_20:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_21:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_22:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_23:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_24:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_25:   ; [c64_ir] Add
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

@OPCODE_26:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_27:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_28:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_29:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_30:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_31:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_32:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_33:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_34:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_35:   ; [c64_ir] Add
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

@OPCODE_36:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_37:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_38:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_39:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_40:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_41:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_42:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_43:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_44:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_45:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_46:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_47:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_48:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_49:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_50:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_51:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_52:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_53:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_54:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_55:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_56:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_57:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_58:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_59:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_60:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_61:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_62:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_63:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_64:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_65:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_66:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_67:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_68:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_69:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_70:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_71:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_72:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_73:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_74:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_75:   ; [c64_ir] Add
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

@OPCODE_76:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_77:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_78:   ; [c64_ir] Add
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

@OPCODE_79:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_80:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_81:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_82:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_83:   ; [c64_ir] JumpIf0(3)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_3

    lda TEMP2

@target_2:

@OPCODE_85:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_86:   ; [c64_ir] JumpElse(4)
    jmp @target_4

@target_3:

@OPCODE_88:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_89:   ; [c64_ir] JumpTarget(3)

@target_4:

@OPCODE_91:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_92:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_93:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_94:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_95:   ; [c64_ir] PushLiteral(7777)
    pha
    tya
    pha
    ldy #30
    lda #97

@OPCODE_96:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_97:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_98:   ; [c64_ir] TempStore
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_99:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_100:   ; [c64_ir] TempLoad
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_101:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_102:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_103:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_104:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_105:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_106:   ; [c64_ir] LoopIf0(1)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_1

    lda TEMP2

@target_5:

@OPCODE_108:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_109:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_110:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_111:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_112:   ; [c64_ir] Exit
    ;rts






; function start


