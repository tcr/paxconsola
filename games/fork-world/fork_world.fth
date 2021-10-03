\ Fork: Not quite Zork

(
    struct
        double% field object-name
        cell% field object-parent
        cell% field object-sibling
        cell% field object-child
        cell% field object-attributes
    end-struct object%
)

: object-name 0 + ;
: object-parent 2 + ;
: object-sibling 3 + ;
: object-child 4 + ;
: object-attributes 5 + ;

6 constant object-cells

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
        ." TODO: DETACH CHILD\n"
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
6 cells allot
s" Living Room" r-living-room object-name 2!

\ Set current room location
variable r-current-var
r-living-room r-current-var !
: r-current r-current-var @ ;

\ Setup player
variable o-player
6 cells allot
s" you" o-player object-name 2!


\ Setup crowbar
variable o-crowbar
6 cells allot
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
6 cells allot
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

: object-lookup ( name-addr name-u -- object )
    case
        2dup s" chest" compare 0= ?of o-chest endof
        2dup s" crowbar" compare 0= ?of o-crowbar endof
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
            ." You already possess the " prso-name type ." .\n" true
        endof
        \ not in room
        prso object-parent @ r-current <> ?of
            ." There is no " prso-name type ."  here.\n" true
        endof
        \ not takeable
        prso object-attributes @ a-takeable and 0= ?of
            ." You can't take the " prso-name type ." .\n" true
        endof

        \ Move object to player
        o-player prso object-move
        ." Took the " prso object-name 2@ type ." .\n"
        true dup
    endcase
    ;

: print-siblings ( sibling -- )
    dup object-name 2@ ."    " type cr
    object-sibling @ dup if print-siblings else drop then
    ;

: verb-inventory ( -- success )
    o-player object-child @ if 
        ." Your inventory contains:\n"
        o-player object-child @ print-siblings
        true
    else
        ." Your inventory is empty.\n"
        true
    then
    ;

: verb-look ( -- success )
    r-current object-child @ if 
        ." The room contains:\n"
        r-current object-child @ print-siblings
        true
    else
        ." The room is empty.\n"
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
        ." TODO: indirect action\n"
        true
    else false then
    ;

: perform-input
    begin
        act-player if leave then
        act-prsi if leave then
        act-prso if leave then
        act-prsa if leave then
        ." I don't understand what you are trying to do.\n"
        1
    until
    cr
    ;




." Welcome to Fork!\n\n"
." What do you do?\n\n"

." > inventory\n"
v-inventory prsa_var !
0 prso_var !
0 prsi_var !
perform-input


." > take crowbar\n"
v-take prsa_var !
o-crowbar prso_var !
0 prsi_var !
perform-input

\ assert
r-current o-crowbar object-is-parent if throw then
o-player o-crowbar object-is-parent if else throw then

." > take crowbar\n"
v-take prsa_var !
o-crowbar prso_var !
0 prsi_var !
perform-input

." > take chest\n"
v-take prsa_var !
o-chest prso_var !
0 prsi_var !
perform-input

." > inventory\n"
v-inventory prsa_var !
0 prso_var !
0 prsi_var !
perform-input

." > look\n"
v-look prsa_var !
0 prso_var !
0 prsi_var !
perform-input
