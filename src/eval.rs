use crate::*;
use std::io::prelude::*;
use termion::raw::IntoRawMode;
use termion::{clear, cursor, style};

pub fn eval_forth(program: &SuperPaxProgram, interactive: bool) -> Vec<u32> {
    // for (name, x) in program {
    //     println!("{:?}", name);
    //     for block in x {
    //         for op in block.commands() {
    //             println!("  {:?}", op.0);
    //         }
    //     }
    // }

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

        // eprintln!(
        //     "[op#{:>4}]  {}",
        //     format!("{}", cindex - 1),
        //     format!("{:?}", op.0)
        // );
        // eprintln!("                                stack: {:?}", stack);
        // eprintln!("                                  alt: {:?}", alt_stack);

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
