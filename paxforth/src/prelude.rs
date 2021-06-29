pub const PRELUDE: &str = r"

variable  temp \ first variable

: swap   >r temp! r> temp@ ;
: over   >r temp! temp@ r> temp@ ;
: rot    >r swap r> swap ;

\ note: must preserve return address!
: r@   r> r> temp! temp@ >r temp@ swap >r ;
: r!   r> r> drop swap >r >r ;

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

: type ( c-addr u -- )
    0 do
        dup i + @ emit
    loop
    ;

: 0>=   $8000 nand invert if 0 else -1 then ;
: 0<= ( n -- f ) dup 0= swap 0< or ;
: -rot ( w1 w2 w3 -- w3 w1 w2 ) swap >r swap r> ;
: tuck ( w1 w2 -- w2 w1 w2 ) swap over ;
: roll3 >r >r >r temp! r> r> r> temp@ ;
: throw 0 = if else abort then ;

: nip    >r temp! r> ;
: <   2dup xor 0< if drop 0< else - 0< then ;
: u<   2dup xor 0< if nip 0< else - 0< then ;
: >   swap < ;
: u>   swap u> ;
: >=   2dup > >r = r> or ;

: within ( u1 u2 u3 -- flag ) over - >r - r> u< ;

: 2@ ( a-addr -- w1 w2 ) dup 1+ @ swap @ ;
: 2! ( w1 w2 a-addr -- ) dup temp! ! temp@ 1+ ! ;
: ?dup ( w -- 0 | w w ) dup 0= if else dup then ;

: throw 0 = if else abort then ;

-1 constant true
0 constant false

: roll ( x .. n -- .. x )
    dup
    begin dup 0 <> while 1- rot >r repeat \ top of alt is counter
    drop
    begin dup 0 <> while 1- r> -rot repeat \ top of alt is counter
    drop
    ;

: compare ( c-addr1 u1 c-addr2 u2 -- n )
    begin
        rot
        2dup
        or 0= if
            drop drop drop drop 0
            1
        else
            dup 0= if drop drop drop drop -1
            1
            else
                over 0= if drop drop drop drop 1
                1
                else                    ( c-addr1 c-addr2 u2 u1 )
                    >r >r               ( c-addr1 c-addr2 )
                    2dup @ swap @       ( c-addr1 c-addr2 c2 c1 )
                    -                   ( c-addr1 c-addr2 [c2 - c1] )
                    dup 0< if
                        \ less than 1
                        drop
                        r> r>
                        drop drop drop drop
                        1
                        1
                    else if
                            \ more than 1
                            r> r>
                            drop drop drop drop
                            -1
                            1
                        else
                            \ loop
                            1+ swap 1+ swap
                            r> 1- r> 1-
                            rot rot
                            0
                        then
                    then
                then
            then
        then
    until
    ;



";
