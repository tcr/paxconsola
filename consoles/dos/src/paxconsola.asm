[map symbols build/paxconsola.map]

    section .text

    org 100h
	
	mov ax, $0		;ES points to our Code segment
    mov es, ax

    push ds
    push es

        ; Switch to Mode 0
        mov ax,0
        int 10h

        ; Disable cursor
        mov cx,0xffff
        mov ah,1
        int 10h

        ; ; Move cursor
        ; mov ah,02
        ; mov bh,0
        ; mov dh,1
        ; mov dl,1
        ; mov al,2
        ; int 10h

        ; ; Write character
        ; mov ah,0x0A
        ; mov al,2
        ; mov bh,0
        ; mov bl,1
        ; mov cx,1
        ; int 10h


        ; Setup return stack for Forth
        mov bx,0xF000
        mov bp,bx

        ; Call Forth
        xchg sp,bp
        call PAX_main
        xchg sp,bp

        ; Drop remaining first value
        pop ax


    pop es
    pop ds
	
	jmp $

    ; Forth extern methods
%include "src/taurus/dos-taurus.asm"

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
