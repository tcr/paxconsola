## 6502 Target (C64)

This target implements the following:

* Y register is TOS (low byte)
* A register is TOS (high byte)
* X register is Return Stack pointer

The stacks are as follows:

* Data stack is stored using processor stack (using pha/pla)
  * This allows fast access via dedicated opcodes
* Return stack is stored in zero page (using lda $00,x)


## Optimization

Pre-cross compilation:

* Function inlining (global setting)
* Discard unused stack values
* Inline constants / propagate stack values

Post-cross compilation

* Per-target function implementations (TODO)
* Per-target peephole optimizations (TODO)
* Indexing into stack (TODO)
* 8-bit value culling

TODO: Can a target be redirected between stack OR zero page, to migrate C64 instructions over?

TODO: Can a target debugger be used to test a "test" program? In all configurations? Can this
be a mega CI test? Or a local bisect test?
