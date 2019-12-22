( check 2048 )

: power dup 0 == if drop else >r 2 * r> 1 - recurse then ;
2 10 power print
