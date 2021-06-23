( @check 5 )

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
