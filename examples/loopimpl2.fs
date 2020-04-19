( check 42 42 )

3 14 

: myloopimpl begin over + r> r> r> 1+ 2dup >r >r = swap >r until ;

\ multiply
>r 0 r> 0 >r >r  

myloopimpl

 r> r> drop drop swap drop

print



: mystar >r >r begin over + loopimpl until r> r>  ;

3 14 >r 0 r> 0 mystar drop drop swap drop print

\ no why???
  : mystar2 >r 0 r> 0 >r >r begin over + loopimpl until r> r> drop drop swap drop ;

3 14  mystar print
