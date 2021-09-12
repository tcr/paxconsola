\ 3 3 >r >r 10 r> r> *

2 1 2 draw-at
3 1 1 draw-at
4 1 2 draw-at
5 1 1 draw-at

40 constant screen-width
25 constant screen-height

variable example
3 example !

example @
6 1 rot draw-at

: draw-background ( -- )
    screen-height 0 do
        screen-width 0 do
             i j 1 draw-at
        loop
    loop
    ;

draw-background
