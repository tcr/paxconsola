( @check 0 -1 -1 0 0 )



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

\ 4 buf-new 1 over buf-append 2 over buf-append buf-count print











999 constant json-parse-error

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

: buf-new ( size -- buf )
    dup 0= if drop 16 then
    dup 2 cells + allocate throw \ size buf
    dup rot swap !               \ buf
    0 over cell+ ! ;

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

s" 420" json-parse-number-digits print
s" apple\\bees\" no thanks" 2dup type cr json-parse-string-body print print print print
