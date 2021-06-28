use crate::prelude::*;
use crate::*;
use lazy_static::*;
use regex::Regex;
use std::io::{stdout, Write};

use crossterm::event::{read, Event};
use crossterm::style::{style, Attribute, Stylize};
use crossterm::{
    cursor, event, execute,
    style::{Color, Print, ResetColor, SetBackgroundColor, SetForegroundColor},
    ExecutableCommand, Result,
};

use crate::targets::wasm::*;

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

fn print_source(code: &str, vm: &VM, pos: Pos) -> crossterm::Result<()> {
    let preview_size = 11;

    let mut source_code = code.to_string();
    if pos.filename == "src/prelude.rs" {
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
        let re = Regex::new(r#"^(\S+)("[^"]+")?"#).unwrap();

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

    loop {
        match read()? {
            Event::Key(event::KeyEvent {
                code: event::KeyCode::Enter,
                ..
            }) => {
                break;
            }
            _ => {}
        }
    }

    execute!(stdout(), cursor::MoveToPreviousLine(preview_size),)?;
    for _ in 0..preview_size {
        eprintln!(
            "                                                                                "
        );
    }
    execute!(stdout(), cursor::MoveToPreviousLine(preview_size),)?;
    execute!(stdout(), cursor::MoveToColumn(0),)?;

    Ok(())
}

fn debug_program_function(code: &str, source_program: &PaxProgram, method: &str, vm: &mut VM) {
    let blocks = source_program
        .get(method)
        .expect(&format!("Expected class {:?}", method));

    let debug = false;

    if debug {
        println!("    fn {:?}:", method);
    }

    let mut i = 0;
    while i < blocks.len() {
        let block = &blocks[i];
        i += 1;

        for command in block.opcodes() {
            if debug {
                println!("        . {:?}", command.0);
            }
            match &command.0 {
                Pax::Abort => {
                    unimplemented!("abort")
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
                    println!("{}", vm.data_pop());
                }
                Pax::Emit => {
                    print!("{}", vm.data_pop() as u8 as char);
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
                Pax::LoadTemp => {
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
                Pax::StoreTemp => {
                    vm.memory[0] = vm.data_pop();
                }
            }
            if debug {
                print_source(code, vm, command.1.clone());
            }
        }
        {
            let terminator = block.terminator();
            if debug {
                println!("        ! {:?}", terminator.0);
            }
            match &terminator.0 {
                PaxTerm::BranchTarget(_n) => {}
                PaxTerm::Call(f) => {
                    vm.alt_push(0);
                    debug_program_function(code, source_program, f, vm);
                    vm.alt_pop();
                }
                PaxTerm::Exit => {
                    return;
                }
                PaxTerm::JumpAlways(n) => {
                    i = *n + 1;
                }
                PaxTerm::JumpIf0(n) => {
                    let v = vm.data_pop();
                    if v == 0 {
                        i = *n + 1;
                    }
                }
            }
            if debug {
                print_source(code, vm, terminator.1.clone());
            }
        }
    }
}

pub fn debug_program(code: &str, source_program: &PaxProgram) -> bool {
    let mut vm = VM {
        _data: vec![],
        _alt: vec![],
        memory: vec![0; 65536],
    };

    println!();
    println!();
    println!();
    println!();
    println!();
    println!();
    debug_program_function(code, source_program, "main", &mut vm);
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
    //     eprintln!("[forth] no ( @checks _ ) comment to check against.");
    //     false
    // }
}
