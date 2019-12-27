.opcode_0
    ; PushLiteral(49156)
    ld d, h
    ld e, l
    ld hl,49156

.opcode_1
    ; Load
    ld a, [hl]
    ld h, 0
    ld l, a

.opcode_2
    ; PushLiteral(37)
    ld d, h
    ld e, l
    ld hl,37

.opcode_3
    ; Equals
    ld a, d
    cp h
    jp nz,.next_0
    ld a, e
    cp l
    jp nz,.next_0
    ld hl, $1
    ; pop de
    jp .next_1
.next_0:
    ld hl, $0
    ; pop de
.next_1:

.opcode_4
    ; PushLabel(8)
    ld d, h
    ld e, l
    ld hl,.opcode_8

.opcode_5
    ; JumpIf0
    ld a,e
    cp $0
    jp nz,.next_2
    jp hl
.next_2:

.opcode_6
    ; PushLabel(9)
    ld d, h
    ld e, l
    ld hl,.opcode_9

.opcode_7
    ; Call
    call EMULATE_JP_HL

.opcode_8
    ; Stop
    ret

.opcode_9
    ; PushLiteral(20)
    ld d, h
    ld e, l
    ld hl,20

.opcode_10
    ; PushLiteral(38912)
    ld d, h
    ld e, l
    ld hl,38912

.opcode_11
    ; Store
    ld a, e
    ld [hl],a

.opcode_12
    ; Exit
    ret


EMULATE_JP_HL:
	jp	hl
