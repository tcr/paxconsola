use crate::*;
use std::io::prelude::*;
use termion::{clear, cursor, style};
use termion::raw::IntoRawMode;
use termion::input::TermRead;
use indexmap::IndexMap;

pub fn eval_forth(code: Vec<Located<Pax>>, interactive: bool) -> Vec<u32> {
    let mut stack: Vec<u32> = vec![];
    let mut alt_stack: Vec<u32> = vec![];

    // TODO could look up max variable allocation from compiled artifact.
    let mut variables: Vec<u32> = vec![0; 1024*64];

    let mut use_graphics = false;

    // function list
    let mut function_map = IndexMap::new();
    for (i, (c, _)) in code.iter().enumerate() {
        if let Pax::Metadata(ref name) = c {
            function_map.insert(name.to_string(), i as u32);
        }
    }

    // eprintln!("[code] {:?}", code);
    let mut cindex = 0;
    let mut frame = 0;
    while cindex < code.len() {
        let op = code[cindex].0.clone();
        cindex += 1;

        // eprintln!("[op#{:>4}]  {}", format!("{}", cindex - 1), format!("{:?}", op));
        // eprintln!("                                stack: {:?}", stack);
        // eprintln!("                                  alt: {:?}", alt_stack);

        match op {
            Pax::BranchTarget => {
                // noop
            },

            Pax::PushLiteral(lit) => {
                stack.push(lit as u32);
            }

            Pax::Equals => {
                unimplemented!();
            }
            // nand
            Pax::Nand => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push(!(z & y));
            }
            // +
            Pax::Add => {
                let b = stack.pop().expect("+ found 0 stack arguments");
                let d = stack.pop().expect("+ found only 1 stack argument");
                stack.push(b.wrapping_add(d));
            }
            // ! (store value in variable)
            Pax::Store8 | Pax::Store => {
                let name = stack.pop().unwrap();
                let value = stack.pop().unwrap();
                variables[name as usize] = value;

                if interactive {
                    if name < 24*24 {
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
                        write!(stdout, "{}{}{}{}", style::Reset, cursor::Goto(x as u16 + 1, y as u16 + 1), color, cursor::Goto(1, 25)).unwrap();
                        eprintln!("[store] setting graphics var: {}", name as usize);
                        let _ = stdout.flush();
                    }
                }
            }
            // @ (get)
            Pax::Load8 | Pax::Load => {
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
            Pax::AltPush => {
                let b = stack.pop().unwrap();
                alt_stack.push(b);
            }
            // r>
            Pax::AltPop => {
                let b = alt_stack.pop().unwrap();
                stack.push(b);
            }
            // call
            Pax::Call(target) => {
                // Look up function globally.
                let function_start = *function_map.get(&target).expect("couldnt determine function location");

                alt_stack.push(cindex as u32);
                cindex = function_start as _;
            }
            // ;
            Pax::Exit => {
                // eprintln!("[call] done: {:?} {:?}", alt_stack, variables.get(&0));
                cindex = alt_stack.pop().unwrap() as usize;
            }
            // jump if TOS == 0
            Pax::JumpIf0(dest, _) => {
                let cond = stack.pop().unwrap();
                if cond == 0 {
                    cindex = dest as _;
                }
            }
            Pax::Stop => {
                break;
            }


            Pax::Metadata(_) => {
                // no-op
            }
            // %
            Pax::Remainder => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(d % b);
                // panic!("remainder not implemented");
            }

            // print
            Pax::Print => {
                // debug: Take the top three items from the stack.
                println!("{}", stack.pop().unwrap());
            }
            // debugger
            Pax::Debugger => {
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
            Pax::Sleep => {
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
        }
    }
    stack
}
