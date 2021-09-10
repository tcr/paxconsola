[map symbols build/paxconsola.map]

%define DosEGA          1

    section .text

    org 100h
	
	mov ax, $0		;ES points to our Code segment
    mov es, ax

	call ScreenInit

    push ds
    push es

        mov bx,0xF000
        mov bp,bx

; fake forth
        push bx
        mov bx,0x5

        xchg sp,bp
        push bx
        xchg sp,bp
        pop bx

        push bx
        mov bx,0x6

        push bx
        xchg sp,bp
        pop bx
        xchg sp,bp

        pop ax
        add bx,ax
; end forth
        pop ax ; get rid of first value

        mov bh,6	;X
        mov bl,11	;Y

        call GetScreenPos
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
        
        mov si, BitmapTest ;DS:SI = Source Bitmap
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
    pop es
    pop ds
	
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
	
	jmp $
	

%include "src/bitmap.asm"

    align 16
BitmapFont:
	incbin "lib/Font96.FNT"
BitmapFontEnd:
	
    align 16
BitmapTest:	
	; incbin "lib/SpriteTestEGA.RAW"
    incbin "lib/generated.raw"
BitmapTestEnd:


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
