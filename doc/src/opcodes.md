# Opcodes

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
