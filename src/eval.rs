use crate::*;
use std::io::prelude::*;
use termion::{clear, cursor, style};
use termion::raw::IntoRawMode;
use termion::input::TermRead;

pub fn eval_forth(code: Vec<Pax>, interactive: bool) -> Vec<u32> {
    let mut stack: Vec<u32> = vec![];
    let mut alt_stack: Vec<u32> = vec![];

    // (index, limit, loop start)
    let mut loop_stack: Vec<(u32, u32, usize)> = Vec::with_capacity(32);
    let mut do_level: Vec<usize> = vec![0];

    // TODO could look up max variable allocation from compiled artifact.
    let mut variables: Vec<u32> = vec![0; 1024*64];

    let mut use_graphics = false;

    // eprintln!("[code] {:?}", code);
    let mut cindex = 0;
    let mut frame = 0;
    while cindex < code.len() {
        let op = code[cindex].clone();
        cindex += 1;
        
        // eprintln!("[op#{:>4}]  {:<12}   stack: {:?}", format!("{}", cindex - 1), format!("{:?}", op), stack);
        match op {
            Pax::PushLiteral(lit) => {
                stack.push(lit as u32);
            }
            Pax::PushLabel(lit) => {
                // All labels just use their opcode indexes.
                stack.push(lit as u32);
            }

            Pax::Equals => {
                unimplemented!();
            }
            Pax::Do => {
                let index = stack.pop().unwrap();
                let limit = stack.pop().unwrap();
                loop_stack.push((index, limit, cindex));
                *do_level.last_mut().unwrap() += 1;
            }
            Pax::Loop => {
                let (index, limit, startindex) = loop_stack.last().unwrap().clone();
                let next_value = index.wrapping_add(1);
                if next_value != limit {
                    loop_stack.last_mut().unwrap().0 = next_value;
                    cindex = startindex;
                } else {
                    loop_stack.pop();
                    *do_level.last_mut().unwrap() -= 1;
                }
            }
            Pax::PlusLoop => {
                let value = stack.pop().unwrap();
                let (index, limit, startindex) = loop_stack.last().unwrap().clone();
                let next_value = index.wrapping_add(value);
                if index != limit { // see http://wiki.laptop.org/go/Forth_Lesson_7#Do_Loops
                    loop_stack.last_mut().unwrap().0 = next_value;
                    cindex = startindex;
                } else {
                    loop_stack.pop();
                    *do_level.last_mut().unwrap() -= 1;
                }
            }
            Pax::IIndex => {
                if *do_level.last().unwrap() == 2 {
                    stack.push(loop_stack[loop_stack.len() - 2].0);
                } else {
                    stack.push(loop_stack[loop_stack.len() - 1].0);
                }
            }
            Pax::JIndex => {
                // Never can be nested twice
                stack.push(loop_stack[loop_stack.len() - 1].0);
            }
            // +
            Pax::Add => {
                let b = stack.pop().expect("+ found 0 stack arguments");
                let d = stack.pop().expect("+ found only 1 stack argument");
                stack.push(b.wrapping_add(d));
            }
            // ! (store value in variable)
            Pax::Store => {
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
            Pax::Load => {
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
            // nand
            Pax::Nand => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push(!(z & y));
            }
            // call
            Pax::Call => {
                let function_start = stack.pop().unwrap();
                alt_stack.push(cindex as u32);
                cindex = function_start as _;
                do_level.push(0);
            }
            // jump (recurse)
            Pax::Jump => {
                let function_start = stack.pop().unwrap();
                cindex = function_start as _;
                do_level.push(0); // dunno if correct
            }
            // ;
            Pax::Exit => {
                // eprintln!("[call] done: {:?} {:?}", alt_stack, variables.get(&0));
                cindex = alt_stack.pop().unwrap() as usize;
                do_level.pop();
            }
            // jump (recurse)
            Pax::JumpIf0 => {
                let dest = stack.pop().unwrap();
                let cond = stack.pop().unwrap();
                if cond == 0 {
                    cindex = dest as _;
                }
            }
            Pax::Stop => {
                break;
            }


            // *
            Pax::Multiply => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(b.wrapping_mul(d));
            },
            // %
            Pax::Remainder => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(d % b);
            }

            // print
            Pax::Print => {
                // debug: Take the top three items from the stack.
                for &b in stack.iter().rev().take(3) {
                    println!("{}", b);
                }
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
