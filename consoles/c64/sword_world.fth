variable initialized
variable player-y
variable player-x

: draw-index ( tile index -- )
    graphics + c!
    ;

: draw-2x2 ( d c b a -- )
    screen-width player-y @ * player-x @ + 
    swap over draw-index
    swap over 1+ draw-index
    swap over screen-width + draw-index
    swap over screen-width + 1+ draw-index
    drop
    ;

: draw-background ( -- )
    10 0 do
        i 48 + i 2 + draw-index
    loop
    6 0 do
        i 1 + i 12 + draw-index
    loop

    screen-width 2 *
    10 0 do
        i 48 + over draw-index
        screen-width +
    loop
    drop
    screen-width 12 *
    6 0 do
        i 1 + over draw-index
        screen-width +
    loop
    drop

    2 screen-width + screen-width +
    16 0 do
        16 0 do
            i j 16 * +      ( -- tile )
            over i +        ( pos tile -- pos tile offset )
            draw-index      ( tile offset --  )
        loop
        screen-width +
    loop
    drop
    ;

: initialize ( -- )
    draw-background
    10 player-y !
    30 player-x !
    \ $E0 0 draw-index
    \ $E0 1 draw-index
    \ $E0 0 screen-width + draw-index
    \ $E0 1 screen-width + draw-index
    ;

\ Initialize only once
initialized @ 0= if initialize then
1 initialized !

: go-up ( -- ) player-y @ 1- player-y ! ;
: go-down ( -- ) player-y @ 1+ player-y ! ;
: go-left ( -- ) player-x @ 1- player-x ! ;
: go-right ( -- ) player-x @ 1+ player-x ! ;

: change-direction ( key -- )
    begin
        left of go-left endof
        up of go-up endof
        right of go-right endof
        down of go-down endof
    endcase
    ;

: check-input
    last-key @ change-direction
    \ 0 last-key !
    ;

$20 $20 $20 $20 draw-2x2

check-input

$9c $99 $49 $47 draw-2x2
