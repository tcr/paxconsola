; https://www.vcfed.org/forum/forum/technical-support/vintage-computer-programming/56910-vga-cga-graphics-library-for-dos-games
; https://www.youtube.com/watch?v=roe22H744bM
; http://www.minuszerodegrees.net/oa/OA%20-%20IBM%20Enhanced%20Graphics%20Adapter.pdf#page=22&zoom=auto,-29,597

set_video_mode:
	mov     ah, 0       ;0=Set Video mode (AL=Mode)
    int     10h         ;bios int
	ret


; bx = width
set_virtual_screen_width:
		mov dx, CRTC_INDEX
		mov al, LINE_OFFSET
		out dx, al
		mov dx, CRTC_DATA
		shr bx, 1
		shr bx, 1
		shr bx, 1
		shr bx, 1 ; width / 16
		mov al, bl
		out dx, al
		ret

; bh = x
; bl = y
; out es:di = destination
get_screen_pos:	
	push bx
	push ax
		mov ah,0
		mov al,bh		;Xpos
		mov di,ax
		
		mov ah,0
		mov al,bl		;Ypos * 40
		mov bx,ROW_WIDTH_IN_BYTES
		mul bx			;AX*BX
		add di,ax
		
		mov ax,[BufferOffscreen]
		shr ax,1
		shr ax,1
		shr ax,1
		shr ax,1
		add ax,0xA000
		mov es,ax
	pop ax
	pop bx
	ret

	
SetPalette:	;AL=Pal Num ;dx=-GRB color
	push di
	push si
	push dx
	push cx
	push bx
	push ax
		mov bl,al			;Color number
;Green Bits	
		mov cl,2			;CL=2
		mov al,dh	
		and al,00001000b	;g3 ----G---
		shr al,cl			;   ------G-
		mov bh,al
		mov al,dh
		and al,00000100b	;g2 -----G--
		shl al,cl			;   ---G----
		or bh,al
;Blue Bits
		mov al,dl	
		and al,00001000b	;b3 ----B---
		inc cl				;CL=3
		shr al,cl			;   -------B
		or bh,al
		mov al,dl
		and al,00000100b	;b2 -----B--
		shl al,1			;   ----B---
		or bh,al
;Red Bits
		mov al,dl	
		and al,10000000b	;r3 R-------
		rol al,cl			;	-----R--
		or bh,al
		mov al,dl
		and al,01000000b	;r2 -R------
		shr al,1			;   --R-----
		or bh,al
;Send to bios
		mov ax,1000h ;Function 10 - subfunction 0 
; (Set Palette color) 	;Color BL ... BH=--rgbRGB

		; "Whenever an VGA function can be performed reasonably well through a BIOS function, 
		; as it can in the case of setting palette RAM, it should be, both because there is no point
		; in reinventing the wheel and because the BIOS may well mask incompatibilities between the
		; IBM VGA and VGA clones." - Abrash
		int 10h
	pop ax
	pop bx
	pop cx
	pop dx
	pop si
	pop di
	ret

setup_palette:
	; Setup the palette
	mov si,Palette
	xor ax,ax
Paletteagain:
	mov dx,[si]
	call SetPalette ;Set Color AL to DX (-GRB)
	inc si			;Move down two bytes
	inc si
	inc ax
	cmp ax,16		;Are we done?
	jnz Paletteagain
	ret


; Await display enable.
wait_display_enable:
        mov dx, INPUT_STATUS
	.l1:
        in al, dx
        and al, 01h
        jnz .l1
        ret

; Await VSYNC signal, indicating the next frame.
wait_vsync:
		push ax
		push dx

		mov dx, INPUT_STATUS
	.l1:
		in al,dx
		test al, 08h
		jz .l1
		
	.l2:
		in al,dx
		test al, 08h
		jnz .l2

		pop dx
		pop ax
		ret


; bh = x
; bl = y
; ch = width
; cl = height
; ds:si = bitmap
draw_bitmap:
		call get_screen_pos
		; ds:si = source bitmap
		; es:di = destination bitplane

		mov dx,SC_INDEX	; Sequencer Address Register
		mov al,02h		; "02' selects Map Mask

	.y_loop:
		push di
		mov bl,ch		; Save width in BL
	.x_loop:
		mov ah,01h	    ;plane 0 (0102h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,2h		;plane 1 (0202h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,4h		;plane 2 (0402h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,8h		;plane 3 (0802h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI

		dec ch
		jnz .x_loop

		; Restore width from BL
		mov ch, bl
		; Move down a line
		pop di
		add di, ROW_WIDTH_IN_BYTES

		dec cl
		jnz .y_loop

		ret


; bl = byte skip
; ch = width
; cl = height
; ds:si = source bitmap
; es:di = destination bitplane
draw_tile_half:
		mov dx,SC_INDEX	; Sequencer Address Register
		mov al,02h		; "02' selects Map Mask

	.y_loop:
		push di
		push cx

		mov bh, 0
		add si, bx
		dec ch
	.x_loop:
		mov ah,01h	    ;plane 0 (0102h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,2h		;plane 1 (0202h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,4h		;plane 2 (0402h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,8h		;plane 3 (0802h)
		out dx,ax		;Apply map mask
		movsb			;DS:SI -> ES:DI

		dec ch
		jnz .x_loop

		; Move down a line
		pop cx
		pop di
		add di, ROW_WIDTH_IN_BYTES		

		dec cl
		jnz .y_loop

		ret



; 
; Copies VRAM buffer from off-screen page to on-screen
; This is slow cause it uses EGA reads instead of an in-memory buffer; however DOSBox emulates an
; infinitely fast graphics card so this is okay for a demo.
;

; ax = source offset
; bx = destination offset
; cx = buffer size to copy
copy_screen_to_buffer:
        push es
        push ds

        ; Set ds and es
		push ax
		mov ax, [BufferOffscreen]
		shr ax, 1
		shr ax, 1
		shr ax, 1
		shr ax, 1
        add ax, 0xA000
        mov es, ax
		mov ax, [BufferOnscreen]
		shr ax, 1
		shr ax, 1
		shr ax, 1
		shr ax, 1
        add ax, 0xA000
        mov ds, ax
		pop ax

copy_plane macro   plane
        ; Copy plane
		push ax
        mov ax, 0004h + (plane << 8)
        mov dx,GC_INDEX
        out dx,ax
        mov ax, 0002h + ((1 << plane) << 8)
        mov dx,SC_INDEX
        out dx,ax
		pop ax

        mov di, bx
        mov si, ax
	.copy_plane_loop:
        movsw
        dec cx
        jnz .copy_plane_loop
	endm

		push cx
        copy_plane 0
		pop cx
		push cx
        copy_plane 1
		pop cx
		push cx
        copy_plane 2
		pop cx
		push cx
        copy_plane 3
		pop cx

        pop ds
        pop es
		ret

Palette:
	dw 0250h;0  -GRB 
	dw 0000h;1  -GRB
	dw 0555h;2  -GRB
	dw 0AAAh;3  -GRB
	dw 0FFFh;4  -GRB
	dw 0826h;5  -GRB
	dw 0D33h;6  -GRB
	dw 03E3h;7  -GRB
	dw 07E6h;8  -GRB
	dw 0AE5h;9  -GRB
	dw 0FF4h;10  -GRB
	dw 02AAh;11  -GRB
	dw 00FFh;12  -GRB
	dw 030Dh;13  -GRB
	dw 063Bh;14  -GRB
	dw 0D0Fh;15  -GRB

    align 16
BitmapTest:	
	; binclude "lib/SpriteTestEGA.RAW"
    binclude "../build/tiles.raw"
BitmapTestEnd:

    align 16
bitmap_linear:
    binclude "../build/tiles-linear.raw"

    align 16
bitmap_hero:
    binclude "../build/tiles-hero.raw"

    align 16
bitmap_block:
    binclude "../build/tiles-block.raw"

    align 16
bitmap_door:
    binclude "../build/tiles-door.raw"

    align 16
bitmap_tilesheet:
    binclude "../build/tilesheet.raw"
