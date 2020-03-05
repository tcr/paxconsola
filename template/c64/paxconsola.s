GFX = $0400

; Override Datasette ram
TEMP = $92
TEMP2 = $93
TEMP3 = $94

TEMP_PAX1 = $95
TEMP_PAX2 = $96

; Can override all BASIC values
; https://csdb.dk/forums/index.php?roomid=11&topicid=3541&showallposts=1
X_START = $02
X_END = $7f

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

    ; Clear the screen
    jsr $e544

mainloop:
    lda $d011
    bpl mainloop ; no: go to mainloop

    ; draw routine
    jsr draw_text
    jsr pax_start
    
    jmp mainloop


pax_start:
    ; Set up PAX ram
    ldx #X_START
    lda #0
    ldy #0

    .include "generated.asm"
    rts


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
