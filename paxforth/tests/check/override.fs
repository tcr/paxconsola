( check 20 )

variable  temp
: drop    if then ;
: swap   >r temp ! r> temp @ ;

: invert  -1 nand ;
: invert  -1 nand ;
: or   invert swap invert nand ;

0 20 or print
