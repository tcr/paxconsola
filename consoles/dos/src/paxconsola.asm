[map symbols build/paxconsola.map]

    section .text

    org 100h

; Program start
start:
	mov ax, $0		;ES points to our Code segment
    mov es, ax

    ; Switch to Mode 0
    mov ax,0
    int 10h

    ; Disable cursor
    mov cx,0xffff
    mov ah,1
    int 10h

main_loop:
    ; Setup return stack for Forth
    mov bx,0xF000
    mov bp,bx

    ; Call Forth
    xchg sp,bp
    call PAX_main
    xchg sp,bp

    ; Wait for VBLANK.
    call await_vblank
    call await_vblank
    call await_vblank
    call await_vblank
    call await_vblank
    call await_vblank
    call await_vblank
    call await_vblank

    ; Poll keyboards
    mov ax, 0x1100
    int 16h
    mov bx,ax
    jnz update_buffer
    
    ; Loop
    jmp main_loop

update_buffer:
    mov cx,0

    mov ah, 10h
    int 16h

    cmp ah,48h  ; Compare to UP
    jnz CurNotUp
    mov cx,38
CurNotUp:
    cmp ah,50h  ; Compare to Down
    jnz CurNotDown
    mov cx,40
CurNotDown:
    cmp ah,4Bh  ; Compare to Left
    jnz CurNotLeft
    mov cx,37
CurNotLeft:
    cmp ah,4Dh  ; Comapre to Right
    jnz CurNotRight
    mov cx,39
CurNotRight:

    ; Store latest value
    mov bx,0x007e
    mov [bx],cx

    ; Jump to start of buffer
    jmp main_loop


; Await VBLANK signal, indicating the next frame.
await_vblank:
    mov dx, 03dah ;wait for vertical retrace
.wr1:
    in al, dx
    test al, 08h
    jnz .wr1
.wr2:
    in al, dx
    test al, 08h
    jz .wr2
    ret


; Forth extern methods
%include "src/engines/dos-taurus.asm"


; Forth compilation
%include "build/paxconsola_generated.asm"


    section .data

UserRam times 256 db 0
