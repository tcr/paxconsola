;-------------
; Tile Data
;-------------

TILE_COUNT EQU 256*16 ;16 bytes each

SECTION "Tiles",ROM0
TILE_DATA:
    INCBIN "build/tiles.bin"
