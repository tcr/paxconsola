// http://www.forth.org/fd/FD-V13N6.pdf
// See "Pygmy" code reference

// use SP for data until you need ret values, then exchange
// seems faster than alternative? always counts down though

// Load
"""
mov bx,[bx]
"""

// Load8
"""
mov bx,[bx]
xor bh,bh
"""

// Store
"""
pop ax
mov [bx],ax
pop bx
"""

// Store8
"""
pop ax
mov [bx],al
pop bx
"""

// PushLiteral
"""
push bx
mov bx,{}
"""

// +
"""
pop ax
add bx,ax
"""

// nand
"""
pop ax
add bx,ax
not bx,bx
"""

// AltPush
"""
xchg sp,bp
push bx
xchg sp,bp
pop bx
"""

// AltPop
"""
push bx
xchg sp,bp
pop bx
xchg sp,bp
"""

// Drop
"""
pop bx
"""
