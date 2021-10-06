# Pax Forth

Pax Consola uses its own version of Forth ("Pax Forth") that it compiles to each target. Forth is a stack-based
language popular in the 80's programming for its powerful abstraction capabilities and low overhead.

Pax Forth is an ahead-of-time compiler, and you can consider it like a 16-bit VM for old CPUs. Its
primary feature, being a stack-based language, are that arithmetic is in reverse polish notation:

```fth
4 6 * print \ this will print "24"
```

Most of the functions in Forth can also be implemented in Forth, including operators:

```forth
\ define a function "*" to multiply two numbers
: * >r 0 r> 0 do over + loop swap drop ;
```

Where possible, expensive functions (like multiplication) are implemented natively in assembly
language. However, Pax Forth is designed to be bootstrapped easily on new platforms and only
requires the implementation of a small number of opcodes. See `ast.rs` for more details.
