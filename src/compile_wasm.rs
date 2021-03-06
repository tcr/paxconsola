pub use crate::wasm::*;
use crate::*;
use petgraph::{graph::NodeIndex, Direction};

const WAT_TEMPLATE: &'static str = r#"
(module
    (type $t0 (func))
    (type $t1 (func (param i32 i32)))
    (type $t2 (func (param i32) (result i32)))
    (type $t3 (func (param i32)))
    (type $t4 (func (result i32)))

    (import "root" "print" (func $print (type $t2)))
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


    (func $main (export "main") (type $t4) (result i32)
        {{main}}
        i32.const 255)


    (memory $memory (export "memory") 2))
  
"#;

/// Returns a compiled WebAssembly file (binary, not WAT format)
pub fn cross_compile_forth_wasm(program: &SuperPaxProgram) -> Vec<u8> {
    let mut wat_out = vec![];
    for (name, blocks) in program {
        if name != "main" {
            continue;
        }

        let graph = crate::dataflow_graph(&blocks);
        eprintln!("graph {:?}", graph);

        let mut wat_block_index = 0;
        let mut wat_block_stack = vec![];
        for (block_index, block) in blocks.iter().enumerate() {
            for op in block.commands() {
                wat_out.push(format!(";; {:?}", &op.0));
                match &op.0 {
                    SuperPax::PushLiteral(lit) => {
                        wat_out.push(format!("    i32.const {}", lit));
                        wat_out.push(format!("    call $data_push"));
                    }
                    SuperPax::Add => {
                        wat_out.push(format!("    call $add"));
                    }
                    SuperPax::Nand => {
                        wat_out.push(format!("    call $nand"));
                    }
                    SuperPax::Drop => {
                        wat_out.push(format!("    call $drop"));
                    }
                    SuperPax::AltPop => {
                        wat_out.push(format!("    call $return_pop"));
                    }
                    SuperPax::AltPush => {
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $return_push"));
                    }
                    SuperPax::LoadTemp => {
                        wat_out.push(format!("    call $temp_load"));
                        wat_out.push(format!("    call $data_push"));
                    }
                    SuperPax::StoreTemp => {
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $temp_store"));
                    }
                    SuperPax::Exit => {}
                    SuperPax::Metadata(_) => {}
                    SuperPax::Call(s) => {
                        unreachable!("expected all methods to be inlined: {}", s);
                    }
                    SuperPax::Load => {
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $mem_load"));
                        wat_out.push(format!("    call $data_push"));
                    }
                    SuperPax::Load8 => {
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $mem_load_8"));
                        wat_out.push(format!("    call $data_push"));
                    }
                    SuperPax::Store => {
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $mem_store"));
                    }
                    SuperPax::Store8 => {
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $mem_store_8"));
                    }
                    SuperPax::BranchTarget(target_index) => {
                        let mut incoming = graph
                            .neighbors_directed(
                                NodeIndex::new(*target_index + 1),
                                Direction::Incoming,
                            )
                            .map(|idx| idx.index() as usize)
                            .collect::<Vec<_>>();
                        incoming.sort();

                        let mut is_loop = false;
                        for edge in &incoming {
                            if edge > target_index {
                                is_loop = true;
                            }
                        }
                        if is_loop {
                            let id = format!("$L{}", wat_block_index);
                            wat_block_index += 1;

                            wat_block_stack.push(id.clone());
                            wat_out.push(format!("    loop {}", id));
                        } else if incoming.len() > 1 {
                            // End of an if or if/else block.
                            wat_out.push(format!("    end"));
                            wat_block_stack.pop().expect("expected end of 'if' block");
                            wat_out.push(format!("    end"));
                            wat_block_stack.pop().expect("expected end of 'else' block");
                        }
                    }
                    SuperPax::JumpIf0(target_index) => {
                        if *target_index > block_index {
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
                        } else {
                            // End of a loop
                            let id = wat_block_stack.pop().unwrap();
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    i32.eqz"));
                            wat_out.push(format!("    br_if {}", id));
                            wat_out.push(format!("    end"));
                        }
                    }
                    SuperPax::JumpAlways(_) => {
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
                    SuperPax::Print => {
                        wat_out.push(format!("    call $data_pop"));
                        wat_out.push(format!("    call $print"));
                        wat_out.push(format!("    drop"));
                    }
                }
                wat_out.push(format!(""));
                // println!("  {:?}", op.0);
            }
        }
    }

    let wat_output = WAT_TEMPLATE
        .replace("{{return_ptr}}", "1024")
        .replace("{{data_ptr}}", "1028")
        .replace("{{temp}}", "1032")
        .replace("{{data}}", "2048")
        .replace("{{return}}", "4096")
        .replace("{{mem}}", "10000")
        .replace("{{main}}", &wat_out.join("\n"));

    // eprintln!("\n\n[WAT]:\n{}\n\n\n", wat_output);

    wat::parse_str(&wat_output).unwrap()
}
