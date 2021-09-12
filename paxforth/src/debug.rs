use crate::*;
use regex::Regex;
use std::io::{stdout, Write};

use crossterm::event::{Event, KeyCode, KeyEvent};
use crossterm::style::{Color, Stylize};
use crossterm::{cursor, event, execute, Result};

struct VM {
    _data: Vec<i16>,
    _alt: Vec<i16>,
    memory: Vec<i16>,
}

impl VM {
    fn data_pop(&mut self) -> i16 {
        self._data.pop().unwrap_or(0)
    }

    fn data_push(&mut self, v: i16) {
        self._data.push(v);
    }

    fn alt_pop(&mut self) -> i16 {
        self._alt.pop().unwrap_or(0)
    }

    fn alt_push(&mut self, v: i16) {
        self._alt.push(v);
    }
}

#[derive(PartialEq)]
enum DebugMode {
    Continue,
    Into,
    Step,
}

pub fn read_line() -> Result<String> {
    let mut line = String::new();
    while let Event::Key(KeyEvent { code, .. }) = event::read()? {
        eprintln!("what {:?}", code);
        match code {
            KeyCode::Enter | KeyCode::Char('\r') => {
                break;
            }
            KeyCode::Char(c) => {
                line.push(c);
            }
            _ => {}
        }
    }

    Ok(line)
}

fn print_source(
    mut message: Option<String>,
    code: &str,
    vm: &VM,
    pos: Pos,
    debug_state: &mut DebugMode,
) -> crossterm::Result<()> {
    while let Some(msg) = message.take() {
        println!("{}", msg);

        let preview_size = 12;

        let mut source_code = code.to_string();
        if pos.filename == "src/prelude.fth" {
            source_code = PRELUDE.to_string();
        }

        println!();
        println!("-----------------------------------------------------------");
        println!(" [{}] from {:?}", pos.function, pos.filename);
        if pos.line < 2 {
            println!()
        } else {
            println!(
                "{:>5} | {}",
                pos.line - 2,
                source_code.lines().skip(pos.line - 3).next().unwrap_or("")
            );
        }
        if pos.line < 1 {
            println!();
        } else {
            println!(
                "{:>5} | {}",
                pos.line - 1,
                source_code.lines().skip(pos.line - 2).next().unwrap_or(""),
            );
        }

        // Current line
        {
            let re = Regex::new(r#"^(."[^"]+"|\S+)"#).unwrap();

            let line = source_code.lines().skip(pos.line - 1).next().unwrap_or("");
            let prefix = line.chars().take(pos.col - 1).collect::<String>();
            let rest = line.chars().skip(pos.col - 1).collect::<String>();
            let highlight = re
                .find(&rest)
                .map(|x| x.as_str().to_string())
                .unwrap_or_else(|| rest.chars().take(1).collect::<String>());
            let suffix = rest.chars().skip(highlight.len()).collect::<String>();
            println!(
                ">{:>4} | {}{}{}",
                pos.line,
                prefix,
                highlight.with(Color::White).on(Color::DarkBlue),
                suffix,
            );
        }
        // println!("{:>1$}", "^", pos.col + 8);

        println!(
            "{:>5} | {}",
            pos.line + 1,
            source_code.lines().skip(pos.line + 0).next().unwrap_or("")
        );
        println!();
        println!("   data: {:?}", vm._data);
        println!("    alt: {:?}", vm._alt);
        println!();
        print!("debugger> (c)ontinue, (s)tep, i(n)to: ");
        stdout().flush().unwrap();

        // Poll for input.
        if *debug_state != DebugMode::Continue {
            let input = read_line().unwrap();
            if input == "s" {
                *debug_state = DebugMode::Step;
            }
            if input == "c" {
                *debug_state = DebugMode::Continue;
            }
            if input == "n" {
                *debug_state = DebugMode::Into;
            }
            if let Ok(mem) = input.parse::<usize>() {
                message = Some(format!(
                    "[memory] {} = {}    ; '{}'",
                    mem, vm.memory[mem], vm.memory[mem] as u8 as char
                ));
            }
        } else {
            println!();
        }

        execute!(stdout(), cursor::MoveToPreviousLine(preview_size),)?;
        for _ in 0..preview_size {
            eprintln!(
                "                                                                                "
            );
        }
        execute!(stdout(), cursor::MoveToPreviousLine(preview_size),)?;
        execute!(stdout(), cursor::MoveToColumn(0),)?;
    }

    Ok(())
}

fn debug_program_function(
    code: &str,
    source_program: &PaxProgram,
    method: &str,
    vm: &mut VM,
    debug_mode: &mut DebugMode,
    buffer: &mut Option<Vec<u8>>,
) {
    // let (_, arity) = ProgramFacts::new(source_program).function_analyze(method);
    // println!("    ; ( {:?} )", arity);

    let blocks = source_program
        .get(method)
        .expect(&format!("Expected class {:?}", method));

    let mut debug = *debug_mode != DebugMode::Continue;

    if debug {
        println!("    fn {:?}:", method);
    }

    let mut i = 0;
    while i < blocks.len() {
        let block = &blocks[i];
        i += 1;

        for command in block.opcodes() {
            if debug {
                print_source(
                    Some(format!("        . {:?}", command.0)),
                    code,
                    vm,
                    command.1.clone(),
                    debug_mode,
                )
                .unwrap();
            }
            match &command.0 {
                Pax::Debugger | Pax::Abort => {
                    // unimplemented!("abort")

                    // TODO add "debugger" command
                    if *debug_mode == DebugMode::Continue {
                        *debug_mode = DebugMode::Step;
                    }
                    debug = true;
                }
                Pax::Add => {
                    let v = vm.data_pop().wrapping_add(vm.data_pop());
                    vm.data_push(v);
                }
                Pax::Nand => {
                    let v = !(vm.data_pop() & vm.data_pop());
                    vm.data_push(v);
                }
                Pax::AltPop => {
                    let v = vm.alt_pop();
                    vm.data_push(v);
                }
                Pax::AltPush => {
                    let v = vm.data_pop();
                    vm.alt_push(v);
                }
                Pax::Drop => {
                    vm.data_pop();
                }
                Pax::Print => {
                    if let Some(buffer) = buffer {
                        writeln!(buffer, "{}", vm.data_pop()).ok();
                    } else {
                        println!("{}", vm.data_pop());
                    }
                }
                Pax::Emit => {
                    if let Some(buffer) = buffer {
                        write!(buffer, "{}", vm.data_pop() as u8 as char).ok();
                    } else {
                        print!("{}", vm.data_pop() as u8 as char);
                    }
                }
                Pax::PushLiteral(l) => {
                    vm.data_push(*l as i16);
                }
                Pax::Load => {
                    let addr = vm.data_pop() as u16 as usize;
                    let v = vm.memory[addr];
                    vm.data_push(v);
                }
                Pax::Load8 => {
                    let addr = vm.data_pop() as u16 as usize;
                    let v = vm.memory[addr] & 0xFF;
                    vm.data_push(v);
                }
                Pax::TempLoad => {
                    vm.data_push(vm.memory[0]);
                }
                Pax::Store => {
                    let addr = vm.data_pop() as u16 as usize;
                    vm.memory[addr] = vm.data_pop();
                }
                Pax::Store8 => {
                    let addr = vm.data_pop() as u16 as usize;
                    vm.memory[addr] = vm.data_pop() & 0xFF;
                }
                Pax::TempStore => {
                    vm.memory[0] = vm.data_pop();
                }
            }
        }
        {
            let terminator = block.terminator();
            if debug {
                print_source(
                    Some(format!("        ! {:?}", terminator.0)),
                    code,
                    vm,
                    terminator.1.clone(),
                    debug_mode,
                )
                .unwrap();
            }
            match &terminator.0 {
                PaxTerm::LoopTarget(_n) | PaxTerm::JumpTarget(_n) => {}
                PaxTerm::Call(f) => {
                    vm.alt_push(0);
                    if *debug_mode == DebugMode::Step {
                        *debug_mode = DebugMode::Continue;
                        debug_program_function(code, source_program, f, vm, debug_mode, buffer);
                        *debug_mode = DebugMode::Step;
                    } else {
                        debug_program_function(code, source_program, f, vm, debug_mode, buffer);
                    }
                    vm.alt_pop();
                }
                PaxTerm::ExternCall(_) => {
                    unimplemented!();
                }
                PaxTerm::Exit => {
                    return;
                }
                PaxTerm::LoopLeave(n) | PaxTerm::JumpElse(n) => {
                    i = *n;
                }
                PaxTerm::JumpIf0(n) | PaxTerm::LoopIf0(n) => {
                    let v = vm.data_pop();
                    if v == 0 {
                        i = *n;
                    }
                }
            }
        }
    }
}

/**
 * Interactive debugigng for a test
 */
pub fn debug_program_test(code: &str, source_program: &PaxProgram) -> Vec<u8> {
    let mut vm = VM {
        _data: vec![],
        _alt: vec![],
        memory: vec![0; 65536],
    };

    let mut debug_mode = DebugMode::Continue;

    let mut buffer: Option<Vec<u8>> = Some(Vec::new());
    debug_program_function(
        code,
        source_program,
        "main",
        &mut vm,
        &mut debug_mode,
        &mut buffer,
    );

    buffer.unwrap()
}

/**
 * Debug program interactively
 */
pub fn debug_program(code: &str, source_program: &PaxProgram) -> bool {
    let mut vm = VM {
        _data: vec![],
        _alt: vec![],
        memory: vec![0; 65536],
    };

    let mut debug_mode = DebugMode::Step;

    println!();
    println!();
    println!();
    println!();
    println!();
    println!();

    let mut buffer: Option<Vec<u8>> = None;
    debug_program_function(
        code,
        source_program,
        "main",
        &mut vm,
        &mut debug_mode,
        &mut buffer,
    );

    true

    // // Parse output from "print" statements.
    // let buffer_string = String::from_utf8_lossy(&buffer).to_string();
    // let found = buffer_string.split_whitespace().collect::<Vec<_>>();

    // if RE_CHECK.is_match(&code) {
    //     let captures = RE_CHECK.captures(&code).unwrap();
    //     let expected = captures[1].split_whitespace().collect::<Vec<_>>();

    //     // Compare output to expected values.
    //     eprintln!("[forth] expected: {:?}", expected);
    //     eprintln!("[forth]   output: {:?}", found);
    //     if expected != found {
    //         eprintln!("[forth] FAILED.");
    //         false
    //     } else {
    //         eprintln!("[forth] SUCCESS!");
    //         true
    //     }
    // } else {
    //     eprintln!("[forth] no ( @check _ ) comment to check against.");
    //     false
    // }
}
