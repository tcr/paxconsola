( check 42 )

3 14 

: myloopimpl r> r> r> 1+ 2dup = if drop drop 1 else >r >r 0 then swap >r ;

\ multiply
>r 0 r> 0 >r >r begin over +

myloopimpl

until swap drop

print
