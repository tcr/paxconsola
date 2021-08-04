
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
: move ( addr1 addr2 u -- : copy u words of memory from 'addr1' to 'addr2' )
    >r swap r>
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
    >r >r >r dup temp! r> r> r> temp@
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

: map-key 0 + ;
: map-data 2 + ;
: map-left 3 + ;
: map-right 4 + ;

: map% ( -- align size ) 8 5 ;

: %alloc ( align size -- addr ) swap drop allocate throw ;


: map-set ( value key-addr key-u map1 -- map2 )
    dup >r
    0= if
        map% %alloc r!
        strdup r@ map-key 2! r@ map-data !
        0 r@ map-left ! 0 r@ map-right !
        r@
    else
        2dup r@ map-key 2@ compare case
            -1 of r@ map-left @ map-set r@ map-left ! r@ endof
            1 of r@ map-right @ map-set r@ map-right ! r@ endof
            2drop r@ map-data ! r@ swap
        endcase
    then
    r> drop
    ;

: map-find ( key-addr key-u map -- map )
    dup >r
    0= if 2drop 0 r> drop
    else
        2dup r@ map-key 2@ compare case
            -1 of r@ map-left @ map-find endof
            1 of r@ map-right @ map-find endof
            2drop r@ swap
        endcase
        r> drop
    then
    ;

: map-get ( key-addr key-u map -- ?value not-found? )
    map-find
    ?dup 0= if true
    else map-data @ false then ;

\ : map-iterate ( xt map -- )
\     dup map-left @ ?dup-if 2 pick swap recurse endif
\     dup map-data @ over map-key 2@ 4 pick execute
\     map-right @ ?dup-if recurse else drop endif ;

variable map_loc

5 s" test" map_loc @ map-set map_loc !
44 s" a" map_loc @ map-set map_loc !
s" test" map_loc @ map-get print print
s" TEST" map_loc @ map-get print print
s" a" map_loc @ map-get print print
