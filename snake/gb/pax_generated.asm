
.opcode_0:
    ; [pax] PushLiteral(49156)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49156)
        

    ld hl,49156
            

.opcode_1:
    ; [pax] Load
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

.opcode_2:
    ; [pax] PushLiteral(37)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(37)
        

    ld hl,37
            

.opcode_3:
    ; [pax] Equals
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] CompareDEAndReplace
        

    ld a, d
    cp h
    jp nz,.next_0
    ld a, e
    cp l
    jp nz,.next_0
    ld hl, $1
    jp .next_1
.next_0:
    ld hl, $0
.next_1:
            

.opcode_4:
    ; [pax] PushLabel(8)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(8)
        

    ld hl,.opcode_8
            

.opcode_5:
    ; [pax] JumpIf0
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] JumpIfDEIs0
        

    ld a, e
    cp $0
    jp nz,.next_2
    jp hl
.next_2:
            

.opcode_6:
    ; [pax] PushLabel(54)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(54)
        

    ld hl,.opcode_54
            

.opcode_7:
    ; [pax] Call
        

    ; [gb_ir] PopAndCall
        
inc c
inc c
call EMULATE_JP_HL

.opcode_8:
    ; [pax] PushLiteral(49156)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49156)
        

    ld hl,49156
            

.opcode_9:
    ; [pax] Load
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

.opcode_10:
    ; [pax] PushLiteral(39)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(39)
        

    ld hl,39
            

.opcode_11:
    ; [pax] Equals
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] CompareDEAndReplace
        

    ld a, d
    cp h
    jp nz,.next_3
    ld a, e
    cp l
    jp nz,.next_3
    ld hl, $1
    jp .next_4
.next_3:
    ld hl, $0
.next_4:
            

.opcode_12:
    ; [pax] PushLabel(16)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(16)
        

    ld hl,.opcode_16
            

.opcode_13:
    ; [pax] JumpIf0
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] JumpIfDEIs0
        

    ld a, e
    cp $0
    jp nz,.next_5
    jp hl
.next_5:
            

.opcode_14:
    ; [pax] PushLabel(47)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(47)
        

    ld hl,.opcode_47
            

.opcode_15:
    ; [pax] Call
        

    ; [gb_ir] PopAndCall
        
inc c
inc c
call EMULATE_JP_HL

.opcode_16:
    ; [pax] PushLiteral(49156)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49156)
        

    ld hl,49156
            

.opcode_17:
    ; [pax] Load
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

.opcode_18:
    ; [pax] PushLiteral(38)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38)
        

    ld hl,38
            

.opcode_19:
    ; [pax] Equals
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] CompareDEAndReplace
        

    ld a, d
    cp h
    jp nz,.next_6
    ld a, e
    cp l
    jp nz,.next_6
    ld hl, $1
    jp .next_7
.next_6:
    ld hl, $0
.next_7:
            

.opcode_20:
    ; [pax] PushLabel(24)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(24)
        

    ld hl,.opcode_24
            

.opcode_21:
    ; [pax] JumpIf0
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] JumpIfDEIs0
        

    ld a, e
    cp $0
    jp nz,.next_8
    jp hl
.next_8:
            

.opcode_22:
    ; [pax] PushLabel(59)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(59)
        

    ld hl,.opcode_59
            

.opcode_23:
    ; [pax] Call
        

    ; [gb_ir] PopAndCall
        
inc c
inc c
call EMULATE_JP_HL

.opcode_24:
    ; [pax] PushLiteral(49156)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49156)
        

    ld hl,49156
            

.opcode_25:
    ; [pax] Load
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

.opcode_26:
    ; [pax] PushLiteral(40)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(40)
        

    ld hl,40
            

.opcode_27:
    ; [pax] Equals
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] CompareDEAndReplace
        

    ld a, d
    cp h
    jp nz,.next_9
    ld a, e
    cp l
    jp nz,.next_9
    ld hl, $1
    jp .next_10
.next_9:
    ld hl, $0
.next_10:
            

.opcode_28:
    ; [pax] PushLabel(32)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(32)
        

    ld hl,.opcode_32
            

.opcode_29:
    ; [pax] JumpIf0
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] JumpIfDEIs0
        

    ld a, e
    cp $0
    jp nz,.next_11
    jp hl
.next_11:
            

.opcode_30:
    ; [pax] PushLabel(66)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(66)
        

    ld hl,.opcode_66
            

.opcode_31:
    ; [pax] Call
        

    ; [gb_ir] PopAndCall
        
inc c
inc c
call EMULATE_JP_HL

.opcode_32:
    ; [pax] Stop
        

    ; [gb_ir] Ret
        
ret

.opcode_33:
    ; [pax] Metadata("drop")
        

.opcode_34:
    ; [pax] PushLabel(36)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLabel(36)
        

    ld hl,.opcode_36
            

.opcode_35:
    ; [pax] JumpIf0
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] JumpIfDEIs0
        

    ld a, e
    cp $0
    jp nz,.next_12
    jp hl
.next_12:
            

.opcode_36:
    ; [pax] Exit
        

    ; [gb_ir] Ret
        
ret

.opcode_37:
    ; [pax] Metadata("over")
        

.opcode_38:
    ; [pax] AltPush
        

    ; [gb_ir] AltDup
        

    push hl
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

.opcode_39:
    ; [pax] PushLiteral(49158)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49158)
        

    ld hl,49158
            

.opcode_40:
    ; [pax] Store
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] StoreDE
        

    ld a, e
    ld [hl],a
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

.opcode_41:
    ; [pax] PushLiteral(49158)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49158)
        

    ld hl,49158
            

.opcode_42:
    ; [pax] Load
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

.opcode_43:
    ; [pax] AltPop
        

    ; [gb_ir] AltPop
        

    pop hl
            

.opcode_44:
    ; [pax] PushLiteral(49158)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(49158)
        

    ld hl,49158
            

.opcode_45:
    ; [pax] Load
        

    ; [gb_ir] ReplaceLoad
        

    ld a, [hl]
    ld h, 0
    ld l, a
            

.opcode_46:
    ; [pax] Exit
        

    ; [gb_ir] Ret
        
ret

.opcode_47:
    ; [pax] Metadata("turn-right")
        

.opcode_48:
    ; [pax] PushLiteral(18)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(18)
        

    ld hl,18
            

.opcode_49:
    ; [pax] PushLiteral(38912)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

.opcode_50:
    ; [pax] PushLiteral(3)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(3)
        

    ld hl,3
            

.opcode_51:
    ; [pax] Add
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] ReplaceAddWithDE
        

    add hl, de
            

.opcode_52:
    ; [pax] Store
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] StoreDE
        

    ld a, e
    ld [hl],a
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

.opcode_53:
    ; [pax] Exit
        

    ; [gb_ir] Ret
        
ret

.opcode_54:
    ; [pax] Metadata("turn-left")
        

.opcode_55:
    ; [pax] PushLiteral(21)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(21)
        

    ld hl,21
            

.opcode_56:
    ; [pax] PushLiteral(38912)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

.opcode_57:
    ; [pax] Store
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] StoreDE
        

    ld a, e
    ld [hl],a
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

.opcode_58:
    ; [pax] Exit
        

    ; [gb_ir] Ret
        
ret

.opcode_59:
    ; [pax] Metadata("turn-up")
        

.opcode_60:
    ; [pax] PushLiteral(19)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(19)
        

    ld hl,19
            

.opcode_61:
    ; [pax] PushLiteral(38912)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

.opcode_62:
    ; [pax] PushLiteral(2)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(2)
        

    ld hl,2
            

.opcode_63:
    ; [pax] Add
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] ReplaceAddWithDE
        

    add hl, de
            

.opcode_64:
    ; [pax] Store
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] StoreDE
        

    ld a, e
    ld [hl],a
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

.opcode_65:
    ; [pax] Exit
        

    ; [gb_ir] Ret
        
ret

.opcode_66:
    ; [pax] Metadata("turn-down")
        

.opcode_67:
    ; [pax] PushLiteral(20)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(20)
        

    ld hl,20
            

.opcode_68:
    ; [pax] PushLiteral(38912)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(38912)
        

    ld hl,38912
            

.opcode_69:
    ; [pax] PushLiteral(1)
        

    ; [gb_ir] Dup
        

    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            

    ; [gb_ir] ReplaceLiteral(1)
        

    ld hl,1
            

.opcode_70:
    ; [pax] Add
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] ReplaceAddWithDE
        

    add hl, de
            

.opcode_71:
    ; [pax] Store
        

    ; [gb_ir] NipIntoDE
        

    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc C
    ld a, [c]
    ld d, a
    inc c
            

    ; [gb_ir] StoreDE
        

    ld a, e
    ld [hl],a
            

    ; [gb_ir] Pop
        

    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c                
            

.opcode_72:
    ; [pax] Exit
        

    ; [gb_ir] Ret
        
ret

EMULATE_JP_HL:
    jp	hl
    
