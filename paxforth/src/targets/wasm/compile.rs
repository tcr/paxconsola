use crate::*;
use indexmap::{IndexMap, IndexSet};
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

pub struct WasmForthCompiler {}

mod state {
    use crate::PaxLiteral;

    #[derive(Debug, Clone)]
    pub enum Reg {
        DataParam(usize),
        AltParam(usize),
        Literal(PaxLiteral),
        Var,
    }

    #[derive(Debug, Clone)]
    pub struct RegState {
        data: Vec<Reg>,
        data_pos: usize,
        alt: Vec<Reg>,
        alt_pos: usize,
        temp: Option<Reg>,
    }

    impl RegState {
        pub fn new() -> RegState {
            RegState {
                data: vec![],
                data_pos: 0,
                alt: vec![],
                alt_pos: 0,
                temp: None,
            }
        }

        fn data_param(&mut self) -> Reg {
            self.data_pos += 1;
            Reg::DataParam(self.data_pos)
        }

        fn alt_param(&mut self) -> Reg {
            self.alt_pos += 1;
            Reg::AltParam(self.alt_pos)
        }

        pub fn pop_data(&mut self) -> Reg {
            self.data.pop().unwrap_or_else(|| self.data_param())
        }

        pub fn push_data(&mut self, reg: Reg) {
            self.data.push(reg);
        }

        pub fn pop_return(&mut self) -> Reg {
            self.alt.pop().unwrap_or_else(|| self.alt_param())
        }

        pub fn push_return(&mut self, reg: Reg) {
            self.alt.push(reg);
        }

        pub fn pop_temp(&mut self) -> Reg {
            self.temp.clone().expect("No temp value in block to load")
        }

        pub fn push_temp(&mut self, reg: Reg) {
            self.temp = Some(reg);
        }

        pub fn signature(&self) -> (usize, usize, usize, usize) {
            (self.data_pos, self.alt_pos, self.data.len(), self.alt.len())
        }

        pub fn data(&self) -> &[Reg] {
            &self.data
        }

        pub fn alt(&self) -> &[Reg] {
            &self.alt
        }
    }
}

use self::state::{Reg, RegState};

fn block_analyze(block: &Block, prev_state: Option<RegState>) -> RegState {
    use Pax::*;

    let mut state = prev_state.unwrap_or_else(|| RegState::new());

    let (commands, terminator) = block.commands_and_terminator();

    // Iterate opcodes
    for (opcode, _pos) in commands {
        match opcode {
            Metadata(_) => {}
            PushLiteral(value) => {
                state.push_data(Reg::Literal(*value));
            }
            AltPush => {
                let reg = state.pop_data();
                state.push_return(reg);
            }
            Drop | Print => {
                state.pop_data();
            }
            Load | Load8 => {
                state.pop_data();
                state.push_data(Reg::Var);
            }
            Add | Nand => {
                state.pop_data();
                state.pop_data();
                state.push_data(Reg::Var);
            }
            Store | Store8 => {
                state.pop_data();
                state.pop_data();
            }
            AltPop => {
                let reg = state.pop_return();
                state.push_data(reg);
            }
            LoadTemp => {
                let reg = state.pop_temp();
                state.push_data(reg);
            }
            StoreTemp => {
                let reg = state.pop_data();
                state.push_temp(reg);
            }

            _ => {
                unreachable!("expected non-terminating opcode");
            }
        }
    }

    // Terminating opcode
    let (opcode, _pos) = terminator;
    match opcode {
        JumpAlways(_) => {}
        JumpIf0(_) => {
            state.pop_data();
        }
        BranchTarget(_) => {}
        Exit => {}

        Abort => {
            panic!("Throw not supported in analyze");
        }
        Call(_) => {
            unreachable!("Cannot optimize non-inlined method");
        }
        _ => {
            unreachable!("expected terminating opcode");
        }
    }

    state
}

fn analyze(blocks: &[Block]) -> FunctionGraph {
    let graph = FunctionGraph::from_blocks(&blocks);
    eprintln!("[compile.rs] graph {:?}", graph);
    eprintln!("[compile.rs] graph {:?}", graph.bfs_sequence());
    eprintln!("[compile.rs] graph {:?}", graph.target_sequence());
    eprintln!();

    eprintln!("[compile.rs] block analyze");
    dump_blocks(blocks);
    let mut last_states = IndexMap::<usize, RegState>::new();
    let mut conditions: Vec<(usize, RegState)> = vec![];
    for (block_index, target) in graph.target_sequence() {
        let block = &blocks[block_index];

        // Evaluate conditions
        conditions = conditions
            .into_iter()
            .filter(|(index, condition)| {
                if *index == block_index {
                    // TODO
                    eprintln!();
                    eprintln!("[compile.rs] TESTING CONDITION: {:?}", condition);
                    eprintln!();
                    false
                } else {
                    true
                }
            })
            .collect();

        let pos_string = block.commands().iter().last().unwrap().1.to_string();
        let state = match target.clone() {
            TargetType::Start => block_analyze(&block, None),
            TargetType::Begin(targets) => {
                let base_states = last_states
                    .iter()
                    .filter(|(key, value)| targets.contains(key))
                    .collect::<Vec<_>>();
                // TODO compare base_States?
                assert_eq!(
                    base_states.len(),
                    1,
                    "expected only one iterated branch {:?}",
                    target
                );
                for target in &targets {
                    if target != base_states[0].0 {
                        conditions.push((*target, base_states[0].1.clone()));
                    }
                }
                base_states[0].1.clone()
            }
            TargetType::Then(targets) => {
                let base_states = last_states
                    .iter()
                    .filter(|(key, value)| targets.contains(key))
                    .collect::<Vec<_>>();
                assert_eq!(
                    base_states.len(),
                    2,
                    "expected tp have two iterated branch {:?}",
                    target
                );

                // TODO compare base_States?
                // Generate a result?

                base_states[0].1.clone()
            }
            TargetType::Block(target) | TargetType::AfterLoop(target) => {
                block_analyze(&block, last_states.get(&target).map(|x| x.clone()))
            }
        };

        eprintln!("{:?} for {}", state.signature(), pos_string,);
        eprintln!("    data: {:?}", state.data());
        eprintln!("     alt: {:?}", state.alt());
        last_states.insert(block_index, state.clone());
    }
    eprintln!();
    graph
}

impl ForthCompiler for WasmForthCompiler {
    /// Returns a compiled WAT file
    fn compile(program: &PaxProgram) -> String {
        let mut wat_out = vec![];
        for (name, blocks) in program {
            if name != "main" {
                continue;
            }

            let graph = analyze(&blocks);

            let mut wat_block_index = 0;
            let mut wat_block_stack = vec![];
            for (block_index, block) in blocks.iter().enumerate() {
                for op in block.commands() {
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
                        Pax::Exit => {}
                        Pax::Metadata(_) => {}
                        Pax::Call(s) => {
                            unreachable!("expected all methods to be inlined: {}", s);
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
                        Pax::BranchTarget(target_index) => {
                            let mut incoming = graph
                                .graph
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
                        Pax::JumpIf0(target_index) => {
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
                        Pax::JumpAlways(_) => {
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
                        Pax::Print => {
                            wat_out.push(format!("    call $data_pop"));
                            wat_out.push(format!("    call $print"));
                            wat_out.push(format!("    drop"));
                        }
                        Pax::Abort => {
                            wat_out.push(format!("    unreachable"));
                            // wat_out.push(format!("    throw 0"));
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
        wat_output
    }
}

impl WasmForthCompiler {
    /// Returns a compiled WebAssembly file (binary, not WAT format)
    pub fn compile_binary(program: &PaxProgram) -> Vec<u8> {
        wat::parse_str(&Self::compile(program)).unwrap()
    }
}
