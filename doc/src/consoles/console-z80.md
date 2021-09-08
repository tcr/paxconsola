# Design Notes

## Forth Stack Design

Pushing new value onto the stack could be done using HL-indirect stack access:

```asm
    ld hl, <offset>         \ load offset into hl
    add hl, STACK_START     \ add stack pointer
    ldi a,(hl)
    ld e,a
    ldi a,(hl)
    ld d,a
```

If hl is used as the pointer for the lifetime of the program, this means that adjusting hl can
always follow its position and skip the setup. 

Important is breaking down z80 opcodes into sub-opcodes.

## References

#### Gameboy Opcode Summary

http://gameboy.mongenel.com/dmg/opcodes.html

#### HL-indirect stack access can be cheaper than z80's stack

https://retrocomputing.stackexchange.com/a/8174/9124

> Loading DE by using HL requires.
>> Moving the offest into HL (3B/10C)
>> Adding SP to HL (1B/11C)
>> Loading the first byte (1B/7C),
>> Incrementing HL (1B/6C)
>> Loading the second (1B/7C)
> Now we need 4B/21C for setup and 3B/20C to load the pointer.

#### gbForth pointer usage

Pushing into hl:

```
\ Push hl (TOS) down the stack
dec c \ zero page pointer
ld a, h
ld (c), a
dec c \ zero page pointer
ld a, l
ld (c), a

\ Load a value to hl (TOS)
ld hl, $1234
```

Popping from hl:

```
\ Load TOS to register DE (optional)
ld d, h
ld e, l

\ Move second item to TOS
ld a, (c)
ld l, a
inc C
ld a, (c)
ld h, a,
inc c
```

