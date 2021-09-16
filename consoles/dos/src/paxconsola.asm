[map symbols build/paxconsola.map]

    section .text

    org 100h

; Program start
start:
	mov ax, $0		;ES points to our Code segment
    mov es, ax

%ifdef ENGINE_TAURUS
    ; Switch to Mode 0
    mov al, 00h
    call set_video_mode

    ; Disable cursor
    mov cx,0xffff
    mov ah,1
    int 10h
%endif

%ifdef ENGINE_LIBRA
    ; Switch to Mode 13 (ega 320x200 16 color)
    mov     al, 0Dh
    call set_video_mode
%endif

%ifdef ENGINE_TAURUS
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

    ; Poll keyboards
    mov ax, 0x1100
    int 16h
    mov bx,ax
    jnz update_buffer
    
    ; Loop
    jmp main_loop
%endif

%ifdef ENGINE_LIBRA
main_loop:
    call setup_palette
    call draw_bitmap
    jmp $
%endif

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


    align 16
%include "src/bitmap.asm"


; Forth extern methods
%ifdef ENGINE_TAURUS
    %include "src/engines/dos-taurus.asm"
%endif
%ifdef ENGINE_LIBRA
    %include "src/engines/dos-libra.asm"
%endif


; Forth compilation
%include "build/paxconsola_generated.asm"


    section .data

UserRam times 256 db 0
