GFX = $0400

;helpful labels
; https://gist.github.com/biomood/1001256
CLEAR = $E544
GETIN  =  $FFE4
SCNKEY =  $FF9F

; Override Datasette ram
TEMP = $92
TEMP2 = $93
TEMP3 = $94

TEMP_PAX1 = $95
TEMP_PAX2 = $96

STACK_RESERVE = $97

; Can override all BASIC values
; https://csdb.dk/forums/index.php?roomid=11&topicid=3541&showallposts=1
X_START = $02
X_END = $7f

    .org $80d

.code
    ; http://sta.c64.org/cbm64mem.html


.ifdef ENGINE_TAURUS
        ; Border color
        lda #$00
        sta $d020
        ; Background color
        lda #$00
        sta $d021
        ; Cursor color
        lda #$01
        sta $0286

        ; Clear the screen
        jsr $e544
.endif

.ifdef ENGINE_LIBRA
        ; Border color
        lda #$00
        sta $d020
        ; Background color
        lda #$0f
        sta $d021
        ; Cursor color
        lda #$01
        sta $0286

        ; lda $DD00
        ; and #%11111100
        ; ora #%00000011 ;<- your desired VIC bank value, see above
        ; sta $DD00

        ; Clear the screen
        jsr $e544

        ; custom graphics mode?
        ; https://www.c64-wiki.com/wiki/Graphics_Modes
        lda $d011
        and #%10011111
        ora #%00000000
        sta $d011
        lda $d016
        and #%11101111
        ora #%00010000
        sta $d016

        ; Custom charset
        ;  lda #%00011000
        lda #%00011000
        sta $d018

        ; Custom colors
        lda #$00
        sta $D022
        lda #$01
        sta $D023

        ; Copy one attribute a bunch of times tho
        ldx #$ff
CopyColorRAMLoop:
        lda charset_attrib_data+2
        sta $d800,x
        sta $d900,x
        sta $da00,x
        dex
        bne CopyColorRAMLoop

; Sprite nonsense

        lda $d01c
        ora #%00000001
        sta $d01c

        ; set sprite pointer index
        ; this, multiplied by $40, is the address
        ; in this case, the address is $2000
        ; $80 * $40 = $2000
        lda #$c0
        sta $07f8

        ; enable sprite 0
        lda #$01
        sta $d015

        ; set x and y position
        lda #$80
        sta $d000
        sta $d001

.endif

        ; draw some helpful text
        ; jsr draw_text

        lda #00
        ldx #(X_END-X_START)
ClearReturnStackLoop:
        sta X_START,x
        dex
        bpl ClearReturnStackLoop

        lda #$00
        ldx #$ff
ClearMemoryLoop:
        sta $9000,x
        dex
        bne ClearMemoryLoop

InitializeForth:
        ; disable inerrupts
        sei
        ; store stack pointer, since execution might not be clean
        tsx 
        stx STACK_RESERVE

        ; Set up PAX registers for execution
        ; X=return stack pointer, Y = high byte of TOS, A = low byte of TOS
        ldx #X_START
        lda #0
        ldy #0

        jsr PAX_FN_main

        ; restore stack
        ldx STACK_RESERVE
        txs
        ; re-enable interrupts
        cli


before_mainloop:
        nop
mainloop:
        lda $d011
        bpl mainloop ; no: go to mainloop

pax_start:
        ; disable inerrupts
        sei
        ; store stack pointer, since execution might not be clean
        tsx 
        stx STACK_RESERVE

        ; Set up PAX registers for execution
        ; X=return stack pointer, Y = high byte of TOS, A = low byte of TOS
        ldx #X_START
        lda #0
        ldy #0

        jsr PAX_FN_next2Dframe

        ; restore stack
        ldx STACK_RESERVE
        txs
        ; re-enable interrupts
        cli


        ; random register
        LDA #5
        STA $7f

        jsr read_joystick

        jmp mainloop


;
; Read joystick port and write to the port register.
;
.proc read_joystick
        clc
        lda $dc01
        lsr
        bcc @up
        lsr
        bcc @down
        lsr
        bcc @left
        lsr
        bcc @right

        lda #0
        sta $7e

        rts

    @up:
        LDA #38
        STA $7e
        rts

    @down:
        LDA #40
        STA $7e
        rts

    @left:
        LDA #37
        STA $7e
        rts

    @right:
        LDA #39
        STA $7e
        rts
.endproc


msg:
        .asciiz "              snake world!              "

draw_text:
        ldx #$00
draw_loop:
        lda msg,x
        sta $0518,x
        inx
        cpx #$28
        bne draw_loop
        rts


libraries:
        .include "input.asm"
        .include "multiply.asm"

; Generated code
        .include "../build/paxconsola_generated.asm"

        .res $2000-*

FONT_EMBED:
        .include "../../examples/gfx/libra-gfx.asm"
FONT_EMBED_END:

        .res $3000-*

GFX_DATA:
        .incbin "../build/sprite-hero.raw"
