\ extern write-char-at

$C020 constant last-key
$C022 constant random-register
$9800 constant graphics

\ https://www.copetti.org/writings/consoles/game-boy/

20 constant screen-width
32 constant screen-row-width
18 constant screen-height

37 constant left
38 constant up
39 constant right
40 constant down

: random random-register @ 255 and swap % ;

0x02 constant TILE_WALL

0x00 constant color-white
0x02 constant color-black
0x03 constant color-green
0x04 constant color-red

: draw-index ( color index -- )
    graphics + c!
    ;

: read-index ( index -- color )
    graphics + c@
    ;

: convert-x-y ( x y -- offset )  screen-row-width * + ;
: write-char-at ( color x y -- )  rot rot convert-x-y draw-index ;
: read-char-at convert-x-y read-index ;
