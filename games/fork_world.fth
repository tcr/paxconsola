( @engine taurus )

\ Fork: Not quite Zork

\ struct
\     double% field object-name
\     cell% field object-parent
\     cell% field object-sibling
\     cell% field object-child
\     cell% field object-attributes
\ end-struct object%

: object-name 0 + ;
: object-parent 4 + ;
: object-sibling 6 + ;
: object-child 8 + ;
: object-attributes 10 + ;

12 constant object-cells

: object% ( -- align size ) 8 object-cells ;

variable prso_var
variable prsi_var
variable prsa_var

: prso prso_var @ ;
: prso-name ( -- name-addr name-u ) prso object-name 2@ ;

: prsi prsi_var @ ;
: prsi-name ( -- name-addr name-u ) prsi object-name 2@ ;

: prsa prsa_var @ ;


\ Setup verbs
100 constant v-take
101 constant v-inventory
102 constant v-look


\ Setup attributes
1 constant a-takeable




\ test

\ 0 prsi_var !
\ 44 s" parent" prsi map-set prsi_var !

: link-sibling ( child sibling -- )
    dup object-sibling @ if object-sibling @ link-sibling else object-sibling ! then
    ;

: detach-child ( parent child -- )
    dup object-parent @ swap            ( parent old-parent child )
    over object-child @ over            ( parent old-parent child old-parent-child child )
    = if
        \ clear child entry
        dup object-sibling @            ( parent old-parent child child-sibling )
        swap 0 swap object-sibling !    ( parent old-parent child-sibling )
        swap object-child !
        drop
    else
        ." TODO: DETACH CHILD" cr
        2drop
    then
    ;

: object-move ( parent child -- )
    dup object-parent @ if 2dup detach-child then   ( parent child )
    2dup object-parent !                            ( parent child )
    over object-child @                             ( parent child parent-child )
    dup if link-sibling drop
    else drop swap object-child ! then
    ;

: object-is-parent ( parent child -- flag )
    object-parent @  ( parent child-parent )
    =
    ;


\ Setup "Living Room"
variable r-living-room
12 cells allot
s" Living Room" r-living-room object-name 2!


\ Set current room location
variable r-current-var
r-living-room r-current-var !
: r-current r-current-var @ ;


\ Setup player
variable o-player
12 cells allot
s" you" o-player object-name 2!


\ Setup crowbar
variable o-crowbar
12 cells allot
s" crowbar" o-crowbar object-name 2!
a-takeable o-crowbar object-attributes !

\ Move crowbar into room.
r-current o-crowbar object-is-parent if throw then
r-current o-crowbar object-move
r-current o-crowbar object-is-parent if else throw then

: act-on-crowbar
    \ ." ACTING ON CROWBAR, skipping\n"
    \ DO nothing for now
    false
    ;

\ Setup chest
variable o-chest
12 cells allot
s" chest" o-chest object-name 2!

\ Move chest into room.
r-current o-chest object-move

\ Object lookups

: act-object ( object -- )
    case
        o-crowbar of act-on-crowbar endof
        false swap
    endcase
    ;

: lookup-object ( name-addr name-u -- object )
    case
        2dup s" chest" compare 0= ?of o-chest endof
        2dup s" crowbar" compare 0= ?of o-crowbar endof
        drop 0 swap
    endcase
    ;

100 constant t-look
101 constant t-take
102 constant t-inventory

: lookup-token ( name-addr name-u -- object )
    case
        2dup s" look" compare 0= ?of t-look endof
        2dup s" take" compare 0= ?of t-take endof
        2dup s" inv" compare 0= ?of t-inventory endof
        2dup s" inventory" compare 0= ?of t-inventory endof
        drop 0 swap
    endcase
    ;


\ Verbs

: verb-take ( -- success )
    case
        \ no direct object
        prso 0= ?of
            ." What do you want to take?" true
        endof
        \ parent is player
        prso object-parent @ o-player = ?of
            ." You already possess the " prso-name type ." ." cr true
        endof
        \ not in room
        prso object-parent @ r-current <> ?of
            ." There is no " prso-name type ."  here." cr true
        endof
        \ not takeable
        prso object-attributes @ a-takeable and 0= ?of
            ." You can't take the " prso-name type ." ." cr true
        endof

        \ Move object to player
        o-player prso object-move
        ." Took the " prso-name type ." ." cr
        true dup
    endcase
    ;

: print-siblings ( sibling -- )
    dup object-name 2@ ."    " type cr
    object-sibling @ dup if print-siblings else drop then
    ;

: verb-inventory ( -- success )
    o-player object-child @ if 
        ." Your inventory contains:" cr
        o-player object-child @ print-siblings
        true
    else
        ." Your inventory is empty." cr
        true
    then
    ;

: verb-look ( -- success )
    r-current object-child @ if 
        ." The room contains:" cr
        r-current object-child @ print-siblings
        true
    else
        ." The room is empty." cr
        true
    then
    ;





\ Actions

: act-verb ( verb -- )
    case
        v-take of verb-take endof
        v-inventory of verb-inventory endof
        v-look of verb-look endof
        false swap
    endcase
    ;

: act-player 
    false
    ;

: act-prsa
    prsa if
        prsa act-verb
    else false then
    ;

: act-prso
    prso if
        prso act-object
    else false then
    ;

: act-prsi
    prsi if
        ." TODO: indirect action" cr
        true
    else false then
    ;

: perform-input
    begin
        act-player if leave then
        act-prsi if leave then
        act-prso if leave then
        act-prsa if leave then
        ." I don't understand what you are trying to do." cr
        true
    until
    cr
    ;


." Welcome to Fork!" cr cr
." What do you do?" cr cr

." > look" cr
v-look prsa_var !
0 prso_var !
0 prsi_var !
perform-input

\ Buffer for reading input
variable read-input-len
variable read-input
255 cells allot

: char-is-whitespace ( char -- flag )
    case
        0x09 of true endof
        0x0a of true endof
        0x0d of true endof
        0x20 of true endof
        false swap
    endcase ;

: char-is-not-whitespace ( char -- flag )
    case
        0x09 of false endof
        0x0a of false endof
        0x0d of false endof
        0x20 of false endof
        true swap
    endcase ;

: str-left-trim ( c-addr1 u1 -- c-addr2 u2 )
    begin dup 0= if leave then
        over c@ char-is-whitespace
    while
        1- swap 1+ swap
    repeat
    ;

: str-next-whitespace ( c-addr1 u1 -- c-addr2 u2 )
    begin dup 0= if leave then
        over c@ char-is-not-whitespace
    while
        1- swap 1+ swap
    repeat
    ;

\ Truncate the length to be only this word
: str-truncate-word ( c-addr1 u1 -- c-addr1 u2)
    2dup str-next-whitespace
    swap drop -
    ;

variable current-word
2 cells allot

: next-frame
    ." > "
    read-input 255 accept read-input-len !

    read-input read-input-len @ str-left-trim str-truncate-word
    current-word 2!

    current-word 2@ lookup-object
    dup if
        prso_var !
        v-take prsa_var !
        0 prsi_var !
        perform-input
    else
        current-word 2@ lookup-token
        dup case
            t-inventory of 
                v-inventory prsa_var !
                0 prso_var !
                0 prsi_var !
                perform-input
            endof
            t-look of 
                v-look prsa_var !
                0 prso_var !
                0 prsi_var !
                perform-input
            endof
            ." I don't understand \"" read-input read-input-len @ type ." \"." cr cr
        endcase
    then
    ;

next-frame
