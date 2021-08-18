$007e constant last-key
$007f constant random-register
$0400 constant graphics

0 begin 

dup graphics + 65 swap ! 

1 + dup 14 -1 nand 1 + + if 0 else -1 then until drop
