;-------------
; Tile Data
;-------------

TILE_COUNT EQU 31*16 ;16 bytes each

SECTION "Tiles",ROM0
TILE_DATA:
    INCBIN "generated/tiles.bin"
