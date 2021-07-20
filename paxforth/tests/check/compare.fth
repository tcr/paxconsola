( @check 0 0 -1 1 -1 1 1 -1 )

: compare ( c-addr1 u1 c-addr2 u2 -- n )
    begin
        rot
        2dup
        or 0= if
            drop 0
            1
        else
            dup 0= if drop -1
            1
            else
                over 0= if drop 1
                1
                else                    ( c-addr1 c-addr2 u2 u1 )
                    >r >r               ( c-addr1 c-addr2 )
                    2dup @ swap @       ( c-addr1 c-addr2 c2 c1 )
                    -                   ( c-addr1 c-addr2 [c2 - c1] )
                    dup 0< if
                        \ less than 1
                        drop
                        r> r>
                        drop
                        1
                        1
                    else if
                            \ more than 1
                            r> r>
                            drop
                            -1
                            1
                        else
                            \ loop
                            1+ swap 1+ swap
                            r> 1- r> 1-
                            rot rot
                            0
                        then
                    then
                then
            then
        then
    until
    swap drop
    swap drop
    swap drop
    ;

s" " s" " compare print
s" abdde" s" abdde" compare print
s" abcde" s" abdde" compare print
s" abdde" s" abcde" compare print
s" abcde" s" abcdef" compare print
s" abcdef" s" abcde" compare print
s" abc" s" aBc" compare print
s" aBc" s" abc" compare print
