;-------------
; gb-template - bank0.asm
;-------------
; Includes
;-------------

	INCLUDE "kernel/hardware.asm"
  	INCLUDE "kernel/header.asm"
	INCLUDE "kernel/tiles.asm"
  	INCLUDE "kernel/map.asm"

;-------------
; Start
;-------------

SECTION "Program Start",ROM0[$150]
START:
	ei				 ;enable interrupts
	ld  sp,$FFFE
	ld  a,IEF_VBLANK ;enable vblank interrupt
	ld  [rIE],a

	ld  a,$0
	ldh [rLCDC],a 	 ;LCD off
	ldh [rSTAT],a

	; clear ram
	; xor a
	; ld hl, $C0FF
; .loop_clear:
	; ldd [hl], a   ; 11001110 11111111
	; bit 7, h
	; jr nz,.loop_clear

	ld  a,%11100100  ;shade palette (11 10 01 00)
	ldh [rBGP],a 	 ;setup palettes
	ldh [rOCPD],a
	ldh [rOBP0],a

	call CLEAR_MAP
	call LOAD_TILES
	; call LOAD_MAP

	ld  a,%11010011  ;turn on LCD, BG0, OBJ0, etc
	ldh [rLCDC],a    ;load LCD flags

	; Set stack to end of internal RAM
	ld HL,$CFFF
	ld SP, HL
	; Clear memory locations
	call CLEAR_RAM

	; Seed the rng from DIV register
	ld a,[$fff4]
	ld [Seed], a
	xor $33
	ld [Seed+1], a
	xor $a7
	ld [Seed+2], a

	; Set end of HRAM marker. (Could be removed)
	ld a, $ba
	ld [$fffe], a
	ld a, $dd
	ld [$ffff], a

LOOP:
	call READ_JOYPAD
	call JOY_RIGHT
	call JOY_LEFT
	call JOY_UP
	call JOY_DOWN

	call WAIT_VBLANK

	; Set forth stack to end of zero page RAM
	ld c, $fe
	ld hl, $0
	call PAX_FN_main

	; store random number in pax_var_random
	call RandomNumber
	ld [pax_var_random],a
	call RandomNumber
	ld [pax_var_random+1],a

	;call _HRAM		 ;call DMA routine from HRAM
	jp LOOP


;-------------
; Pax Forth VM
;-------------

	INCLUDE "build/pax_generated.asm"

;-------------
; Subroutines
;-------------

VBLANK_IRQ:
	ld  [vblank_temp], a
	ld  a,$1
	ld  [vblank_flag],a
	ld  a,[vblank_temp]
	reti

WAIT_VBLANK:
	ld  hl,vblank_flag
.wait_vblank_loop
	halt
	nop  			 ;Hardware bug
	ld  a,$0
	cp  [hl]
	jr  z,.wait_vblank_loop
	ld  [hl],a
	ld  a,[vblank_count]
	inc a
	ld  [vblank_count],a
	ret

DMA_COPY:
	ld  de,$FF80  	 ;DMA routine, gets placed in HRAM
	rst $28
	DB  $00,$0D
	DB  $F5, $3E, $C1, $EA, $46, $FF, $3E, $28, $3D, $20, $FD, $F1, $D9
	ret

CLEAR_MAP:
	ld  hl,_SCRN0    ;load map0 ram
	ld  bc,$400
.clear_map_loop
	ld  a,$1
	ld  [hli],a      ;clear tile, increment hl
	dec bc
	ld  a,b
	or  c
	jr  nz,.clear_map_loop
	ret


LOAD_TILES:
	ld  hl,TILE_DATA
	ld  de,_VRAM
	ld  bc,TILE_COUNT
.load_tiles_loop
	ld  a,[hli]      ;grab a byte
	ld  [de],a       ;store the byte in VRAM
	inc de
	dec bc
	ld  a,b
	or  c
	jr  nz,.load_tiles_loop
	ret

LOAD_MAP:
	ld  hl,MAP_DATA  ;same as LOAD_TILES
	ld  de,_SCRN0
	ld  bc,$400
.load_map_loop
	ld  a,[hli]
	ld  [de],a
	inc de
	dec bc
	ld  a,b
	or  c
	jr  nz,.load_map_loop
	ret


CLEAR_RAM:
	ld  hl,$C000    ;load game ram
	ld  bc,$200
.loop
	ld  a,$0
	ld  [hli],a      ;clear tile, increment hl
	dec bc
	ld  a,b
	or  c
	jr  nz,.loop
	ret

READ_JOYPAD:
	ld  a,%00100000  ;select dpad
	ld  [rP1],a
	ld  a,[rP1]		 ;takes a few cycles to get accurate reading
	ld  a,[rP1]
	ld  a,[rP1]
	ld  a,[rP1]
	cpl 			 ;complement a
	and %00001111    ;select dpad buttons
	swap a
	ld  b,a

	ld  a,%00010000  ;select other buttons
	ld  [rP1],a
	ld  a,[rP1]
	ld  a,[rP1]
	ld  a,[rP1]
	ld  a,[rP1]
	cpl
	and %00001111
	or  b
					 ;lower nybble is other
	ld  b,a
	ld  a,[joypad_down]
	cpl
	and b
	ld  [joypad_pressed],a
					 ;upper nybble is dpad
	ld  a,b
	ld  [joypad_down],a
	ret

JOY_RIGHT:
	ld d,a
	and %00010000
	cp  %00010000
	jp  nz,JOY_FALSE
	ld  a,39
	ld [pax_var_last_key], a
	ld a,d
	ret
JOY_LEFT:
	ld d,a
	and %00100000
	cp  %00100000
	jp  nz,JOY_FALSE
	ld  a,37
	ld [pax_var_last_key], a
	ld a,d
	ret
JOY_UP:
	and %01000000
	cp  %01000000
	jp  nz,JOY_FALSE
	ld  a,38
	ld [pax_var_last_key], a
	ld a,d
	ret
JOY_DOWN:
	and %10000000
	cp  %10000000
	jp  nz,JOY_FALSE
	ld  a,40
	ld [pax_var_last_key], a
	ld a,d
	ret
JOY_A:
	and %00000001
	cp  %00000001
	jp  nz,JOY_FALSE
	ld  a,$1
	ret
JOY_B:
	and %00000010
	cp  %00000010
	jp  nz,JOY_FALSE
	ld  a,$1
	ret
JOY_SELECT:
	and %00000100
	cp  %00000100
	jp  nz,JOY_FALSE
	ld  a,$1
	ret
JOY_START:
	and %00001000
	cp  %00001000
	jp  nz,JOY_FALSE
	ld  a,$1
	ret
JOY_FALSE:
	;ld  a,$0
	;ld [pax_var_last_key], a
	ld a,d
	ret



; http://www.retroprogramming.com/2017/07/xorshift-pseudorandom-numbers-in-z80.html
RandomNumber:

        ld      hl,Seed

        ld      a,[hl+]

        sra     a

        sra     a

        sra     a

        xor     [hl]

        inc     hl

        rra

        rl      [hl]

        dec     hl

        rl      [hl]

        dec     hl

        rl      [hl]

        ld      a,[$fff4]          ; get divider register to increase

randomness:

        add     [hl]

        ret




; Native exported functions

PAX_NATIVE_read2Dindex:
    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

	; Wait until VRAM mode is 0 or 1
:   ld   a,[$0FF41]
    bit  1,a
    jr   nz, :-

    ; [gb_ir] ReplaceLoad8
    ld a, [hl]
    ld l, a
    xor a
    ld h, a

    ; [gb_ir] Ret
    ret

PAX_NATIVE_draw2Dindex:
    ; [gb_ir] Label(".target_0")
.target_0:

    ; [gb_ir] CopyToDE
    ld e,l
    ld d,h

    ; [gb_ir] ReplaceLiteral(38912)
    ld hl,38912

    ; [gb_ir] ReplaceAddWithDE
    add hl, de

    ; [gb_ir] NipIntoDE
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c

	; Wait until VRAM mode is 0 or 1
:   ld   a,[$0FF41]
	bit  1,a
	jr   nz, :-

    ; [gb_ir] StoreDE8
    ld a, e
    ld [hl],a

    ; [gb_ir] Pop
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c

    ; [gb_ir] Ret
    ret


SECTION "RAM Vars",WRAM0[$C000]
vblank_flag:
db
vblank_count:
db
joypad_down:
db                   ;dow/up/lef/rig/sta/sel/a/b
joypad_pressed:
db
vblank_temp:
db
Seed:
db
db
db

SECTION "Pax System Vars",WRAM0[$C020]
pax_var_last_key:   ; hardcoded at
db
db
pax_var_random:   ; hardcoded at
db
db


SECTION "Pax User Vars",WRAM0[$C040]
pax_user_vars:
