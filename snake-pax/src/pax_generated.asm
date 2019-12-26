;[op] Pushn(49156)
    ; 49156
    ld d, h
    ld e, l ; push new value
    ld hl,49156

;[op] Load
    ; @ (8-bit)
    ld a, [hl]
    ld h, 0
    ld l, a

;[op] Pushn(37)
    ; 37
    ld d, h
    ld e, l ; push new value
    ld hl,37

;[op] Equals
    ; =
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

;[op] If
    ; if (8-bit)
    ld a,l
    cp $0
    jr z,.next_2

;[op] Pushn(17)
    ; 17
    ld d, h
    ld e, l ; push new value
    ld hl,17

;[op] Pushn(38912)
    ; 38912
    ld d, h
    ld e, l ; push new value
    ld hl,38912

;[op] Store
    ; ! (8-bit)
    ld a, e
    ld [hl],a

;[op] Then
.next_2

