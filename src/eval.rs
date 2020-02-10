use crate::*;
use petgraph::{graph::NodeIndex, Direction};
use std::io::prelude::*;
use termion::raw::IntoRawMode;
use termion::{clear, cursor, style};
use wasm3::environment::Environment;
use wasm3::module::Module;

const WAT_TEMPLATE: &'static str = r#"
(module
    (type $t0 (func))
    (type $t1 (func (param i32 i32)))
    (type $t2 (func (param i32) (result i32)))
    (type $t3 (func (param i32)))
    (type $t4 (func (result i32)))
    (import "root" "print" (func $print (type $t2)))
    (func $__wasm_call_ctors (type $t0))
    (func $mem_store (export "mem_store") (type $t1) (param $p1 i32) (param $p0 i32)
    get_local $p1
      get_local $p1
      i32.const 1
      i32.shl
      i32.const {{mem}}
      i32.add
      get_local $p0
      i32.store16)
    (func $mem_load (export "mem_load") (type $t2) (param $p0 i32) (result i32)
      get_local $p0
      i32.const 1
      i32.shl
      i32.const {{mem}}
      i32.add
      i32.load16_s)
    (func $mem_store_8 (export "mem_store_8") (type $t1) (param $p1 i32) (param $p0 i32)
      get_local $p1
      i32.const 1
      i32.shl
      i32.const {{mem}}
      i32.add
      get_local $p0
      i32.store16)
    (func $mem_load_8 (export "mem_load_8") (type $t2) (param $p0 i32) (result i32)
      get_local $p0
      i32.const 1
      i32.shl
      i32.const {{mem}}
      i32.add
      i32.load8_s)
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
    (func $return_pop (export "return_pop") (type $t4) (result i32)
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
      i32.load16_s)
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

wasm3::make_func_wrapper!(wasm_print_wrap: wasm_print(value: u64) -> u64);

fn wasm_print(value: u64) -> u64 {
    println!("{}", value);
    value
}

pub fn eval_forth(program: &SuperPaxProgram, interactive: bool) -> Vec<u32> {
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
                match &op.0 {
                    SuperPax::PushLiteral(lit) => {
                        wat_out.push(format!("i32.const {}", lit));
                        wat_out.push(format!("call $data_push"));
                    }
                    SuperPax::Add => {
                        wat_out.push(format!("call $add"));
                    }
                    SuperPax::Nand => {
                        wat_out.push(format!("call $nand"));
                    }
                    SuperPax::Drop => {
                        wat_out.push(format!("call $drop"));
                    }
                    SuperPax::AltPop => {
                        wat_out.push(format!("call $return_pop"));
                        wat_out.push(format!("call $data_push"));
                    }
                    SuperPax::AltPush => {
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $return_push"));
                    }
                    SuperPax::LoadTemp => {
                        wat_out.push(format!("call $temp_load"));
                    }
                    SuperPax::StoreTemp => {
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $temp_store"));
                    }
                    SuperPax::Exit => {}
                    SuperPax::Metadata(_) => {}
                    SuperPax::Call(s) => {
                        // if s != "drop" {
                        unreachable!("{}", s);
                        // } else {
                        // wat_out.push(format!("call $drop"));
                        // }
                    }
                    SuperPax::Load => {
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $mem_load"));
                        wat_out.push(format!("call $data_push"));
                    }
                    SuperPax::Load8 => {
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $mem_load_8"));
                        wat_out.push(format!("call $data_push"));
                    }
                    SuperPax::Store => {
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $mem_store"));
                    }
                    SuperPax::Store8 => {
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $mem_store_8"));
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
                            wat_out.push(format!("loop {}", id));
                        } else if incoming.len() > 1 {
                            // End of an if or if/else block.
                            wat_out.push(format!("end"));
                            wat_block_stack.pop().unwrap();
                            wat_out.push(format!("end"));
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

                            wat_out.push(format!("block {}", parent_id));
                            wat_out.push(format!("block {}", if_id));
                            wat_out.push(format!("call $data_pop"));
                            wat_out.push(format!("i32.eqz"));
                            wat_out.push(format!("br_if {}", if_id));
                        } else {
                            // End of a loop
                            let id = wat_block_stack.pop().unwrap();
                            wat_out.push(format!("call $data_pop"));
                            wat_out.push(format!("i32.eqz"));
                            wat_out.push(format!("br_if {}", id));
                            wat_out.push(format!("end"));
                        }
                    }
                    SuperPax::JumpAlways(_) => {
                        let id = format!("$B{}", wat_block_index);
                        wat_block_index += 1;
                        let parent_block = wat_block_stack.iter().rev().nth(1).clone().unwrap();

                        wat_out.push(format!("br {}", parent_block));
                        wat_out.push(format!("end"));
                        wat_out.push(format!("block {}", id));
                    }
                    SuperPax::Print => {
                        wat_out.push(format!("call $data_pop"));
                        wat_out.push(format!("call $print"));
                        wat_out.push(format!("drop"));
                    }
                }
                // println!("  {:?}", op.0);
            }
        }
    }

    let wat_output = wat_out.join("\n");

    eprintln!("\n\n[WAT]:\n{}\n\n\n", wat_output);

    let binary = wat::parse_str(
        WAT_TEMPLATE
            .replace("{{return_ptr}}", "1024")
            .replace("{{data_ptr}}", "1028")
            .replace("{{temp}}", "1032")
            .replace("{{data}}", "2048")
            .replace("{{return}}", "4096")
            .replace("{{mem}}", "10000")
            .replace("{{main}}", &wat_output),
    )
    .unwrap();

    let env = Environment::new();
    let rt = env.create_runtime(1024 * 60);
    let parsed_module = Module::parse(&env, &binary[..]).expect("module couldnt parse");

    let mut module = rt.load_module(parsed_module).map_err(|x| x.1).unwrap();
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
    return vec![];

    let mut stack: Vec<u32> = vec![];
    let mut alt_stack: Vec<u32> = vec![];
    // TODO could look up max variable allocation from compiled artifact.
    let mut variables: Vec<u32> = vec![0; 1024 * 64];

    let mut use_graphics = false;

    // Random frame counter component.
    // let mut frame = 0;

    // Build fn indexes for our current code pointer.
    let mut idx = 0;
    let mut fn_indexes = vec![];
    for (name, blocks) in program {
        for (i, block) in blocks.iter().enumerate() {
            fn_indexes.push((idx, name.to_string(), i));
            idx += block.commands().len();
        }
    }
    let idx_len = idx;

    // eprintln!("cindex ---> {:?}", fn_indexes);

    // Convert an absolute position to one relative to a function block.
    let index_lookup = |idx: usize| {
        // eprintln!("cindex: {:?}", idx);
        fn_indexes.iter().rev().find(|x| x.0 <= idx).map(|x| {
            // eprintln!("{:?}", (idx - x.0, x.1.clone(), x.2));
            (idx - x.0, x.1.clone(), x.2)
        })
    };
    let fn_block_lookup = |name: &str, block: usize| {
        fn_indexes
            .iter()
            .rev()
            .find(|x| x.1 == name && x.2 == block)
    };

    // eprintln!("[code] {:?}", code);
    let mut cindex = 0;
    let mut current_function = vec![0];

    while cindex < idx_len {
        let (pos, name, block) = index_lookup(cindex).unwrap();
        let op = program[&name][block].commands()[pos].clone();
        cindex += 1;

        // eprintln!("[ {} ] [{}]  {}", name, cindex - 1, format!("{:?}", op.0));
        // eprintln!("                                stack: {:?}", stack);
        // eprintln!("                                  alt: {:?}", alt_stack);
        // std::thread::sleep_ms(20);

        match op.0 {
            SuperPax::BranchTarget(_) => {
                // noop
            }

            SuperPax::PushLiteral(lit) => {
                stack.push(lit as u32);
            }

            SuperPax::Drop => {
                stack.pop().unwrap();
            }

            // nand
            SuperPax::Nand => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push(!(z & y));
            }
            // +
            SuperPax::Add => {
                let b = stack.pop().expect("+ found 0 stack arguments");
                let d = stack.pop().expect("+ found only 1 stack argument");
                stack.push(b.wrapping_add(d));
            }

            SuperPax::LoadTemp => {
                stack.push(variables[TEMP_ADDRESS as usize]);
            }
            SuperPax::StoreTemp => {
                let value = stack.pop().unwrap();
                variables[TEMP_ADDRESS as usize] = value;
            }

            // ! (store value in variable)
            SuperPax::Store8 | SuperPax::Store => {
                let name = stack.pop().unwrap();
                let value = stack.pop().unwrap();
                variables[name as usize] = value;

                if interactive {
                    if name < 24 * 24 {
                        eprintln!("[store] setting graphics var: {}", name as usize);
                        let x = name % 24;
                        let y = (name - x) / 24;

                        let stdout = std::io::stdout();
                        let stdout = stdout.lock();
                        let mut stdout = stdout.into_raw_mode().unwrap();
                        if !use_graphics {
                            write!(stdout, "{}", clear::All).unwrap();
                            use_graphics = true;
                        }
                        // eprintln!("drawing coords: {} x: {} y: {}", name, x, y);
                        let color = if value == 0 { "@" } else { "_" };
                        write!(
                            stdout,
                            "{}{}{}{}",
                            style::Reset,
                            cursor::Goto(x as u16 + 1, y as u16 + 1),
                            color,
                            cursor::Goto(1, 25)
                        )
                        .unwrap();
                        eprintln!("[store] setting graphics var: {}", name as usize);
                        let _ = stdout.flush();
                    }
                }
            }
            // @ (get)
            SuperPax::Load8 | SuperPax::Load => {
                let name = stack.pop().unwrap();

                if name == 577 {
                    // random
                    let random_u32 = rand::random::<u32>();
                    stack.push(random_u32);
                } else {
                    let value = *variables.get(name as usize).unwrap_or(&0);
                    stack.push(value);
                }
            }
            // >r
            SuperPax::AltPush => {
                let b = stack.pop().unwrap();
                alt_stack.push(b);
            }
            // r>
            SuperPax::AltPop => {
                let b = alt_stack.pop().unwrap();
                stack.push(b);
            }
            // call
            SuperPax::Call(target) => {
                // Look up function globally.
                let function_start = fn_block_lookup(&target, 0)
                    .expect("couldnt determine function location")
                    .0;

                alt_stack.push(cindex as u32);
                cindex = function_start as _;
            }
            SuperPax::Exit => {
                // eprintln!("[call] done: {:?} {:?}", alt_stack, variables.get(&0));
                if alt_stack.len() == 0 {
                    break;
                }
                cindex = alt_stack.pop().unwrap() as usize;
                current_function.pop();
            }
            SuperPax::JumpAlways(branch) => {
                let dest = fn_block_lookup(&name, branch + 1).unwrap().0;
                cindex = dest as _;
            }
            SuperPax::JumpIf0(branch) => {
                let cond = stack.pop().unwrap();
                if cond == 0 {
                    let dest = fn_block_lookup(&name, branch + 1).unwrap().0;
                    cindex = dest as _;
                    // assert_eq!(code[cindex].0, Pax::BranchTarget);
                }
            }

            SuperPax::Metadata(_) => {
                // no-op
                current_function.push(cindex - 1);
            }

            // print
            SuperPax::Print => {
                // debug: Take the top three items from the stack.
                println!("{}", stack.pop().unwrap());
            } /*
              // debugger
              SuperPax::Debugger => {
                  if use_graphics {
                      const VAR_START_X: usize = 579;
                      const VAR_START_Y: usize = VAR_START_X + 500 + 1;

                      let stdout = std::io::stdout();
                      let stdout = stdout.lock();
                      let mut stdout = stdout.into_raw_mode().unwrap();
                      write!(stdout, "{}{}{}\r\n",
                          style::Reset,
                          cursor::Goto(1, 27),
                          format!("[debugger] stack: {:?}\r\n[debugger] snake-x-head({}): {:?}\r\n[debugger] snake-y-head({}): {:?}\r\n[debugger] snake-x: {:?}\r\n[debugger] snake-y: {:?}\r\n", stack,
                              VAR_START_X, variables.get(VAR_START_X),
                              VAR_START_Y, variables.get(VAR_START_Y),
                              variables[VAR_START_X..(VAR_START_X+16)].iter().map(|x| x.to_string()).collect::<Vec<_>>().join("-"),
                              variables[VAR_START_Y..(VAR_START_Y+16)].iter().map(|x| x.to_string()).collect::<Vec<_>>().join("-"),
                          ),
                      ).unwrap();
                      let _ = stdout.flush();
                      eprint!("... press <enter> to continue\r\n");
                      drop(stdout);

                      let stdin = std::io::stdin();
                      let mut stdin = stdin.lock();
                      let _ = TermRead::read_line(&mut stdin);
                  }
              }
              // pushn
              SuperPax::Sleep => {
                  let time = stack.pop().unwrap();
                  std::thread::sleep(std::time::Duration::from_millis(time as _));
                  frame += 1;

                  if frame == 4 {
                      // HACK fill in last-key while interpreting
                      variables[576] = 38;
                  } else if frame == 12 {
                      // HACK fill in last-key while interpreting
                      variables[576] = 37;
                  }
              }
              */
        }
    }
    stack
}
