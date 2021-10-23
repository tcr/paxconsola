; *******************************************************************************************************************************************************************
; *******************************************************************************************************************************************************************
;
;															Microvision Space Invaders : Subroutines (Chapter 1)
;
; *******************************************************************************************************************************************************************
; *******************************************************************************************************************************************************************

	org 0400h

; *******************************************************************************************************************************************************************
;
;													Reset Invader Row. On Entry, X points to the Row to be reset.
;
; *******************************************************************************************************************************************************************

ResetInvaderRow
	tcy 	InvaderRemaining_47 												; Position 9 is the data start (Row in 8 is reset elsewhere.)
	tcmiy 	5 																	; There are 5 invaders remaining
	tcmiy 	0																	; Border (Left)
	tcmiy 	0 																	; Column 1 ....
	tcmiy 	4 																	; Column 2 ..X.
	tcmiy 	5 																	; Column 3 X.X.
	tcmiy 	5 																	; Column 4 X.X.
	tcmiy 	0																	; Border (Right)
	retn

; *******************************************************************************************************************************************************************
;
;														Set the Row Nibble 8 for x = 4,5,6,7 e.g. each invader row
;	
; *******************************************************************************************************************************************************************

SetInvaderVerticalPosition
	tcy 	InvaderRowPosition_47 												; Row position is RAM(X,8)
	ldx 	4
	tam 																		; Write Row 0 position
	a2aac 																		; Drop down 2 rows.
	ldx 	5 																	; Write Row 1 position
	tam
	a2aac
	ldx 	6 																	; Write Row 2 position
	tam
	a2aac
	ldx 	7 																	; Write Row 3 position
	tam
	retn

; *******************************************************************************************************************************************************************
;
;							A utility function for 'RenderInvaders' - outputs (X,11) through (X,14) to the hardware latches.
;
; *******************************************************************************************************************************************************************

_OutputInvaderRowData
	tcy 	InvaderRowStart_47 													; Data from 11
	tya
	tcy 	HWNotDataClock 														; Store 11 in (X,HWNotDataClock) which is workspace, so we can leave Y unchanged.
	tam 																		; (mostly)

_OIRDLoop
	tmy 																		; Read the current data address (e.g. 11 at start) into Y
	ynec 	15 																	; If not reached 15, output the data at Y
	br 		_OIRDOutput
	retn

_OIRDOutput
	tma 																		; Read the data at that address
	tdo 																		; Send to Output ports
	comx																		; Need to make ports work (X < 4)
	tcy 	HWNotDataClock 														; Pulse Data Clock
	rstr
	setr
	comx 																		; Fix X back up.
	imac 																		; Bump the pointer up and write it back
	tam 
	br 		_OIRDLoop 															; Go round again.

; *******************************************************************************************************************************************************************
;
;																If M(4,6) = 0,3 Load X with 4..7 respectively.
;
; *******************************************************************************************************************************************************************

TaxRoutineM46																	; Special version that uses M(4,6) as the value
	ldx 	4
	tcy 	TaxIndex_4
	tmy 																		; Put in Y, 0-1-2-3.
	dyn 																		; Will skip if Y = 0
	br 		_NotTax0
	ldx 	4
	retn
_NotTax0
	dyn
	br 		_NotTax1
	ldx 	5
	retn
_NotTax1
	dyn
	br 		_NotTax2
	ldx 	6
	retn
_NotTax2
	ldx 	7
	retn

	org 0440h

; *******************************************************************************************************************************************************************
;	
;										Check to see if the invaders can move to the left. Returns Y = 0 if that is possible
;
; *******************************************************************************************************************************************************************

CheckMoveLeft
	ldx 	4
	tcy 	InvaderRowStart_47 													; 11 is the left most column
	tbit1 	0 																	; Bit 0 is the leftmost bit
	br 		_CMLExit
	ldx 	5
	tbit1 	0
	br 		_CMLExit
	ldx 	6
	tbit1 	0
	br 		_CMLExit
	ldx 	7
	tbit1 	0
	br 		_CMLExit
	tcy 	0 																	; No bits set - return Y = 0
_CMLExit
	retn


; *******************************************************************************************************************************************************************
;
;										Check to see if the invaders can move to the right. Returns Y = 0 if that is possible
;	
; *******************************************************************************************************************************************************************

CheckMoveRight
	ldx 	4
	tcy 	InvaderRowEnd_47 													; 14 is the right most column
	tbit1 	3 																	; Bit 3 is the rightmost bit
	br 		_CMRExit
	ldx 	5
	tbit1 	3
	br 		_CMRExit
	ldx 	6
	tbit1 	3
	br 		_CMRExit
	ldx 	7
	tbit1 	3
	br 		_CMRExit
	tcy 	0 																	; No bits set - return Y = 0
_CMRExit
	retn

; *******************************************************************************************************************************************************************
;
;																	Reset Player and Bullets
;
; *******************************************************************************************************************************************************************

ResetPlayerAndBullets
	ldx 	2
	tcy 	9 																	; Clear 9 to 0 - constant delimits bullets
_RPABClear
	cla
	tamdyn
	br 		_RPABClear
	tcy 	PlayerY_2 															; Point to (2,0) which is the player position
	tcmiy 	15 																	; Bottom row
	tcmiy 	8 																	; Half way position.
	retn

; *******************************************************************************************************************************************************************
;												Shift a row right. This is effectively shifting data left.
; *******************************************************************************************************************************************************************

ShiftRowRight
	tcy 	InvaderRowEnd_47													; Start at 14.
_SRRLoop
	tma 																		; Shift it left. Much easier :) 	
	amaac 
	tam
	dyn
	tbit1 	3 																	; Is the LSB of the previous (e.g. the MSB visually set)
	br 		_SRRCarryOut 														; If it is it becomes the MSB of the current. 
_SRRCO0
	ynec 	10
	br 		_SRRLoop
	retn

_SRRCarryOut
	iyc
	sbit 	0
	dyn
	br 		_SRRCO0
	br 		_SRRCO0

; *******************************************************************************************************************************************************************
;
;									Shift a row left. Because the bits are reversed this is effectively shifting data right.
;
; *******************************************************************************************************************************************************************

	org 0480h

ShiftRowLeft
	tcy 	InvaderRowStart_47 													; Start at 11.
_SRLLoop
	rbit 	0
	tbit1 	1 																	; Shift bit 1 right
	br 		_SRLBit1  							
_SRLBit1a
	tbit1 	2 																	; Shift bit 2 right
	br 		_SRLBit2
_SRLBit2a
	tbit1 	3 																	; Shift bit 3 right
	br 		_SRLBit3 
_SRLBit3a
	rbit 	3 																	; Clear bit 3
	iyc  																		; Look at the next one
	tbit1 	0																	; Check it's LSB (actually MSB - think reversal)
	br 		_SRLBit0 															; if set that needs to go into original bit 3.
_SRLBit0a
	ynec 	15 																	; Do for all four nibbles
	br 		_SRLLoop
	retn

_SRLBit0
	dyn
	sbit 	3
	iyc
	br 		_SRLBit0a
	br 		_SRLBit0a

_SRLBit1
	sbit 	0
	rbit 	1
	br 		_SRLBit1a

_SRLBit2
	sbit 	1
	rbit 	2
	br 		_SRLBit2a

_SRLBit3
	sbit 	2
	rbit 	3
	br 		_SRLBit3a

; *******************************************************************************************************************************************************************
;
;																			Scan Keyboard
;
; *******************************************************************************************************************************************************************

ScanKeyboard
	ldx 	3
	tcy 	HWKeyRightCol 														; Keyboard stuff goes in 8,9,10
_SCKLoop
	setr 																		; Set the keyboard line high.
	rbit 	0 																	; Clear bits 0 + 1
	rbit 	1
	sbit 	2 																	; Set bit 2
	tbit1 	3 																	; Skip if bit 3 is set
	br 		_SCKSkip1
	rbit  	2 																	; Clear bit 2 - effectively copies bit 3 into bit 2
_SCKSkip1
	sbit 	3 																	; Set the MSB
	knez  																		; Skip if key pressed
	br 		_SCKSkip2
	rbit  	3 																	; if not pressed, clear the MSB.
_SCKSkip2
	rstr 																		; Set keyboard line low.
	iyc 																		; Bump pointer
	ynec 	11 																	; Do 8,9,10.
	br 		_SCKLoop
	retn

; *******************************************************************************************************************************************************************
;
;																			Move Left Code
;
; *******************************************************************************************************************************************************************

PlayerMoveLeftCheck
	ldx 	3 																	; Left key is on the left
	tcy 	HWKeyLeftCol
	tbit1 	3 																	; Is key down ?
	br 		_MLCKeyDown
	retn
_MLCKeyDown
	ldx 	2 																	; Point to Player X (2,1)
	tcy 	PlayerX_2
	mnez 																		; X has to be non-zero
	br 		_MLCOkay
	retn
_MLCOkay
	dman 																		; Decrement and load position.
	tam 
	retn

; *******************************************************************************************************************************************************************
;
;																			Move Right Code
;
; *******************************************************************************************************************************************************************

	org 04c0h

PlayerMoveRightCheck
	ldx 	3 																	; Right key is on the middle column
	tcy 	HWKeyMiddleCol
	tbit1 	3 																	; Is key down ?
	br 		_MRCKeyDown
	retn
_MRCKeyDown
	ldx 	2 																	; Point to Player X (2,1)
	tcy 	PlayerX_2
	imac 																		; X has < 15
	br 		_MRCFail 															; Skip if it was 15.
	tam  																		; Save incremented position
_MRCFail
	retn

; *******************************************************************************************************************************************************************
;
;																		Invader Moving Sound
;
; *******************************************************************************************************************************************************************

SFXMoveInvader
	ldx 	3 																	; Point to the alternate toggle.
	tcy 	SoundAlternateBeep_3
	tma 																		; Toggle Bit 3 and write back
	a8aac
	tam
	tbit1 	3 																	; Use Bit 3 to determine Sound Effect
	br 		_SFXMIAlternate
	ldx 	0
	tcy 	OSDSoundTimer
	tcmiy 	5
	tcmiy 	7
	retn
_SFXMIAlternate
	ldx 	0
	tcy 	OSDSoundTimer
	tcmiy 	5
	tcmiy 	3
	retn

; *******************************************************************************************************************************************************************
;	
;																		Player Bullet Fire Sound
;
; *******************************************************************************************************************************************************************

SFXFireBullet
	ldx 	0
	tcy 	OSDSoundTimer
	tcmiy 	2
	tcmiy 	7
	retn

; *******************************************************************************************************************************************************************
;
;										  Check if Frame is complete (e.g. all the invaders are dead), return 1 yes, 0 no
;
; *******************************************************************************************************************************************************************
	
CheckAllInvadersKilled
	tcy 	InvaderRemaining_47 												; Want to check this is zero for 4,5,6,7
	ldx 	4
	mnez	
	br 		CAIKFail
	ldx 	5
	mnez	
	br 		CAIKFail
	ldx 	6
	mnez	
	br 		CAIKFail
	ldx 	7
	mnez	
	br 		CAIKFail
	tcy 	1 																	; If all are zero, return 1
	retn
CAIKFail 
	tcy 	0 																	; Fail return 0
	retn

; *******************************************************************************************************************************************************************
;
;													Check if invaders in Row X have landed, return 1 yes, 0 no
;
; *******************************************************************************************************************************************************************

CheckInvaderRowLanded
	tcy 	InvaderRemaining_47 												; Check that there are some remaining first.
	tma 																		; Read it
	cpaiz 																		; S set if zero
	br 		CIRLFail 															; Nothing to land.
	tcy 	InvaderRowPosition_47 												; Point to invader row position
	tmy 																		; Read that position into Y
	ynec 	15 																	; If not the bottom row.
	br 		CIRLFail 															; then not landed
	tcy 	1 																	; Return Y = 1, this row has landed, over.
	retn
CIRLFail
	tcy 	0
	retn

	org 0500h

; *******************************************************************************************************************************************************************
;
;			Check to see if an invader has been shot in Row X. M(X,7) contains the row number. If so, clear the invader, 
;			decrement the 'remaining' counter. Return Y = 1 for a hit,0 for a miss.
;
; *******************************************************************************************************************************************************************

CheckIfInvaderShot
	tcy 	7 																	; (X,7) contains the bullet column number.
	tma 																		; Bullet column number -> A
	tcy 	10 																	; Left hand column - 1
CIISFindNibble
	iyc  																		; Next Column
	a12aac 																		; This will fall through if A = 0..3
	br 		CIISFindNibble 								 						; Keep going until A == 12-15 - representing 0..3
	iac  																		; Will cause carry if A = 15, e.g. was 3 originally.
	br 		_CIIS3
	iac 																		; Similar for A = 14,13,12 etc.
	br 		_CIIS2
	iac
	br 		_CIIS1
_CIIS0
	tbit1 	0 																	; Bit 0 is the Left most bit
	br 		_CIIS0a 															; If hit, fix up and exit
_CIISFail
 	tcy 	0																	; No hit, exit.
	retn 
_CIIS0a
	rbit 	0 																	; Clear the bit
	br 		_CIISCompleteHit 													; Complete the hit.

_CIIS1 																			; Duplicate code , Bit 1 is 2nd from Left (bit reversal)
	tbit1 	1
	br 		_CIIS1a
	br 		_CIISFail
_CIIS1a
	rbit 	1
	br 		_CIISCompleteHit

_CIIS2 																			; Duplicate code , Bit 2 is 2nd from Right (bit reversal)
	tbit1 	2
	br 		_CIIS2a
	br 		_CIISFail
_CIIS2a
	rbit 	2
	br 		_CIISCompleteHit

_CIIS3 																			; Duplicate code , Bit 3 is Right Most (bit reversal)
	tbit1 	3
	br 		_CIIS3a
	br 		_CIISFail
_CIIS3a
	rbit 	3

_CIISCompleteHit
	tcy 	InvaderRemaining_47 												; Decrement the invader remaining count
	dman
	tam
	tcy 	1 																	; And return 1.
	retn 	

; *******************************************************************************************************************************************************************
;
;												Similar routine but tests if there is an invader in row X bit A only
;
; *******************************************************************************************************************************************************************

TestABitInRowX 
	tcy 	10 																	; Point to Start - 1
TABIFindNibble 																	; Find the Nibble to check. 
	iyc
	a12aac
	br 		TABIFindNibble 														; A will be 12-15 when found.
	iac 	
	br 		_TABI3
	iac 	
	br 		_TABI2
	iac 	
	br 		_TABI1
	tbit1 	0  																	; Was 12, so check the LSB.
	br 		_TABIRet1
	br 		_TABIRet0
_TABI1
	tbit1 	1  																	; Was 13, so check the LSB.
	br 		_TABIRet1
	br 		_TABIRet0
_TABI2
	tbit1 	2  																	; Was 14, so check the LSB.
	br 		_TABIRet1
	br 		_TABIRet0
_TABI3
	tbit1 	3  																	; Was 15, so check the LSB.
	br 		_TABIRet1
_TABIRet0
	tcy 	0
	retn
_TABIRet1
	tcy 	1
	retn
