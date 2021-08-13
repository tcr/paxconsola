$007e constant last-key
$007f constant random-register
$0400 constant graphics

\ #1 tile at pos 0
\ 64 graphics c!

: random random-register @ 255 and swap % ;

40 constant width
25 constant height

\ 30 constant width
\ 20 constant height

\ 20 constant width
\ 18 constant height

variable initialized
variable frame \ unused

variable snake-x-head
500 cells allot

variable snake-y-head
500 cells allot

variable apple-x
variable apple-y

37 constant left
38 constant up
39 constant right
40 constant down

0x20 constant color-white

variable direction
variable length

: snake-x ( offset -- address )
  cells snake-x-head + ;

: snake-y ( offset -- address )
  cells snake-y-head + ;

\ TODO should be multiplying 32 by `cells`
: convert-x-y ( x y -- offset )  40 * + ;
: draw-index ( color index -- )  graphics + c! ;
: draw ( color x y -- )  convert-x-y draw-index ;
: draw-white ( x y -- )  color-white rot rot draw ;
: draw-black ( x y -- )  0xE6 rot rot draw ;
: draw-snake-tile ( x y -- )  0xE8 rot rot draw ;
: draw-apple-tile ( x y -- )  0xE9 rot rot draw ;

: draw-background ( -- )
    0
    height 0 do
        width 0 do
            color-white over i + draw-index
        loop
        width +
   loop
   drop
   ;

: draw-walls
    \ Draw bottom wall
    width height 1 - *
    width 0 do
        0xE6 over i + draw-index
    loop
    drop

    \ Draw top wall
    width 0 do
        0xE6 i draw-index
    loop

    \ Draw right wall
    width 1 -
    height 0 do
        0xE6 over draw-index
        width +
    loop
    drop

    \ Draw left wall
    0
    height 0 do
        0xE6 over draw-index
        width +
    loop
    drop
    ;

: initialize-snake
  16 length !
  length @ 1 + 0 do
    8 i - i snake-x !
    8 i snake-y !
  loop
  right direction ! ;

: set-apple-position apple-x ! apple-y ! ;

: initialize-apple  8 13 set-apple-position ;

: draw-full-snake
  length @ 0 do
    i snake-x @ i snake-y @ draw-snake-tile
  loop
  ;

: initialize
  draw-background
  draw-walls
  initialize-snake
  initialize-apple
  draw-full-snake
  ;


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
  then then then then drop ;

\ Move each segment of the snake forward by one
: move-snake-tail
  -1 length @ do
      i drop i snake-x @ i 1 + snake-x !
      i snake-y @ i 1 + snake-y !
  1 -loop
  ;

: is-horizontal  direction @ dup
  left = swap
  right = or ;

: is-vertical  direction @ dup
  up = swap
  down = or ;

: turn-up     is-horizontal if up direction ! then ;
: turn-left   is-vertical if left direction ! then ;
: turn-down   is-horizontal if down direction ! then ;
: turn-right  is-vertical if right direction ! then ;

: change-direction ( key -- )
  left over = if turn-left else
  up over = if turn-up else
  right over = if turn-right else
  down over = if turn-down
  then then then then drop ;

: check-input
  last-key @ change-direction
  0 last-key ! ;

\ get random x or y position within playable area
: random-x-position ( -- pos )
  width 4 - random 2 + ;
: random-y-position ( -- pos )
  height 4 - random 2 + ;

: move-apple
  apple-x @ apple-y @ draw-white
  random-x-position random-y-position
  set-apple-position ;

: grow-snake  1 length +! ;

: check-apple
  snake-x-head @ apple-x @ =
  snake-y-head @ apple-y @ =
  and if
    move-apple
    grow-snake
  then ;

: check-collision ( -- flag )
  \ get current x/y position
  snake-x-head @ snake-y-head @

  \ get color at current position
  convert-x-y graphics + c@

  \ leave boolean flag on stack
  color-white = ;

: draw-snake-head-tail
  0 snake-x @ 0 snake-y @ draw-snake-tile
  length @ snake-x @
  length @ snake-y @
  draw-white ;

: draw-apple
  apple-x @ apple-y @ draw-apple-tile ;


\ Initialize only once
initialized @ 0= if initialize then
1 initialized !

\ Game loop
draw-snake-head-tail
draw-apple
check-input
move-snake-tail
move-snake-head
check-apple

check-collision
if else 0 initialized ! then
