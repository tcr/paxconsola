<style>
    #opcodes tr td:nth-child(1) code,
    #opcodes tr td:nth-child(2) code {
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

```fth
( define a function "*" to multiply two numbers )
: * >r 0 r> 0 do over + loop swap drop ;
```

Where possible, expensive functions (like multiplication) are implemented natively in assembly
language. However, Pax Forth is designed to be bootstrapped easily on new platforms and only
requires the implementation of a small number of opcodes. See `ast.rs` for more details.

The Pax Forth opcodes are:

<table id="opcodes">
<tr>
<th>Opcode</th>
<th><a href="https://www.complang.tuwien.ac.at/forth/gforth/Docs-html/Stack_002dEffect-Comments-Tutorial.html">Stack Effect</a></th>
<th>Description</th>
</tr>

<tr>
<td>Drop</td>
<td><code>( reg -- )</code></td>
<td>Removes the top element from the data stack</td>
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
<td>LoadTemp</td>
<td><code>(       -- temp copy )</code></td>
<td>Copies the <code>temp</code> register and pushes it on the data stack.</td>
</tr>

<tr>
<td>StoreTemp</td>
<td><code>( value --       )</code></td>
<td>Overwrites the <code>temp</code> register.</td>
</tr>

<tr>
<td>Add</td>
<td><code>( a b -- result )</code></td>
<td>Pushes <code>a + b</code> onto the data stack.</td>
</tr>

<tr>
<td>Nand</td>
<td><code>( a b -- result )</code></td>
<td>Pushes <code>~(a & b)</code> onto the data stack.</td>
</tr>


<tr>
<td>todo</td>
</tr>
</table>

```
pub enum Pax {
    Drop,

    PushLiteral(PaxLiteral),

    AltPop,
    AltPush,
    LoadTemp,
    StoreTemp,

    // Metadata(String),
    Add,
    Nand,

    Load,
    Load8,
    Store8,
    Store,

    Print,
    Emit,
    Abort,
    Debugger,
}

// Pax opcodes for terminating a block.
#[derive(Debug, PartialEq, Clone, Serialize, Deserialize)]
pub enum PaxTerm {
    Exit,
    Call(String),

    LoopTarget(usize),
    LoopLeave(usize),
    LoopIf0(usize),

    JumpIf0(usize),
    JumpElse(usize),
    JumpTarget(usize),
}
```
