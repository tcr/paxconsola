use crate::*;
use lazy_static::*;
use regex::Regex;

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

fn debug_program_function(code: &str, source_program: &PaxProgram, method: &str, vm: &mut VM) {
    let blocks = source_program
        .get(method)
        .expect(&format!("Expected class {:?}", method));

    let mut i = 0;
    while i < blocks.len() {
        let block = &blocks[i];
        i += 1;

        for command in block.opcodes() {
            // eprintln!("        [{}] {:?}", method, command.0);
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
        }
        {
            // eprintln!("               {:?}", block.terminator().0);
            match &block.terminator().0 {
                PaxTerm::BranchTarget(n) => {}
                PaxTerm::Call(f) => {
                    vm.alt_push(0);
                    vm.alt_push(0);
                    debug_program_function(code, source_program, f, vm);
                    vm.alt_pop();
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
        }
    }
}

pub fn debug_program(code: &str, source_program: &PaxProgram) -> bool {
    let mut vm = VM {
        _data: vec![],
        _alt: vec![],
        memory: vec![0; 65536],
    };

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
