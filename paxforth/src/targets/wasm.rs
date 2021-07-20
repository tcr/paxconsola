use crate::analyze::walker::*;
use crate::*;

const WAT_TEMPLATE: &'static str = include_str!("wasm_template.wat");

/**
 * A struct that implements PaxWalker and can return
 * a WAT-compiled version of our Forth code with its field `buffer`.
 */
pub struct WasmForthCompilerWalker {
    buffer: String,
}

impl WasmForthCompilerWalker {
    fn new() -> WasmForthCompilerWalker {
        WasmForthCompilerWalker {
            buffer: String::new(),
        }
    }

    fn push(&mut self, string: &str) {
        self.buffer.push_str(string);
        self.buffer.push_str("\n");
    }
}

/**
 * Implements `opcode()` and `terminator()` for PaxWalker.
 */
impl PaxWalker for WasmForthCompilerWalker {
    fn opcode(&mut self, op: &Located<Pax>, _stack: &[WalkerLevel]) {
        self.push(&format!(";; {:?}", &op.0));
        match &op.0 {
            Pax::PushLiteral(lit) => {
                self.push(&format!("    i32.const {}", lit));
                self.push(&format!("    call $data_push"));
            }
            Pax::Add => {
                self.push(&format!("    call $add"));
            }
            Pax::Nand => {
                self.push(&format!("    call $nand"));
            }
            Pax::Drop => {
                self.push(&format!("    call $drop"));
            }
            Pax::AltPop => {
                self.push(&format!("    call $return_pop"));
            }
            Pax::AltPush => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $return_push"));
            }
            Pax::LoadTemp => {
                self.push(&format!("    call $temp_load"));
                self.push(&format!("    call $data_push"));
            }
            Pax::StoreTemp => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $temp_store"));
            }
            Pax::Load => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $mem_load"));
                self.push(&format!("    call $data_push"));
            }
            Pax::Load8 => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $mem_load_8"));
                self.push(&format!("    call $data_push"));
            }
            Pax::Store => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $mem_store"));
            }
            Pax::Store8 => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $mem_store_8"));
            }
            Pax::Print => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $print"));
                self.push(&format!("    drop"));
            }
            Pax::Emit => {
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    call $emit"));
            }
            Pax::Abort => {
                self.push(&format!("    unreachable"));
                // self.push(&format!("    throw 0"));
            }
            Pax::Debugger => {
                // ignore
            }
        }
        self.push(&format!(""));
    }

    fn terminator(
        &mut self,
        terminator: &Located<PaxTerm>,
        current: &WalkerLevel,
        _stack: &[WalkerLevel],
    ) {
        self.push(&format!(";; {:?}", &terminator.0));
        match &terminator.0 {
            PaxTerm::Exit => {}
            PaxTerm::Call(ref s) => {
                self.push(&format!("    i32.const {}", 0)); // dummy value
                self.push(&format!("    call $return_push"));
                self.push(&format!("    call $fn_{}", name_slug(s)));
                self.push(&format!("    call $return_pop"));
                self.push(&format!("    call $drop"));
            }

            /* branches */
            PaxTerm::JumpIf0(_target_index) => {
                let index = current.to_block();
                // Start of an "if" block
                let parent_id = format!("$B{}_outer", index);
                let if_id = format!("$B{}_if", index);

                self.push(&format!("    block {}", parent_id));
                self.push(&format!("    block {}", if_id));
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    i32.eqz"));
                self.push(&format!("    br_if {}", if_id));
            }
            PaxTerm::JumpElse(_) => {
                let index = current.to_block();

                // Start of an "else" block
                let parent_block = format!("$B{}_outer", index);
                let next_block = format!("$B{}", index);

                self.push(&format!("    br {}", parent_block));
                self.push(&format!("    end"));
                self.push(&format!("    block {}", next_block));
            }
            PaxTerm::JumpTarget(_) => {
                // End of an "if" or "else" block
                self.push(&format!("    end"));
                self.push(&format!("    end"));
            }

            /* loops */
            PaxTerm::LoopTarget(_) => {
                let index = current.to_loop();

                // Loop start.
                let parent_id = format!("$L{}_outer", index);
                let loop_id = format!("$L{}", index);

                self.push(&format!("    block {}", parent_id));
                self.push(&format!("    loop {}", loop_id));
            }
            PaxTerm::LoopIf0(_) => {
                let index = current.to_loop();

                let loop_id = format!("$L{}", index);

                // eprintln!("[LOOP STACK bye] {:?}", wat_loop_stack);
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    i32.eqz"));
                self.push(&format!("    br_if {}", loop_id));
                self.push(&format!("    end"));
                self.push(&format!("    end"));
            }
            PaxTerm::LoopLeave(_) => {
                let index = current.to_loop();

                let parent_id = format!("$L{}_outer", index);

                self.push(&format!(";;   (leave)"));
                self.push(&format!("    br {}", parent_id));
            }
        }
        self.push(&format!(""));
    }
}

/**
 * Struct that compiles PaxProgram to WAT format.
 */
pub struct WasmForthCompiler {}

impl ForthCompiler for WasmForthCompiler {
    /// Returns a compiled WAT file
    fn compile(program: &PaxProgram) -> String {
        let mut walker = WasmForthCompilerWalker::new();

        for (name, blocks) in program {
            walker.push(&format!("(func $fn_{} (type $t0)", name_slug(name)));

            structured_walk(&mut walker, blocks);

            walker.push(&format!(")"));
            walker.push(&format!(""));
        }

        WAT_TEMPLATE
            // 4 byte variable definition (return pointer)
            .replace("{{return_ptr}}", "1024")
            // 4 byte variable definition (data pointer)
            .replace("{{data_ptr}}", "1028")
            // 4 byte variable definition (temp pointer)
            .replace("{{temp}}", "1032")
            // Data stack
            .replace("{{data}}", "2048")
            // Alt stack
            .replace("{{return}}", "4096")
            // RAM space
            .replace("{{mem}}", "10000")
            // Functions declared in WASM
            .replace("{{functions}}", &walker.buffer)
    }
}
