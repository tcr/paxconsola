( check 20 33 44 44 44 44 )

: invert  -1 nand ;
: or   invert swap invert nand ;

0 20 or print drop

99 33 swap drop print drop

: dosample   4 0 do 44 print drop loop ;

dosample
