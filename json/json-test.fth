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
: free ( addr -- )
    drop
    ;






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
    0 buf-new { buf }
    begin
        json-parse-string-char
        dup 0>=
    while buf buf-append to buf repeat
    drop                 \ c-addr2 u2
    buf buf-count strdup \ c-addr2 u2 str-addr str-u
    buf free throw ;

: json-type-string ( c-addr1 u1 -- c-addr2 u2 string )
    json-parse-string-body json-type-string json-2make ;

s" 420" json-parse-number-digits print
s" \"applebees\"" json-type-string
