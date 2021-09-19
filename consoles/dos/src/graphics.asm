; https://www.vcfed.org/forum/forum/technical-support/vintage-computer-programming/56910-vga-cga-graphics-library-for-dos-games
; https://www.youtube.com/watch?v=roe22H744bM

; %define DosVGA          1
%define DosEGA          1
; %define DosCGA          1


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
		shr bx, 4 ; width / 16
		mov al, bl
		out dx, al
		ret


GetScreenPos:	;BH,BL = X,Y Returns ES:DI=Destination
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
		shr ax,4
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
		int 10h ;bios int 
	pop ax
	pop bx
	pop cx
	pop dx
	pop si
	pop di
	ret


; Await VSYNC signal, indicating the next frame.
wait_vsync:
		pusha
		mov dx, INPUT_STATUS
	.l1:
		in al,dx
		test al, 08h
		jz .l1
		
	.l2:
		in al,dx
		test al, 08h
		jnz .l2
		popa
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
	

; bh = x
; bl = y
; ch = width
; cl = height
; si = bitmap
draw_bitmap:
	call GetScreenPos

	; ds:si = source bitmap
	; es:di = destination bitplane

	; http://www.minuszerodegrees.net/oa/OA%20-%20IBM%20Enhanced%20Graphics%20Adapter.pdf#page=22&zoom=auto,-29,597

	%ifdef DosEGA
		mov dx,SC_INDEX	; Sequencer Address Register
		mov al,02h		; "02' selects Map Mask
	%endif

DrawBitmap_Yagain:
	push di
	mov bl,ch			;Save width in BL
DrawBitmap_Xagain:
	%ifdef DosEGA
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
	%endif
	%ifdef DosCGA
		movsb			;DS:SI -> ES:DI
	%endif
	%ifdef DosVGA
		movsb				;DS:SI -> ES:DI
	%endif
	dec ch
	jnz DrawBitmap_Xagain

	mov ch,bl			; Restore width from BL
	pop di
	add di,ROW_WIDTH_IN_BYTES		;Move down a line (40 bytes)

	dec cl
	jnz DrawBitmap_Yagain

	ret

; 
; Copies VRAM buffer at 0xA300 to 0xA000
; This is slow cause it uses EGA reads instead of an in-memory buffer; however DOSBox emulates an
; infinitely fast graphics card so this is okay for a demo.
;
copy_buffer_to_screen:
        push es
        push ds

        ; Set ds and es
		mov ax, [BufferOffscreen]
		shr ax, 4
        add ax, 0xA000
        mov ds, ax
		mov ax, [BufferOnscreen]
		shr ax, 4
        add ax, 0xA000
        mov es, ax

		jmp copy_buffer

copy_screen_to_buffer:
        push es
        push ds

        ; Set ds and es
		mov ax, [BufferOnscreen]
		shr ax, 4
        add ax, 0xA000
        mov ds, ax
		mov ax, [BufferOffscreen]
		shr ax, 4
        add ax, 0xA000
        mov es, ax

		jmp copy_buffer

copy_buffer:

%macro  copy_plane 1 
        ; Copy plane
        mov ax, 0004h + (%1 << 8)
        mov dx,GC_INDEX
        out dx,ax
        mov ax, 0002h + ((1 << %1) << 8)
        mov dx,SC_INDEX
        out dx,ax

        mov di, 0
        mov si, 0
        mov cx, SCREEN_IN_BYTES / 4
    %%copy_plane:
        movsd
        dec cx
        jnz %%copy_plane
%endmacro

        copy_plane 0
        copy_plane 1
        copy_plane 2
        copy_plane 3

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
	; incbin "lib/SpriteTestEGA.RAW"
    incbin "build/tiles.raw"
BitmapTestEnd:

    align 16
bitmap_linear:
    incbin "build/tiles-linear.raw"

    align 16
bitmap_hero:
    incbin "build/tiles-hero.raw"