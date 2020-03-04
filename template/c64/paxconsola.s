.code
    ; Make screen black and text white
    lda #$00
    sta $d020
    sta $d021
    lda #$01
    sta $0286

    ; Select charset
    lda #23
    sta $d018

    ; Clear the screen and jump to draw routine
    jsr $e544
    jsr draw_text
		
pax_start:
	ldx #95
    stx $0400

loop:		
    jmp *


msg:
    .asciiz "              hello world!              "

draw_text:
    ldx #$00
draw_loop:
    lda msg,x
    sta $05e0,x
    inx
    cpx #$28
    bne draw_loop
    rts
