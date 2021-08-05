<style>
    .opcodes tr td:nth-child(1),
    .opcodes tr td:nth-child(2) code {
        white-space: pre;
    }
</style>

# Introduction

Pax Consola is a development environment for games that run on vintage computers and video game
consoles.

Using the online IDE at http://paxconsola.com, you can write a game that runs on a bunch of many
early home computers and consoles at once. Currently Pax Consola makes it easy to write a game for
these platforms:

* Commodore 64
* Gameboy
* DOS (PLANNED)
* Apple ][ (PLANNED)
* Atari 2600 (PLANNED)

Pax Consola also supports an in-browser environment targeting WebAssembly.

## Coding with Pax Forth

Pax Consola uses its own version of Forth ("Pax Forth") that it compiles to each target. Forth is a stack-based
language popular in the 80's programming for its powerful abstraction capabilities and low overhead.

Pax Forth is an ahead-of-time compiler, and you can consider it like a 16-bit VM for old CPUs. Its
primary feature, being a stack-based language, are that arithmetic is in reverse polish notation:

```fth
4 6 * print ( this will print "24")
```

Most of the functions in Forth can also be implemented in Forth, including operators:

```forth
( define a function "*" to multiply two numbers )
: * >r 0 r> 0 do over + loop swap drop ;
```

Where possible, expensive functions (like multiplication) are implemented natively in assembly
language. However, Pax Forth is designed to be bootstrapped easily on new platforms and only
requires the implementation of a small number of opcodes. See `ast.rs` for more details.

Every function consists of a list of blocks, with each block consisting of <i>opcodes</i> and each
block ending with a <i>terminator opcode</i>.

The opcodes all operate on 16-bit values. They are:

<table class="opcodes">
<tr>
<th>Opcode</th>
<th><a href="https://www.complang.tuwien.ac.at/forth/gforth/Docs-html/Stack_002dEffect-Comments-Tutorial.html">Stack Effect</a></th>
<th>Description</th>
</tr>

<tr>
<td>Drop</td>
<td><code>( reg -- )</code></td>
<td>Removes the top value from the data stack</td>
</tr>

<tr>
<td><nobr>PushLiteral( <b>literal</b> )</nobr></td>
<td><code>( -- literal )</code></td>
<td>Pushes <b>literal</b> to the top of the data stack.</td>
</tr>

<tr>
<td>AltPop</td>
<td><code>(          -- value )</code><br><code>( R: value --       )</code></td>
<td>Pops a value from the return stack.</td>
</tr>

<tr>
<td>AltPush</td>
<td><code>(    value --       )</code><br><code>( R:       -- value )</code></td>
<td>Pushes a value onto the return stack.</td>
</tr>

<tr>
<td>Add</td>
<td><code>( a b -- added  )</code></td>
<td>Pushes <code>a + b</code> onto the data stack.</td>
</tr>

<tr>
<td>Nand</td>
<td><code>( a b -- nanded )</code></td>
<td>Pushes <code>~(a & b)</code> onto the data stack.</td>
</tr>

<tr>
<td>TempLoad</td>
<td><code>(       -- temp-copy )</code></td>
<td>Copies the <code>temp</code> register and pushes it on the data stack.</td>
</tr>

<tr>
<td>TempStore</td>
<td><code>( value --           )</code></td>
<td>Overwrites the <code>temp</code> register with <code>value</code>.</td>
</tr>

<tr>
<td>Load</td>
<td><code>( address -- value )</code></td>
<td>Loads a <code>value</code> from the memory <code>address</code> and pushes it on the data stack.</td>
</tr>

<tr>
<td>Load8</td>
<td><code>( address -- value )</code></td>
<td>Loads a <code>value</code> from the memory <code>address</code> and pushes it on the data stack. The loaded value is truncated to 8 bits.</td>
</tr>

<tr>
<td>Store</td>
<td><code>( value address -- )</code></td>
<td>Stores the <code>value</code>at the memory <code>address</code>.</td>
</tr>

<tr>
<td>Store8</td>
<td><code>( value address -- )</code></td>
<td>Stores the <code>value</code> at the memory <code>address</code>. The value written to the address is truncated to 8 bits.</td>
</tr>

<tr>
<td>Print</td>
<td><code>( value -- )</code></td>
<td>Prints <code>value</code> as a number followed by a newline to the console (if available).</td>
</tr>

<tr>
<td>Emit</td>
<td><code>( value -- )</code></td>
<td>Prints the ASCII character <code>value</code> to the console (if available).</td>
</tr>

<tr>
<td>Abort</td>
<td><code>( -- )</code></td>
<td>Terminates the program immediately.</td>
</tr>

<tr>
<td>Debugger</td>
<td><code>( -- )</code></td>
<td>Pauses the program if in a debugging session, otherwise ignored.</td>
</tr>

</table>

The terminator opcodes are:

<table class="opcodes">
<tr>
<th>Opcode</th>
<th><a href="https://www.complang.tuwien.ac.at/forth/gforth/Docs-html/Stack_002dEffect-Comments-Tutorial.html">Stack Effect</a></th>
<th>Description</th>
</tr>

<tr>
<td>Exit</td>
<td><code>( -- )</code></td>
<td>Return from a function or program to its caller.</td>
</tr>


<tr>
<td>Call( <b>identifier</b> )</td>
<td><code>( .. -- .. )</code></td>
<td>Invoke a function by its identifier. The callee may modify the data and return stacks.</td>
</tr>

<tr>
<td>LoopTarget( <b>block</b> )</td>
<td><code>( -- )</code></td>
<td>Begin a loop, starting with the subsequent block.</td>
</tr>

<tr>
<td>LoopLeave( <b>block</b> )</td>
<td><code>( -- )</code></td>
<td>Jump to the end of the loop and exit it.</td>
</tr>

<tr>
<td>LoopIf0( <b>block</b> )</td>
<td><code>( cond -- )</code></td>
<td>If cond is equal to 0, loop back to the <code>LoopTarget</code> located at <code>block</code>.</td>
</tr>

<tr>
<td>JumpIf0( <b>block</b> )</td>
<td><code>( cond -- )</code></td>
<td>If <code>cond</code> is equal to 0, control proceeds to the next block. If not, control proceeds to the next <code>JumpElse<code>, or </code>JumpTarget</code> if there is no "else" condition. </td>
</tr>

<tr>
<td>JumpElse( <b>block</b> )</td>
<td><code>( -- )</code></td>
<td>Begin the "else" condition of an "if" block.</td>
</tr>

<tr>
<td>JumpTarget( <b>block</b> )</td>
<td><code>( -- )</code></td>
<td>Ends an "if" block.</td>
</tr>

</table>


## 6502 Target (C64)

This target implements the following:

* Y register is TOS (low byte)
* A register is TOS (high byte)
* X register is Return Stack pointer

The stacks are as follows:

* Data stack is stored on system stack (using pha/pla)
* Return stack is stored in zero page (using lda $00,x)
