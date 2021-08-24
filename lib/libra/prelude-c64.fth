$007e constant last-key
$007f constant random-register
$0400 constant graphics

40 constant screen-width
40 constant screen-row-width
25 constant screen-height

37 constant left
38 constant up
39 constant right
40 constant down

: random random-register @ 255 and swap % ;

0xE6 constant TILE_WALL

0x20 constant color-white
0xE6 constant color-black
182 constant color-green
0xE9 constant color-red
