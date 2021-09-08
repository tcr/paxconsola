ScreenInit:
	mov     ah, 0       ;0=Set Video mode (AL=Mode)
    mov     al, 0Dh 	;mode 13 (ega 320x200 16 color)
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

	
