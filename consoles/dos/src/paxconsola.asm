[map symbols build/paxconsola.map]

       section .text

		%define MISC_OUTPUT  03c2h
		%define GC_INDEX     03ceh
		%define SC_INDEX     03c4h
		%define SC_DATA      03c5h
		%define CRTC_INDEX   03d4h
		%define CRTC_DATA    03d5h
		%define INPUT_STATUS 03dah
		%define AC_WRITE     03c0h
		%define AC_READ      03c1h		
		%define MAP_MASK       02h
		%define MEMORY_MODE    04h
		%define UNDERLINE_LOC  14h
		%define MODE_CONTROL   17h
		%define HIGH_ADDRESS   0ch
		%define LOW_ADDRESS    0dh
		%define LINE_OFFSET    13h
		%define PEL_PANNING    13h
		
		%define CRTC_LINECOMPARE 24		
		%define CRTC_OVERFLOW     7
		%define CRTC_MAXSCANLINE  9

        bits 16
        org 100h

; Program start
start:
        mov ax, $0		;ES points to our Code segment
        mov es, ax

%ifdef ENGINE_TAURUS

engine_start:
        ; Switch to Mode 0
        mov al, 00h
        call set_video_mode

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
        call wait_vsync
        call wait_vsync
        call wait_vsync
        call wait_vsync
        call wait_vsync
        call wait_vsync

        ; Poll keyboards
        call poll_keyboard
        
        ; Loop
        jmp main_loop
%endif

%ifdef ENGINE_LIBRA

engine_start:
        ; Switch to Mode 13 (ega 320x200 16 color)
        mov al, 0Dh
        call set_video_mode

        ; Set virtual line width higher to compensate for scroll
		mov bx, 352
		call set_virtual_screen_width

main_loop:
        ; mov ax, 0
        ; mov [0x007e], ax

        call setup_palette

        mov ch,13
    .draw_row:
        dec ch
        push cx

        mov cl,21
    .draw_tile:
        dec cl
        push cx

        mov bh,cl	;X
        shl bh,1
        mov bl,ch	;Y
        shl bl,4
        mov ch,2	;Width
        mov cl,16		;Height
	    mov si, bitmap_linear
        call draw_bitmap

        pop cx
        test cl,cl
        jnz .draw_tile

        pop cx
        test ch,ch
        jnz .draw_row

        mov bh,2	;X
        mov bl,8	;Y
        mov ch,6	;Width
        mov cl,48		;Height
	    mov si, BitmapTest
        call draw_bitmap

        mov ax,0
        mov [PelPanning],ax
        mov [0x007e],ax


    .inner_loop:
        ; Wait for VBLANK.
        call wait_vsync
        ; call wait_vsync
        ; call wait_vsync
        ; call wait_vsync
        ; call wait_vsync
        ; call wait_vsync
        ; call wait_vsync
        ; call wait_vsync
        ; call wait_vsync

        ; Poll keyboards
        call poll_keyboard

        mov ax,[0x007e]
        cmp al,39
        jnz .inner_loop

        ; Read our horizontal scrolling register
        ; mov ax,[PelPanning]
        ; cmp ax,7
        ; jne .inner_loop_next

        ; Shift video by 1 byte
		mov ah,[PelPanning]
        shr ah,3
		mov al, LOW_ADDRESS
		mov dx, CRTC_INDEX
		out dx, ax

        ; mov ax,0
        ; mov [PelPanning],ax
        ; mov [0x007e],ax

        ; mov bh,al
        ; mov ax,0x1000
        ; mov bl,PEL_PANNING
        ; int 10h

        ; jmp $
    
    .inner_loop_after:

        mov ax,[PelPanning]
        mov bh,al
        mov ax,0x1000
        mov bl,PEL_PANNING
        int 10h

        ; Increase PEL Panning register
        mov ax,[PelPanning]
        inc ax
        mov [PelPanning],ax

        ; Loop
        jmp .inner_loop

%endif



    align 16
%include "src/graphics.asm"
%include "src/input.asm"


; Forth extern methods
%ifdef ENGINE_TAURUS
    %include "src/engines/dos-taurus.asm"
%endif
%ifdef ENGINE_LIBRA
    %include "src/engines/dos-libra.asm"
%endif


    align 16
; Forth compilation
%include "build/paxconsola_generated.asm"


    section .data

UserRam times 256 db 0

PelPanning db 0
