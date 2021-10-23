; *******************************************************************************************************************************************************************
; *******************************************************************************************************************************************************************
;
;																		Microvision Space Invaders
;
;																   Written by Paul Robson January 2014
;
;	Revisions: 	1.0 		Completed 22-Jan-2014
;
; *******************************************************************************************************************************************************************
; *******************************************************************************************************************************************************************

lbr  MACRO   dest
		ldp (dest >> 6) & 1111b
        br dest
        ENDM

lcall  MACRO   dest
		ldp (dest >> 6) & 1111b
        call dest
        ENDM

; Workaround bug in asl
xma  MACRO
		db 03h
        ENDM

	include 	idata.asm														; Define Memory Usage
	include 	system_start.asm 														; Microvision Standard Routines

	ldx 	3 																	; Set Lives to one.
	tcy 	Lives_3
	tcmiy 	1
	lcall 	OSClearDisplaySpace 												; Clear Display to 0000
	tcy 	1
	lbr 	PlayOver			 												; Go a rendering - fakes 'lost life'

; *******************************************************************************************************************************************************************
;
;																			Start a new game
;
; *******************************************************************************************************************************************************************

RestartGame
	ldx 	3 																	; Set Invader Speed (basic game speed control) to 10 and Lives to 3.
	tcy 	InvaderSpeed_3
	tcmiy 	10
	tcmiy 	3
	lcall 	OSClearDisplaySpace 												; Clear score

; *******************************************************************************************************************************************************************
;
;																		  Go to the next level
;
; *******************************************************************************************************************************************************************

NextLevel
	ldx 	3  																	; Bump Invader Speed
	tcy 	InvaderSpeed_3
	dman 																		; If you somehow beat level 0 which is insane you will get to very slow 15.
	tam

; *******************************************************************************************************************************************************************
;
;																Reset the same level (after invaders have landed)
;
; *******************************************************************************************************************************************************************

ResetLevel

	comc
	ldx 	4 																	; Reset the invader rows
	lcall	ResetInvaderRow
	ldx 	5
	lcall	ResetInvaderRow
	ldx 	6
	lcall	ResetInvaderRow
	ldx 	7
	lcall	ResetInvaderRow

	cla
	lcall 	SetInvaderVerticalPosition 											; Position invaders at the top
	comc

; *******************************************************************************************************************************************************************
;
;													Life has been lost - invaders stay as they are but base and bullets are reset
;
; *******************************************************************************************************************************************************************

LostLife
	comc
	lcall 	ResetPlayerAndBullets												; Reset the bullets and the player.
	comc

	tcy 	InvaderDirection_3													; Reset Invader Initial Direction so they go left
	ldx 	3
	tcmiy 	0

; *******************************************************************************************************************************************************************
;
;																		Main Game Loop (most of which is in imain.asm)
;
; *******************************************************************************************************************************************************************

MainLoop 																	
	lcall 	OSSwitchPolarity 													; Switch display polarity, keeps Microvision LCD happy.
	comc
	lbr 	RenderAllAndMove 													; Render everything using the code in Chapter 1, which comes back immediately below.

EndRenderAndMove																; Here : Y = 0 (ok), 1 (life lost), 2 (landed), 3 (complete)
	ynec 	0 																	; If Y is zero, then the game has stopped.
	br 		PlayOver
	br 		MainLoop

; *******************************************************************************************************************************************************************
;
;								Game ended for some reason: Y = 1 (life lost), Y = 2 (invaders landed), Y = 3 (level complete)
;
; *******************************************************************************************************************************************************************

PlayOver
	tya 																		; Put code in Y (as above, can also be 4 - starting)
	ldx 	2 																	; Save code in Game Status in Bank 2
	tcy 	GameStatus_2
	tam 	
	a13aac 																		; S will be set if the status value was 3 or more
	br 		NoLivesLost
	ldx 	3 																	; Point XY to the lives value
	tcy 	Lives_3
	dman 																		; decrement and write back.
	tam 
NoLivesLost
	lbr 	RenderScoreAndLives

; *******************************************************************************************************************************************************************
;
;																	Render the score/lives display
;	
; *******************************************************************************************************************************************************************

	org 0100h

RenderScoreAndLives
	lcall 	OSSwitchPolarity 													; Polarity Switch on this.
	tcy 	2 																	; Render score at offset 2.
	lbr 	OSUpdateAllAndRenderTextDisplay
OSExternalRenderTextExit 			

	tcy 	14
	ldx 	0
	lcall	OSWriteBitsY 														; Write Column 14 out.
	cla
	a7aac 	 																	; value to output = 1110 to LCD controller
	tdo 																		; Put on output lines.
	ldx 	3 																	; Read lives into A
	tcy 	Lives_3
	tma
	lcall 	OutputATimes 														; Output A times.
	cla 	
	tdo
	ldx 	3 																	; Read Lives
	tcy 	Lives_3
	tma 
	cpaiz 																		; Calculate 4 - Lives
	a4aac
	lcall 	OutputATimes 														; Output spaces.
	lcall 	OSUpdateDisplay
	comc 																		; Update keyboard variables.
	lcall 	ScanKeyboard
	comc
	ldx 	3 																	; Check for both left + middle pressed.
	tcy 	HWKeyMiddleCol
	cla 																		; check 8 in both middle and left values
	a8aac
	mnea 
	br 		RenderScoreAndLives
	tcy 	HWKeyLeftCol
	mnea
	br 		RenderScoreAndLives
	lbr 	DecideAction 														; Both 8, the decide what to do next.

OutputATimes
	dan  																		; Dec A
	br 		OATContinue 														; If gone -ve then over
	retn
OATContinue
	tcy 	HWNotDataClock
	rstr
	setr
	br 		OutputATimes

; *******************************************************************************************************************************************************************
;
;														End of Score/Lives Display - decide what to do next.
;
; *******************************************************************************************************************************************************************

	org 0140h

DecideAction
	ldx 	3 																	; Read lives.
	tcy 	Lives_3
	tma
	cpaiz 																		; Sets S if Lives = 0
	br 		DA_Restart 															; If so, Restart game.
	ldx 	2 																	; Read the game status.
	tcy 	GameStatus_2
	tma
	a13aac 																		; if >= 3 then
	br 		DA_NextLevel 														; do the next level
	iac
	br 		DA_ResetLevel 														; if = 2 then redo the current level.
	lbr 	LostLife 															; otherwise =1, lost life but continue.

DA_Restart
	lbr 	RestartGame
DA_NextLevel
	lbr 	NextLevel
DA_ResetLevel
	lbr 	ResetLevel

; *******************************************************************************************************************************************************************
;
;															Fix up as OSIncrement cannot jump back to chapter 1
;
; *******************************************************************************************************************************************************************

OSExternalIncrementExit 														; Fix up. OSIncrementOne is called in the bullet move code (if an invader is hit)
	comc 																		; It comes here (in Chapter 0) and is dispatched to the end of the bullet move
	lbr 	BulletMoveExit 														; code in Chapter 1.

; *******************************************************************************************************************************************************************
;
;																		Subroutine and main games code
;
; *******************************************************************************************************************************************************************

	include 	iroutines.asm 													; Space Invader Subroutines
	include 	imain.asm														; Main Loop Code.

	include 	system_end.asm
