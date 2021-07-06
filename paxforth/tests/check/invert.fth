( @check 20 33 44 44 44 44 )

: invert  -1 nand ;
: or   invert swap invert nand ;

\ 0 20 or print

\ 99 33 swap drop print

: dosample   4 0 do 44 print loop ;

dosample
