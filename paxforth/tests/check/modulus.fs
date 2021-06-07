( @check 1 0 2  )

: 0<   $8000 nand invert if -1 else 0 then ;
: % ( value divisor -- modulus ) begin 2dup - dup 0< if rot drop + -1 else rot drop swap 0 then until ;

-5 0< if 1 else 0 then print
55 0< print
47 5 % print
