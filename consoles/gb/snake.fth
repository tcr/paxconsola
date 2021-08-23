$C020 constant last-key
$C022 constant random-register
$9800 constant graphics

20 constant screen-width
32 constant screen-row-width
18 constant screen-height

: random random-register @ 255 and swap % ;

\ ---

0x02 constant TILE_WALL

variable initialized
variable frame

variable snake-x-head
500 cells allot

variable snake-y-head
500 cells allot

variable apple-x
variable apple-y

0x00 constant color-white

37 constant left
38 constant up
39 constant right
40 constant down

variable direction
variable length

: snake-x ( offset -- address )
  cells snake-x-head + 
  ;

: snake-y ( offset -- address )
  cells snake-y-head + 
  ;

\ TODO should be multiplying 32 by `cells`
: convert-x-y ( x y -- offset )  32 * + ;
: draw-index ( color index -- )  graphics + c! ;
: draw ( color x y -- )  convert-x-y draw-index ;
: draw-white ( x y -- )  color-white rot rot draw ;
: draw-black ( x y -- )  2 rot rot draw ;
: draw-snake-tile ( x y -- )  3 rot rot draw ;
: draw-apple-tile ( x y -- )  4 rot rot draw ;

: draw-background
    0
    screen-height 0 do
        screen-width 0 do
            color-white over i + draw-index
        loop
        screen-row-width +
    loop
    drop
    ;

: draw-walls
    \ Draw bottom wall
    screen-height 1 - screen-row-width *
    screen-width 0 do
        TILE_WALL over i + draw-index
    loop
    drop

    \ Draw top wall
    screen-width 0 do
        TILE_WALL i draw-index
    loop

    \ Draw right wall
    screen-width 1 -
    screen-height 0 do
        TILE_WALL over draw-index
        screen-row-width +
    loop
    drop

    \ Draw left wall
    0
    screen-height 0 do
        TILE_WALL over draw-index
        screen-row-width +
    loop
    drop
    ;

: initialize-snake
    4 length !
    length @ 1 + 0 do
        8 i - i snake-x !
        8 i snake-y !
    loop
    right direction !
    ;

: set-apple-position apple-x ! apple-y ! ;

: initialize-apple  8 13 set-apple-position ;

: initialize
    draw-background
    draw-walls
    initialize-snake
    initialize-apple
    ;

\ Initialize only once
initialized @ 0= if initialize then
1 initialized !






\ game runtime


: move-up  -1 snake-y-head +! ;
: move-left  -1 snake-x-head +! ;
: move-down  1 snake-y-head +! ;
: move-right  1 snake-x-head +! ;

: move-snake-head  direction @
    left over  = if move-left else
    up over    = if move-up else
    right over = if move-right else
    down over  = if move-down
    then then then then drop
    ;

\ Move each segment of the snake forward by one
: move-snake-tail
    -1 length @ do
        i drop i snake-x @ i 1 + snake-x !
        i snake-y @ i 1 + snake-y !
    1 -loop
    ;

: is-horizontal  direction @ dup
    left = swap
    right = or
    ;

: is-vertical  direction @ dup
    up = swap
    down = or
    ;

: turn-up     is-horizontal if up direction ! then ;
: turn-left   is-vertical if left direction ! then ;
: turn-down   is-horizontal if down direction ! then ;
: turn-right  is-vertical if right direction ! then ;

: change-direction ( key -- )
    left over = if turn-left else
    up over = if turn-up else
    right over = if turn-right else
    down over = if turn-down
    then then then then drop
    ;

: check-input
    last-key @ change-direction
    0 last-key !
    ;

\ get random x or y position within playable area

: random-x-position ( -- pos )
    screen-width 4 - random 2 +
    ;

: random-y-position ( -- pos )
    screen-height 4 - random 2 +
    ;

: move-apple
    apple-x @ apple-y @ draw-white
    random-x-position random-y-position
    set-apple-position
    ;

: grow-snake  1 length +! ;

: check-apple
    snake-x-head @ apple-x @ =
    snake-y-head @ apple-y @ =
    and if
        move-apple
        grow-snake
    then
    ;

: check-collision ( -- flag )
    \ get current x/y position
    snake-x-head @ snake-y-head @

    \ get color at current position
    convert-x-y graphics + c@

    \ leave boolean flag on stack
    0 =
    ;

: draw-snake-head-tail
    0 snake-x @ 0 snake-y @ draw-snake-tile
    length @ snake-x @
    length @ snake-y @
    draw-white
    ;

: draw-apple
    apple-x @ apple-y @ draw-apple-tile
    ;






\ game loop

\ Game loop
draw-snake-head-tail
draw-apple
check-input
move-snake-tail
move-snake-head
check-apple

check-collision
if else 0 initialized ! then

\ end frameskip
\ then
















(

: move-right 23 graphics 67 + c! ;
: move-left 21 graphics 65 + c! ;
: move-up 22 graphics 34 + c! ;
: move-down 24 graphics 98 + c! ;

last-key @
  left over = if move-left else
  up over    = if move-up else
  right over  = if move-right else
  down over = if move-down
  then then then then

)


