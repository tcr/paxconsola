extern write-char-at ( x y char -- )
extern read-char-at ( x y char -- )

$007e constant last-key

40 constant screen-width
25 constant screen-height

37 constant left
38 constant up
39 constant right
40 constant down

extern random-word ( -- rand8bit )

: random random-word 255 and swap % ;

2 constant TILE_WALL

0x20 constant color-white
0 constant char-space
1 constant color-green
3 constant color-red

\ on DOS cr is \r\n
: cr 13 emit 10 emit ;

: 2@ ( a-addr -- w1 w2 ) dup 2 + @ swap @ ;
: 2! ( w1 w2 a-addr -- ) dup temp! ! temp@ 2 + ! ;

extern accept ( c-addr c-n-max -- c-n )
