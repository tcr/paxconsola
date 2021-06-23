
(
struct
    double% field map-key
    cell% field map-data
    cell% field map-left
    cell% field map-right
end-struct map%
)

variable HEAP_OFFSET

variable HEAP_BASE
1000 cells allot


\ Implement a simple bump allocator with no failsafe
: allocate ( u -- a-addr wior )
    HEAP_BASE HEAP_OFFSET @ + swap
    HEAP_OFFSET @ + HEAP_OFFSET !
    0
    ;

0 constant map-key
2 constant map-data
3 constant map-left
4 constant map-right

: map% ( -- align size ) 8 5 ;

: %alloc ( align size -- addr ) swap drop allocate ;

map% %alloc drop

dup 5 swap map-key + !
dup map-key + @ print

7 begin
    dup 6 = if 0 print leave then
    dup 7 = if 1 print leave then
    ( default ) 2 print
    0
until

\ 7 case
\     6 of 0 print endof
\     7 of 1 print endof
\     \ ( default ) 2 print
\ endcase

\ 7
\ dup 6 = if
\     0 print
\ else
\     dup 7 = if
\         1 print
\     else
\         dup 2 print
\     then
\ then
\ drop
