
%define K_UP    48h
%define K_LEFT  4Bh
%define K_RIGHT 4Dh
%define K_DOWN  50h

poll_keyboard:
        mov ax, 0
        mov [KEYBOARD_VALUE],ax

        xor ax, ax
        in al, 60h

        test al, 0x80
        jz .update_buffer

        ; no key
        ret

    .update_buffer:
        mov cx,0

        cmp al,K_UP
        jnz .not_up
        mov cx,ASCII_UP
    .not_up:
        cmp al,K_DOWN
        jnz .not_down
        mov cx,ASCII_DOWN
    .not_down:
        cmp al,K_LEFT
        jnz .not_left
        mov cx,ASCII_LEFT
    .not_left:
        cmp al,K_RIGHT
        jnz .not_right
        mov cx,ASCII_RIGHT
    .not_right:

        ; Store latest value
        mov [KEYBOARD_VALUE],cx

        ; Jump to start of buffer
        ret
