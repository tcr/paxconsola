
        include "g7000.h"

        org     0400h

        jmp     selectgame
        jmp     irq
        jmp     timer
        jmp     vsyncirq
        jmp     start
        jmp     soundirq

timer:
        retr            ; timer interrupts are discussed later

start:
        call    gfxoff              ; switch the graphics off
        mov     r0,#vdc_char0       ; start char
        mov     r3,#20h             ; x-position
        mov     r4,#20h             ; y-position
        mov     r2,#0Bh             ; length
        mov     r1,#hellostr & 0FFh ; the string to print
                                    ; must be in the same page
loop:
        mov     a,r1                ; get pointer
        movp    a,@a                ; get char
        mov     r5,a                ; into to right register
        inc     r1                  ; advance pointer
        mov     r6,#col_chr_white   ; colour
        call    printchar           ; print it
        djnz    r2,loop             ; do it again
        call    gfxon               ; lets see what is written
    .stop:
        jmp     .stop               ; Thats all

hellostr
        ; http://www.atarihq.com/danb/files/o2doc.pdf#page=13&zoom=auto,-175,781
        db     1Dh, 12h, 0eh, 0eh, 17h, 0Ch
        db     11h, 17h, 13h, 0Eh, 1Ah

