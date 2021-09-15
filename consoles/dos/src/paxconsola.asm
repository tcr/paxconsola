[map symbols build/paxconsola.map]

    section .text

    org 100h
	
	mov ax, $0		;ES points to our Code segment
    mov es, ax

    ; Switch to Mode 0
    mov ax,0
    int 10h

    ; Disable cursor
    mov cx,0xffff
    mov ah,1
    int 10h

    jmp main_loop


main_loop:
    call await_vblank
    call await_vblank
    call await_vblank
    call await_vblank

    ; Setup return stack for Forth
    mov bx,0xF000
    mov bp,bx

    ; Call Forth
    xchg sp,bp
    call PAX_main
    xchg sp,bp

    ; Drop remaining first value
    ; pop ax

    ; call await_vblank
	; jmp main_loop
    
    jmp main_loop

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
	
CursorX			equ UserRam
CursorY			equ UserRam+1
MonitorBak_AX 	equ UserRam+2
MonitorBak_F	equ UserRam+4
MonitorBak_IP   equ UserRam+6
MonitorBak_ES   equ UserRam+8
MonitorBak_DS   equ UserRam+10

; EXE_end
