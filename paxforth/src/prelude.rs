pub const PRELUDE: &str = r"

variable  temp \ first variable

: swap   >r temp! r> temp@ ;
: over   >r temp! temp@ r> temp@ ;
: rot    >r swap r> swap ;

\ note: must preserve return address!
: r@   r> r> temp! temp@ >r temp@ swap >r ;
: r!   r> r> r> drop >r >r >r ;

: 2drop   + drop ;
: dup    temp! temp@ temp@ ;
: 2dup   over over ;

: cells dup + ;
: cell+ 1 cells + ;

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

\ pop off the return address, then limit, then index.
\ add one to index and push limit and index back to stack; then compare
\ increased index with limit. return true if equal
: loopimpl r> r> r> 1+ 2dup >r >r = swap >r ;
\ same thing but accepts input argument saying countdown value
: -loopimpl r> swap r> swap r> swap - 2dup >r >r = swap >r ;

\ note: must preserve return address!
: i r> r> r> temp! temp@ >r >r >r temp@ ;
: j r> r> r> r> r> temp! temp@ >r >r >r >r >r temp@ ;

: * >r 0 r> 0 do over + loop swap drop ;
: 2* 2 * ;

: 0<   $8000 nand invert if -1 else 0 then ;
: % ( value divisor -- modulus ) begin 2dup - dup 0< if rot drop + -1 else rot drop swap 0 then until ;

";
