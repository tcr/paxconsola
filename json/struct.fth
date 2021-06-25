-1 constant true
0 constant false

: 2@ ( a-addr -- w1 w2 ) dup 1+ @ swap @ ;
: 2! ( w1 w2 a-addr -- ) dup temp! ! temp@ 1+ ! ;
: ?dup ( w -- 0 | w w ) dup 0= if else dup then ;

: compare ( c-addr1 u1 c-addr2 u2 -- n ) drop drop drop drop 1 ;

: throw 0 = if else abort then ;

variable HEAP_OFFSET

variable HEAP_BASE
1000 cells allot

\ Implement a simple bump allocator with no failsafe
: allocate ( u -- a-addr wior )
    HEAP_BASE HEAP_OFFSET @ + swap
    HEAP_OFFSET @ + HEAP_OFFSET !
    0
    ;

( move should check that u is not negative )
: move ( addr1 addr2 u -- : copy u words of memory from 'addr2' to 'addr1' )
	0 do
		2dup i + @ swap i + !
	loop
	2drop ;

\ free at the moment does nothing :(
: free ( addr -- )
    drop
    ;


\
\ ORIGINAL FILE
\

: buf-new ( size -- buf )
    dup 0= if drop 16 then
    dup 2 cells + allocate throw \ size buf
    dup rot swap !               \ buf
    0 over cell+ ! ;

: buf-append ( char buf -- buf )
    dup @ over cell+ @                    \ char buf size len
    = if                                  \ char buf
        dup @ 2* 2 cells + allocate throw \ char buf new-buf
        2dup over @ 2 cells + move
        over @ 2* over !
        swap free throw                   \ char new-buf
    then                                 \ char buf
    dup dup cell+ @ 2 cells + +           \ char buf new-pos
    rot swap c!                           \ buf
    dup cell+ dup @ 1+ swap ! ;

: buf-count ( buf -- c-addr u )
    cell+ dup cell+ swap @ ;

: cellbuf-new ( size -- buf )
    dup 0= if drop 16 then
    dup cells 2 cells + allocate throw
    dup rot swap !
    0 over cell+ ! ;

: cellbuf-append ( cell buf -- buf )
    dup @ over cell+ @
    = if
        dup @ cells 2* 2 cells + allocate throw
        2dup over @ cells 2 cells + move
        over @ 2* over !
        swap free throw
    then
    dup dup cell+ @ cells 2 cells + +
    rot swap !
    dup cell+ dup @ 1+ swap ! ;

: pick3
    rot dup temp! rot rot temp@
    ;

: strdup ( c-addr1 u -- c-addr2 u )
    dup allocate throw   \ c-addr1 u c-addr2
    rot over pick3 move \ u c-addr2
    swap ;

: arrdup ( addr1 u -- addr2 u )
    dup cells allocate throw   \ addr1 u addr2
    rot over pick3 cells move \ u addr2
    swap ;

\ 4 buf-new 1 over buf-append 2 over buf-append buf-count print






\ --------------------------------

(
    struct
        double% field map-key
        cell% field map-data
        cell% field map-left
        cell% field map-right
    end-struct map%
)

0 constant map-key
2 constant map-data
3 constant map-left
4 constant map-right

: map% ( -- align size ) 8 5 ;

: %alloc ( align size -- addr ) swap drop allocate ;


: map-set ( value key-addr key-u map1 -- map2 )
    dup >r
    0= if
        map% %alloc r!
        strdup r@ map-key 2! r@ map-data !
        0 r@ map-left ! 0 r@ map-right !
        r@
    else
        2dup r@ map-key 2@ compare case
            -1 of r@ map-left @ recurse r@ map-left ! r@ endof
            1 of r@ map-right @ recurse r@ map-right ! r@ endof
            2drop r@ map-data ! r@ swap
        endcase
    then
    r> drop ;

: map-find ( key-addr key-u map -- map )
    dup >r
    0= if 0
    else
        2dup r@ map-key 2@ compare case
            -1 of r@ map-left @ recurse endof
            1 of r@ map-right @ recurse endof
            2drop r@ swap
        endcase
    then
    r> drop ;

: map-get ( key-addr key-u map -- ?value not-found? )
    map-find
    ?dup 0= if true
    else map-data @ false then ;

\ : map-iterate ( xt map -- )
\     dup map-left @ ?dup-if 2 pick swap recurse endif
\     dup map-data @ over map-key 2@ 4 pick execute
\     map-right @ ?dup-if recurse else drop endif ;


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


\ map% %alloc drop

\ dup 5 swap map-key + !
\ dup map-key + @ print

variable mymap
map% %alloc drop mymap !

42 s" a" mymap
\ 50 s" b" mymap @ map-set
\ 99 s" c" mymap @ map-set

\ s" a" mymap @ map-get print print
