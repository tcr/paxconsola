( @check 55 )



\ Memory

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
: free ( addr -- wior )
    drop
    0
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














\ Start json.fth




\ JSON error exceptions

999 constant json-parse-error
777 constant json-type-error

\ JSON object type and helpers

0 constant json-type-bool
1 constant json-type-int
2 constant json-type-float
3 constant json-type-string
4 constant json-type-object
5 constant json-type-array

(
struct
    8 16 field json-data
    cell% field json-type
end-struct json%
)

: json-data 0 + ;
: json-type 16 + ;

: json% ( -- align size ) 8 24 ;

: %alloc ( align size -- addr ) swap drop allocate throw ;

variable json-true-val
json% %alloc
dup json-data true swap !
dup json-type json-type-bool swap !
json-true-val !
: json-true json-true-val @ ;

variable json-false-val
json% %alloc
dup json-data false swap !
dup json-type json-type-bool swap !
: json-false json-false-val @ ;

: json-make ( data type -- obj )
    json% %alloc             \ data type obj
    dup json-type rot swap ! \ data obj
    dup json-data rot swap ! ;

: json-2make ( data1 data2 type -- obj )
    json% %alloc             \ data1 data2 type obj
    dup json-type rot swap ! \ data1 data2 obj
    dup json-data 2swap rot 2! ;

\ : json-fmake ( type -- obj ) ( F: data -- )
\     json% %alloc             \ type obj  /  F: data
\     dup json-type rot swap ! \ obj  /  F: data
\     dup json-data f! ;

\ : json-negate ( value -- )
\     dup json-type @ case
\         json-type-int of
\             dup json-data @ negate swap json-data ! endof
\         json-type-float of
\             dup json-data f@ fnegate json-data f! endof
\         json-type-error throw
\     endcase ;

\ recursive-descent JSON parser

: json-getchar ( c-addr1 u1 -- c-addr2 u2 char )
    dup 0<= if json-parse-error throw then
    1- swap dup 1+ -rot c@ ;

: json-?getchar ( c-addr1 u1 -- c-addr2 u2 char )
    dup if json-getchar else -1 then ;

: json-ungetchar ( c-addr1 u1 char -- c-addr2 u2 )
    rot 1- tuck c! swap 1+ ;

: json-parse-number-digits ( c-addr1 u1 -- c-addr2 u2 int )
    json-getchar $30 -                       \ c-addr u num
    dup 0 10 within 0= if json-parse-error throw then
    -rot                                      \ num c-addr u
    begin
        json-?getchar dup $30 $3a within    \ num c-addr u char/-1 flag
    while
        $30 - 3 roll 10 * + -rot
    repeat                                   \ num c-addr u char/-1
    dup 0>= if json-ungetchar else drop then \ num c-addr u
    rot ;

: json-isblank ( char -- flag )
    case
        0x09 of true endof
        0x0a of true endof
        0x0d of true endof
        0x20 of true endof
        false swap
    endcase ;

: json-trim ( c-addr1 u1 -- c-addr2 u2 char )
    begin json-getchar dup json-isblank while drop repeat ;

\ TODO : json-eat-string ( c-addr1 u1 c-addrC uC -- c-addr2 u2 )
\    2over 2over string-prefix? 0= if json-parse-error throw endif
\    nip /string ;

defer json-parse-string
defer json-parse-number
defer json-parse-object
defer json-parse-array

: json-parse-value ( c-addr1 u1 -- c-addr2 u2 value )
    json-trim
    dup 0x30 0x3a within if json-ungetchar json-parse-number
    else
        case
            0x22 of json-parse-string endof
            \ TODO 0x2d of json-parse-number json-negate endof
            0x7b of json-parse-object endof
            0x5b of json-parse-array endof
            \ TODO 0x74 of s" rue" json-eat-string json-true endof
            \ TODO 0x66 of s" alse" json-eat-string json-false endof
            \ TODO 0x6e of s" ull" json-eat-string 0 endof
            json-parse-error throw
        endcase
    then ;

: json-parse-string-escape-hex ( c-addr1 u1 -- c-addr2 u2 char )
    0 4 0 do                                       \ c-addr u num
        -rot json-getchar                           \ num c-addr u char
        dup $30 < if json-parse-error throw then
        dup $30 $3a within if $30 - then
        dup $41 $47 within if $37 - then
        dup $61 $67 within if $57 - then
        dup $30 >= if json-parse-error throw then \ num c-addr u digit
        3 roll 16 * +                               \ c-addr u new-num
    loop ;

: json-parse-string-escape ( c-addr1 u1 -- c-addr2 u2 char )
    json-getchar case
        $22 of $22 endof \   " -> quotation mark
        $5c of $5c endof \   \ -> reverse solidus
        $2f of $2f endof \   / -> solidus
        $62 of $08 endof \   b -> backspace
        $66 of $0c endof \   f -> formfeed
        $6e of $0a endof \   n -> newline
        $72 of $0d endof \   r -> carriage return
        $74 of $09 endof \   t -> horizontal tab
        $75 of json-parse-string-escape-hex endof
        json-parse-error throw
    endcase ;

: json-parse-string-char ( c-addr1 u1 -- c-addr2 u2 char )
    json-getchar
    dup $20 < if json-parse-error throw then
    case
        $22 of -1 endof
        $5c of json-parse-string-escape endof
        dup
    endcase ;

: json-parse-string-body ( c-addr u1 -- c-addr2 u2 str-addr str-u )
    0 buf-new >r
    begin
        json-parse-string-char
        dup 0>=
    while r@ buf-append r! repeat
    drop                 \ c-addr2 u2
    r@ buf-count strdup \ c-addr2 u2 str-addr str-u
    r> free throw
    ;

:noname ( c-addr1 u1 -- c-addr2 u2 string )
    json-parse-string-body json-type-string json-2make ;
is json-parse-string

: json-parse-object-member ( c-addr1 u1 -- c-addr2 u2 value key-addr key-u )
    json-parse-string-body 2swap \ key-addr key-u c-addr c-u
    json-trim 0x3a <> if json-parse-error throw endif
    json-parse-value -rot        \ key-addr key-u value c-addr c-u
    json-trim case
        0x7d of 0x7d json-ungetchar endof
        0x2c of endof            \ , is expected here
        json-parse-error throw   \ something else
    endcase                      \ key-addr key-u value c-addr c-u
    rot 4 roll 4 roll ;

: json-parse-number-digits ( c-addr1 u1 -- c-addr2 u2 int )
    json-getchar 0x30 -                       \ c-addr u num
    dup 0 10 within 0= if json-parse-error throw endif
    -rot                                      \ num c-addr u
    begin
        json-?getchar dup 0x30 0x3a within    \ num c-addr u char/-1 flag
    while
            0x30 - 3 roll 10 * + -rot
    repeat                                    \ num c-addr u char/-1
    dup 0>= if json-ungetchar else drop endif \ num c-addr u
    rot ;

\ : json-parse-number-exp ( c-addr1 u1 -- c-addr2 u2 number ) ( F: mantissa -- )
\     10e0                     \ c-addr u  /  F: mantissa 10e0
\     json-getchar case
\         0x2b of 1e0 endof
\         0x2d of -1e0 endof
\         json-ungetchar 1e0 0
\     endcase                  \ c-addr u  /  F: mantissa 10e0 exp-sign
\     json-parse-number-digits \ c-addr u exp-value  /  F: mantissa 10e0 exp-sign
\     0 d>f f* f** f*          \ c-addr u  /  F: number
\     json-type-float json-fmake ;

\ : json-parse-number-fraction ( int-part c-addr1 u1 -- c-addr2 u2 number )
\     tuck                     \ int-part u1 c-addr u
\     json-parse-number-digits \ int-part u1 c-addr u frac-part
\     -rot dup 4 roll swap -   \ int-part frac-part c-addr u frac-len
\     10e0 0 d>f fnegate f**   \ int-part frac-part c-addr u  /  F: multiplier
\     rot 0 d>f f*             \ int-part c-addr u  /  F: frac-part
\     rot 0 d>f f+             \ c-addr u  /  F: number
\     json-?getchar
\     dup 0x45 = over 0x65 = or if drop json-parse-number-exp exit endif
\     dup 0>= if json-ungetchar else drop endif
\     json-type-float json-fmake ;

:noname ( c-addr1 u1 -- c-addr2 u2 number )
    json-parse-number-digits \ -rot
    \ json-?getchar dup case
    \     0x2e of drop json-parse-number-fraction exit endof
    \     0x45 of drop rot 0 d>f json-parse-number-exp exit endof
    \     0x65 of drop rot 0 d>f json-parse-number-exp exit endof
    \ endcase
    \ dup 0>= if json-ungetchar else drop endif
    \ rot
    json-type-int json-make ;
is json-parse-number

:noname ( c-addr1 u1 -- c-addr2 u2 object )
    0 >r
    begin json-trim dup 0x7d <>
    while
            0x22 <> if json-parse-error throw endif
            json-parse-object-member  \ c-addr u value key-addr key-u
            over 3 roll 3 roll 3 roll \ c-addr u key-addr value key-addr key-u
            r@ map-set r!        \ c-addr u key-addr
            free throw
    repeat
    drop r> json-type-object json-make ;
is json-parse-object

:noname ( c-addr1 u1 -- c-addr2 u2 array )
    0 cellbuf-new >r
    begin json-trim dup 0x5d <>
    while
            json-ungetchar json-parse-value \ c-addr u value
            r@ cellbuf-append r!       \ c-addr u
            json-trim case
                0x5d of 0x5d json-ungetchar endof
                0x2c of endof
                json-parse-error throw
            endcase
    repeat
    drop
    r@ buf-count arrdup json-type-array json-2make
    r> free throw ;
is json-parse-array



\ New test taht stuff

\ s" 420" json-parse-number-digits print
\ s" apple\\bees\" no thanks" 2dup type cr json-parse-string-body print print print print

s" \"beta\": \"str\", \"arr\": [1, 2, 99], \"nested\": {\"b\": \"sure\"}, \"a\": 55}" json-parse-object @ json-data \ print print print
variable mymap
mymap !

mymap @
s" a" rot map-get throw json-data @ print
mymap @
s" beta" rot map-get throw json-data 2@ type cr
mymap @
s" arr" rot map-get throw json-data 2@ print 4 + @ @ print
