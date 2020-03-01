use crate::*;
use petgraph::{graph::NodeIndex, Direction};
use std::io::prelude::*;

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

#[cfg(feature = "wasm3")]
wasm3::make_func_wrapper!(wasm_print_wrap: wasm_print(value: u64) -> u64);

fn wasm_print(value: u64) -> u64 {
    println!("{}", value);
    value
}

pub fn eval_forth(program: &SuperPaxProgram, interactive: bool) -> Vec<u8> {
    let mut wat_out = vec![];
    for (name, blocks) in program {
        if name != "main" {
            continue;
        }

        let graph = crate::dataflow_graph(&blocks);

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
                            wat_block_stack.pop().unwrap();
                            wat_out.push(format!("    end"));
                            wat_block_stack.pop().unwrap();
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

    eprintln!("\n\n[WAT]:\n{}\n\n\n", wat_output);

    wat::parse_str(&wat_output).unwrap()
}

#[cfg(feature = "stdweb")]
pub fn run_wasm(binary: &[u8]) {
    run_wasm_with_memory(binary, &wasm_memory_init());
}

#[cfg(feature = "stdweb")]
pub fn wasm_memory_init() -> stdweb::Value {
    use stdweb::*;

    return js! {
        const mem = new Uint16Array(0xFFFF);
        mem.fill(0);
        return mem;
    };
}

// Provide memory to operate with
#[cfg(feature = "stdweb")]
pub fn run_wasm_with_memory(binary: &[u8], memory: &stdweb::Value) {
    use stdweb::*;

    js! {
        let binary = @{binary};
        let canvas = document.querySelector("#WASM_CANVAS");
        let mem = @{memory};
        WebAssembly.instantiate(new Uint8Array(binary), {
            root: {
                print: (arg) => {
                    // console.log("[print]", arg);
                    document.querySelector("#PRINT_OUTPUT").value += arg + "\n";
                },
                extmem_load: (loc) => {
                    if (loc < 0) { // TODO shouldn't wasm do this conversion?
                        loc = 0xFFFF + loc + 1;
                    }
                    // console.info("extmem_load:", loc);
                    return mem[loc] & 0xFFFF;
                },
                extmem_load_8: (loc) => {
                    if (loc < 0) { // TODO shouldn't wasm do this conversion?
                        loc = 0xFFFF + loc + 1;
                    }
                    // console.info("extmem_load_8:", loc);
                    return mem[loc] & 0xFF;
                },
                extmem_store: (loc, value) => {
                    if (loc < 0) { // TODO shouldn't wasm do this conversion?
                        loc = 0xFFFF + loc + 1;
                    }
                    // console.info("extmem_store:", loc.toString(16), value);
                    if (loc == 0x9800) {
                        requestAnimationFrame(() => {
                            const ctx = canvas.getContext("2d");
                            ctx.fillStyle = "#FFF0000";
                            ctx.fillRect(0, 0, 500, 500);
                        });
                    }
                    mem[loc] = value & 0xFFFF;
                },
                extmem_store_8: (loc, value) => {
                    if (loc < 0) { // TODO shouldn't wasm do this conversion?
                        loc = 0xFFFF + loc + 1;
                    }
                    // console.info("extmem_store_8:", loc.toString(16), value);
                    const row_len = 32; // fixed on gameboy
                    const wl = 30;
                    const hl = 20;
                    const w = canvas.width;
                    const h = canvas.height;
                    if (loc >= 0x9800 && loc < 0x9800 + (wl*hl)) {
                        const x = (loc - 0x9800) % row_len;
                        const y = Math.floor((loc - 0x9800) / row_len);

                        const ctx = canvas.getContext("2d");
                        ctx.fillStyle = value == 0 ? "#000000" : "#FF0000";
                        // console.log(x, y);
                        ctx.fillRect(w/wl*x, h/hl*y, w/wl, h/hl);
                    }
                    mem[loc] = value & 0xFF;
                },
            },
        }).then(res => {
            // console.info("[wasm] starting...");
            document.querySelector("#PRINT_OUTPUT").value = "";
            res.instance.exports.main();
            // console.info("[wasm] complete.");
        });
    }
}

#[cfg(feature = "wasmi")]
mod wasmi_support {
    use wasmi::{
        Error as InterpreterError, Externals, FuncInstance, FuncRef, GlobalDescriptor,
        GlobalInstance, GlobalRef, ImportResolver, ImportsBuilder, MemoryDescriptor,
        MemoryInstance, MemoryRef, Module, ModuleImportResolver, ModuleInstance, ModuleRef,
        RuntimeArgs, RuntimeValue, Signature, TableDescriptor, TableInstance, TableRef, Trap,
    };

    pub struct SpecModule {}

    impl SpecModule {
        pub fn new() -> Self {
            SpecModule {}
        }
    }

    const PRINT_FUNC_INDEX: usize = 0;

    impl Externals for SpecModule {
        fn invoke_index(
            &mut self,
            index: usize,
            args: RuntimeArgs,
        ) -> Result<Option<RuntimeValue>, Trap> {
            match index {
                PRINT_FUNC_INDEX => {
                    let a: u32 = args.nth_checked(0)?;
                    println!("{:?}", a);
                    Ok(Some(RuntimeValue::I32(a as i32)))
                }
                _ => panic!("SpecModule doesn't provide function at index {}", index),
            }
        }
    }

    impl ModuleImportResolver for SpecModule {
        fn resolve_func(
            &self,
            field_name: &str,
            func_type: &Signature,
        ) -> Result<FuncRef, InterpreterError> {
            let index = match field_name {
                "print" => PRINT_FUNC_INDEX,
                _ => {
                    return Err(InterpreterError::Instantiation(format!(
                        "Unknown host func import {}",
                        field_name
                    )));
                }
            };

            let func = FuncInstance::alloc_host(func_type.clone(), index);
            return Ok(func);
        }
    }

    pub struct SpecDriver {
        spec_module: SpecModule,
    }

    impl SpecDriver {
        pub fn new() -> SpecDriver {
            SpecDriver {
                spec_module: SpecModule::new(),
            }
        }

        pub fn spec_module(&mut self) -> &mut SpecModule {
            &mut self.spec_module
        }
    }

    impl ImportResolver for SpecDriver {
        fn resolve_func(
            &self,
            module_name: &str,
            field_name: &str,
            func_type: &Signature,
        ) -> Result<FuncRef, InterpreterError> {
            if module_name == "root" {
                self.spec_module.resolve_func(field_name, func_type)
            } else {
                Err(InterpreterError::Instantiation(format!(
                    "Module not registered {}",
                    module_name
                )))
            }
        }

        fn resolve_global(
            &self,
            _module_name: &str,
            _field_name: &str,
            _descriptor: &GlobalDescriptor,
        ) -> Result<GlobalRef, InterpreterError> {
            unimplemented!();
        }

        fn resolve_memory(
            &self,
            _module_name: &str,
            _field_name: &str,
            _descriptor: &MemoryDescriptor,
        ) -> Result<MemoryRef, InterpreterError> {
            unimplemented!();
        }

        fn resolve_table(
            &self,
            _module_name: &str,
            _field_name: &str,
            _descriptor: &TableDescriptor,
        ) -> Result<TableRef, InterpreterError> {
            unimplemented!();
        }
    }
}

/// Evaluate WebAssembly binary using the wasmi library.
#[cfg(feature = "wasmi")]
pub fn run_wasm(binary: &[u8]) {
    use self::wasmi_support::*;
    use wasmi::{ImportsBuilder, Module, ModuleInstance, NopExternals, RuntimeValue};

    // Here we load module using dedicated for this purpose
    // `load_from_file` function (which works only with modules)
    let module = Module::from_buffer(binary).expect("WebAssembly binary had validation errors");

    let mut imports = SpecDriver::new();

    // Intialize deserialized module. It adds module into It expects 3 parameters:
    // - a name for the module
    // - a module declaration
    // - "main" module doesn't import native module(s) this is why we don't need to provide external native modules here
    // This test shows how to implement native module https://github.com/NikVolf/parity-wasm/blob/master/src/interpreter/tests/basics.rs#L197
    let main = ModuleInstance::new(&module, &imports)
        .expect("Failed to instantiate module")
        .run_start(imports.spec_module())
        .expect("Failed to run start function in module");

    // TODO module root not found

    // "_call" export of function to be executed with an i32 argument and prints the result of execution
    main.invoke_export("main", &[], imports.spec_module());
}

/// Evaluate WebAssembly binary using the wasm3 library.
#[cfg(feature = "wasm3")]
pub fn run_wasm(binary: &[u8]) {
    use wasm3::environment::Environment;
    use wasm3::module::Module;

    let env = Environment::new().unwrap();
    let rt = env.create_runtime(1024 * 60).unwrap();
    let parsed_module = Module::parse(&env, &binary[..]).expect("module couldnt parse");

    let mut module = rt.load_module(parsed_module).unwrap();
    eprintln!("execution:");
    module
        .link_function::<(i32,), i32>("root", "print", wasm_print_wrap)
        .unwrap();
    let func = module
        .find_function::<(), i32>("main")
        .unwrap_or_else(|err| {
            match &err {
                wasm3::error::Error::Wasm3(err) => {
                    eprintln!("wasm compilation error: {}", err);
                }
                _ => {}
            }
            panic!("{:?}", err);
        });
    func.call().unwrap();
}
