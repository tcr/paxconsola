3 14 * print


\ expanded version

14 3 >r 0 r> 0

>r >r

begin

\ block start v

>r temp ! temp @ r> temp @ +

r> r> 1 +

>r temp ! temp @ r> temp @
>r temp ! temp @ r> temp @

-

if 0 else -1 then if + if then 1 else >r >r 0 then

\ block end ^

until

>r temp ! r> temp @ if then print
