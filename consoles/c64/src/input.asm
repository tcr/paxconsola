.proc read_keyboard
        JSR SCNKEY      ;SCAN KEYBOARD
        JSR GETIN       ;GET CHARACTER
        CMP #0          ;IS IT NULL?
        BNE @keys    ;no? parse the key

        ; clear the key
        lda #0
        sta $7e
        
        rts

    @keys:   
        CMP #87		;W - up
        ; BEQ UP
        
        CMP #83		;S - down
        ; BEQ DOWN
        
        CMP #65		;A - left
        ; BEQ LEFT
        
        CMP #68		;D - right
        ; BEQ RIGHT
        
        ;CMP ENTER	;end if enter clicked
        ;BEQ END
        
        rts
.endproc
