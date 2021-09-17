poll_keyboard:
        mov ax, 0
        mov [KEYBOARD_VALUE],ax

        mov ax, 0x1100
        int 16h
        mov bx,ax
        jnz .update_buffer
        ret

    .update_buffer:
        mov cx,0

        mov ah, 10h
        int 16h

        cmp ah,48h  ; Compare to UP
        jnz .not_up
        mov cx,38
    .not_up:
        cmp ah,50h  ; Compare to Down
        jnz .not_down
        mov cx,40
    .not_down:
        cmp ah,4Bh  ; Compare to Left
        jnz .not_left
        mov cx,37
    .not_left:
        cmp ah,4Dh  ; Comapre to Right
        jnz .not_right
        mov cx,39
    .not_right:

        ; Store latest value
        mov [KEYBOARD_VALUE],cx

        ; Jump to start of buffer
        ret
