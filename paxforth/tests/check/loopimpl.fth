( @check 42 )

3 14

: myloopimpl r> r> r> 1+ 2dup >r >r = swap >r ;

\ multiply
>r 0 r> 0 >r >r begin over +

myloopimpl

until r> r> drop drop swap drop

print
