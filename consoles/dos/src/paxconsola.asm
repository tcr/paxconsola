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



        ; Application defines

        %define KEYBOARD_VALUE 0x7e

        %define ROWS_COUNT 14
        %define COLUMNS_COUNT 22

        %define ROW_WIDTH_IN_BYTES (COLUMNS_COUNT * 2)
        %define ROW_HEIGHT_IN_PIXELS 16
        %define PANNING_VRAM_OFFSET (2 + (ROW_WIDTH_IN_BYTES * ROW_HEIGHT_IN_PIXELS))
        %define SCREEN_IN_BYTES ROW_WIDTH_IN_BYTES * ROW_HEIGHT_IN_PIXELS * ROWS_COUNT

        %define VIDEO_BUFFER_OFFSET 0x3000
        
        %define ASCII_LEFT 37
        %define ASCII_UP 38
        %define ASCII_RIGHT 39
        %define ASCII_DOWN 40


        ; cpu 8086
        bits 16
        org 100h

; Program start
start:
        mov ax, $0		;ES points to our Code segment
        mov es, ax

        ; clear flags
        cld

        ; Clear initial RAM
        mov ax,0
        mov [PelPanning],al
        mov [VerticalOffset],ax
        mov [KEYBOARD_VALUE],ax


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

        ; Switch video to unchained mode
        mov dx,SC_INDEX
        mov ax,604h
        out dx,ax

        ; Setup the color palette.
        call setup_palette

        ; Set EGA virtual line width higher to compensate for scroll
		mov bx, (ROW_WIDTH_IN_BYTES * 8)
		call set_virtual_screen_width

        ; Setup buffer indexes. Offscreen buffer initially lives at VIDEO_BUFFER_OFFSET.
        mov ax, VIDEO_BUFFER_OFFSET
        mov [BufferOffscreen], ax
        mov ax, 0
        mov [BufferOnscreen], ax

        ; Setup horizontal panning register.
        mov al,16
        mov [PelPanning],al
        ; Compute initial VRAM offset: one column and one row
        mov ax, (ROW_WIDTH_IN_BYTES * ROW_HEIGHT_IN_PIXELS)
        mov [VerticalOffset],ax

draw_background:
        mov ch, ROWS_COUNT
    .draw_row:
        dec ch
        push cx

        mov cl, COLUMNS_COUNT
    .draw_tile:
        dec cl
        push cx

        ; draw individual tile
        mov bh,cl	    ; X
        shl bh,1
        mov bl,ch	    ; Y
        shl bl,4
        mov ch,2	    ; Width
        mov cl,16		; Height
	    mov si, bitmap_linear
        call draw_bitmap

        ; loop .draw_tile
        pop cx
        test cl,cl
        jnz .draw_tile

        ; loop .draw_row
        pop cx
        test ch,ch
        jnz .draw_row

draw_hero:
        ; Draw hero sprite
        mov bh, 2	;X
        mov bl, 16	;Y
        mov ch, 2	;Width
        mov cl, 16		;Height
	    mov si, bitmap_hero
        call draw_bitmap

; Wait for VSYNC and then redraw the screen.
game_loop:
        ; Wait for VSYNC.
        call wait_vsync

        ; Swap buffers
        mov ax, [BufferOnscreen]
        mov bx, [BufferOffscreen]
        mov [BufferOffscreen], ax
        mov [BufferOnscreen], bx

        ; Calculate VRAM offset.
        mov bh, 0
		mov bl, [PelPanning]
        shr bx, 3
		add bx, [VerticalOffset]
        add bx, [BufferOnscreen]

        ; Set VRAM offset.
        mov ah, bl
		mov al, LOW_ADDRESS
		mov dx, CRTC_INDEX
		out dx, ax
        mov ah, bh
		mov al, HIGH_ADDRESS
		mov dx, CRTC_INDEX
		out dx, ax

        ; Set PEL_PANNING register.
        mov ah, 0
        mov al, [PelPanning]
        mov bh, al
        mov ax, 0x1000
        mov bl, PEL_PANNING
        int 10h

    .check_keys:
        ; Poll keyboard
        call poll_keyboard
        mov ax, [KEYBOARD_VALUE]

        ; Check keys.
        cmp al, ASCII_RIGHT
        jz .key_right
        cmp al, ASCII_LEFT
        jz .key_left
        cmp al, ASCII_DOWN
        jz .key_down
        cmp al, ASCII_UP
        jz .key_up

        ; Continue game loop.
        jmp frame_work
    
    .key_right:
        ; Increase PEL Panning register
        inc word [PelPanning]
        jmp frame_work
    
    .key_left:
        ; Decrease PEL Panning register
        dec word [PelPanning]
        jmp frame_work
    
    .key_down:
        ; Decrease PEL Panning register
        mov ax, [VerticalOffset]
        add ax, ROW_WIDTH_IN_BYTES
        mov [VerticalOffset], ax
        jmp frame_work
    
    .key_up:
        ; Decrease PEL Panning register
        mov ax, [VerticalOffset]
        sub ax, ROW_WIDTH_IN_BYTES
        mov [VerticalOffset], ax
        jmp frame_work
    
frame_work:
        ; Copy frame buffer
        call copy_screen_to_buffer

        ; ; clear tile behind a sprite
        ; mov bh,2	    ; X
        ; mov bl,16	    ; Y
        ; mov ch,2	    ; Width
        ; mov cl,16		; Height
	    ; mov si, bitmap_linear
        ; call draw_bitmap ; draw to second buffer

        ; ; draw sprite
        ; mov bh,2	    ; X
        ; mov bl,16	    ; Y
        ; mov ch,2	    ; Width
        ; mov cl,16		; Height
	    ; mov si, bitmap_hero
        ; call draw_bitmap ; draw to second buffer

        ; Maybe draw new 1/2 column
        ; Maybe draw new 1/2 row

        jmp game_loop

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

PelPanning db 0
VerticalOffset dw 0

BufferOffscreen     dw 0
BufferOnscreen      dw 0
