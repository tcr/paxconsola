
; *******************************************************************************************************************************************************************
; *******************************************************************************************************************************************************************
;
;														Microvision Space Invaders : Main Loop Code
;
; *******************************************************************************************************************************************************************
; *******************************************************************************************************************************************************************

; *******************************************************************************************************************************************************************
;
;										Render the four invader rows, the bullets and the players. This is a jump-in-out routine.
;	
; *******************************************************************************************************************************************************************

	org 0540h

RenderAllAndMove
	ldx 	4 																	; M(4,6) is the index, starting at -1
	tcy 	TaxIndex_4
	tcmiy 	15

_RILoop
	ldx 	4 																	; Point to the index M(4,6)
	tcy 	TaxIndex_4
	imac 																		; Increment the index and update it.
	tam
	a12aac 																		; If it has reached 4 (4+12 = 16)
	br 		_RIExit 															; Then exit this loop.

	lcall 	TaxRoutineM46 														; Set X to 4,5,6,7 accordingly
	tcy 	InvaderRowPosition_47 												; Now points to (X,8), the row position.
	tma 																		; Read the Row position.
	ldx 	0 																	; Set X to zero so RSTR/SETR works.
	comc 																		; Write that out to select the invader row.
	lcall	OSWriteBitsA
	comc 																		; Fix the chapter bit back.
	lcall	TaxRoutineM46
	lcall 	_OutputInvaderRowData 												; Call routine to output row data.
	comc
	lcall	OSUpdateDisplay 													; And update the display
	comc
	br 		_RILoop 															; And go round.
_RIExit 	

	ldx 	2 																	; Bullet Rendering Code
	tcy 	RenderPointer_2
	tcmiy 	14 																	; (2,15) is the pointer for rendering. Set to -2 (effectively)
_RBLoop
	tcy 	RenderPointer_2 													; Read the pointer.
	ldx 	2
	tma 
	a2aac
	tam  																		; Bump it by two.
	tay 																		; Put in Y
	a6aac  																		; If it has reached 10 (note use of constant here)
	br 		_RBExit 															; Then exit
	mnez 																		; If memory != 0 then drawing will take place
	br 		_RBDraw
	br 		_RBLoop

_RBDraw
	tma 																		; Read the Y position into A.
	ldx 	0 																	; And output as Row Data. 						
	comc  	
	lcall 	OSWriteBitsA 													
	ldx 	2 																	; Read pointer + 1 into A
	tcy 	RenderPointer_2
	imac
	tay 																		; Put into Y, read into A
	tma
	ldx 	0 																	; And output as column data
	lcall 	OSWriteBitsA
	lcall 	OSUpdateDisplay 													; Update the display
	comc 																		; Fix CB back.
	br 		_RBLoop 															; And Loop Round.


; *******************************************************************************************************************************************************************
;
;		Move the Invaders. First goes through a /16 counter, then a down counter to slow it down. Moving is then checked - if moving cannot be done the direction
;		is reversed and the invaders drop down a level, otherwise the invaders are moved by shifting.
;
; *******************************************************************************************************************************************************************

_RBExit
	ldx 	3 																	; Decrement divide by 16 counter
	tcy 	Div16_3
	dman
	tam																			; And write back.
	lbr 	InvaderMovePhase 													; Drops through, consider as one thing.

	org 0580h

InvaderMovePhase 																; (X,Y) set to 3,0 in the previous page to make this code fit on a page.
	mnez 	 																	; Exit if counter non-zero.
	br 		IMPExit
	tcy 	InvaderCounter_3													; Point to the timer counter.
	mnez 																		; If non-zero, decrement and exit.
	br 		_IMPDecrementAndExit 												; Not moving this time.

_IMPMove
	tcy 	InvaderSpeed_3 														; Copy (2,2) to (2,1) e.g. reset the speed.
	tma 						
	tcy 	InvaderCounter_3
	tam
	tcy 	InvaderDirection_3 													; 4 is the direction.
	tbit1 	3 																	; if MSB is set then going right.
	br 		_IMPCheckRight 														; Go check it.

_IMPCheckLeft
	lcall 	CheckMoveLeft 														; Can we move left. Y is zero if we can.
	ynec 	0 																	; If y is non zero go down and reverse
	br 		_IMPDropDown
	ldx 	4 																	; Otherwise shift left all four invader rows
	lcall 	ShiftRowLeft
	ldx 	5
	lcall 	ShiftRowLeft
	ldx 	6
	lcall 	ShiftRowLeft
	ldx 	7
	lcall 	ShiftRowLeft
	br 		_IMPShuffleExit

_IMPCheckRight
	lcall 	CheckMoveRight 														; Can we move right, Y is zero if we can.
	ynec 	0 																	; If Y is non zero go down and reverse
	br 		_IMPDropDown
	ldx 	4 																	; Otherwise shift right all four invader rows
	lcall	ShiftRowRight
	ldx 	5
	lcall	ShiftRowRight
	ldx 	6
	lcall	ShiftRowRight
	ldx 	7
	lcall	ShiftRowRight
_IMPShuffleExit
	lcall 	SFXMoveInvader
	br 		IMPExit

_IMPDropDown
	ldx 	4 																	; Get current row position from (4,8)
	tcy 	InvaderRowPosition_47 
	imac 																		; Read and add one to it.
	lcall 	SetInvaderVerticalPosition 											; Set the new vertical position to +1 from the old one.
	ldx 	3 																	; Reverse the direction.
	tcy 	InvaderDirection_3
	tma 																		; Add 8 - it should toggle bit 3.
	a8aac
	tam
IMPExit 																		; Otherwise end of Render All and Move Invaders Phase.
	lbr 	PlayerMove

_IMPDecrementAndExit
	dman
	tam
	br 		IMPExit
	
; *******************************************************************************************************************************************************************
;
;																		Player Move Code
;
; *******************************************************************************************************************************************************************

	org 05c0h
PlayerMove
	ldx 	3 																	; Point to the Player Move Counter
	tcy 	PlayerMoveCounter_3
	tma 																		; Read it
	a6aac																		; Add 6 to it (controls player speed)
	br 		PlayerMove2 														; on S, move the player
	tam  																		; Write it back and exit player move code.
	br 		PlayerMoveExit

PlayerMove2
	tam 																		; Write the value back.
	lcall 	ScanKeyboard 														; Call the scan keyboard routine.
	lcall 	PlayerMoveLeftCheck													; Check left/right move.	
	lcall 	PlayerMoveRightCheck

	ldx 	3 																	; Right key is fire.
	tcy 	HWKeyRightCol 	
	tmy  																		; Read that key status into Y
	ynec 	8 																	; Is it a 0->1 transition
	br 		PlayerMoveExit 														; If not, then exit.

	ldx 	2 																	; Look at Bullet Y (2,2)
	tcy 	PlayerBulletY_2
	mnez 																		; If it is non-zero, then you have already fired.
	br 		PlayerMoveExit

	tcy 	PlayerX_2 															; Read Player X
	tma
	tcy 	PlayerBulletY_2 													; Point to bullet Y
	tcmiy 	14 																	; Bullet in row 14.
	tam  																		; Column = Player X. 

	lcall	SFXFireBullet
PlayerMoveExit	
	lbr 	BulletMove

; *******************************************************************************************************************************************************************
;
;																			Player Bullet Move Code
;
; *******************************************************************************************************************************************************************

	org 0600h
BulletMove
	ldx 	3
	tcy 	PlayerBulletMoveCounter_3 											; Point to bullet move counter
	tma 																		; Read it
	a4aac																		; Add bullet speed constantt
	br 		MoveBullet 															; If overflow then move
	tam 																		; Write counter back
	br 		BulletMoveExit 														; And exit this.

MoveBullet
	tam 																		; Write counter back
	ldx 	2
	tcy 	PlayerBulletY_2 													; Look at Bullet Y
	tma 																		; Read it 
	cpaiz 																		; Will set flag if was zero
	br 		BulletMoveExit
	dman 																		; Move it up 1.
	tamiyc 																		; And write it back, moving Y to Bullet X

	tma 																		; Read Bullet X and write to M(X,7) for X = 4..7
	tcy 	7 																	; This is so Bullet X can be retrieved without changing X.
	ldx 	4
	tam
	ldx 	5
	tam
	ldx 	6
	tam
	ldx 	7
	tam

	ldx 	4 																	; Set M(4,6) to 3 - we check the invaders from the bottom row up.
	tcy 	TaxIndex_4
	tcmiy 	3
CheckForInvaderHitLoop
	lcall 	TaxRoutineM46 														; Set X to the current value (e.g. 4-7)
	tcy 	InvaderRowPosition_47 												; Read M(X,8) which is the current row number
	tma
	ldx 	2 																	; M(2,2) is the bullet row 																	
	tcy 	PlayerBulletY_2
	mnea 																		; Are they different ?
	br  	CFIHLNext 															; Yes, then go to the next one.

	lcall 	TaxRoutineM46 														; Reload X again.
	lcall	CheckIfInvaderShot 													; Check if invaders shot
	ynec 	1 																	; If Y is not 1, i.e. it wasn't.
	br 		CFIHLNext  															; Try the next row.

	ldx 	2 																	; Hit Invader : Kill bullet.
	tcy 	PlayerBulletY_2
	tcmiy 	0
	comc  	 																	; Do the 'Increment One' routine in Chapter 0 (e.g. add 1 to the score)
	lbr 	OSIncrementOne 

CFIHLNext 	
	ldx 	4 																	; Decrement M(4,6) e.g. work backwards
	tcy 	TaxIndex_4
	dman
	tam
	tay 																		; Put in Y
	ynec 	15 																	; If not 15, then keep going.
	br 		CheckForInvaderHitLoop

BulletMoveExit
	lcall	CheckInvaderRowLanded  												; Check invaders have landed
	ynec 	0
	br 		HasLanded
	lbr 	AlienBullets 														; if not, continue to alien bullet move

HasLanded 																		; End loop with code 2 (invaders landed)
	tcy 	2
	lbr 	ExitRenderAndMove

; *******************************************************************************************************************************************************************
;
;																	Move, or create alien bullets
;
; *******************************************************************************************************************************************************************

	org 0640h

AlienBullets
	ldx 	2 																	; Point to AB Speed Counter
	tcy 	ABSpeedCounter_2
	tma 																		; Read it
	a2aac 																		; Add speed value
	br 		ABMoveThisTime 														; If S move this time.
	tam 																		; Write Back
	br 		ABCompleted

ABMoveThisTime
	tam 																		; Write it back.
	tcy 	ABPointer_2															; Set the pointer to point to the first bullet
	tcmiy 	4
ABMoveLoop
	ldx 	2
	tcy 	ABPointer_2 														; Read the alien bullet pointer code.
	tmy 																		; Read the pointer value into Y, e.g. Y now points to the bullet.
	tma  																		; Read Alien Bullet.Y
	cpaiz 																		; Will set S if zero (e.g. not in motion)
	br 		ABEmptySlot 														; If so, it's an empty slot - consider firing.

	imac 																		; Read alien bullet.Y, increment it
	tam 																		; Write it back, moving the bullet down.
	iac 																		; increment it again, setting S if it was 15 e.g. on the bottom row.
	br 		ABCheckCollision
	br 		ABNextBullet

ABCheckCollision
	tcmiy 	0 																	; Write 0 to alien bullet.y, disabling it, inc pointer to alien bullet.x
	tma 		 																; Read alien bullet.x
	tcy 	PlayerX_2 															; Compare X with Player X
	mnea 																		; if different
	br 		ABNextBullet 														; then exit this check.

	tcy 	1 	 																; Exit with Y = 1 (Life lost)
	br 	 	ExitRenderAndMove

ABEmptySlot 																	; Come here if Bullet.Y = 0, e.g. not being fired.
	comc 																		; Random number
	lcall 	OSRandomNumber
	comc
	dan 																		; one time in eight this will fail, thus suggesting a launch
	br 		ABNextBullet
	lbr 	AttemptBulletFire

ABNextBullet
	ldx 	2
	tcy 	ABPointer_2 														; Point to the pointer
	tma 	
	a2aac 																		; Add 2 to go to the next bullet.
	tam
	tay  																		; If not reached ten (bullets at 4,6 and 8)
	ynec 	10 	
	br 		ABMoveLoop 															; Do the next bullet.

ABCompleted 																	; Finally, we have finished the main loop.
	lcall 	CheckAllInvadersKilled 												; If all invaders killed
	ynec 	0 																	; If they are all killed
	br 		AllKilled

	tcy 	0  																	; Return zero, okay.
ExitRenderAndMove
	comc
	lbr 	EndRenderAndMove

AllKilled 																		; All shot down. Return code 3 (level complete)
	tcy 	3
	br 		ExitRenderAndMove

	org 0680h

; *******************************************************************************************************************************************************************
;
;																Attempt to fire bullet pointed to by (2,ABPointer_2)
;
; *******************************************************************************************************************************************************************

AttemptBulletFire
	comc  																		; Generate X position to try (0-15)
	lcall 	OSRandomNumber
	comc 
	ldx 	2 																	; And save it.
	tcy 	AlienBulletTrialX_2
	tam
	ldx 	4 																	; Set the X pointer for TAX to 3, e.g. search bottom up.
	tcy 	TaxIndex_4
	tcmiy	3

ABFSearchLoop
	ldx 	2 																	; Read the trial X position into A.
	tcy 	AlienBulletTrialX_2
	tma	
	lcall 	TaxRoutineM46 														; Set X accordingly, keeping A
	lcall 	TestABitInRowX 														; Check to see if that row (A) can fire in invader row (X)
	ynec 		0 																	; If we could do this (e.g. that row can fire)
	br 		ABFFiringPointFound 												; Then we can fire.
	ldx 	4
	tcy 	TaxIndex_4 															; Otherwise decement the TAX pointer, e.g. try rows above.
	dman
	tam 
	imac 																		; This will set S if the decrement finished
	br 		AttemptBulletFire 													; In which case, try another X position, this one has no invader
	br 		ABFSearchLoop 														; Otherwise, try the previous level.

ABFFiringPointFound 															; X contains the firing point row.
	tcy 	InvaderRowPosition_47  												; Read the invader row from (X,8)
	tma 
	ldx 	2 																	; Read the pointer to the current alien bullet into Y
	tcy 	ABPointer_2 
	tmy 
	tam 																		; Store that row in the alien bullet position
	tcy 	AlienBulletTrialX_2 												; Read the X position
	tma
	tcy  	ABPointer_2 														; Read the pointer + 1 into Y
	tmy 
	iyc
	tam 																		; And store the X position there.

	lbr 	ABNextBullet 														; Go do the next bullet.
