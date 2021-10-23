
; *******************************************************************************************************************************************************************
;
;																					Memory Usage
;
; *******************************************************************************************************************************************************************
;	
;	Page 0 : 	System Memory

;	Page 2 : 	0,1 				Y,X Player	(None are drawn if Y == 0)
;				2,3 				Y,X Player Bullet
; 				4,5 				Y,X Invader Bullet # 1
;				6,7 				Y,X Invader Bullet # 2
;				8,9 				Y,X Invader Bullet # 3
;
;				11 					Game status when game ended for some reason
;				12 					Alien Bullet Trial position.
;				13 					Alien Bullet Speed Counter
;				14 					Alien Bullet Pointer.
;				15 					Pointer to currently drawn bullet.

;	Page 3 : 	0 					Divide by 16 counter for Moving the Space Invaders
; 				1 					Down counter, when reaches zero then move invaders.
; 				2 					Speed value, initial value of Down Counter (1)
; 				3 					Lives
; 				4 					Invader Move Direction. 0 = Left, Non-Zero = Right (Bit 3 only)
; 				5 					Player move counter (constant added, move on carry)
;				6 					Player bullet move counter (constand added, move on carry)
;				7 					Toggle to determine which invader moving beep (Bit 3 only)
; 				8-10 				Bit 3, current state, Bit 2, last state for rows 8-10 (Right,Middle,Left)

;	Page 4-7:	0 					Score digit (X = 4 = MSD) (System method)
;				1-5 				Score digit graphic (System method)
;				6,7 				Temporary Stores for Invader Row Code
;				8 					Row position.
;				9 					Number of invaders remaining
;				10 					0
;				11 					Column 1 (LSB = RHS)
;				12-14 				Columns 2..4
; 				15 					Zero

;				4,6 				is used as a counter for the pseudo 'tax' instruction


PlayerY_2 = 0
PlayerX_2 = 1
PlayerBulletY_2 = 2
PlayerBulletX_2 = 3

GameStatus_2 = 11
AlienBulletTrialX_2 = 12
ABSpeedCounter_2 = 13
ABPointer_2 = 14
RenderPointer_2 = 15

Div16_3 = 0
InvaderCounter_3 = 1
InvaderSpeed_3 	= 2
Lives_3 = 3
InvaderDirection_3 = 4
PlayerMoveCounter_3 = 5
PlayerBulletMoveCounter_3 = 6
SoundAlternateBeep_3 = 7

TaxIndex_4 = 6
InvaderRowPosition_47 = 8 
InvaderRemaining_47 = 9
InvaderRowStart_47 = 11
InvaderRowEnd_47 = 14
