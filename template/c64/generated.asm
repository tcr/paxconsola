@OPCODE_0:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_2:   ; [c64_ir] BranchTarget(0)
@target_0:

@OPCODE_3:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_4:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_5:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_6:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_7:   ; [c64_ir] BranchTarget(1)
@target_1:

@OPCODE_8:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_9:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_10:   ; [c64_ir] BranchTarget(2)
@target_2:

@OPCODE_11:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_12:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_13:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_14:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_15:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_16:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_17:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_18:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_19:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_20:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_21:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_22:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_23:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_24:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_25:   ; [c64_ir] BranchTarget(3)
@target_3:

@OPCODE_26:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_27:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_28:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_29:   ; [c64_ir] BranchTarget(4)
@target_4:

@OPCODE_30:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_31:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_32:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_33:   ; [c64_ir] BranchTarget(5)
@target_5:

@OPCODE_34:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_35:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_36:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_37:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_38:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_39:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_40:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_41:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_42:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_43:   ; [c64_ir] BranchTarget(6)
@target_6:

@OPCODE_44:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_45:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_46:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_47:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_48:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_49:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_50:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_51:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_52:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_53:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_54:   ; [c64_ir] BranchTarget(7)
@target_7:

@OPCODE_55:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_56:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_57:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_58:   ; [c64_ir] BranchTarget(8)
@target_8:

@OPCODE_59:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_60:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_61:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_62:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_63:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_64:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_65:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_66:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_67:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_68:   ; [c64_ir] BranchTarget(9)
@target_9:

@OPCODE_69:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_70:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_71:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_72:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_73:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_74:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_75:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_76:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_77:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_78:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_79:   ; [c64_ir] BranchTarget(10)
@target_10:

@OPCODE_80:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_81:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_82:   ; [c64_ir] BranchTarget(11)
@target_11:

@OPCODE_83:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_84:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_85:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_86:   ; [c64_ir] BranchTarget(12)
@target_12:

@OPCODE_87:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_88:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_89:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_90:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_91:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_92:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_93:   ; [c64_ir] BranchTarget(13)
@target_13:

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

@OPCODE_96:   ; [c64_ir] BranchTarget(14)
@target_14:

@OPCODE_97:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_98:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_99:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_100:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_101:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_102:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_103:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_105:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_106:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_107:   ; [c64_ir] BranchTarget(15)
@target_15:

@OPCODE_108:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_109:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_110:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

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

@OPCODE_113:   ; [c64_ir] BranchTarget(16)
@target_16:

@OPCODE_114:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_115:   ; [c64_ir] Add
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

@OPCODE_116:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_117:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_118:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_119:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_120:   ; [c64_ir] BranchTarget(17)
@target_17:

@OPCODE_121:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_122:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_123:   ; [c64_ir] BranchTarget(18)
@target_18:

@OPCODE_124:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_125:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_126:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_127:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_128:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_129:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_130:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_131:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_132:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_133:   ; [c64_ir] BranchTarget(19)
@target_19:

@OPCODE_134:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_135:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_136:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_137:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_138:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_139:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_140:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_141:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_142:   ; [c64_ir] Drop
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

@OPCODE_145:   ; [c64_ir] BranchTarget(20)
@target_20:

@OPCODE_146:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_147:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_148:   ; [c64_ir] BranchTarget(21)
@target_21:

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

@OPCODE_151:   ; [c64_ir] BranchTarget(22)
@target_22:

@OPCODE_152:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_153:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_154:   ; [c64_ir] BranchTarget(23)
@target_23:

@OPCODE_155:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_156:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_157:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_158:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_159:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_160:   ; [c64_ir] Add
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

@OPCODE_161:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_162:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_163:   ; [c64_ir] Add
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

@OPCODE_164:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_165:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_168:   ; [c64_ir] BranchTarget(24)
@target_24:

@OPCODE_169:   ; [c64_ir] JumpIf0(27)
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

@OPCODE_170:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_171:   ; [c64_ir] JumpAlways(28)
    jmp @target_28

@OPCODE_172:   ; [c64_ir] BranchTarget(27)
@target_27:

@OPCODE_173:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_174:   ; [c64_ir] BranchTarget(28)
@target_28:

@OPCODE_175:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_176:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_179:   ; [c64_ir] JumpIf0(33)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_33

    lda TEMP2

@OPCODE_180:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_181:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_182:   ; [c64_ir] BranchTarget(30)
@target_30:

@OPCODE_183:   ; [c64_ir] Add
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

@OPCODE_186:   ; [c64_ir] BranchTarget(31)
@target_31:

@OPCODE_187:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_188:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_189:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_190:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_191:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_192:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_193:   ; [c64_ir] JumpAlways(34)
    jmp @target_34

@OPCODE_194:   ; [c64_ir] BranchTarget(33)
@target_33:

@OPCODE_195:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_196:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_197:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_198:   ; [c64_ir] BranchTarget(34)
@target_34:

@OPCODE_199:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_200:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_201:   ; [c64_ir] BranchTarget(35)
@target_35:

@OPCODE_202:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_203:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_204:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_205:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_206:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_207:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_208:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_209:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_210:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_211:   ; [c64_ir] JumpIf0(13)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_13

    lda TEMP2

@OPCODE_212:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_213:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_214:   ; [c64_ir] BranchTarget(37)
@target_37:

@OPCODE_215:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_216:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_217:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_218:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_219:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_220:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_221:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_222:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_223:   ; [c64_ir] BranchTarget(38)
@target_38:

@OPCODE_224:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_225:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_226:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_227:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_228:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_229:   ; [c64_ir] Add
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

@OPCODE_230:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_231:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_232:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

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

@OPCODE_234:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_235:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_236:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_237:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_238:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_239:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_240:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_241:   ; [c64_ir] BranchTarget(39)
@target_39:

@OPCODE_242:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_243:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_244:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_245:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_246:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_247:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_248:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_249:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_250:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_251:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_252:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_253:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

@OPCODE_254:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_255:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_256:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_257:   ; [c64_ir] BranchTarget(40)
@target_40:

@OPCODE_258:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_259:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_260:   ; [c64_ir] BranchTarget(41)
@target_41:

@OPCODE_261:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_262:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_263:   ; [c64_ir] BranchTarget(42)
@target_42:

@OPCODE_264:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_265:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_266:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_267:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_268:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_269:   ; [c64_ir] Add
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

@OPCODE_270:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_271:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_272:   ; [c64_ir] Add
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

@OPCODE_273:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_274:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_277:   ; [c64_ir] BranchTarget(43)
@target_43:

@OPCODE_278:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_279:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_280:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_281:   ; [c64_ir] BranchTarget(44)
@target_44:

@OPCODE_282:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_283:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_284:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_285:   ; [c64_ir] BranchTarget(45)
@target_45:

@OPCODE_286:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_287:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_288:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_289:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

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

@OPCODE_292:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_293:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_294:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_295:   ; [c64_ir] BranchTarget(46)
@target_46:

@OPCODE_296:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_297:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_298:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_299:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_300:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_301:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_302:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_303:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_304:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_305:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_306:   ; [c64_ir] BranchTarget(47)
@target_47:

@OPCODE_307:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_308:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_309:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_310:   ; [c64_ir] BranchTarget(48)
@target_48:

@OPCODE_311:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_312:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_313:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_314:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_315:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_316:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_317:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_318:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_319:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_320:   ; [c64_ir] BranchTarget(49)
@target_49:

@OPCODE_321:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_322:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_323:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_324:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_325:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_326:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_327:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_328:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_329:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_330:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_331:   ; [c64_ir] BranchTarget(50)
@target_50:

@OPCODE_332:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_333:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_334:   ; [c64_ir] BranchTarget(51)
@target_51:

@OPCODE_335:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_336:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_337:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_338:   ; [c64_ir] BranchTarget(52)
@target_52:

@OPCODE_339:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_340:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_341:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_342:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_343:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_344:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_345:   ; [c64_ir] BranchTarget(53)
@target_53:

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

@OPCODE_348:   ; [c64_ir] BranchTarget(54)
@target_54:

@OPCODE_349:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_350:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_351:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_352:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_353:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_354:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_355:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_356:   ; [c64_ir] Add
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

@OPCODE_357:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_358:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_359:   ; [c64_ir] BranchTarget(55)
@target_55:

@OPCODE_360:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_361:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_362:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

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

@OPCODE_365:   ; [c64_ir] BranchTarget(56)
@target_56:

@OPCODE_366:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_367:   ; [c64_ir] Add
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

@OPCODE_368:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_369:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_370:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_371:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_372:   ; [c64_ir] BranchTarget(57)
@target_57:

@OPCODE_373:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_374:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_375:   ; [c64_ir] BranchTarget(58)
@target_58:

@OPCODE_376:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_377:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_378:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_379:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_380:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_381:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_382:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_383:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_384:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_385:   ; [c64_ir] BranchTarget(59)
@target_59:

@OPCODE_386:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_387:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_388:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_389:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_390:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_391:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_392:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_393:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_394:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_395:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_396:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_397:   ; [c64_ir] BranchTarget(60)
@target_60:

@OPCODE_398:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_399:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_400:   ; [c64_ir] BranchTarget(61)
@target_61:

@OPCODE_401:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_402:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_403:   ; [c64_ir] BranchTarget(62)
@target_62:

@OPCODE_404:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_405:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_406:   ; [c64_ir] BranchTarget(63)
@target_63:

@OPCODE_407:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_408:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_409:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_410:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_411:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_412:   ; [c64_ir] Add
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

@OPCODE_413:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_414:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_415:   ; [c64_ir] Add
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

@OPCODE_416:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_417:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_420:   ; [c64_ir] BranchTarget(64)
@target_64:

@OPCODE_421:   ; [c64_ir] JumpIf0(67)
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

@OPCODE_422:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_423:   ; [c64_ir] JumpAlways(68)
    jmp @target_68

@OPCODE_424:   ; [c64_ir] BranchTarget(67)
@target_67:

@OPCODE_425:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_426:   ; [c64_ir] BranchTarget(68)
@target_68:

@OPCODE_427:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_428:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_429:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_430:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_431:   ; [c64_ir] JumpIf0(73)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_73

    lda TEMP2

@OPCODE_432:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_433:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_434:   ; [c64_ir] BranchTarget(70)
@target_70:

@OPCODE_435:   ; [c64_ir] Add
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

@OPCODE_436:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_437:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_438:   ; [c64_ir] BranchTarget(71)
@target_71:

@OPCODE_439:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_440:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_441:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_442:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_443:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_444:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_445:   ; [c64_ir] JumpAlways(74)
    jmp @target_74

@OPCODE_446:   ; [c64_ir] BranchTarget(73)
@target_73:

@OPCODE_447:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_448:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_449:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_450:   ; [c64_ir] BranchTarget(74)
@target_74:

@OPCODE_451:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_452:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_453:   ; [c64_ir] BranchTarget(75)
@target_75:

@OPCODE_454:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_455:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_456:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_457:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_458:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_459:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_460:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_461:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_462:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_463:   ; [c64_ir] JumpIf0(53)
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

@OPCODE_464:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_465:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_466:   ; [c64_ir] BranchTarget(77)
@target_77:

@OPCODE_467:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_468:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_469:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_470:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_471:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_472:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_473:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_474:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_475:   ; [c64_ir] BranchTarget(78)
@target_78:

@OPCODE_476:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_477:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_478:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_479:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_480:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_481:   ; [c64_ir] Add
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

@OPCODE_482:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_483:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_484:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_485:   ; [c64_ir] Add
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

@OPCODE_486:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_487:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_488:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_489:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_490:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_491:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_492:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_493:   ; [c64_ir] BranchTarget(79)
@target_79:

@OPCODE_494:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_495:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_496:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_497:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_498:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_499:   ; [c64_ir] BranchTarget(80)
@target_80:

@OPCODE_500:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_501:   ; [c64_ir] Add
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

@OPCODE_502:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_503:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_504:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_505:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_506:   ; [c64_ir] BranchTarget(81)
@target_81:

@OPCODE_507:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_508:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_509:   ; [c64_ir] BranchTarget(82)
@target_82:

@OPCODE_510:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_511:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_512:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_513:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_514:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_515:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_516:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_517:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_518:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_519:   ; [c64_ir] BranchTarget(83)
@target_83:

@OPCODE_520:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_521:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_522:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_523:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_524:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_525:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_526:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_527:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_528:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_529:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_530:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_531:   ; [c64_ir] BranchTarget(84)
@target_84:

@OPCODE_532:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_533:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_534:   ; [c64_ir] BranchTarget(85)
@target_85:

@OPCODE_535:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_536:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_537:   ; [c64_ir] BranchTarget(86)
@target_86:

@OPCODE_538:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_539:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_540:   ; [c64_ir] BranchTarget(87)
@target_87:

@OPCODE_541:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_542:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_543:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_544:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_545:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_546:   ; [c64_ir] Add
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

@OPCODE_547:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_548:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_550:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_551:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_554:   ; [c64_ir] BranchTarget(88)
@target_88:

@OPCODE_555:   ; [c64_ir] JumpIf0(91)
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

@OPCODE_556:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_557:   ; [c64_ir] JumpAlways(92)
    jmp @target_92

@OPCODE_558:   ; [c64_ir] BranchTarget(91)
@target_91:

@OPCODE_559:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_560:   ; [c64_ir] BranchTarget(92)
@target_92:

@OPCODE_561:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_562:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_563:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_564:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_565:   ; [c64_ir] JumpIf0(97)
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

@OPCODE_566:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_567:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_568:   ; [c64_ir] BranchTarget(94)
@target_94:

@OPCODE_569:   ; [c64_ir] Add
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

@OPCODE_570:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_571:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_572:   ; [c64_ir] BranchTarget(95)
@target_95:

@OPCODE_573:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_574:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_575:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_576:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_577:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_578:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_579:   ; [c64_ir] JumpAlways(98)
    jmp @target_98

@OPCODE_580:   ; [c64_ir] BranchTarget(97)
@target_97:

@OPCODE_581:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_582:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_583:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_584:   ; [c64_ir] BranchTarget(98)
@target_98:

@OPCODE_585:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_586:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_587:   ; [c64_ir] BranchTarget(99)
@target_99:

@OPCODE_588:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_589:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_590:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_591:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_592:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_593:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_594:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_595:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_596:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_597:   ; [c64_ir] JumpIf0(1)
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

@OPCODE_598:   ; [c64_ir] PushLiteral(25)
    pha
    tya
    pha
    ldy #0
    lda #25

@OPCODE_599:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_600:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_601:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_602:   ; [c64_ir] BranchTarget(101)
@target_101:

@OPCODE_603:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_604:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_605:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_606:   ; [c64_ir] BranchTarget(102)
@target_102:

@OPCODE_607:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_608:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_609:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_610:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_611:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_612:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_613:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_614:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_615:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_616:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_617:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_618:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_619:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_620:   ; [c64_ir] BranchTarget(103)
@target_103:

@OPCODE_621:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_622:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_623:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_624:   ; [c64_ir] BranchTarget(104)
@target_104:

@OPCODE_625:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_626:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_627:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_628:   ; [c64_ir] BranchTarget(105)
@target_105:

@OPCODE_629:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_630:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_631:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

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

@OPCODE_635:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_636:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_637:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_638:   ; [c64_ir] BranchTarget(106)
@target_106:

@OPCODE_639:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_640:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_641:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_642:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_643:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_644:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_645:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_646:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_647:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_648:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_649:   ; [c64_ir] BranchTarget(107)
@target_107:

@OPCODE_650:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_651:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_652:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_653:   ; [c64_ir] BranchTarget(108)
@target_108:

@OPCODE_654:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_655:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_656:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_657:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_658:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_659:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_660:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_661:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_662:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_663:   ; [c64_ir] BranchTarget(109)
@target_109:

@OPCODE_664:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_665:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_666:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_667:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_668:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_669:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_670:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_671:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_672:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_673:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_674:   ; [c64_ir] BranchTarget(110)
@target_110:

@OPCODE_675:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_676:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_677:   ; [c64_ir] BranchTarget(111)
@target_111:

@OPCODE_678:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_679:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_680:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_681:   ; [c64_ir] BranchTarget(112)
@target_112:

@OPCODE_682:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_683:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_684:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_685:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_686:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_687:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_688:   ; [c64_ir] BranchTarget(113)
@target_113:

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

@OPCODE_691:   ; [c64_ir] BranchTarget(114)
@target_114:

@OPCODE_692:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_693:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_694:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_695:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_696:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_697:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_698:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_700:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_701:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_702:   ; [c64_ir] BranchTarget(115)
@target_115:

@OPCODE_703:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_704:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_705:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

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

@OPCODE_708:   ; [c64_ir] BranchTarget(116)
@target_116:

@OPCODE_709:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_710:   ; [c64_ir] Add
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

@OPCODE_711:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_712:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_713:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_714:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_715:   ; [c64_ir] BranchTarget(117)
@target_117:

@OPCODE_716:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_717:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_718:   ; [c64_ir] BranchTarget(118)
@target_118:

@OPCODE_719:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_720:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_721:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_722:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_723:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_724:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_725:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_726:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_727:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_728:   ; [c64_ir] BranchTarget(119)
@target_119:

@OPCODE_729:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_730:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_731:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_732:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_733:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_734:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_735:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_736:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_737:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_738:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_739:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_740:   ; [c64_ir] BranchTarget(120)
@target_120:

@OPCODE_741:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_742:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_743:   ; [c64_ir] BranchTarget(121)
@target_121:

@OPCODE_744:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_745:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_746:   ; [c64_ir] BranchTarget(122)
@target_122:

@OPCODE_747:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_748:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_749:   ; [c64_ir] BranchTarget(123)
@target_123:

@OPCODE_750:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_751:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_752:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_753:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_754:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_755:   ; [c64_ir] Add
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

@OPCODE_756:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_757:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_758:   ; [c64_ir] Add
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

@OPCODE_759:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_760:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_763:   ; [c64_ir] BranchTarget(124)
@target_124:

@OPCODE_764:   ; [c64_ir] JumpIf0(127)
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

@OPCODE_765:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_766:   ; [c64_ir] JumpAlways(128)
    jmp @target_128

@OPCODE_767:   ; [c64_ir] BranchTarget(127)
@target_127:

@OPCODE_768:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_769:   ; [c64_ir] BranchTarget(128)
@target_128:

@OPCODE_770:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_771:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_772:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_773:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_774:   ; [c64_ir] JumpIf0(133)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_133

    lda TEMP2

@OPCODE_775:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_776:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_777:   ; [c64_ir] BranchTarget(130)
@target_130:

@OPCODE_778:   ; [c64_ir] Add
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

@OPCODE_779:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_780:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_781:   ; [c64_ir] BranchTarget(131)
@target_131:

@OPCODE_782:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_783:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_784:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_785:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_786:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_787:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_788:   ; [c64_ir] JumpAlways(134)
    jmp @target_134

@OPCODE_789:   ; [c64_ir] BranchTarget(133)
@target_133:

@OPCODE_790:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_791:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_792:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_793:   ; [c64_ir] BranchTarget(134)
@target_134:

@OPCODE_794:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_795:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_796:   ; [c64_ir] BranchTarget(135)
@target_135:

@OPCODE_797:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_798:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_799:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_800:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_801:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_802:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_803:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_804:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_805:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_806:   ; [c64_ir] JumpIf0(113)
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

@OPCODE_807:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_808:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_809:   ; [c64_ir] BranchTarget(137)
@target_137:

@OPCODE_810:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_811:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_812:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_813:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_814:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_815:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_816:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_817:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_818:   ; [c64_ir] BranchTarget(138)
@target_138:

@OPCODE_819:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_820:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_821:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_822:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_823:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_824:   ; [c64_ir] Add
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

@OPCODE_825:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_826:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_827:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_828:   ; [c64_ir] Add
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

@OPCODE_829:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_830:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_831:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_832:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_833:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_834:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_835:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_836:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_837:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_838:   ; [c64_ir] BranchTarget(139)
@target_139:

@OPCODE_839:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_840:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_841:   ; [c64_ir] BranchTarget(140)
@target_140:

@OPCODE_842:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_843:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_844:   ; [c64_ir] BranchTarget(141)
@target_141:

@OPCODE_845:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_846:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

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

@OPCODE_849:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_850:   ; [c64_ir] Add
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

@OPCODE_851:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_852:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_853:   ; [c64_ir] Add
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

@OPCODE_854:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_855:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_858:   ; [c64_ir] BranchTarget(142)
@target_142:

@OPCODE_859:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_860:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_861:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_862:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_863:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_864:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_865:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_866:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_867:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

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

@OPCODE_870:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_871:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_872:   ; [c64_ir] BranchTarget(143)
@target_143:

@OPCODE_873:   ; [c64_ir] PushLiteral(2)
    pha
    tya
    pha
    ldy #0
    lda #2

@OPCODE_874:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_875:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_876:   ; [c64_ir] BranchTarget(144)
@target_144:

@OPCODE_877:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_878:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_879:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_880:   ; [c64_ir] BranchTarget(145)
@target_145:

@OPCODE_881:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_882:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_883:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

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

@OPCODE_887:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_888:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_889:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_890:   ; [c64_ir] BranchTarget(146)
@target_146:

@OPCODE_891:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_892:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_893:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_894:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_895:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_896:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_897:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_898:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_899:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_900:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_901:   ; [c64_ir] BranchTarget(147)
@target_147:

@OPCODE_902:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_903:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_904:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_905:   ; [c64_ir] BranchTarget(148)
@target_148:

@OPCODE_906:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_907:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_908:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_909:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_910:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_911:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_912:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_913:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_914:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_915:   ; [c64_ir] BranchTarget(149)
@target_149:

@OPCODE_916:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_917:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_918:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_919:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_920:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_921:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_922:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_923:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_924:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_925:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_926:   ; [c64_ir] BranchTarget(150)
@target_150:

@OPCODE_927:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_928:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_929:   ; [c64_ir] BranchTarget(151)
@target_151:

@OPCODE_930:   ; [c64_ir] PushLiteral(40)
    pha
    tya
    pha
    ldy #0
    lda #40

@OPCODE_931:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_932:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_933:   ; [c64_ir] BranchTarget(152)
@target_152:

@OPCODE_934:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_935:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_936:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_937:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_938:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_939:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_940:   ; [c64_ir] BranchTarget(153)
@target_153:

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

@OPCODE_943:   ; [c64_ir] BranchTarget(154)
@target_154:

@OPCODE_944:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_945:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_946:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_947:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_948:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_949:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_950:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_951:   ; [c64_ir] Add
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

@OPCODE_952:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_953:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_954:   ; [c64_ir] BranchTarget(155)
@target_155:

@OPCODE_955:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_956:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_957:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

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

@OPCODE_960:   ; [c64_ir] BranchTarget(156)
@target_156:

@OPCODE_961:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_962:   ; [c64_ir] Add
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

@OPCODE_963:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_964:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_965:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_966:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_967:   ; [c64_ir] BranchTarget(157)
@target_157:

@OPCODE_968:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_969:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_970:   ; [c64_ir] BranchTarget(158)
@target_158:

@OPCODE_971:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_972:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_973:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_974:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_975:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_976:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_977:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_978:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_979:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_980:   ; [c64_ir] BranchTarget(159)
@target_159:

@OPCODE_981:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_982:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_983:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_984:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_985:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_986:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_987:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_988:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_989:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_990:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_991:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_992:   ; [c64_ir] BranchTarget(160)
@target_160:

@OPCODE_993:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_994:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_995:   ; [c64_ir] BranchTarget(161)
@target_161:

@OPCODE_996:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_997:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_998:   ; [c64_ir] BranchTarget(162)
@target_162:

@OPCODE_999:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1000:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1001:   ; [c64_ir] BranchTarget(163)
@target_163:

@OPCODE_1002:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1003:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_1004:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1005:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1006:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1007:   ; [c64_ir] Add
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

@OPCODE_1008:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1009:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1010:   ; [c64_ir] Add
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

@OPCODE_1011:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1012:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_1015:   ; [c64_ir] BranchTarget(164)
@target_164:

@OPCODE_1016:   ; [c64_ir] JumpIf0(167)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_167

    lda TEMP2

@OPCODE_1017:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1018:   ; [c64_ir] JumpAlways(168)
    jmp @target_168

@OPCODE_1019:   ; [c64_ir] BranchTarget(167)
@target_167:

@OPCODE_1020:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1021:   ; [c64_ir] BranchTarget(168)
@target_168:

@OPCODE_1022:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1023:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1024:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1025:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1026:   ; [c64_ir] JumpIf0(173)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_173

    lda TEMP2

@OPCODE_1027:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1028:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1029:   ; [c64_ir] BranchTarget(170)
@target_170:

@OPCODE_1030:   ; [c64_ir] Add
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

@OPCODE_1031:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1032:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1033:   ; [c64_ir] BranchTarget(171)
@target_171:

@OPCODE_1034:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1035:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1036:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1037:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1038:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1039:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1040:   ; [c64_ir] JumpAlways(174)
    jmp @target_174

@OPCODE_1041:   ; [c64_ir] BranchTarget(173)
@target_173:

@OPCODE_1042:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1043:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1044:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1045:   ; [c64_ir] BranchTarget(174)
@target_174:

@OPCODE_1046:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1047:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1048:   ; [c64_ir] BranchTarget(175)
@target_175:

@OPCODE_1049:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1050:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1051:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1052:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1053:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1054:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1055:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1056:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1057:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1058:   ; [c64_ir] JumpIf0(153)
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

@OPCODE_1059:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1060:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1061:   ; [c64_ir] BranchTarget(177)
@target_177:

@OPCODE_1062:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1063:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1064:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1065:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1066:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1067:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1068:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1069:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1070:   ; [c64_ir] BranchTarget(178)
@target_178:

@OPCODE_1071:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1072:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1073:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1074:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1075:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1076:   ; [c64_ir] Add
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

@OPCODE_1077:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1078:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1079:   ; [c64_ir] PushLiteral(1024)
    pha
    tya
    pha
    ldy #4
    lda #0

@OPCODE_1080:   ; [c64_ir] Add
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

@OPCODE_1081:   ; [c64_ir] Store8
    sta TEMP
    sty TEMP2
    pla
    pla
    ldy #0
    sta (TEMP),y
    pla
    tay
    pla

@OPCODE_1082:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1083:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1084:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1085:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1086:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1087:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1088:   ; [c64_ir] BranchTarget(179)
@target_179:

@OPCODE_1089:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1090:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1091:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1092:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1093:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1094:   ; [c64_ir] BranchTarget(180)
@target_180:

@OPCODE_1095:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1096:   ; [c64_ir] Add
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

@OPCODE_1097:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1098:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1099:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1100:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1101:   ; [c64_ir] BranchTarget(181)
@target_181:

@OPCODE_1102:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1103:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1104:   ; [c64_ir] BranchTarget(182)
@target_182:

@OPCODE_1105:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1106:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1107:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1108:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1109:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1110:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1111:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1112:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1113:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1114:   ; [c64_ir] BranchTarget(183)
@target_183:

@OPCODE_1115:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1116:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1117:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1118:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1119:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1120:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1121:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1122:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1123:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1124:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1125:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1126:   ; [c64_ir] BranchTarget(184)
@target_184:

@OPCODE_1127:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1128:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1129:   ; [c64_ir] BranchTarget(185)
@target_185:

@OPCODE_1130:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1131:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1132:   ; [c64_ir] BranchTarget(186)
@target_186:

@OPCODE_1133:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1134:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1135:   ; [c64_ir] BranchTarget(187)
@target_187:

@OPCODE_1136:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1137:   ; [c64_ir] Nand
    sty TEMP
    sta TEMP2
    pla
    and TEMP
    eor #$ff
    tay
    pla
    and TEMP2
    eor #$ff

@OPCODE_1138:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1139:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1140:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1141:   ; [c64_ir] Add
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

@OPCODE_1142:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1143:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1144:   ; [c64_ir] Add
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

@OPCODE_1145:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1146:   ; [c64_ir] Drop
    pla
    tay
    pla

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

@OPCODE_1149:   ; [c64_ir] BranchTarget(188)
@target_188:

@OPCODE_1150:   ; [c64_ir] JumpIf0(191)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_191

    lda TEMP2

@OPCODE_1151:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1152:   ; [c64_ir] JumpAlways(192)
    jmp @target_192

@OPCODE_1153:   ; [c64_ir] BranchTarget(191)
@target_191:

@OPCODE_1154:   ; [c64_ir] PushLiteral(-1)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1155:   ; [c64_ir] BranchTarget(192)
@target_192:

@OPCODE_1156:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1157:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1158:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1159:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1160:   ; [c64_ir] JumpIf0(197)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_197

    lda TEMP2

@OPCODE_1161:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1162:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1163:   ; [c64_ir] BranchTarget(194)
@target_194:

@OPCODE_1164:   ; [c64_ir] Add
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

@OPCODE_1165:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1166:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1167:   ; [c64_ir] BranchTarget(195)
@target_195:

@OPCODE_1168:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1169:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1170:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1171:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1172:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1173:   ; [c64_ir] PushLiteral(1)
    pha
    tya
    pha
    ldy #0
    lda #1

@OPCODE_1174:   ; [c64_ir] JumpAlways(198)
    jmp @target_198

@OPCODE_1175:   ; [c64_ir] BranchTarget(197)
@target_197:

@OPCODE_1176:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1177:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1178:   ; [c64_ir] PushLiteral(0)
    pha
    tya
    pha
    ldy #0
    lda #0

@OPCODE_1179:   ; [c64_ir] BranchTarget(198)
@target_198:

@OPCODE_1180:   ; [c64_ir] PushLiteral(65535)
    pha
    tya
    pha
    ldy #255
    lda #255

@OPCODE_1181:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1182:   ; [c64_ir] BranchTarget(199)
@target_199:

@OPCODE_1183:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1184:   ; [c64_ir] StoreTemp
    sta TEMP_PAX1
    sty TEMP_PAX2
    pla
    tay
    pla

@OPCODE_1185:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1186:   ; [c64_ir] LoadTemp
    pha
    tya
    pha
    lda TEMP_PAX1
    ldy TEMP_PAX2

@OPCODE_1187:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1188:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1189:   ; [c64_ir] AltPush
    sta $00,x
    tya
    inx
    sta $00,x
    inx
    pla
    tay
    pla

@OPCODE_1190:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1191:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1192:   ; [c64_ir] JumpIf0(101)
    sta TEMP

    pla
    tay
    pla

    sta TEMP2
    lda #0
    cmp TEMP
    bne *+7
    lda TEMP2
    jmp @target_101

    lda TEMP2

@OPCODE_1193:   ; [c64_ir] AltPop
    pha
    tya
    pha ; bump down TOS
    dex
    lda $00,x
    tay
    dex
    lda $00,x

@OPCODE_1194:   ; [c64_ir] Drop
    pla
    tay
    pla

@OPCODE_1195:   ; [c64_ir] Exit
    ;rts






; function start


