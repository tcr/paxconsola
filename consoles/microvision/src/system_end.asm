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

; ***********************************************************************************************************************************************
;
;															Program starts here
;	
; ***********************************************************************************************************************************************
;														Page 15 ($3C0) [2 bytes spare]
; ***********************************************************************************************************************************************

	org 03C0h

StartLibrary
	ldx		0 													; Set up the bit table at M(0,0)
	tcy 	0
	tcmiy	8
	tcmiy	4
	tcmiy	2
	tcmiy	1
	tcmiy 	0 													;  Turn sound off by setting timer to zero.

	tcy		HWNotDataClock										; 	set !dataclock 1, latch pulse 0
	setr 														;  Initial state of control lines.
	tcy 	HWLatchPulse
	rstr

	lbr 	__StartProgram

; ***********************************************************************************************************************************************
;
;	Output a bit position to the LCD Driver, either row or column. There are four near identical subroutines, which output
;	M(M(XY)), M(XY), Y or A. It converts the value to a sequence of nibbles with the nth bit set, (where 0 is the left most bit/upper bit)
;
;	Four phases - it one's complements the position so 15 is now the left most
;				- it outputs zeros before the position
;				- it outputs the bit pattern at the position
;				- it outputs the bit pattern after the position
;
;	Requires a table at (X0) to contain 8,4,2,1 (bit lookup)
;	Uses (X7) as temporary storage - this is used for efficiency (so we don't keep changing Y)
;
; ***********************************************************************************************************************************************

OSWriteBitsM 													; Position in M(XY)
	tmy 
OSWriteBitsY													; Position in Y
	tya 
OSWriteBitsA 													; A = 0..15, Bit position (15 = right most)
	cpaiz														; Invert A so that 15 is now the left most pixel.	
	dan 
	tcy 	HWNotDataClock 										; Y = Not Data Clock
	tam 														; Save to 0:HWNotDataClock
	cla
	tdo 														; set the output lines to $00.
	tma 														; Restore the value.

__WBStart
	a4aac 														; Add 4 to the Bit position - if 12..15 (e.g. the right position),status will be set and it will be 0..3
	br 		__WBEndStart 
	rstr 														; Pulse Not(Data Clock) to write out leading zero nibbles.
	setr
	br 		__WBStart

__WBEndStart 														
	tay															; Point to the look up table
	tma 														; Read it to get the nibble to write
	tdo 														; Write to the O lines
	tcy 	HWNotDataClock 										; Pulse the not data clock to write it out.
	rstr 									
	setr

	cla															; Clear the O line again
	tdo 
	tma 														; Read the original value back (e.g. the value at the start)
__WBEnd
	a12aac 														; Subtract 4. Status set if value was >= 4
	br 		__WBEndNibble 										; so output one zero nibble
	retn 														
__WBEndNibble
	rstr 														; Pulse the not data clock line
	setr
	br 		__WBEnd 											; And try it again.

; ***********************************************************************************************************************************************
;
;			   Copy addressed latches to holding latches, updating the display. Play sound if the sound counter is non-zero
;
; ***********************************************************************************************************************************************

OSUpdateDisplay
	ldx 	0
	tcy 	OSDSoundTimer 										; Check sound timer
	mnez 														; If it is non-zero
	br 		__UDMakeSound 										; If so, go to make sound ....
OSUpdateDisplayNoSound
	tcy 	HWLatchPulse 										; Pulse the latch pulse
	setr
	rstr
	retn

__UDMakeSound
	tcy 	OSDPitch 											; Read pitch
	tma
	tcy 	__PitchCounter 										; Add into pitch counter
	amaac
	tam 														; Write pitch counter back
	tbit1 	3 													; Is MSB set ?
	br 		__UDBitSet
	tcy 	HWSpeaker 											; No, clear speaker bit
	rstr
	br 		OSUpdateDisplayNoSound
__UDBitSet 														; Yes, set speaker bit
	tcy 	HWSpeaker
	setr
	br  	OSUpdateDisplayNoSound
