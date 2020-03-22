pub const PRELUDE: &str = r"

: drop    if then ;
: 2drop   + drop ;

variable  temp \ 578
: swap   >r temp ! r> temp @ ;
: over   >r temp ! temp @ r> temp @ ;
: rot    >r swap r> swap ;

\ note: must preserve return address!
: r@   r> r> temp ! temp @ >r temp @ swap >r ;

: dup    temp ! temp @ temp @ ;
: 2dup   over over ;
: ?dup   temp ! temp @ if temp @ temp @ then ;

: cells dup + ;

: invert   -1 nand ;
: negate   invert 1 + ;
: -        negate + ;

: 1+   1 + ;
: 1-   -1 + ;
: +!   dup >r @ + r> ! ;
: 0=   if 0 else -1 then ;
: =    - 0= ;
: <>   = 0= ;
: ==   - 0= ;

: or   invert swap invert nand ;
: xor   2dup nand 1+ dup + + + ;
: and   nand invert ;

\ return stack pops off index, then limit, reverse of initial stack order
\ compare, if equal then cleanup and return 1, else increase index, push, return 0
\ note: must preserve return address!
: loopimpl r> r> r> 1+ 2dup = if 2drop 1 else >r >r 0 then swap >r ;
: -loopimpl r> r> rot r> swap - 2dup = if 2drop 1 else >r >r 0 then swap >r ;

\ note: must preserve return address!
: i r> r> r> temp ! temp @ >r >r >r temp @ ;
: j r> r> r> r> r> temp ! temp @ >r >r >r >r >r temp @ ;

: * >r 0 r> 0 do over + loop swap drop ;

: 0<   $8000 nand invert if -1 else 0 then ;
: % ( value divisor -- modulus ) begin 2dup - dup 0< if rot drop + -1 else rot drop swap 0 then until ;

";
