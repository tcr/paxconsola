\ 3 14 * print


\ expanded version

14 3 >r 0 r> 0

>r >r

begin \ block[1]

>r temp ! temp @ r> temp @ +

r> r> 1 +

>r temp ! temp @ r> temp @
>r temp ! temp @ r> temp @

-1 nand 1 + + \ -

\ block[2] block[3-4] block[5]
if 0 else -1 then

\ block[6] block[7] block[8]
if + if then 1 else >r >r 0 then

\ block[9]
until
\ block[10]

>r temp ! r> temp @ if then print
