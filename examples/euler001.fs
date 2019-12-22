( check 233168 )

( If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000. )


: temp 0 ;
: temp@ temp @ ;
: temp! temp ! ;

: g if temp@ + else then ;

: f temp@ 0 == if else
  temp@ 3 % 0 ==
  temp@ 5 % 0 ==
  or g
  temp@ 1 - temp! recurse then ;
231 3 0 0 pack temp! 0 f print
( 9 temp! 0 f print )
