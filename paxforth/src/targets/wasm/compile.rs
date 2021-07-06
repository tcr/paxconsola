use crate::*;
use maplit::*;
use percent_encoding::{utf8_percent_encode, AsciiSet, NON_ALPHANUMERIC};
use petgraph::Direction;

fn name_slug(name: &str) -> String {
    const NON_ALPHA: AsciiSet = NON_ALPHANUMERIC.remove(b'_');
    utf8_percent_encode(name, &NON_ALPHA)
        .to_string()
        .replace("$", "$$")
        .replace("%", "$")
        .to_string()
}

const WAT_TEMPLATE: &'static str = r#"
(module
    (type $t0 (func))
    (type $t1 (func (param i32 i32)))
    (type $t2 (func (param i32) (result i32)))
    (type $t3 (func (param i32)))
    (type $t4 (func (result i32)))

    (import "root" "print" (func $print (type $t2)))
    (import "root" "emit" (func $emit (type $t3)))
    (import "root" "extmem_load" (func $extmem_load (param i32) (result i32)))
    (import "root" "extmem_load_8" (func $extmem_load_8 (param i32) (result i32)))
    (import "root" "extmem_store" (func $extmem_store (param i32) (param i32)))
    (import "root" "extmem_store_8" (func $extmem_store_8 (param i32) (param i32)))

    (func $__wasm_call_ctors (type $t0))

    (func $mem_load (export "mem_load") (type $t2) (param $p0 i32) (result i32)
        get_local $p0
        call $extmem_load)

    (func $mem_load_8 (export "mem_load_8") (type $t2) (param $p0 i32) (result i32)
        get_local $p0
        call $extmem_load_8)

    (func $mem_store (export "mem_store") (type $t1) (param $p0 i32) (param $p1 i32)
        get_local $p0
        get_local $p1
        call $extmem_store)

    (func $mem_store_8 (export "mem_store_8") (type $t1) (param $p0 i32) (param $p1 i32)
        get_local $p0
        get_local $p1
        call $extmem_store_8)

    (func $data_push (export "data_push") (type $t3) (param $p0 i32)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{data_ptr}}
        tee_local $l0
        i32.const 1
        i32.add
        i32.store offset={{data_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{data}}
        i32.add
        get_local $p0
        i32.store16)

    (func $data_pop (export "data_pop") (type $t4) (result i32)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{data_ptr}}
        i32.const -1
        i32.add
        tee_local $l0
        i32.store offset={{data_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{data}}
        i32.add
        i32.load16_s)

    (func $return_push (export "return_push") (type $t3) (param $p0 i32)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{return_ptr}}
        tee_local $l0
        i32.const 1
        i32.add
        i32.store offset={{return_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{return}}
        i32.add
        get_local $p0
        i32.store16)

    (func $return_pop (export "return_pop") (type $t0)
        (local $l0 i32)
        i32.const 0
        i32.const 0
        i32.load offset={{return_ptr}}
        i32.const -1
        i32.add
        tee_local $l0
        i32.store offset={{return_ptr}}
        get_local $l0
        i32.const 1
        i32.shl
        i32.const {{return}}
        i32.add
        i32.load16_s
        call $data_push)

    (func $temp_store (export "temp_store") (type $t3) (param $p0 i32)
        i32.const 0
        get_local $p0
        i32.store16 offset={{temp}})

    (func $temp_load (export "temp_load") (type $t4) (result i32)
        i32.const 0
        i32.load16_s offset={{temp}})

    (func $drop (export "drop") (type $t0)
        i32.const 0
        i32.const 0
        i32.load offset={{data_ptr}}
        i32.const -1
        i32.add
        i32.store offset={{data_ptr}})

    (func $add (export "add") (type $t0)
        call $data_pop
        call $data_pop
        i32.add
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        call $data_push)

    (func $multiply (export "multiply") (type $t0)
        call $data_pop
        call $data_pop
        i32.mul
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        call $data_push)

    (func $nand (export "nand") (type $t0)
        call $data_pop
        call $data_pop
        i32.and
        i32.const -1
        i32.xor
        call $data_push)

    {{functions}}

    (func $main (export "main") (type $t4) (result i32)
        call $fn_main
        i32.const 255)


    (memory $memory (export "memory") 2))

"#;

pub struct WasmForthCompiler {}

impl ForthCompiler for WasmForthCompiler {
    /// Returns a compiled WAT file
    fn compile(program: &PaxProgram) -> String {
        let mut wat_out = vec![];

        for (name, blocks) in program {
            wat_out.push(format!("(func $fn_{} (type $t0)", name_slug(name)));

            let graph = BlockGraph::<()>::from_blocks(&blocks);

            // Iterate over blocks in function.
            let mut wat_block_index = 0;
            let mut wat_block_stack = vec![];
            let mut wat_loop_stack = vec![];
            let mut last_command = None;
            let mut not_jumped_always = hashset![];
            // eprintln!();
            for (block_index, block) in blocks.iter().enumerate() {
                // eprintln!("block[{}]: {:?}", block_index, block);
                // eprintln!();
                let (opcodes, terminator) = block.opcodes_and_terminator();
                for op in opcodes {
                    wat_out.push(format!(";; {:?}", &op.0));
                    match &op.0 {
                        Pax::PushLiteral(lit) => {
                            wat_out.push(format!("    i32.const {}", lit));
                            wat_out.push(format!("    call $data_push"));
                        }
                        Pax::Add => {
                            wat_out.push(format!("    call $add"));
                        }
                        Pax::Nand => {
                            wat_out.push(format!("    call $nand"));
                        }
                        Pax::Drop => {
                            wat_out.push(format!("    call $drop"));
                        }
                        Pax::AltPop => {
                            wat_out.push(format!("    call $return_pop"));
                        }
                        Pax::AltPush => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $return_push"));
                        }
                        Pax::LoadTemp => {
                            wat_out.push(format!("    call $temp_load"));
                            wat_out.push(format!("    call $data_push"));
                        }
                        Pax::StoreTemp => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $temp_store"));
                        }
                        Pax::Load => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $mem_load"));
                            wat_out.push(format!("    call $data_push"));
                        }
                        Pax::Load8 => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $mem_load_8"));
                            wat_out.push(format!("    call $data_push"));
                        }
                        Pax::Store => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $mem_store"));
                        }
                        Pax::Store8 => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $mem_store_8"));
                        }
                        Pax::Print => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $print"));
                            wat_out.push(format!("    drop"));
                        }
                        Pax::Emit => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $emit"));
                        }
                        Pax::Abort => {
                            wat_out.push(format!("    unreachable"));
                            // wat_out.push(format!("    throw 0"));
                        }
                        Pax::Debugger => {
                            // ignore
                        }
                    }
                    wat_out.push(format!(""));
                    // println!("  {:?}", op.0);

                    last_command = Some(op.0.clone());
                }
                {
                    wat_out.push(format!(";; {:?}", &terminator.0));
                    match &terminator.0 {
                        PaxTerm::Exit => {}
                        PaxTerm::Call(ref s) => {
                            wat_out.push(format!("    i32.const {}", 0)); // dummy value
                            wat_out.push(format!("    call $return_push"));
                            wat_out.push(format!("    call $fn_{}", name_slug(s)));
                            wat_out.push(format!("    call $return_pop"));
                            wat_out.push(format!("    call $drop"));
                        }
                        PaxTerm::BranchTarget(ref target_index) => {
                            let incoming = graph
                                .directed_edges_from_node(*target_index + 1, Direction::Incoming);
                            let mut is_loop = false;
                            for edge in &incoming {
                                if edge > target_index {
                                    is_loop = true;
                                }
                            }
                            if is_loop {
                                // Loop start.
                                let id = format!("$L{}", wat_block_index);
                                wat_block_index += 1;

                                wat_loop_stack.push(id.clone());
                                // eprintln!("[LOOP STACK add] {:?}", wat_loop_stack);
                                wat_block_stack.push(id.clone());

                                wat_out.push(format!("    block {}_BLOCK", id));
                                wat_out.push(format!("    loop {}", id));
                            } else if incoming.len() == 2
                                /* Ignore incoming edges that are optimized to jump always */
                                /* This is because WASM requires structured loops */
                                && !not_jumped_always.contains(&block_index)
                            {
                                // End of an if block.
                                wat_out.push(format!("    end"));
                                wat_block_stack.pop().expect("expected end of 'if' block");
                                wat_out.push(format!("    end"));
                                wat_block_stack.pop().expect("expected end of 'else' block");
                            }
                        }
                        PaxTerm::JumpIf0(ref target_index) => {
                            if *target_index > block_index {
                                if let Some(Pax::PushLiteral(0)) = last_command {
                                    // Determine if branch end is the target of multiple targets
                                    let incoming = graph.directed_edges_from_node(
                                        *target_index + 1,
                                        Direction::Incoming,
                                    );
                                    // println!("incoming: {:?}", incoming);
                                    let is_leave = incoming.len() > 2;

                                    if is_leave {
                                        // eprintln!(
                                        //     "[LOOP STACK leave] {:?} - {:?}",
                                        //     wat_block_index, incoming
                                        // );
                                        wat_out.push(format!(";;   (leave)"));
                                        wat_out.push(format!("    call $drop"));

                                        let parent_block = wat_loop_stack.last().unwrap().clone();
                                        wat_out.push(format!("    br {}_BLOCK", parent_block));
                                    } else {
                                        // End of an if block
                                        wat_block_stack.pop().unwrap(); // last_block
                                        let parent_block = wat_block_stack.pop().unwrap();
                                        wat_block_stack.push(parent_block.clone());

                                        wat_out.push(format!(";;   (optimized as JumpAlways)"));
                                        not_jumped_always.insert(block_index + 1);

                                        wat_out.push(format!("    call $drop"));

                                        let next_block = format!("$B{}", wat_block_index);
                                        wat_block_index += 1;

                                        wat_out.push(format!("    br {}", parent_block));
                                        wat_out.push(format!("    end"));
                                        wat_out.push(format!("    block {}", next_block));
                                        wat_block_stack.push(next_block);
                                    }
                                } else {
                                    // Start of an if block
                                    let parent_id = format!("$B{}", wat_block_index);
                                    wat_block_index += 1;
                                    wat_block_stack.push(parent_id.clone());
                                    let if_id = format!("$B{}", wat_block_index);
                                    wat_block_index += 1;
                                    wat_block_stack.push(if_id.clone());

                                    wat_out.push(format!("    block {}", parent_id));
                                    wat_out.push(format!("    block {}", if_id));
                                    wat_out.push(format!("    call $data_pop"));
                                    wat_out.push(format!("    i32.eqz"));
                                    wat_out.push(format!("    br_if {}", if_id));
                                }
                            } else {
                                // End of a loop
                                wat_loop_stack.pop();

                                // eprintln!("[LOOP STACK bye] {:?}", wat_loop_stack);
                                let id = wat_block_stack.pop().unwrap();
                                wat_out.push(format!("    call $data_pop"));
                                wat_out.push(format!("    i32.eqz"));
                                wat_out.push(format!("    br_if {}", id));
                                wat_out.push(format!("    end"));
                                wat_out.push(format!("    end"));
                            }
                        }
                        PaxTerm::JumpAlways(_) => {
                            // Recurse
                            wat_block_stack.pop().unwrap(); // last_block
                            let parent_block = wat_block_stack.pop().unwrap();
                            wat_block_stack.push(parent_block.clone());

                            let next_block = format!("$B{}", wat_block_index);
                            wat_block_index += 1;

                            wat_out.push(format!("    br {}", parent_block));
                            wat_out.push(format!("    end"));
                            wat_out.push(format!("    block {}", next_block));
                            wat_block_stack.push(next_block);
                        }
                    }
                    wat_out.push(format!(""));

                    last_command = None;
                }
            }

            wat_out.push(format!(")"));
            wat_out.push(format!(""));
        }

        let wat_output = WAT_TEMPLATE
            .replace("{{return_ptr}}", "1024")
            .replace("{{data_ptr}}", "1028")
            .replace("{{temp}}", "1032")
            .replace("{{data}}", "2048")
            .replace("{{return}}", "4096")
            .replace("{{mem}}", "10000")
            .replace("{{functions}}", &wat_out.join("\n"));

        // eprintln!("\n\n[WAT]:\n{}\n\n\n", wat_output);

        wat_output
    }
}

impl WasmForthCompiler {
    /// Returns a compiled WebAssembly file (binary, not WAT format)
    pub fn compile_binary(program: &PaxProgram) -> Vec<u8> {
        wat::parse_str(&Self::compile(program)).unwrap()
    }
}
