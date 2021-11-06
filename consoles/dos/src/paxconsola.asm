    cpu 8086

MISC_OUTPUT  equ 03c2h
GC_INDEX     equ 03ceh
SC_INDEX     equ 03c4h
SC_DATA      equ 03c5h
CRTC_INDEX   equ 03d4h
CRTC_DATA    equ 03d5h
INPUT_STATUS equ 03dah
AC_WRITE     equ 03c0h
AC_READ      equ 03c1h		
MAP_MASK       equ 02h
MEMORY_MODE    equ 04h
UNDERLINE_LOC  equ 14h
MODE_CONTROL   equ 17h
HIGH_ADDRESS   equ 0ch
LOW_ADDRESS    equ 0dh
LINE_OFFSET    equ 13h
PEL_PANNING    equ 13h

CRTC_LINECOMPARE equ 24		
CRTC_OVERFLOW     equ 7
CRTC_MAXSCANLINE  equ 9



; Application defines

KEYBOARD_VALUE equ 0x7e

ROWS_COUNT equ 15
COLUMNS_COUNT equ 21

TILE_WIDTH equ 16
TILE_HEIGHT equ 16

TILE_IN_BYTES equ (2 * TILE_HEIGHT * 4)

ROW_WIDTH_IN_BYTES equ (COLUMNS_COUNT * 2)
SCREEN_IN_BYTES equ (ROW_WIDTH_IN_BYTES * TILE_HEIGHT * ROWS_COUNT)

START_HORIZONTAL_OFFSET equ 8
START_VERTICAL_OFFSET equ 8

; Have the next screen offset be four pixels adjusted
VIDEO_BUFFER_OFFSET equ (ROW_WIDTH_IN_BYTES * TILE_HEIGHT * (ROWS_COUNT + 4))

ASCII_LEFT equ 37
ASCII_UP equ 38
ASCII_RIGHT equ 39
ASCII_DOWN equ 40

MAP_WIDTH equ 32
MAP_HEIGHT equ 32


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

        ; Setup random seed
        call rand_seed


    ifdef ENGINE_TAURUS

        ; Clear memory
        mov ax, $1000
    .clear_memory:
        dec ax
        mov bx,ax
        add bx,0xc000
        mov byte ptr [bx],0
        test ax,ax
        jnz .clear_memory

engine_start:
        ; Switch to Mode 0
        mov al, 00h
        call set_video_mode

        ; Disable cursor
        mov cx,0xffff
        mov ah,1
        int 10h

        ; Setup return stack for Forth
        mov bx,0xF000
        mov bp,bx

        ; Call Forth
        xchg sp,bp
        call PAX_main
        xchg sp,bp

main_loop:
        ; Setup return stack for Forth
        mov bx,0xF000
        mov bp,bx

        ; Call Forth
        xchg sp,bp
        call PAX_next2Dframe
        xchg sp,bp

        ; Wait for VBLANK.
        call wait_vsync
        call wait_vsync
        call wait_vsync

        ; Poll keyboards
        call poll_keyboard
        
        ; Loop
        jmp main_loop
    endif

    ifdef ENGINE_LIBRA

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
        shl bl,1
        shl bl,1
        shl bl,1
        shl bl,1
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
        shr bx, 1
        shr bx, 1
        shr bx, 1
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
        dec word ptr [RelativeXCoordinate]

        ; Decrease PEL Panning register
        dec byte ptr [PelPanning]
        js frame_work_left
        jmp frame_work
    
    .key_right:
        ; Decrease relative coordinate
        inc word ptr [RelativeXCoordinate]

        ; Increase PEL Panning register
        inc byte ptr [PelPanning]
        mov al, [PelPanning]
        cmp al,TILE_WIDTH
        jge .key_right_frame_work_right
        jmp frame_work
    .key_right_frame_work_right:
        jmp frame_work_right
    
    .key_up:
        ; Decrease relative coordinate
        dec word ptr [RelativeYCoordinate]

        ; Decrease Vertical Offset
        mov ax, [VerticalOffset]
        sub ax, ROW_WIDTH_IN_BYTES
        mov [VerticalOffset], ax
        js .key_up_frame_work_up
        jmp frame_work
    .key_up_frame_work_up:
        jmp frame_work_up

    .key_down:
        ; Decrease relative coordinate
        inc word ptr [RelativeYCoordinate]

        ; Decrease Vertical Offset
        mov ax, [VerticalOffset]
        add ax, ROW_WIDTH_IN_BYTES
        mov [VerticalOffset], ax
        cmp ax, (ROW_WIDTH_IN_BYTES * 16)
        jge .key_up_frame_work_down
        jmp frame_work
    .key_up_frame_work_down:
        jmp frame_work_down
    
frame_work:
        ; Copy frame buffer
        mov ax, 0
        mov bx, 0
        mov cx, (SCREEN_IN_BYTES / 2)
        call copy_screen_to_buffer

        ret

; Pan off left side, draw left column
frame_work_left:
        ; if we only panned on the right side of a tile, don't redraw column
        test word ptr [RelativeXCoordinate], 0x8
        jnz .new_column

        ; Copy frame buffer right 8 pixels
        mov ax, 0
        mov bx, 1
        mov cx, (SCREEN_IN_BYTES / 2)
        call copy_screen_to_buffer

        ; Update panning counter
        mov ah, 7
        mov [PelPanning], ah

        ret

    .new_column:
        ; Copy frame buffer right 16 pixels
        mov ax, 0
        mov bx, 2
        mov cx, (SCREEN_IN_BYTES / 2) - 2
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
        shl bl,1
        shl bl,1
        shl bl,1
        shl bl,1
        mov ch,2	    ; Width
        mov cl,TILE_HEIGHT		; Height
	    call frame_map_bitmap_lookup
        call draw_bitmap

        ; loop .draw_column
        pop cx
        test ch,ch
        jnz .draw_column

        inc word ptr [HeroSpriteX]
        inc word ptr [HeroSpriteX]

        ret

; Pan off right side, draw right column
frame_work_right:
        ; Copy frame buffer left 16 pixels
        mov ax, 2
        mov bx, 0
        mov cx, (SCREEN_IN_BYTES / 2) - 2
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
        shl bl,1
        shl bl,1
        shl bl,1
        shl bl,1        ; * 16
        mov ch,2	    ; Width
        mov cl,TILE_HEIGHT		; Height
	    call frame_map_bitmap_lookup
        call draw_bitmap

        ; loop .draw_column
        pop cx
        test ch,ch
        jnz .draw_column

        dec word ptr [HeroSpriteX]
        dec word ptr [HeroSpriteX]

        ret

frame_work_up:
        ; Copy frame buffer
        mov ax, 0
        mov bx, ROW_WIDTH_IN_BYTES * TILE_HEIGHT
        mov cx, ((SCREEN_IN_BYTES - (ROW_WIDTH_IN_BYTES * TILE_HEIGHT)) / 2)
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

        mov ax, word ptr [HeroSpriteY]
        add ax, TILE_HEIGHT
        mov word ptr [HeroSpriteY], ax

        ret

frame_work_down:
        ; Copy frame buffer
        mov ax, ROW_WIDTH_IN_BYTES * TILE_HEIGHT
        mov bx, 0
        mov cx, ((SCREEN_IN_BYTES - (ROW_WIDTH_IN_BYTES * TILE_HEIGHT)) / 2)
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

        mov ax, word ptr [HeroSpriteY]
        sub ax, TILE_HEIGHT
        mov word ptr [HeroSpriteY], ax

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
        mov bh, byte ptr [HeroSpriteX]
        mov bl, byte ptr [HeroSpriteY]
        mov ch, 2	    ; Width
        mov cl, 16		; Height
        call draw_bitmap ; draw to second buffer

        mov word ptr [HeroSpriteX], 10 * 2
        mov word ptr [HeroSpriteY], 6 * TILE_HEIGHT

        ; draw sprite
        mov bh, byte ptr [HeroSpriteX]	    ; X
        mov bl, byte ptr [HeroSpriteY]	    ; Y
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
        shl ax, 1
        shl ax, 1
        shl ax, 1   ; bh * 8 
        add ax, word ptr [RelativeXCoordinate]
        sar ax, 1
        sar ax, 1
        sar ax, 1
        sar ax, 1   ; / 16
        mov cx, ax

        mov ax, 0
        mov al, bl
        add ax, word ptr [RelativeYCoordinate]
        sar ax, 1
        sar ax, 1
        sar ax, 1
        sar ax, 1
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
        shl ax, 1
        shl ax, 1
        shl ax, 1
        shl ax, 1
        shl ax, 1 ; * MAP_WIDTH
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



    endif



; Irrelevant interrupt you can break on in the monitor
; BPINT 21 25
dosbox_break:
        push ax
        mov ah, 25h
        int 21h
        pop ax
        ret


;https://stackoverflow.com/a/40709661

; clobbers: AH, DX
rand_seed:
        mov     AH, 00h   ; interrupt to get system timer in CX:DX 
        int     1AH
        mov     [RandSeed], dx
        ret

; ----------------
; inputs: none  (modifies RandSeed seed variable)
; clobbers: DX.  returns: AX = next random number
rand_new:
        mov     ax, 25173               ; LCG Multiplier
        mul     word ptr [RandSeed]         ; DX:AX = LCG multiplier * seed
        add     ax, 13849               ; Add LCG increment value
        ; Modulo 65536, AX = (multiplier*seed+increment) mod 65536
        mov     [RandSeed], ax          ; Update seed = return value
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1
        shr     ax,1                    ; Discard 5 bits
        ret


    align 16
    include "graphics.asm"
    include "input.asm"


; Forth extern methods
    ifdef ENGINE_TAURUS
    include "engines/dos-taurus.asm"
    endif
    ifdef ENGINE_LIBRA
    include "engines/dos-libra.asm"

    include "../build/level-1.asm"
    endif


    align 16
; Forth compilation
    include "../build/paxconsola_generated.asm"


    ; section .data

.data_start:
RelativeXCoordinate dw 0
RelativeYCoordinate dw 0
PelPanning db 0
VerticalOffset dw 0

HeroSpriteX dw 0
HeroSpriteY dw 0

BufferOffscreen     dw 0
BufferOnscreen      dw 0

RandSeed            dw 0
.data_end:
