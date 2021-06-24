( @check Hi )

variable c_addr
32 cells allot

c_addr
dup $48 swap ! 1+
dup $69 swap ! 1+
dup $0D swap ! 1+
dup $0A swap ! 1+
dup $00 swap ! 1+
drop

: mytype ( c-addr u -- )
    0
    do
        dup i + @ emit
    loop
    ;

c_addr 4 mytype
