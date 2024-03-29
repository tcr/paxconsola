\ Welcome to the basic "Snake World" game.
\ This game is written in Pax Forth, an ahead-of-time compiled Forth
\ that can run on several vintage consoles and computer systems. See
\ the "Docs" for more inforamtion.
\
\ To try out this game, click any of the targets in the IDE.

\ The following line tells the compiler which "game engine" we want to use.
( @engine taurus )

\ Setup variables for our in-game objects.

variable snake-x-head
500 cells allot

variable snake-y-head
500 cells allot

variable direction
variable length

variable apple-x
variable apple-y

: snake-x ( offset -- address )
    cells snake-x-head +
    ;

: snake-y ( offset -- address )
    cells snake-y-head +
    ;

: draw-white ( x y -- ) color-white write-char-at ;
: draw-black ( x y -- ) color-black write-char-at ;
: draw-snake-tile ( x y -- ) color-green write-char-at ;
: draw-apple-tile ( x y -- ) color-red write-char-at ;

: draw-background ( -- )
    screen-height 0 do
        screen-width 0 do
             i j color-white write-char-at
        loop
    loop
    ;

: draw-walls
    \ Draw bottom wall
    screen-height 1 -
    screen-width 0 do
        i over TILE_WALL write-char-at
    loop
    drop

    \ Draw top wall
    0
    screen-width 0 do
        i over TILE_WALL write-char-at
    loop
    drop

    \ Draw right wall
    screen-width 1 -
    screen-height 0 do
        dup i TILE_WALL write-char-at
    loop
    drop

    \ Draw left wall
    0
    screen-height 0 do
        dup i TILE_WALL write-char-at
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

: draw-full-snake
    length @ 0 do
        i snake-x @ i snake-y @ draw-snake-tile
    loop
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
    screen-width 2 - random 1 + ;

: random-y-position ( -- pos )
    screen-height 2 - random 1 +
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
    read-char-at

    \ leave boolean flag on stack
    TILE_WALL =
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


\ Game loop

\ This method is invoked once, at the start of the game,
\ or each time the game resets (when you collide with a
\ wall or with yourself)
: initialize
    draw-background
    draw-walls
    initialize-snake
    initialize-apple
    draw-full-snake
    ;

\ This method is called once per frame, to update the
\ in-game state and check the termination condition.
: next-frame
    draw-snake-head-tail
    draw-apple
    check-input
    move-snake-tail
    move-snake-head
    check-apple

    check-collision
    if initialize then
    ;

initialize
next-frame
