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

    jsr PAX_FN_main

    ; restore stack
    ldx STACK_RESERVE
    txs
    ; re-enable interrupts
    cli

    ; random register
    LDA #5
    STA $7f

    clc
    lda $dc01
    lsr
    bcc UP
    lsr
    bcc DOWN
    lsr
    bcc LEFT
    lsr
    bcc RIGHT
 
; input_fire_check:
;   lda #$10                ; mask left movement (16 == bit 5 == %0001 0000)
;   bit $DC01               ; bitwise "and" with joystick port 1
;   bne next_after_input   ; if not active (==1), go back to .input_left_check
  
  ; else print F (for FIRE)
  ;lda #$46                ; load character 'F' into register A
  ;jsr $FFD2               ; print character to screen

input_none:
  lda #0
  sta $7e
  
  jmp pax_finished
  

    ; altternative: scan keycodes

    JSR SCNKEY      ;SCAN KEYBOARD
    JSR GETIN       ;GET CHARACTER
    CMP #0          ;IS IT NULL?
    BNE pax_keys    ;no? parse the key

    ; clear the key
    lda #0
    sta $7e
    
    jmp pax_finished


pax_keys:

START	:        
    CMP #87		;W - up
    BEQ UP
    
    CMP #83		;S - down
    BEQ DOWN
    
    CMP #65		;A - left
    BEQ LEFT
    
    CMP #68		;D - right
    BEQ RIGHT
    
    ;CMP ENTER	;end if enter clicked
    ;BEQ END
    
    JMP pax_finished
    
UP:	
    LDA #38
    STA $7e
    JMP pax_finished

DOWN:        
    LDA #40
    STA $7e
    JMP pax_finished

LEFT:
    LDA #37
    STA $7e
    JMP pax_finished

RIGHT:	        
    LDA #39
    STA $7e
    JMP pax_finished


pax_finished:
    jmp mainloop


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


; http://forum.6502.org/viewtopic.php?f=9&t=689
.proc NATIVE_FN_2A
    dex
    dex

    LDY   #0
    LDA   0,X   ; Move NOS to N and then zero
    STA   TEMP  ; (ie, erase) NOS (2 bytes).
    STY   0,X   ; STZ can be replaced with STY
                ; here since NEXT left 0 in Y.
    LDA   1,X
    STA   TEMP2
    STY   1,X   ; STZ can be replaced with STY
                ; here since NEXT left 0 in Y.
    LDY   #$10  ; Go through the loop 16 times.

@1:
    ASL  0,X    ; Shift the 2 top stack cells
    ROL  1,X    ; (ie, four bytes) left one bit.
    ROL  2,X    ; The multiplier gets shifted out
    ROL  3,X    ; as the product gets shifted in.
    BCC  @2
                ; If the high bit shifted out was 1,
    CLC         ; add the 2-byte value at N into NOS,
    LDA  TEMP
    ADC  0,X    ; low byte,
    STA  0,X

    LDA  TEMP2
    ADC  1,X    ; then high byte.
    STA  1,X
                ; If there was a carry, then
    BCC  @2     ; increment low byte of high cell.
    INC  2,X    ; Public-domain used LDA#0, ADC, STA.
                ; If incrementing the low byte of the
    BNE  @2     ; high cell made it 0, you must also
    INC  3,X    ; increment the high byte of the high
                ; cell!  Lacking this is where the
                ; bug lay in the public-domain UM*
@2: 
    DEY
    BNE   @1    ; Loop again if not done.

    rts
.endproc



; Generated code

    .include "../build/paxconsola_generated.asm"

    .res $2000-*

FONT_EMBED:
    .include "../../examples/gfx/libra-gfx.asm"
FONT_EMBED_END:
