( @check 111 222 333 999 100 200 -300 -99 -199 299 )

\ https://forth-standard.org/standard/core/CASE

: cs1 case 1 of 111 endof
   2 of 222 endof
   3 of 333 endof
   >r 999 r>
   endcase
   ;

1 cs1 .
2 cs1 .
3 cs1 .
4 cs1 .

: cs2
   >r case
   -1 of case r@ 1 of 100 endof
                2 of 200 endof
                >r -300 r>
        endcase
     endof
   -2 of case r@ 1 of -99 endof
                >r -199 r>
        endcase
     endof
     >r 299 r>
   endcase r> drop
   ;

-1 1 cs2 .
-1 2 cs2 .
-1 3 cs2 .
-2 1 cs2 .
-2 2 cs2 .
 0 2 cs2 .
