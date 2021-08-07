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

    .include "generated.asm"

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
