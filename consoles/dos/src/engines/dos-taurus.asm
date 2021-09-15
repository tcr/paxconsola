; extern call "write-char-at"
PAXEXT_write2Dchar2Dat:
    ; switch hardware stack back from alt stack
    push cx
    xchg sp,bp

    ; Save Char to write
    mov cl,bl
    ; Save Y
    pop bx
    mov dh,bl
    ; Save X
    pop bx
    mov dl,bl

    ; Move cursor
    mov ah,02
    mov bh,0
    ;mov dh,1 ; Y already populated
    ;mov dl,1 ; X already populated
    int 10h

    ; Write character
    mov ah,0x0A
    mov al,cl ; Char saved in cl
    mov bh,0
    mov cx,1
    int 10h

    ; switch hardware stack to alt stack to pop value
    pop bx
    xchg sp,bp
    pop cx
    ret

; extern call "read-char-at"
PAXEXT_read2Dchar2Dat:
    ; switch hardware stack back from alt stack
    xchg sp,bp

    ; Save Y
    mov dh,bl
    ; Save X
    pop bx
    mov dl,bl

    ; Move cursor
    mov ah,02
    mov bh,0
    ;mov dh,1 ; Y already populated
    ;mov dl,1 ; X already populated
    int 10h

    ; Read character
    mov ah,0x08
    mov bh,0
    int 10h

    ; Move character into TOS
    mov bh,0
    mov bl,al

    ; switch hardware stack to alt stack to pop value
    xchg sp,bp
    ret
