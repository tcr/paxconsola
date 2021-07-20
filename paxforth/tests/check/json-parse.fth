( @check 420 )

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
        $30 - 3roll 10 * + -rot
    repeat                                   \ num c-addr u char/-1
    dup 0>= if json-ungetchar else drop then \ num c-addr u
    rot ;

s" 420" json-parse-number-digits print
