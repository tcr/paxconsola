set_video_mode:
	mov     ah, 0       ;0=Set Video mode (AL=Mode)
    int     10h         ;bios int
	ret


GetScreenPos:	;BH,BL = X,Y Returns ES:DI=Destination
	push bx
	push ax
		mov ah,0
		mov al,bh		;Xpos
		mov di,ax
		
		mov ah,0
		mov al,bl		;Ypos * 40
		mov bx,40
		mul bx			;AX*BX
		add di,ax
		
		mov ax,0A000h 	;Screen Base= A000h
		mov es,ax
	pop ax
	pop bx
	ret
	
GetScreenNextLine:
	add di,40		;Move down a line (40 bytes)
	ret

%define DosEGA          1
	
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


	; https://www.vcfed.org/forum/forum/technical-support/vintage-computer-programming/56910-vga-cga-graphics-library-for-dos-games
draw_bitmap:
	mov bh,6	;X
	mov bl,11	;Y

	; bh = X
	; bl = Y
	call GetScreenPos
	; es:di = destination bitplane

	%ifdef DosCGA
		mov ch,12	;Width
	%endif
	%ifdef DosEGA
		mov ch,6	;Width
	%endif
	%ifdef DosVGA
		mov ch,48	;Width
	%endif
	mov cl,48		;Height
	mov si, BitmapTest
	; bh = X
	; bl = Y
	; ch = Width
	; cl = Height
	; ds:si = source bitmap
	; es:di = destination bitplane

DrawBitmap_Yagain:
	push di
	push cx
DrawBitmap_Xagain:
	%ifdef DosEGA
		mov ax,0102h	;plane 0 (0102h)
		mov dx,03c4h		
		out dx,ax		;Apply plane mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,2h		;plane 1 (0202h)
		out dx,ax		;Apply plane mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,4h		;plane 2 (0402h)
		out dx,ax		;Apply plane mask
		movsb			;DS:SI -> ES:DI
		dec di			;Reset Dest Ram
		
		mov ah,8h		;plane 3 (0802h)
		out dx,ax		;Apply plane mask
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

	pop cx
	pop di
	call GetScreenNextLine

	inc bl
	dec cl
	jnz DrawBitmap_Yagain

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
