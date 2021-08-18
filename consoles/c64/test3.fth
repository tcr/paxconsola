$007e constant last-key
$007f constant random-register
$0400 constant graphics

\ acid test

\ KP: bug in dup
\ pos 10-12
211 graphics 5 5 + + c!
95 graphics 6 dup + + c!

\ #1 tile at pos 0
211 graphics c!
\ pos 1
212 graphics 1 + c!
\ pos 2
193 >r 0 >r r> r> graphics 2 + c! drop
\ pos 3
210 graphics $ffff $fffc nand + c!
\ pos 4
212 graphics 4 + c!

