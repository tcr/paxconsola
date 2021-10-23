; ***********************************************************************************************************************************************
; ***********************************************************************************************************************************************
;
;															Microvision System Code
;															=======================
;
;	Functionality:
;
;		LCD Interface : bit writing, polarity reversal, update, number font generation, number area clear, number screen rendering.
;		Speaker : 		Sound managed through update (overall pitch) and polarity reversal (length)
;		Other :			Random Number Generation
;
;	Pages Occupied:
;		Page 15 ($3C0), 0 ($000), 1 ($040), 2 ($080)
;
;	Written by Paul Robson January 2014
;
; ***********************************************************************************************************************************************
; ***********************************************************************************************************************************************

HWNotDataClock = 7												; R Latch connected to not- dataclock on LCD
HWLatchPulse = 6												; R Latch connected to Latch Pulse on LCD

HWKeyLeftCol = 10 												; Keyboard column selection R Latches
HWKeyMiddleCol = 9
HWKeyRightCol = 8

HWSpeaker = 0 													; Speaker line

;	Page 0 of RAM Allocation
;	========================
;	0-3		Lookup Table (8,4,2,1)
;	4 		Sound Timer - off when zero
;	5 		Pitch
;	6 		Pitch Counter - adds Pitch to Pitch Counter, bit 3 is copied to the sound bit
;	7 		Temporary value used by WriteBits routine. Note that WriteBitsX routines can operate with X register non zero
;			provided memory location (X,7) is kept as this will be overwritten.
;	8 		Line pointer (y position on screen)
; 	9 		Offset pointer (in page X+4)
;	10,11 	Seed values for the 4 bit RNG.

OSDSoundTimer = 4 												; Non-zero for sound to play - decremented when > zero ever polarity reversal (frame)
OSDPitch = 5 													; Pitch - added to PitchCounter every time Address Latch->Holding latch is performed
__PitchCounter = 6 												; Bit 3 of the PitchCounter is mirrored to the speaker line.
__LinePointer = 8
__OffsetPointer = 9
__XNRandom = 10 												; Random Number seeds.
__CNRandom = 11

; ***********************************************************************************************************************************************
;
;						Create/Update Digit Pattern for Row X : X = 4..7. Pattern# is in (X,0), data starts at (X,1)
;
;									(Note: all bit patterns are reversed, assuming BlockBuster PLA + Wiring)
; ***********************************************************************************************************************************************
;																Page 0 ($000) [1 byte spare]
; ***********************************************************************************************************************************************

	org 0h

OSCreateGraphicY 												; Use graphic Y in column X
	tya
OSCreateGraphicA 												; Use graphic A in column X
	tcy 	0 													; Store A in offset 0
	tam
OSUpdateGraphic 												; Update image in column X
	tcy 	0 													; Start at location zero.
	tma 														; Load the character value
	tcy 	1 													; Point to the store area.
	tam 														; Store it in M(X,Y)
	a6aac 														; is it >= 10 
	br 		__CGExit1 											; if so, exit now after erasing the tam before

	mnez 														; If non zero goto 1-9 code
	br 		__CG1To9
	tcmiy 	7 													; Output a zero. ***
	tcmiy 	5													; 				  * *
	tcmiy	5													; 				  * *
__CG0b
	tcmiy	5 													; 				  * *
__CG0a 
	tcmiy	7 													; 				  ***
	br 		__CGExit

__CG1To9														; M(X,Y) contains the number
	tma 														; Load into A
	a11aac 														; Will cause carry to be set if 5,6,7,8,9
	br 		__CG5To9

__CG1To4														; Process 1 to 4.
	dman 														; Now 0-3 representing 1-4
	cpaiz 														; Now S will be set if it was 0 (was originally 1)
	br 		__CG1 												; So draw the 1 code if so, a vertical line.
	tma 														; Otherwise, reload the number from A, it is 2,3 or 4.
	a12aac 														; This will cause a carry if it was originally 4
	br 		__CG4 												; If so , do 4 code. Now it is 2 or 3 (now A = 14 and 15 for these)
	tcmiy 	7 													; So do *** which is the top 3 lines for both 2 and 3.
	tcmiy 	4 													; then    *
	tcmiy 	7 													; then  ***
	iac 														; Carry will be set if it is 3 (it was 15), in which case do the tail to 5 (backwards L)
	br 		__CG5a
	tcmiy 	1 													; do *.. then solid tail and exit (e.g. bottom rows of 2) (e.g. forwards L)
	br 		__CG0a

__CG4 															; Output a '4'.
	tcmiy 	5													; *.*
	tcmiy 	5													; *.*
	tcmiy	7													; ***
	br 		__CG1a												; Use last two lines of 1 code to output the rest of the 4.

__CG1 															; Output a '1'.
	tcmiy	4 				
__CG1b 															; 4 x ..*
	tcmiy	4
	tcmiy	4
__CG1a 															; 2 x ..*
	tcmiy	4
	tcmiy 	4
	br 		__CGExit

__CG5To9 														; Do 5,6,7,8,9, represented by 0,1,2,3,4 at this point due to the A11AAC.
	tcmiy 	7 													; always a top line *** for 5-9.
	a14aac 														; will drop through if 5 or 6 (14 and 15), 7,8,9 are 0,1,2.
	br 		__CG7To9 											
	tcmiy 	1 													; Output *.. - these are common for both 5 and 6.
	tcmiy 	7 													; Output ***
	iac 														; Will set carry if it was 6 (6 -> 1 -> 15 after a11aac and a15aac)
	br 		__CG0b 												; In which case draw the bottom two lines of '0' 
__CG5a
	tcmiy 	4 													; Draw ..* - this is the reverse L and the bottom two lines of '5'
	br 		__CG0a 												; Draw Bottom line and exit.

__CG7To9
	cpaiz 														; (0,1,2 representing 7,8,9). S will be set if A was zero following cpaiz.
	br 		__CG1b 												; In which case it was 7, so draw the tail (4 x ..*)
	tcmiy 	5 													; Draw *.* which are commonalities for 8 and 9.
	tcmiy 	7	 												; Draw ***
	iac 														; if it was 8, then draw the *.* and *** e.g. bottom of 8
	br 		__CG0b
	br 		__CG5a 												; Draw tail of 9

__CGExit1 														; >= 10, a value was stored though so clear it
	tcmiy 	0
__CGExit
	tcy 	0 													; Load current value into A
	tma 
	retn 														; End of routine.

; ***********************************************************************************************************************************************
;
;													Render the text/number display.
;
;	On entry, Y contains the vertical position of the top line of the text. This needs a label 'RenderTextExit' to be defined as this is a 
;	jump in, jump out routine *not* a subroutine, as it uses subroutines and we only have one level.
;
;	This does the *whole* of the rendering including polarity switching.
;	
; ***********************************************************************************************************************************************
;														Page 1 ($040) [1 byte spare]
; ***********************************************************************************************************************************************

	org 040h

OSRenderTextDisplay
	tya
	ldx 	0 													; Point to page zero
	tcy 	__LinePointer 										; Write vertical screen position to line pointer
	tamiyc 						
	tcmiy 	1 													; Write offset (initially 1) to offset pointer
	call	OSSwitchPolarity 									; Switch polarity, start of frame.

__RTDLoop
	tcy 	__LinePointer 										; Read line pointer 
	lcall 	OSWriteBitsM 										; and write that column value.	

	call 	__RTDNibble2										; Read offset pointer into Y
	ldx 	4 													; Output nibble from 4,5,6 and 7.
	call 	__RTDNibble 										; offset pointer is reloaded on exit.
	ldx 	5
	call 	__RTDNibble
	ldx 	6
	call 	__RTDNibble
	ldx 	7
	call 	__RTDNibble

	lcall 	OSUpdateDisplay 									; Update the display.
	tcy 	__LinePointer										; Bump line pointer
	imac
	tamiyc 														; Save and point to offset pointer
	imac 														; Read and increment and update
	tam 														; Write back
	tay 														; Put in Y
	ynec 	6 													; Do for offsets 1-5.
	br 		__RTDLoop

	lbr 	OSExternalRenderTextExit 							; Exit the rendering.

__RTDNibble
	tma 														; Read the (X,Offset) into 
	tdo 														; Put on output lines.
	ldx 	0 													; Back to page 0.
	tcy 	HWNotDataClock 										; now controlling the data clock
	rstr  														; 1->0->1 pulse on data clock
	setr
__RTDNibble2
	tcy 	__OffsetPointer 									; Read the offset pointer into Y for next time
	tmy
	retn			

; ***********************************************************************************************************************************************
;
;	Call to switch polarity. Leaves !DC = 0 on exit, so that the next word latch (a rising edge on !DC) clocks in the data
;	at the right time - setting it back to 1 would cause a clock here. Decrement the sound timer if it is greater than zero.
;
; ***********************************************************************************************************************************************

OSSwitchPolarity
 	ldx 	0
	tcy 	OSDSoundTimer 										; Point Y to sound timer
	dman 														; Load and decrement, S set if wasn't zero.
	br 		__SPNotZero
	cla 														; If was zero, leave it at zero
__SPNotZero
	tam 														; Write it back.
	tcy 	HWLatchPulse										; On Entry, !DC = 1, LP = 0
	setr														; !DC = 1, LP = 1 - copies the addressed latches to the holding latches (no effect)
	tcy		HWNotDataClock 										; set !dataclock to 0
	rstr
	tcy 	HWLatchPulse 										; Falling Edge on Latch Pulse with !DC = 0, toggles polarity
	rstr
	retn 														; Leave !DC = 0 for latching next word.

; ***********************************************************************************************************************************************
;
;										Clear the display space to 0 (digit) and all spaces
;
; ***********************************************************************************************************************************************

OSClearDisplaySpace
	tcy 	5 													; Start at offset 5
	cla  														; Value to write out
__CDSLoop
	ldx 	4 													; Write to bank 4,5,6,7 in turn.
	tam
	ldx 	5
	tam
	ldx 	6
	tam
	ldx 	7 			
	tamdyn 														; Keep doing until Y goes -ve
	br 		__CDSLoop
	retn

; ***********************************************************************************************************************************************
;
;												Random Number Generator (preserves Y), sets X to zero.
;	
; ***********************************************************************************************************************************************
;														Page 2 ($080) [1 byte spare]
; ***********************************************************************************************************************************************

	org 080h

OSRandomNumber
	ldx 	0 													; Access page 0.
	tya 														; Save Y in NotDataClock temp
	tcy 	HWNotDataClock
	tam 
    tcy     __XNRandom                   						; read XNext
    tma                                 						; A = XNext value
    tcy     __CNRandom                    						; Y points to CNext
    alem                                						; S set if XNext <= CNext
    br      __OSRLNoDecrement           	  					; so clear if CNext < XNext
    dan                           		      					; so A = XNext-1 if CNext < XNext
__OSRLNoDecrement
    xma                                 						; now : A is old CNext, CNext is XNext maybe -1
    tcy     __XNRandom                   						; now calculate XNext := XNext + old CNext + 1
    amaac                               						; add XNext to old CNext
    iac                                 						; add one
    tam                                 						; write back to XNext
    tcy 	HWNotDataClock 										; restore Y
    tmy
    retn

; ***********************************************************************************************************************************************
;
;								Same as render text display but calls OSUpdateGraphic on each bank first
;	
; ***********************************************************************************************************************************************

OSUpdateAllAndRenderTextDisplay
	ldx 	0 													; Save Y (vertical position) in NotDataClock temp in bank 0
	tya
	tcy 	HWNotDataClock
	tam
	ldx 	4 													; Update 4 banks
	lcall 	OSUpdateGraphic
	ldx 	5
	lcall 	OSUpdateGraphic
	ldx 	6
	lcall 	OSUpdateGraphic
	ldx 	7
	lcall 	OSUpdateGraphic
	ldx 	0 													; Restore vertical position
	tcy 	HWNotDataClock
	tmy
	lbr 	OSRenderTextDisplay 								; and then render the text

; ***********************************************************************************************************************************************
;
;									Add 1, 10, 100 to current 'score' in banks 4,5,6,7 - if used as score.
;
;	These routines are jump in jump out routines.
;
; ***********************************************************************************************************************************************

OSIncrementHundred
	tcy 	1 													; Jump into hundreds
	br 		__Increment100
OSIncrementTen
	tcy 	1 													; Jump into tens
	br 		__Increment10
OSIncrementOne
	ldx 	7 													; Start at least significant digit
	tcy 	1 													; Carry forward 1 to start with
	call 	__Increment  										; Add into first digit, carry out is in Y
__Increment10
	ldx 	6 													; tens
	call 	__Increment
__Increment100
	ldx 	5 													; hundreds
	call 	__Increment
	ldx 	4 													; thousands
	call 	__Increment
	lbr 	OSExternalIncrementExit

																; Add Y to (X,0) - fix for decimal - Y is carry out
__Increment
	tya 														; Save carry forward in A
	tcy 	0 													; Point to digit (e.g. M(X,0))
	amaac 														; add current digit to the carry forward
	tam 														; Write it back to M(X,0)
	a6aac 														; add 6, S if overflow (e.g. it was 10, decimal carry)
	br 		__Overflow 
	retn 														; No overflow, return Y = 0 e.g. no carry forward.
__Overflow
	tcmiy 	0 													; reset current digit to zero, set Y to 1 carry forward
	retn 														; and exit - handy instruction :)


; ***********************************************************************************************************************************************
;
;															Start of Main Program
;
; ***********************************************************************************************************************************************

	org 0c0h

__StartProgram

;	Updates
;
;	17-1-14			Changes OSUpdateDisplay and OSSwitchPolarity to set X = 0 at the start, pretty much compulsory.
;					(all change X except OSWriteBits* which can work in any page if you sacrifice or preserve (X,7))
;

