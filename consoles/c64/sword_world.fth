$007e constant last-key
$007f constant random-register
$0400 constant graphics

37 constant left
38 constant up
39 constant right
40 constant down

40 constant width
25 constant height

variable initialized

: draw-index ( color index -- )
    graphics + c!
    ;

: draw-background ( -- )
    0
    16 0 do
        16 0 do
            i j 16 * + over i + draw-index
        loop
        width +
    loop
    drop
    ;

: initialize
    draw-background
    ;

\ Initialize only once
initialized @ 0= if initialize then
1 initialized !
