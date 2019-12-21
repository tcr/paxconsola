( 233168 )

( If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000. )

: g if r@ + else then ;

: f r@ 0 == if else
  r@ 3 % 0 ==
  r@ 5 % 0 ==
  or g
  r> 1 - >r recurse then ;
231 3 0 0 push1 >r 0 f print
( 9 >r 0 f print )
