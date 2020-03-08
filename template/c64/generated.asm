@OPCODE_0:   ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

@OPCODE_1:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_2:   ; [c64_ir] PushLiteral(5)
    pha
    tya
    pha
    ldy #0
    lda #5

@OPCODE_3:   ; [c64_ir] PushLiteral(5)
    pha
    tya
    pha
    ldy #0
    lda #5

@OPCODE_4:   ; [c64_ir] Add
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

@OPCODE_5:   ; [c64_ir] Add
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

@OPCODE_6:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_7:   ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

@OPCODE_8:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_9:   ; [c64_ir] PushLiteral(6)
    pha
    tya
    pha
    ldy #0
    lda #6

@OPCODE_10:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_11:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_12:   ; [c64_ir] BranchTarget(0)
@target_0:

@OPCODE_13:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_14:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_15:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_16:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_17:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_18:   ; [c64_ir] Add
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

@OPCODE_19:   ; [c64_ir] Add
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

@OPCODE_20:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_21:   ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

@OPCODE_22:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_23:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_24:   ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

@OPCODE_25:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_26:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_27:   ; [c64_ir] Add
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

@OPCODE_28:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_29:   ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

@OPCODE_30:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_31:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_32:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_33:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_34:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_35:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_36:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_37:   ; [c64_ir] Add
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

@OPCODE_38:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_39:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_40:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_41:   ; [c64_ir] BranchTarget(1)
@target_1:

@OPCODE_42:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_43:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_44:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_45:   ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

@OPCODE_46:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_47:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_48:   ; [c64_ir] PushLiteral(65532)
    pha
    tya
    pha
    ldy #255
    lda #252

@OPCODE_49:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_50:   ; [c64_ir] Add
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

@OPCODE_51:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_52:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_53:   ; [c64_ir] JumpIf0(4)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_4

    lda TEMP2

@OPCODE_54:   ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

@OPCODE_55:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_56:   ; [c64_ir] PushLiteral(4)
    pha
    tya
    pha
    ldy #0
    lda #4

@OPCODE_57:   ; [c64_ir] Add
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

@OPCODE_58:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_59:   ; [c64_ir] JumpAlways(5)
    jmp @target_5

@OPCODE_60:   ; [c64_ir] BranchTarget(4)
@target_4:

@OPCODE_61:   ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

@OPCODE_62:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_63:   ; [c64_ir] PushLiteral(44)
    pha
    tya
    pha
    ldy #0
    lda #44

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

@OPCODE_65:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_66:   ; [c64_ir] BranchTarget(5)
@target_5:

@OPCODE_67:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_68:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_69:   ; [c64_ir] Add
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

@OPCODE_70:   ; [c64_ir] JumpIf0(8)
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

@OPCODE_71:   ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

@OPCODE_72:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_73:   ; [c64_ir] PushLiteral(45)
    pha
    tya
    pha
    ldy #0
    lda #45

@OPCODE_74:   ; [c64_ir] Add
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

@OPCODE_75:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_76:   ; [c64_ir] JumpAlways(9)
    jmp @target_9

@OPCODE_77:   ; [c64_ir] BranchTarget(8)
@target_8:

@OPCODE_78:   ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

@OPCODE_79:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_80:   ; [c64_ir] PushLiteral(5)
    pha
    tya
    pha
    ldy #0
    lda #5

@OPCODE_81:   ; [c64_ir] Add
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

@OPCODE_82:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_83:   ; [c64_ir] BranchTarget(9)
@target_9:

@OPCODE_84:   ; [c64_ir] PushLiteral(5)
    pha
    tya
    pha
    ldy #0
    lda #5

@OPCODE_85:   ; [c64_ir] PushLiteral(5)
    pha
    tya
    pha
    ldy #0
    lda #5

@OPCODE_86:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_87:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_88:   ; [c64_ir] BranchTarget(10)
@target_10:

@OPCODE_89:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_90:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_91:   ; [c64_ir] BranchTarget(11)
@target_11:

@OPCODE_92:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_93:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_94:   ; [c64_ir] BranchTarget(12)
@target_12:

@OPCODE_95:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_96:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_97:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_98:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_99:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_100:   ; [c64_ir] Add
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

@OPCODE_106:   ; [c64_ir] JumpIf0(15)
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

@OPCODE_107:   ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

@OPCODE_108:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_109:   ; [c64_ir] PushLiteral(46)
    pha
    tya
    pha
    ldy #0
    lda #46

@OPCODE_110:   ; [c64_ir] Add
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

@OPCODE_111:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_112:   ; [c64_ir] JumpAlways(16)
    jmp @target_16

@OPCODE_113:   ; [c64_ir] BranchTarget(15)
@target_15:

@OPCODE_114:   ; [c64_ir] PushLiteral(94)
    pha
    tya
    pha
    ldy #0
    lda #94

@OPCODE_115:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_116:   ; [c64_ir] PushLiteral(6)
    pha
    tya
    pha
    ldy #0
    lda #6

@OPCODE_117:   ; [c64_ir] Add
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

@OPCODE_118:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_119:   ; [c64_ir] BranchTarget(16)
@target_16:

@OPCODE_120:   ; [c64_ir] PushLiteral(45)
    pha
    tya
    pha
    ldy #0
    lda #45

@OPCODE_121:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_122:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_123:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_124:   ; [c64_ir] BranchTarget(17)
@target_17:

@OPCODE_125:   ; [c64_ir] PushLiteral(95)
    pha
    tya
    pha
    ldy #0
    lda #95

@OPCODE_126:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_127:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_128:   ; [c64_ir] BranchTarget(18)
@target_18:

@OPCODE_129:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_130:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_131:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_132:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_133:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_134:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_135:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_136:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_137:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_138:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_139:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_140:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_141:   ; [c64_ir] Add
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

@OPCODE_142:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_143:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_144:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_145:   ; [c64_ir] BranchTarget(19)
@target_19:

@OPCODE_146:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_147:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_148:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_149:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_150:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_151:   ; [c64_ir] BranchTarget(20)
@target_20:

@OPCODE_152:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

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

@OPCODE_154:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_155:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_156:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_157:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_158:   ; [c64_ir] BranchTarget(21)
@target_21:

@OPCODE_159:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_160:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_161:   ; [c64_ir] BranchTarget(22)
@target_22:

@OPCODE_162:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_163:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_164:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_165:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_166:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_167:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_168:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_169:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_170:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_171:   ; [c64_ir] BranchTarget(23)
@target_23:

@OPCODE_172:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_173:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_174:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_175:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_176:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_177:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_178:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_179:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_180:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_181:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_182:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_183:   ; [c64_ir] BranchTarget(24)
@target_24:

@OPCODE_184:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_185:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_186:   ; [c64_ir] BranchTarget(25)
@target_25:

@OPCODE_187:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_188:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_189:   ; [c64_ir] BranchTarget(26)
@target_26:

@OPCODE_190:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_191:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_192:   ; [c64_ir] BranchTarget(27)
@target_27:

@OPCODE_193:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_194:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_195:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_196:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_197:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_198:   ; [c64_ir] Add
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

@OPCODE_199:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_200:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_201:   ; [c64_ir] Add
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

@OPCODE_202:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_203:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_204:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_205:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_206:   ; [c64_ir] BranchTarget(28)
@target_28:

@OPCODE_207:   ; [c64_ir] JumpIf0(31)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_31

    lda TEMP2

@OPCODE_208:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_209:   ; [c64_ir] JumpAlways(32)
    jmp @target_32

@OPCODE_210:   ; [c64_ir] BranchTarget(31)
@target_31:

@OPCODE_211:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_212:   ; [c64_ir] BranchTarget(32)
@target_32:

@OPCODE_213:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_214:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_215:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_216:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_217:   ; [c64_ir] JumpIf0(37)
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

@OPCODE_218:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_219:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_220:   ; [c64_ir] BranchTarget(34)
@target_34:

@OPCODE_221:   ; [c64_ir] Add
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

@OPCODE_222:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_223:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_224:   ; [c64_ir] BranchTarget(35)
@target_35:

@OPCODE_225:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_226:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_227:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_228:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_229:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_230:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_231:   ; [c64_ir] JumpAlways(38)
    jmp @target_38

@OPCODE_232:   ; [c64_ir] BranchTarget(37)
@target_37:

@OPCODE_233:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_234:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_235:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_236:   ; [c64_ir] BranchTarget(38)
@target_38:

@OPCODE_237:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_238:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_239:   ; [c64_ir] BranchTarget(39)
@target_39:

@OPCODE_240:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_241:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_242:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_243:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_244:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_245:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_246:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_247:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_248:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_249:   ; [c64_ir] JumpIf0(17)
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

@OPCODE_250:   ; [c64_ir] Exit
    ;rts






; function start


