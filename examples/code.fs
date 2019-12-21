 : fib dup 0 == if drop else 1 - >r dup rot + r> recurse then ; 

1 1 20 fib print
