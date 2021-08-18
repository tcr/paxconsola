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

    ; draw some helpful text
    jsr draw_text

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


    LDA #5
    STA $7f

    JSR SCNKEY      ;SCAN KEYBOARD
    JSR GETIN       ;GET CHARACTER
    CMP #0          ;IS IT NULL?
    BEQ pax_finished  ;no? skip


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

    .include "paxconsola_generated.asm"
