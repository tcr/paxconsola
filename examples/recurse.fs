( check 20 )

: invert  -1 nand ;
: invert  -1 nand ;
: or   invert swap invert nand ;

0 20 or print drop
