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

        %define ROWS_COUNT 15
        %define COLUMNS_COUNT 21

        %define TILE_WIDTH 16
        %define TILE_HEIGHT 16

        %define TILE_IN_BYTES 2 * TILE_HEIGHT * 4

        %define ROW_WIDTH_IN_BYTES (COLUMNS_COUNT * 2)
        %define SCREEN_IN_BYTES ROW_WIDTH_IN_BYTES * TILE_HEIGHT * ROWS_COUNT

        %define START_HORIZONTAL_OFFSET 8
        %define START_VERTICAL_OFFSET 8

        ; Have the next screen offset be four pixels adjusted
        %define VIDEO_BUFFER_OFFSET ROW_WIDTH_IN_BYTES * TILE_HEIGHT * (ROWS_COUNT + 4)
        
        %define ASCII_LEFT 37
        %define ASCII_UP 38
        %define ASCII_RIGHT 39
        %define ASCII_DOWN 40

        %define MAP_WIDTH 32
        %define MAP_HEIGHT 32


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
        mov ax, 0
        ; bytes
        mov [PelPanning], al
        ; words
        mov [VerticalOffset], ax
        mov [KEYBOARD_VALUE], ax
        mov [RelativeXCoordinate], ax
        mov [RelativeYCoordinate], ax
        mov [HeroSpriteX], ax
        mov [HeroSpriteY], ax


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
        mov ax, START_HORIZONTAL_OFFSET
        mov [PelPanning],al
        mov [RelativeXCoordinate], ax
        ; Compute initial VRAM offset: one column and one row
        mov ax, START_VERTICAL_OFFSET * ROW_WIDTH_IN_BYTES
        mov [VerticalOffset],ax
        mov ax, START_VERTICAL_OFFSET
        mov [RelativeYCoordinate], ax

draw_entire_map:
        mov ch, ROWS_COUNT
    .draw_row:
        dec ch
        push cx

        mov cl, COLUMNS_COUNT
    .draw_tile:
        dec cl
        push cx

        push cx
        mov bx, 0
        mov bl, ch
        mov ch, 0
	    call map_bitmap_lookup
        pop cx

        ; draw individual tile
        mov bh,cl	    ; X
        shl bh,1
        mov bl,ch	    ; Y
        shl bl,4
        mov ch,2	    ; Width
        mov cl,16		; Height
        call draw_bitmap

        ; loop .draw_tile
        pop cx
        test cl,cl
        jnz .draw_tile

        ; loop .draw_row
        pop cx
        test ch,ch
        jnz .draw_row

; Wait for VSYNC and then redraw the screen.
game_loop:
        call    wait_display_enable

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

        ; Wait for VSYNC.
        call wait_vsync

    .check_keys:
        ; Poll keyboard
        call poll_keyboard
        call pan_map
        call redraw_sprites

        jmp game_loop


;
; Panning the background in response to a keypress.
;
; ax = keyboard value
pan_map:
        ; Read from keyboard buffer
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

        ; Continue redrawing frame.
        jmp frame_work
    
    .key_left:
        ; Decrease relative coordinate
        dec word [RelativeXCoordinate]

        ; Decrease PEL Panning register
        dec byte [PelPanning]
        js frame_work_left
        jmp frame_work
    
    .key_right:
        ; Decrease relative coordinate
        inc word [RelativeXCoordinate]

        ; Increase PEL Panning register
        inc byte [PelPanning]
        mov al, [PelPanning]
        cmp al,TILE_WIDTH
        jge frame_work_right
        jmp frame_work
    
    .key_up:
        ; Decrease relative coordinate
        dec word [RelativeYCoordinate]

        ; Decrease Vertical Offset
        mov ax, [VerticalOffset]
        sub ax, ROW_WIDTH_IN_BYTES
        mov [VerticalOffset], ax
        js frame_work_up
        jmp frame_work

    .key_down:
        ; Decrease relative coordinate
        inc word [RelativeYCoordinate]

        ; Decrease Vertical Offset
        mov ax, [VerticalOffset]
        add ax, ROW_WIDTH_IN_BYTES
        mov [VerticalOffset], ax
        cmp ax, (ROW_WIDTH_IN_BYTES * 16)
        jge frame_work_down
        jmp frame_work
    
frame_work:
        ; Copy frame buffer
        mov ax, 0
        mov bx, 0
        mov cx, (SCREEN_IN_BYTES / 4)
        call copy_screen_to_buffer

        ret

; Pan off left side, draw left column
frame_work_left:
        ; if we only panned on the right side of a tile, don't redraw column
        test word [RelativeXCoordinate], 0x8
        jnz .new_column

        ; Copy frame buffer right 8 pixels
        mov ax, 0
        mov bx, 1
        mov cx, (SCREEN_IN_BYTES / 4)
        call copy_screen_to_buffer

        ; Update panning counter
        mov ah, 7
        mov [PelPanning], ah

        ret

    .new_column:
        ; Copy frame buffer right 16 pixels
        mov ax, 0
        mov bx, 2
        mov cx, (SCREEN_IN_BYTES / 4) - 2
        call copy_screen_to_buffer

        ; Update panning counter
        mov ah, (TILE_WIDTH - 1)
        mov [PelPanning], ah

        mov ch, ROWS_COUNT
    .draw_column:
        dec ch
        push cx

        ; draw individual tile
        mov bh,0
        mov bl,ch
        shl bl,4
        mov ch,2	    ; Width
        mov cl,TILE_HEIGHT		; Height
	    call frame_map_bitmap_lookup
        call draw_bitmap

        ; loop .draw_column
        pop cx
        test ch,ch
        jnz .draw_column

        inc word [HeroSpriteX]
        inc word [HeroSpriteX]

        ret

; Pan off right side, draw right column
frame_work_right:
        ; Copy frame buffer left 16 pixels
        mov ax, 2
        mov bx, 0
        mov cx, (SCREEN_IN_BYTES / 4) - 1
        call copy_screen_to_buffer

        ; Update panning counter
        mov ah, 0
        mov [PelPanning], ah

        mov ch, ROWS_COUNT
    .draw_column:
        dec ch
        push cx

        ; draw individual tile
        mov bh,(COLUMNS_COUNT - 1)*2
        mov bl,ch
        shl bl,4        ; * 16
        mov ch,2	    ; Width
        mov cl,TILE_HEIGHT		; Height
	    call frame_map_bitmap_lookup
        call draw_bitmap

        ; loop .draw_column
        pop cx
        test ch,ch
        jnz .draw_column

        dec word [HeroSpriteX]
        dec word [HeroSpriteX]

        ret

frame_work_up:
        ; Copy frame buffer
        mov ax, 0
        mov bx, ROW_WIDTH_IN_BYTES * TILE_HEIGHT
        mov cx, ((SCREEN_IN_BYTES - (ROW_WIDTH_IN_BYTES * TILE_HEIGHT)) / 4)
        call copy_screen_to_buffer

        mov ax, (ROW_WIDTH_IN_BYTES * (TILE_HEIGHT - 1))
        mov [VerticalOffset], ax

        mov cl, COLUMNS_COUNT
    .draw_row:
        dec cl
        push cx

        ; draw individual tile
        mov bh,cl
        shl bh,1
        mov bl,0
        mov ch,2	    ; Width
        mov cl,TILE_HEIGHT		; Height
	    call frame_map_bitmap_lookup
        call draw_bitmap

        ; loop .draw_row
        pop cx
        test cl,cl
        jnz .draw_row

        mov ax, word [HeroSpriteY]
        add ax, TILE_HEIGHT
        mov word [HeroSpriteY], ax

        ret

frame_work_down:
        ; Copy frame buffer
        mov ax, ROW_WIDTH_IN_BYTES * TILE_HEIGHT
        mov bx, 0
        mov cx, ((SCREEN_IN_BYTES - (ROW_WIDTH_IN_BYTES * TILE_HEIGHT)) / 4)
        call copy_screen_to_buffer

        mov ax, 0
        mov [VerticalOffset], ax

        mov cl, COLUMNS_COUNT
    .draw_row:
        dec cl
        push cx

        ; draw individual tile
        mov bh,cl
        shl bh,1
        mov bl, (ROWS_COUNT - 1) * TILE_HEIGHT
        mov ch,2	    ; Width
        mov cl,TILE_HEIGHT		; Height
	    call frame_map_bitmap_lookup
        call draw_bitmap

        ; loop .draw_row
        pop cx
        test cl,cl
        jnz .draw_row

        mov ax, word [HeroSpriteY]
        sub ax, TILE_HEIGHT
        mov word [HeroSpriteY], ax

        ret

;
; Method for redrawing on-screen sprites
;
redraw_sprites:
        ; FIXME definitely a bug here
        mov ax, [HeroSpriteX]
        mov bh,al
        mov ax, [HeroSpriteY]
        mov bl,al
	    call frame_map_bitmap_lookup

        ; clear tile behind a sprite
        mov bh, [HeroSpriteX]
        mov bl, [HeroSpriteY]
        mov ch, 2	    ; Width
        mov cl, 16		; Height
        call draw_bitmap ; draw to second buffer

        mov word [HeroSpriteX], 10 * 2
        mov word [HeroSpriteY], 6 * TILE_HEIGHT

        ; draw sprite
        mov bh, [HeroSpriteX]	    ; X
        mov bl, [HeroSpriteY]	    ; Y
        mov ch,2	    ; Width
        mov cl,16		; Height
	    mov si, bitmap_hero
        call draw_bitmap ; draw to second buffer


        ret

; ; bx = local X offset
; ; cx = local Y offset
; ; out bx = global X index
; ; out cx = global Y index
; get_global_offset:
;     mov ax, 0
;     mov al, bh
;     shl ax, 3
;     add ax, word [RelativeXCoordinate]
;     sar ax, 4
;     mov cx, ax

;     mov ax, 0
;     mov al, bl
;     add ax, word [RelativeYCoordinate]
;     sar ax, 4
;     mov bx, ax

;     ret

; bh = local X offset
; bl = local Y offset
; out bx = global Y index
; out cx = global X index
get_panning_offset:
        mov ax, 0
        mov al, bh
        shl ax, 3   ; bh * 8 
        add ax, word [RelativeXCoordinate]
        sar ax, 4   ; / 16
        mov cx, ax

        mov ax, 0
        mov al, bl
        add ax, word [RelativeYCoordinate]
        sar ax, 4
        mov bx, ax

        ret

;
; sprite lookup
;
; bh = local X offset
; bl = local Y offset
;
; out ax = trashed
frame_map_bitmap_lookup:
        push cx
        push bx

        call get_panning_offset
        call map_bitmap_lookup

        pop bx
        pop cx
        ret

; cx = X coord
; bx = Y coord
map_bitmap_lookup:
        test cx, cx
        js .null
        cmp cx, MAP_WIDTH
        jge .null

        test bx, bx
        js .null
        cmp bx, MAP_HEIGHT
        jge .null

    .lookup:
        mov ax, bx
        shl ax, 5 ; * MAP_WIDTH
        add ax, cx
        shl ax, 1
        add ax, map_level_1
        mov bx, ax
        mov ax, 0
        mov al, [bx]

        mov bx, TILE_IN_BYTES
        mul bx
        add ax, bitmap_tilesheet

        mov si, ax
        jmp .end
    
    .null:
        mov si, bitmap_tilesheet

    .end:
        ret





; Irrelevant interrupt you can break on in the monitor
; BPINT 21 25
dosbox_break:
        push ax
        mov ah, 25h
        int 21h
        pop ax
        ret


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

    %include "build/level-1.asm"
%endif


    align 16
; Forth compilation
%include "build/paxconsola_generated.asm"


    section .data

.data_start:
RelativeXCoordinate dw 0
RelativeYCoordinate dw 0
PelPanning db 0
VerticalOffset dw 0

HeroSpriteX dw 0
HeroSpriteY dw 0

BufferOffscreen     dw 0
BufferOnscreen      dw 0
.data_end:
