
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
