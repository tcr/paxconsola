variable initialized

: initialize ;

\ Initialize only once
initialized @ 0= if initialize then
1 initialized !
