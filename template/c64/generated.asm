@OPCODE_0:   ; [c64_ir] PushLiteral(36866)
    pha
    tya
    pha
    ldy #144
    lda #2

@OPCODE_1:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

@OPCODE_2:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_3:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_4:   ; [c64_ir] BranchTarget(0)
@target_0:

@OPCODE_5:   ; [c64_ir] JumpIf0(3)
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

@OPCODE_6:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_7:   ; [c64_ir] JumpAlways(4)
    jmp @target_4

@OPCODE_8:   ; [c64_ir] BranchTarget(3)
@target_3:

@OPCODE_9:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_10:   ; [c64_ir] BranchTarget(4)
@target_4:

@OPCODE_11:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_12:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_13:   ; [c64_ir] JumpIf0(246)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_246

    lda TEMP2

@OPCODE_14:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_15:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_16:   ; [c64_ir] BranchTarget(6)
@target_6:

@OPCODE_17:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_18:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_19:   ; [c64_ir] BranchTarget(7)
@target_7:

@OPCODE_20:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_21:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_22:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_23:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_24:   ; [c64_ir] BranchTarget(8)
@target_8:

@OPCODE_25:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_26:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_27:   ; [c64_ir] BranchTarget(9)
@target_9:

@OPCODE_28:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

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

@OPCODE_31:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_32:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_33:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_34:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_35:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_36:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_37:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_38:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_39:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_40:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_41:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_42:   ; [c64_ir] BranchTarget(10)
@target_10:

@OPCODE_43:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_44:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_45:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_46:   ; [c64_ir] BranchTarget(11)
@target_11:

@OPCODE_47:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_48:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_49:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_50:   ; [c64_ir] BranchTarget(12)
@target_12:

@OPCODE_51:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_52:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_53:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_54:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_55:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_56:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_57:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_58:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_59:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_60:   ; [c64_ir] BranchTarget(13)
@target_13:

@OPCODE_61:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_62:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_63:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_64:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_65:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_66:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_67:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_68:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_69:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_70:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_71:   ; [c64_ir] BranchTarget(14)
@target_14:

@OPCODE_72:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_73:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_74:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_75:   ; [c64_ir] BranchTarget(15)
@target_15:

@OPCODE_76:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_77:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_78:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_79:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_80:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_81:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_82:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_83:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_84:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_85:   ; [c64_ir] BranchTarget(16)
@target_16:

@OPCODE_86:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_87:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_88:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_89:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_90:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_91:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_92:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_93:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_94:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_95:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_96:   ; [c64_ir] BranchTarget(17)
@target_17:

@OPCODE_97:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_98:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_99:   ; [c64_ir] BranchTarget(18)
@target_18:

@OPCODE_100:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_101:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_102:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_103:   ; [c64_ir] BranchTarget(19)
@target_19:

@OPCODE_104:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_105:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_106:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_107:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_108:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_109:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_110:   ; [c64_ir] BranchTarget(20)
@target_20:

@OPCODE_111:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_112:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_113:   ; [c64_ir] BranchTarget(21)
@target_21:

@OPCODE_114:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_115:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_116:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_117:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_118:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_119:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_120:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_121:   ; [c64_ir] Add
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

@OPCODE_122:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_123:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_124:   ; [c64_ir] BranchTarget(22)
@target_22:

@OPCODE_125:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_126:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_127:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_128:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_129:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_130:   ; [c64_ir] BranchTarget(23)
@target_23:

@OPCODE_131:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

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

@OPCODE_133:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_134:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_135:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_136:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_137:   ; [c64_ir] BranchTarget(24)
@target_24:

@OPCODE_138:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_139:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_140:   ; [c64_ir] BranchTarget(25)
@target_25:

@OPCODE_141:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_142:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_143:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_144:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_145:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_146:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_147:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_148:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_149:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_150:   ; [c64_ir] BranchTarget(26)
@target_26:

@OPCODE_151:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_152:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_153:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_154:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_155:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_156:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_157:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_158:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_159:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_160:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_161:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_162:   ; [c64_ir] BranchTarget(27)
@target_27:

@OPCODE_163:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_164:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_165:   ; [c64_ir] BranchTarget(28)
@target_28:

@OPCODE_166:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_167:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_168:   ; [c64_ir] BranchTarget(29)
@target_29:

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

@OPCODE_171:   ; [c64_ir] BranchTarget(30)
@target_30:

@OPCODE_172:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_173:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_174:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_175:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_176:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_177:   ; [c64_ir] Add
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

@OPCODE_178:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_179:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_180:   ; [c64_ir] Add
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

@OPCODE_181:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_182:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_183:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_184:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_185:   ; [c64_ir] BranchTarget(31)
@target_31:

@OPCODE_186:   ; [c64_ir] JumpIf0(34)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_34

    lda TEMP2

@OPCODE_187:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_188:   ; [c64_ir] JumpAlways(35)
    jmp @target_35

@OPCODE_189:   ; [c64_ir] BranchTarget(34)
@target_34:

@OPCODE_190:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_191:   ; [c64_ir] BranchTarget(35)
@target_35:

@OPCODE_192:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_193:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_194:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_195:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_196:   ; [c64_ir] JumpIf0(40)
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

@OPCODE_197:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_198:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_199:   ; [c64_ir] BranchTarget(37)
@target_37:

@OPCODE_200:   ; [c64_ir] Add
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

@OPCODE_201:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_202:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_203:   ; [c64_ir] BranchTarget(38)
@target_38:

@OPCODE_204:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_205:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_206:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_207:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_208:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_209:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_210:   ; [c64_ir] JumpAlways(41)
    jmp @target_41

@OPCODE_211:   ; [c64_ir] BranchTarget(40)
@target_40:

@OPCODE_212:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_213:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_214:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_215:   ; [c64_ir] BranchTarget(41)
@target_41:

@OPCODE_216:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_217:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_218:   ; [c64_ir] BranchTarget(42)
@target_42:

@OPCODE_219:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_220:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_221:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_222:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_223:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_224:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_225:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
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

@OPCODE_228:   ; [c64_ir] JumpIf0(20)
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

@OPCODE_229:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_230:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_231:   ; [c64_ir] BranchTarget(44)
@target_44:

@OPCODE_232:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_233:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_234:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_235:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_236:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_237:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_238:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_239:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_240:   ; [c64_ir] BranchTarget(45)
@target_45:

@OPCODE_241:   ; [c64_ir] Drop
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

@OPCODE_243:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_246:   ; [c64_ir] Add
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

@OPCODE_249:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_250:   ; [c64_ir] Add
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

@OPCODE_251:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_252:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_253:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_254:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_255:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_256:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_257:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_258:   ; [c64_ir] BranchTarget(46)
@target_46:

@OPCODE_259:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_260:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_261:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_262:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_263:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_264:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_265:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_266:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_267:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_268:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_269:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_270:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

@OPCODE_271:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_272:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_273:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_274:   ; [c64_ir] BranchTarget(47)
@target_47:

@OPCODE_275:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_276:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_277:   ; [c64_ir] BranchTarget(48)
@target_48:

@OPCODE_278:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_279:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_280:   ; [c64_ir] BranchTarget(49)
@target_49:

@OPCODE_281:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_282:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_283:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_284:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_285:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_286:   ; [c64_ir] Add
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

@OPCODE_287:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_288:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_289:   ; [c64_ir] Add
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

@OPCODE_290:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_291:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_292:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_293:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_294:   ; [c64_ir] BranchTarget(50)
@target_50:

@OPCODE_295:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_296:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_297:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_298:   ; [c64_ir] BranchTarget(51)
@target_51:

@OPCODE_299:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_300:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_301:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_302:   ; [c64_ir] BranchTarget(52)
@target_52:

@OPCODE_303:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_304:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_305:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_306:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_307:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_308:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_309:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_310:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_311:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_312:   ; [c64_ir] BranchTarget(53)
@target_53:

@OPCODE_313:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_314:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_315:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_316:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_317:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_318:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_319:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_320:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_321:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_322:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_323:   ; [c64_ir] BranchTarget(54)
@target_54:

@OPCODE_324:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_325:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_326:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_327:   ; [c64_ir] BranchTarget(55)
@target_55:

@OPCODE_328:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_329:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_330:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_331:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_332:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_333:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_334:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_335:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_336:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_337:   ; [c64_ir] BranchTarget(56)
@target_56:

@OPCODE_338:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_339:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_340:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_341:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_342:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_343:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_344:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_345:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_346:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_347:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_348:   ; [c64_ir] BranchTarget(57)
@target_57:

@OPCODE_349:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_350:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_351:   ; [c64_ir] BranchTarget(58)
@target_58:

@OPCODE_352:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_353:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_354:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_355:   ; [c64_ir] BranchTarget(59)
@target_59:

@OPCODE_356:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_357:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_358:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_359:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_360:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_361:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_362:   ; [c64_ir] BranchTarget(60)
@target_60:

@OPCODE_363:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_364:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_365:   ; [c64_ir] BranchTarget(61)
@target_61:

@OPCODE_366:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_367:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_368:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_369:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_370:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_371:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_372:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_373:   ; [c64_ir] Add
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

@OPCODE_374:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_375:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_376:   ; [c64_ir] BranchTarget(62)
@target_62:

@OPCODE_377:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_378:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_379:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_380:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_381:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_382:   ; [c64_ir] BranchTarget(63)
@target_63:

@OPCODE_383:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_384:   ; [c64_ir] Add
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

@OPCODE_385:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_386:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_387:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_388:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_389:   ; [c64_ir] BranchTarget(64)
@target_64:

@OPCODE_390:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_391:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_392:   ; [c64_ir] BranchTarget(65)
@target_65:

@OPCODE_393:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_394:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_395:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_396:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_397:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_398:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_399:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_400:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_401:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_402:   ; [c64_ir] BranchTarget(66)
@target_66:

@OPCODE_403:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_404:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_405:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_406:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_407:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_408:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_409:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_410:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_411:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_412:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_413:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_414:   ; [c64_ir] BranchTarget(67)
@target_67:

@OPCODE_415:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_416:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_417:   ; [c64_ir] BranchTarget(68)
@target_68:

@OPCODE_418:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_419:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_420:   ; [c64_ir] BranchTarget(69)
@target_69:

@OPCODE_421:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_422:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_423:   ; [c64_ir] BranchTarget(70)
@target_70:

@OPCODE_424:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_425:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_426:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_427:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_428:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_429:   ; [c64_ir] Add
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

@OPCODE_430:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_431:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_432:   ; [c64_ir] Add
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

@OPCODE_433:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_434:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_435:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_436:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_437:   ; [c64_ir] BranchTarget(71)
@target_71:

@OPCODE_438:   ; [c64_ir] JumpIf0(74)
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

@OPCODE_439:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_440:   ; [c64_ir] JumpAlways(75)
    jmp @target_75

@OPCODE_441:   ; [c64_ir] BranchTarget(74)
@target_74:

@OPCODE_442:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_443:   ; [c64_ir] BranchTarget(75)
@target_75:

@OPCODE_444:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_445:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_446:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_447:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_448:   ; [c64_ir] JumpIf0(80)
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

@OPCODE_449:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_450:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_451:   ; [c64_ir] BranchTarget(77)
@target_77:

@OPCODE_452:   ; [c64_ir] Add
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

@OPCODE_453:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_454:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_455:   ; [c64_ir] BranchTarget(78)
@target_78:

@OPCODE_456:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_457:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_458:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_459:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_460:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_461:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_462:   ; [c64_ir] JumpAlways(81)
    jmp @target_81

@OPCODE_463:   ; [c64_ir] BranchTarget(80)
@target_80:

@OPCODE_464:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_465:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_466:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_467:   ; [c64_ir] BranchTarget(81)
@target_81:

@OPCODE_468:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_469:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_470:   ; [c64_ir] BranchTarget(82)
@target_82:

@OPCODE_471:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_472:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_473:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_474:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_475:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_476:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_477:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_478:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_479:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_480:   ; [c64_ir] JumpIf0(60)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_60

    lda TEMP2

@OPCODE_481:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_482:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_483:   ; [c64_ir] BranchTarget(84)
@target_84:

@OPCODE_484:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_485:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_486:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_487:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_488:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_489:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_490:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_491:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_492:   ; [c64_ir] BranchTarget(85)
@target_85:

@OPCODE_493:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_494:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_495:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_496:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_497:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_498:   ; [c64_ir] Add
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

@OPCODE_499:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_500:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_501:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_502:   ; [c64_ir] Add
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

@OPCODE_503:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_504:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_505:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_506:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_507:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_508:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_509:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_510:   ; [c64_ir] BranchTarget(86)
@target_86:

@OPCODE_511:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_512:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_513:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_514:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_515:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_516:   ; [c64_ir] BranchTarget(87)
@target_87:

@OPCODE_517:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_518:   ; [c64_ir] Add
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

@OPCODE_519:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_520:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_521:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_522:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_523:   ; [c64_ir] BranchTarget(88)
@target_88:

@OPCODE_524:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_525:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_526:   ; [c64_ir] BranchTarget(89)
@target_89:

@OPCODE_527:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_528:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_529:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_530:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_531:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_532:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_533:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_534:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_535:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_536:   ; [c64_ir] BranchTarget(90)
@target_90:

@OPCODE_537:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_538:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_539:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_540:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_541:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_542:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_543:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_544:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_545:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_546:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_547:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_548:   ; [c64_ir] BranchTarget(91)
@target_91:

@OPCODE_549:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_550:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_551:   ; [c64_ir] BranchTarget(92)
@target_92:

@OPCODE_552:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_553:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_554:   ; [c64_ir] BranchTarget(93)
@target_93:

@OPCODE_555:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_556:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_557:   ; [c64_ir] BranchTarget(94)
@target_94:

@OPCODE_558:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_559:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_560:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_561:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_562:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

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

@OPCODE_564:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_565:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_566:   ; [c64_ir] Add
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

@OPCODE_567:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_568:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_569:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_570:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_571:   ; [c64_ir] BranchTarget(95)
@target_95:

@OPCODE_572:   ; [c64_ir] JumpIf0(98)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_98

    lda TEMP2

@OPCODE_573:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_574:   ; [c64_ir] JumpAlways(99)
    jmp @target_99

@OPCODE_575:   ; [c64_ir] BranchTarget(98)
@target_98:

@OPCODE_576:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_577:   ; [c64_ir] BranchTarget(99)
@target_99:

@OPCODE_578:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_579:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_580:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_581:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_582:   ; [c64_ir] JumpIf0(104)
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

@OPCODE_583:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_584:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_585:   ; [c64_ir] BranchTarget(101)
@target_101:

@OPCODE_586:   ; [c64_ir] Add
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

@OPCODE_587:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_588:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_589:   ; [c64_ir] BranchTarget(102)
@target_102:

@OPCODE_590:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_591:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_592:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_593:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_594:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_595:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_596:   ; [c64_ir] JumpAlways(105)
    jmp @target_105

@OPCODE_597:   ; [c64_ir] BranchTarget(104)
@target_104:

@OPCODE_598:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_599:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_600:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_601:   ; [c64_ir] BranchTarget(105)
@target_105:

@OPCODE_602:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_603:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_604:   ; [c64_ir] BranchTarget(106)
@target_106:

@OPCODE_605:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_606:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_607:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_608:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_609:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_610:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_611:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_612:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_613:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_614:   ; [c64_ir] JumpIf0(8)
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

@OPCODE_615:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

@OPCODE_616:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_617:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_618:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_619:   ; [c64_ir] BranchTarget(108)
@target_108:

@OPCODE_620:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_621:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_622:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_623:   ; [c64_ir] BranchTarget(109)
@target_109:

@OPCODE_624:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_625:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_626:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_627:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_628:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_629:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_630:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_631:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_632:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_633:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_634:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_635:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_636:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_637:   ; [c64_ir] BranchTarget(110)
@target_110:

@OPCODE_638:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_639:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_640:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_641:   ; [c64_ir] BranchTarget(111)
@target_111:

@OPCODE_642:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_643:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_644:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_645:   ; [c64_ir] BranchTarget(112)
@target_112:

@OPCODE_646:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_647:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_648:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_649:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_650:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_651:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_652:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_653:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_654:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_655:   ; [c64_ir] BranchTarget(113)
@target_113:

@OPCODE_656:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_657:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_658:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_659:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_660:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_661:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_662:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_663:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_664:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_665:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_666:   ; [c64_ir] BranchTarget(114)
@target_114:

@OPCODE_667:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_668:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_669:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_670:   ; [c64_ir] BranchTarget(115)
@target_115:

@OPCODE_671:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_672:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_673:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_674:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_675:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_676:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_677:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_678:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_679:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_680:   ; [c64_ir] BranchTarget(116)
@target_116:

@OPCODE_681:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_682:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_683:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_684:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_685:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_686:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_687:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_688:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_689:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_690:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_691:   ; [c64_ir] BranchTarget(117)
@target_117:

@OPCODE_692:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_693:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_694:   ; [c64_ir] BranchTarget(118)
@target_118:

@OPCODE_695:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_696:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_697:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_698:   ; [c64_ir] BranchTarget(119)
@target_119:

@OPCODE_699:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_700:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_701:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_702:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_703:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_704:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_705:   ; [c64_ir] BranchTarget(120)
@target_120:

@OPCODE_706:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_707:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_708:   ; [c64_ir] BranchTarget(121)
@target_121:

@OPCODE_709:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_710:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_711:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_712:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_713:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_714:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_715:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_716:   ; [c64_ir] Add
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

@OPCODE_717:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_718:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_719:   ; [c64_ir] BranchTarget(122)
@target_122:

@OPCODE_720:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_721:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_722:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_723:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_724:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_725:   ; [c64_ir] BranchTarget(123)
@target_123:

@OPCODE_726:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_727:   ; [c64_ir] Add
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

@OPCODE_728:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_729:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_730:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_731:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_732:   ; [c64_ir] BranchTarget(124)
@target_124:

@OPCODE_733:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_734:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_735:   ; [c64_ir] BranchTarget(125)
@target_125:

@OPCODE_736:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_737:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_738:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_739:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_740:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_741:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_742:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_743:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_744:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_745:   ; [c64_ir] BranchTarget(126)
@target_126:

@OPCODE_746:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_747:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_748:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_749:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_750:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_751:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_752:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_753:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_754:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_755:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_756:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_757:   ; [c64_ir] BranchTarget(127)
@target_127:

@OPCODE_758:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_759:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_760:   ; [c64_ir] BranchTarget(128)
@target_128:

@OPCODE_761:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_762:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_763:   ; [c64_ir] BranchTarget(129)
@target_129:

@OPCODE_764:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_765:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_766:   ; [c64_ir] BranchTarget(130)
@target_130:

@OPCODE_767:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_768:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_769:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_770:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_771:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_772:   ; [c64_ir] Add
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

@OPCODE_773:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_774:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_775:   ; [c64_ir] Add
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

@OPCODE_776:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_777:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_778:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_779:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_780:   ; [c64_ir] BranchTarget(131)
@target_131:

@OPCODE_781:   ; [c64_ir] JumpIf0(134)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_134

    lda TEMP2

@OPCODE_782:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_783:   ; [c64_ir] JumpAlways(135)
    jmp @target_135

@OPCODE_784:   ; [c64_ir] BranchTarget(134)
@target_134:

@OPCODE_785:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_786:   ; [c64_ir] BranchTarget(135)
@target_135:

@OPCODE_787:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_788:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_789:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_790:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_791:   ; [c64_ir] JumpIf0(140)
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

@OPCODE_792:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_793:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_794:   ; [c64_ir] BranchTarget(137)
@target_137:

@OPCODE_795:   ; [c64_ir] Add
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

@OPCODE_796:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_797:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_798:   ; [c64_ir] BranchTarget(138)
@target_138:

@OPCODE_799:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_800:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_801:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_802:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_803:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_804:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_805:   ; [c64_ir] JumpAlways(141)
    jmp @target_141

@OPCODE_806:   ; [c64_ir] BranchTarget(140)
@target_140:

@OPCODE_807:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_808:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_809:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_810:   ; [c64_ir] BranchTarget(141)
@target_141:

@OPCODE_811:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_812:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_813:   ; [c64_ir] BranchTarget(142)
@target_142:

@OPCODE_814:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_815:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_816:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_817:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_818:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_819:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_820:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_821:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_822:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_823:   ; [c64_ir] JumpIf0(120)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_120

    lda TEMP2

@OPCODE_824:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_825:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_826:   ; [c64_ir] BranchTarget(144)
@target_144:

@OPCODE_827:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_828:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_829:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_830:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_831:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_832:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_833:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_834:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_835:   ; [c64_ir] BranchTarget(145)
@target_145:

@OPCODE_836:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_837:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_838:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_839:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_840:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_842:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_843:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_844:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

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

@OPCODE_846:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_847:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_848:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_849:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_850:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_851:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_852:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_853:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_854:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_855:   ; [c64_ir] BranchTarget(146)
@target_146:

@OPCODE_856:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_857:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_858:   ; [c64_ir] BranchTarget(147)
@target_147:

@OPCODE_859:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_860:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_861:   ; [c64_ir] BranchTarget(148)
@target_148:

@OPCODE_862:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_863:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_864:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_865:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_866:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_867:   ; [c64_ir] Add
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

@OPCODE_868:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_869:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_870:   ; [c64_ir] Add
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

@OPCODE_871:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_872:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_873:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_874:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_875:   ; [c64_ir] BranchTarget(149)
@target_149:

@OPCODE_876:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_877:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_878:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_879:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_880:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_881:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_882:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_883:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_884:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_885:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_886:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_887:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_888:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_889:   ; [c64_ir] BranchTarget(150)
@target_150:

@OPCODE_890:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_891:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_892:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_893:   ; [c64_ir] BranchTarget(151)
@target_151:

@OPCODE_894:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_895:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_896:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_897:   ; [c64_ir] BranchTarget(152)
@target_152:

@OPCODE_898:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_899:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_900:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_901:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_902:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_903:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_904:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_905:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_906:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_907:   ; [c64_ir] BranchTarget(153)
@target_153:

@OPCODE_908:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_909:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_910:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_911:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_912:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_913:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_914:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_915:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_916:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_917:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_918:   ; [c64_ir] BranchTarget(154)
@target_154:

@OPCODE_919:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_920:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_921:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_922:   ; [c64_ir] BranchTarget(155)
@target_155:

@OPCODE_923:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_924:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_925:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_926:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_927:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_928:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_929:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_930:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_931:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_932:   ; [c64_ir] BranchTarget(156)
@target_156:

@OPCODE_933:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_934:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_935:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_936:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_937:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_938:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_939:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_940:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_941:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_942:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_943:   ; [c64_ir] BranchTarget(157)
@target_157:

@OPCODE_944:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_945:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_946:   ; [c64_ir] BranchTarget(158)
@target_158:

@OPCODE_947:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_948:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_949:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_950:   ; [c64_ir] BranchTarget(159)
@target_159:

@OPCODE_951:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_952:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_953:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_954:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_955:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_956:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_957:   ; [c64_ir] BranchTarget(160)
@target_160:

@OPCODE_958:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_959:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_960:   ; [c64_ir] BranchTarget(161)
@target_161:

@OPCODE_961:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_962:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_963:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_964:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_965:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_966:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_967:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_968:   ; [c64_ir] Add
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

@OPCODE_969:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_970:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_971:   ; [c64_ir] BranchTarget(162)
@target_162:

@OPCODE_972:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_973:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_974:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_975:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_976:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_977:   ; [c64_ir] BranchTarget(163)
@target_163:

@OPCODE_978:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_979:   ; [c64_ir] Add
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

@OPCODE_980:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_981:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_982:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_983:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_984:   ; [c64_ir] BranchTarget(164)
@target_164:

@OPCODE_985:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_986:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_987:   ; [c64_ir] BranchTarget(165)
@target_165:

@OPCODE_988:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_989:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_990:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_991:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_992:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_993:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_994:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_995:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_996:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_997:   ; [c64_ir] BranchTarget(166)
@target_166:

@OPCODE_998:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_999:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1000:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1001:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1002:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1003:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1004:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1005:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1006:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1007:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1008:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1009:   ; [c64_ir] BranchTarget(167)
@target_167:

@OPCODE_1010:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1011:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1012:   ; [c64_ir] BranchTarget(168)
@target_168:

@OPCODE_1013:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1014:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1015:   ; [c64_ir] BranchTarget(169)
@target_169:

@OPCODE_1016:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1017:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1018:   ; [c64_ir] BranchTarget(170)
@target_170:

@OPCODE_1019:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1020:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_1021:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1022:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1023:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1024:   ; [c64_ir] Add
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

@OPCODE_1025:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1026:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1027:   ; [c64_ir] Add
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

@OPCODE_1028:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1029:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1030:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1031:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1032:   ; [c64_ir] BranchTarget(171)
@target_171:

@OPCODE_1033:   ; [c64_ir] JumpIf0(174)
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

@OPCODE_1034:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1035:   ; [c64_ir] JumpAlways(175)
    jmp @target_175

@OPCODE_1036:   ; [c64_ir] BranchTarget(174)
@target_174:

@OPCODE_1037:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1038:   ; [c64_ir] BranchTarget(175)
@target_175:

@OPCODE_1039:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1040:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1041:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1042:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1043:   ; [c64_ir] JumpIf0(180)
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

@OPCODE_1044:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1045:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1046:   ; [c64_ir] BranchTarget(177)
@target_177:

@OPCODE_1047:   ; [c64_ir] Add
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

@OPCODE_1048:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1049:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1050:   ; [c64_ir] BranchTarget(178)
@target_178:

@OPCODE_1051:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1052:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1053:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1054:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1055:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1056:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1057:   ; [c64_ir] JumpAlways(181)
    jmp @target_181

@OPCODE_1058:   ; [c64_ir] BranchTarget(180)
@target_180:

@OPCODE_1059:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1060:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1061:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1062:   ; [c64_ir] BranchTarget(181)
@target_181:

@OPCODE_1063:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1064:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1065:   ; [c64_ir] BranchTarget(182)
@target_182:

@OPCODE_1066:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1067:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1068:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1069:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1070:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1071:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1072:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1073:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1074:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1075:   ; [c64_ir] JumpIf0(160)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_160

    lda TEMP2

@OPCODE_1076:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1077:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1078:   ; [c64_ir] BranchTarget(184)
@target_184:

@OPCODE_1079:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1080:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1081:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1082:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1083:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1084:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1085:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1086:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1087:   ; [c64_ir] BranchTarget(185)
@target_185:

@OPCODE_1088:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1089:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1090:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1091:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1092:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1093:   ; [c64_ir] Add
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

@OPCODE_1094:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1095:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1096:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_1097:   ; [c64_ir] Add
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

@OPCODE_1098:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1099:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1100:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1101:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1102:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1103:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1104:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1105:   ; [c64_ir] BranchTarget(186)
@target_186:

@OPCODE_1106:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1107:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1108:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1109:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1110:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1111:   ; [c64_ir] BranchTarget(187)
@target_187:

@OPCODE_1112:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1113:   ; [c64_ir] Add
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

@OPCODE_1114:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1115:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1116:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1117:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1118:   ; [c64_ir] BranchTarget(188)
@target_188:

@OPCODE_1119:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1120:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1121:   ; [c64_ir] BranchTarget(189)
@target_189:

@OPCODE_1122:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1123:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1124:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1125:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1126:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1127:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1128:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1129:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1130:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1131:   ; [c64_ir] BranchTarget(190)
@target_190:

@OPCODE_1132:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1133:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1134:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1135:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1136:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1137:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1138:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1139:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1140:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1141:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1142:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1143:   ; [c64_ir] BranchTarget(191)
@target_191:

@OPCODE_1144:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1145:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1146:   ; [c64_ir] BranchTarget(192)
@target_192:

@OPCODE_1147:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1148:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1149:   ; [c64_ir] BranchTarget(193)
@target_193:

@OPCODE_1150:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1151:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1152:   ; [c64_ir] BranchTarget(194)
@target_194:

@OPCODE_1153:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1154:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_1155:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1156:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1157:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1158:   ; [c64_ir] Add
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

@OPCODE_1159:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1160:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1161:   ; [c64_ir] Add
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

@OPCODE_1162:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1163:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1164:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1165:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1166:   ; [c64_ir] BranchTarget(195)
@target_195:

@OPCODE_1167:   ; [c64_ir] JumpIf0(198)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_198

    lda TEMP2

@OPCODE_1168:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1169:   ; [c64_ir] JumpAlways(199)
    jmp @target_199

@OPCODE_1170:   ; [c64_ir] BranchTarget(198)
@target_198:

@OPCODE_1171:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1172:   ; [c64_ir] BranchTarget(199)
@target_199:

@OPCODE_1173:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1174:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1175:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1176:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1177:   ; [c64_ir] JumpIf0(204)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_204

    lda TEMP2

@OPCODE_1178:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1179:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1180:   ; [c64_ir] BranchTarget(201)
@target_201:

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

@OPCODE_1182:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1183:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1184:   ; [c64_ir] BranchTarget(202)
@target_202:

@OPCODE_1185:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1186:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1187:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1188:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1189:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1190:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1191:   ; [c64_ir] JumpAlways(205)
    jmp @target_205

@OPCODE_1192:   ; [c64_ir] BranchTarget(204)
@target_204:

@OPCODE_1193:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1194:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1195:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1196:   ; [c64_ir] BranchTarget(205)
@target_205:

@OPCODE_1197:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1198:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1199:   ; [c64_ir] BranchTarget(206)
@target_206:

@OPCODE_1200:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1201:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1202:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1203:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1204:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1205:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1206:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1207:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1208:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1209:   ; [c64_ir] JumpIf0(108)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_108

    lda TEMP2

@OPCODE_1210:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1211:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1212:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1213:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1214:   ; [c64_ir] BranchTarget(208)
@target_208:

@OPCODE_1215:   ; [c64_ir] PushLiteral(4)
    pha
    tya
    pha
    ldy #0
    lda #4

@OPCODE_1216:   ; [c64_ir] PushLiteral(38880)
    pha
    tya
    pha
    ldy #151
    lda #224

@OPCODE_1217:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1218:   ; [c64_ir] PushLiteral(38880)
    pha
    tya
    pha
    ldy #151
    lda #224

@OPCODE_1219:   ; [c64_ir] Load
    sta TEMP
    sty TEMP2
    ldy #0
    lda (TEMP),y

@OPCODE_1220:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1221:   ; [c64_ir] Add
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

@OPCODE_1222:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1223:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1224:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1225:   ; [c64_ir] BranchTarget(209)
@target_209:

@OPCODE_1226:   ; [c64_ir] PushLiteral(8)
    pha
    tya
    pha
    ldy #0
    lda #8

@OPCODE_1227:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1228:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1229:   ; [c64_ir] BranchTarget(210)
@target_210:

@OPCODE_1230:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1231:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1232:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1233:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1234:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1235:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1236:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1237:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1238:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1239:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1240:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1241:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1242:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1243:   ; [c64_ir] BranchTarget(211)
@target_211:

@OPCODE_1244:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1245:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1246:   ; [c64_ir] BranchTarget(212)
@target_212:

@OPCODE_1247:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1248:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1249:   ; [c64_ir] BranchTarget(213)
@target_213:

@OPCODE_1250:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1251:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_1252:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1253:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1254:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1255:   ; [c64_ir] Add
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

@OPCODE_1256:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1257:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1258:   ; [c64_ir] Add
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

@OPCODE_1259:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1260:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1261:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1262:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1263:   ; [c64_ir] BranchTarget(214)
@target_214:

@OPCODE_1264:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1265:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1266:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1267:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1268:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1269:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1270:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1271:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1272:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1273:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1274:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1275:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1276:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1277:   ; [c64_ir] BranchTarget(215)
@target_215:

@OPCODE_1278:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1279:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1280:   ; [c64_ir] BranchTarget(216)
@target_216:

@OPCODE_1281:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1282:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1283:   ; [c64_ir] BranchTarget(217)
@target_217:

@OPCODE_1284:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1285:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1286:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1287:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1288:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1289:   ; [c64_ir] Add
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

@OPCODE_1290:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1291:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1292:   ; [c64_ir] PushLiteral(36870)
    pha
    tya
    pha
    ldy #144
    lda #6

@OPCODE_1293:   ; [c64_ir] Add
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

@OPCODE_1294:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1295:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1296:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1297:   ; [c64_ir] PushLiteral(8)
    pha
    tya
    pha
    ldy #0
    lda #8

@OPCODE_1298:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1299:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1300:   ; [c64_ir] BranchTarget(218)
@target_218:

@OPCODE_1301:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1302:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1303:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1304:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1305:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1306:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1307:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1308:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1309:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1310:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1311:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1312:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1313:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1314:   ; [c64_ir] BranchTarget(219)
@target_219:

@OPCODE_1315:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1316:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1317:   ; [c64_ir] BranchTarget(220)
@target_220:

@OPCODE_1318:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1319:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1320:   ; [c64_ir] BranchTarget(221)
@target_221:

@OPCODE_1321:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1322:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1323:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1324:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1325:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1326:   ; [c64_ir] Add
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

@OPCODE_1327:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1328:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1329:   ; [c64_ir] PushLiteral(37872)
    pha
    tya
    pha
    ldy #147
    lda #240

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

@OPCODE_1331:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1332:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1333:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1334:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1335:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1336:   ; [c64_ir] BranchTarget(222)
@target_222:

@OPCODE_1337:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1338:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1339:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1340:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1341:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1342:   ; [c64_ir] BranchTarget(223)
@target_223:

@OPCODE_1343:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1344:   ; [c64_ir] Add
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

@OPCODE_1345:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1346:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1347:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1348:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1349:   ; [c64_ir] BranchTarget(224)
@target_224:

@OPCODE_1350:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1351:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1352:   ; [c64_ir] BranchTarget(225)
@target_225:

@OPCODE_1353:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1354:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1355:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1356:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1357:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1358:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1359:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1360:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1361:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1362:   ; [c64_ir] BranchTarget(226)
@target_226:

@OPCODE_1363:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1364:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1365:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1366:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1367:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1368:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1369:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1370:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1371:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1372:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1373:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1374:   ; [c64_ir] BranchTarget(227)
@target_227:

@OPCODE_1375:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1376:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1377:   ; [c64_ir] BranchTarget(228)
@target_228:

@OPCODE_1378:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1379:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1380:   ; [c64_ir] BranchTarget(229)
@target_229:

@OPCODE_1381:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1382:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1383:   ; [c64_ir] BranchTarget(230)
@target_230:

@OPCODE_1384:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1385:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_1386:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1387:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1388:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1389:   ; [c64_ir] Add
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

@OPCODE_1390:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1391:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_1393:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1394:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1395:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1396:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1397:   ; [c64_ir] BranchTarget(231)
@target_231:

@OPCODE_1398:   ; [c64_ir] JumpIf0(234)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_234

    lda TEMP2

@OPCODE_1399:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1400:   ; [c64_ir] JumpAlways(235)
    jmp @target_235

@OPCODE_1401:   ; [c64_ir] BranchTarget(234)
@target_234:

@OPCODE_1402:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1403:   ; [c64_ir] BranchTarget(235)
@target_235:

@OPCODE_1404:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1405:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1406:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1407:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1408:   ; [c64_ir] JumpIf0(240)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_240

    lda TEMP2

@OPCODE_1409:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1410:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1411:   ; [c64_ir] BranchTarget(237)
@target_237:

@OPCODE_1412:   ; [c64_ir] Add
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

@OPCODE_1413:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1414:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1415:   ; [c64_ir] BranchTarget(238)
@target_238:

@OPCODE_1416:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1417:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1418:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1419:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1420:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1421:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1422:   ; [c64_ir] JumpAlways(241)
    jmp @target_241

@OPCODE_1423:   ; [c64_ir] BranchTarget(240)
@target_240:

@OPCODE_1424:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1425:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1426:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1427:   ; [c64_ir] BranchTarget(241)
@target_241:

@OPCODE_1428:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1429:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1430:   ; [c64_ir] BranchTarget(242)
@target_242:

@OPCODE_1431:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1432:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1433:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1434:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1435:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1436:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1437:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1438:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1439:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1440:   ; [c64_ir] JumpIf0(209)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_209

    lda TEMP2

@OPCODE_1441:   ; [c64_ir] PushLiteral(39)
    pha
    tya
    pha
    ldy #0
    lda #39

@OPCODE_1442:   ; [c64_ir] PushLiteral(38878)
    pha
    tya
    pha
    ldy #151
    lda #222

@OPCODE_1443:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1444:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1445:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1446:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1447:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1448:   ; [c64_ir] BranchTarget(244)
@target_244:

@OPCODE_1449:   ; [c64_ir] PushLiteral(8)
    pha
    tya
    pha
    ldy #0
    lda #8

@OPCODE_1450:   ; [c64_ir] PushLiteral(13)
    pha
    tya
    pha
    ldy #0
    lda #13

@OPCODE_1451:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1452:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1453:   ; [c64_ir] BranchTarget(245)
@target_245:

@OPCODE_1454:   ; [c64_ir] PushLiteral(38874)
    pha
    tya
    pha
    ldy #151
    lda #218

@OPCODE_1455:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1456:   ; [c64_ir] PushLiteral(38876)
    pha
    tya
    pha
    ldy #151
    lda #220

@OPCODE_1457:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1458:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1459:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1460:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1461:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1462:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1463:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1464:   ; [c64_ir] BranchTarget(246)
@target_246:

@OPCODE_1465:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1466:   ; [c64_ir] PushLiteral(36866)
    pha
    tya
    pha
    ldy #144
    lda #2

@OPCODE_1467:   ; [c64_ir] Store
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1468:   ; [c64_ir] Exit
    ;rts






; function start


