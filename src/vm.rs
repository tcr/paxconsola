use num_derive::*;
use maplit::*;
use regex::Regex;
use std::collections::{BTreeMap, VecDeque};
use std::io::prelude::*;
use std::io;
use std::fs::File;
use std::env;
use std::process::exit;
use std::io::Cursor;
use num_traits::cast::FromPrimitive;

macro_rules! die {
    ($($tok:tt)+) => {{
        let stderr = io::stderr();
        let mut stderr = stderr.lock();
        let _ = writeln!(stderr, $($tok)+);
        exit(1)
    }}
}

fn main() {
    let mut args = env::args_os().skip(1);
    let path = match args.next() {
        Some(p) => p,
        None => die!("no filename specified"),
    };
    if args.next().is_some() {
        die!("expected one argument");
    }
    let mut file = File::open(&path).unwrap_or_else(|err| die!("{}", err));
    let mut buffer = Vec::with_capacity(file.metadata().map(|m|m.len()).unwrap_or(0) as usize);
    file.read_to_end(&mut buffer).unwrap_or_else(|err| die!("{}", err));

    // if path.to_string_lossy().ends_with(".bytes") {
    //     // Read as bytecode
    //     forth(buffer);
    // } else {
        // Read as source
        let script = compile_forth(buffer);
        forth(script);
    // }
}

#[derive(Debug, Clone)]
pub enum Token {
    Word(String),
    Literal(isize),
}

#[derive(Debug, Clone)]
pub struct Parser {
    pub code: String,
}

impl Parser {
    pub fn new(code: &str) -> Parser {
        Parser {
            code: code.to_string(),
        }
    }
}

impl Iterator for Parser {
    type Item = Token;

    fn next(&mut self) -> Option<Token> {
        let code_input = self.code.trim_start().to_string();
        if code_input.is_empty() {
            return None;
        }

        let re_int = Regex::new(r"(?s)^(\-?\d+)(\s+.*?)?$").unwrap();
        let re_int_hex = Regex::new(r"(?s)^0x(\d+)(\s+.*?)?$").unwrap();
        let re_word = Regex::new(r"(?s)^(\S*)(\s+.*?)?$").unwrap();

        let matches = re_int.captures(&code_input);
        match matches {
            Some(cap) => {
                self.code = cap[2].to_string();
                return Some(Token::Literal(cap[1].parse::<isize>().unwrap()));
            }
            _ => {}
        }

        let matches = re_int_hex.captures(&code_input);
        match matches {
            Some(cap) => {
                self.code = cap[2].to_string();
                unimplemented!();
            }
            _ => {}
        }

        let matches = re_word.captures(&code_input);
        match matches {
            Some(cap) => {
                self.code = cap[2].to_string();
                return Some(Token::Word(cap[1].to_string()));
            }
            _ => {}
        }

        panic!("incomplete parse: {:?}", &code_input);
    }
}

enum ParseMode {
    Default,
    FunctionName,
    CommentParens,
}

fn compile_forth(buffer: Vec<u8>) -> Vec<u8> {
    let code = String::from_utf8_lossy(&buffer).to_string();
    let parser = Parser::new(&code);

    let mut parse_mode = ParseMode::Default;
    let mut output = vec![];
    let mut functions = hashmap![];
    for token in parser {
        eprintln!("[token] {:?}", token);

        match parse_mode {
            ParseMode::CommentParens => {
                match token {
                    Token::Word(ref word) => {
                        if word == ")" {
                            parse_mode = ParseMode::Default;
                        }
                    }
                    _ => {}
                }
            }
            ParseMode::FunctionName => {
                match token {
                    Token::Word(ref word) => {
                        let idx = functions.len() as u8;
                        functions.insert(word.to_string(), idx);
                        output.push(idx);
                    }
                    _ => panic!("expected function name"),
                }
                parse_mode = ParseMode::Default;
            }
            ParseMode::Default => {
                match token {
                    Token::Word(word) => {
                        // Skip comments
                        if word == "(" {
                            parse_mode = ParseMode::CommentParens;
                            continue;
                        }

                        // Functions shadow all terms
                        if functions.contains_key(word.as_str()) {
                            output.push(Pax::Pushn as _);
                            output.push(functions[word.as_str()]);
                            output.push(Pax::Call as _);
                            continue;
                        }

                        match word.as_str() {
                            "print" => output.push(Pax::Print as _), // pax+
                            "+" => output.push(Pax::Add as _), // pax
                            ">r" => output.push(Pax::AltPush as _), // pax
                            "r>" => output.push(Pax::AltPop as _), // pax
                            "!" => output.push(Pax::Store as _), // pax
                            "@" => output.push(Pax::Load as _), // pax

                            "*" => output.push(Pax::Multiply as _),
                            "-" => output.push(Pax::Subtract as _),
                            "%" => output.push(Pax::Remainder as _),
                            "dup" => output.push(Pax::Dup as _),
                            "swap" => output.push(Pax::Swap as _),
                            "rot" => output.push(Pax::Rotate as _),
                            ":" => {
                                output.push(Pax::Function as _);
                                parse_mode = ParseMode::FunctionName;
                            }
                            ";" => output.push(Pax::FunctionEnd as _),
                            "recurse" => {
                                output.push(Pax::Recurse as _);
                            },
                            "pack" => output.push(Pax::Pack as _),
                            "if" => output.push(Pax::If as _),
                            "else" => output.push(Pax::Else as _),
                            "then" => output.push(Pax::Then as _),
                            "==" => output.push(Pax::Equals as _),
                            "drop" => output.push(Pax::Drop as _),
                            "or" => output.push(Pax::Or as _),
                            "and" => output.push(Pax::And as _),
                            "nand" => output.push(Pax::AltPop as _),
                            _ => {
                                panic!("unknown value: {:?}", word);
                            }
                        }
                    }
                    Token::Literal(lit) => {
                        if lit > 255 {
                            panic!("Cannot convert {} to u8", lit);
                        }
                        output.push(Pax::Pushn as _);
                        output.push(lit as u8);
                    }
                }
            }
        }
    }

    return output;
}

#[repr(u8)]
#[derive(FromPrimitive, ToPrimitive, Debug, PartialEq)]
enum Pax { 
    Print,
    Add,
    Store,
    Load,
    AltPush,
    AltPop,
    Function,
    FunctionEnd,
    Nand,
    Recurse,
    Pushn,
    Multiply,
    Subtract,
    Call,
    Pack,
    Rotate,
    Swap,
    Dup,
    Remainder,
    And,
    Or,
    Equals,
    Drop,
    If,
    Else,
    Then,
}

fn forth(code: Vec<u8>) -> Vec<u32> {
    // Pre-allocate some space. Keeps short programs with small stacks from
    // spending time up front repeatedly re-allocating the stacks.
    let mut stack: Vec<u32> = Vec::with_capacity(32);
    let mut alt_stack: Vec<u32> = Vec::with_capacity(32);

    // Could also use a HashMap but BTreeMaps tend to be faster smaller tables.
    // If we had more guarantees about where variables could be written,
    // variable lookup could be significantly faster.
    let mut variables: BTreeMap<u32, u32> = BTreeMap::new();

    // To avoid allocating every time we define a function, store them all in
    // the same Vec, terminate them with a 17 byte (can't appear in function
    // definitions), and put a pointer to them in function_table.
    let mut function_table: Vec<usize> = vec![0; 256];
    let mut function_code: Vec<u8> = Vec::new();

    // NOTE: this could be significantly faster if we loosened the stack
    // abstraction a bit but forth really is all about stacks.

    // eprintln!("[code] {:?}", code);
    let mut cindex = 0;
    while cindex < code.len() {
        let op = code[cindex];
        cindex += 1;
        
        // eprintln!("[op:{}] {}", cindex - 1, op);
        // eprintln!("[stack] {:?}", stack);
        match Pax::from_u8(op).unwrap() {
            // print
            Pax::Print => {
                // debug: Take the top three items from the stack.
                for &b in stack.iter().rev().take(3) {
                    println!("{}", b);
                }
            }
            // +
            Pax::Add => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(b + d);
            }
            // ! (store value in variable)
            Pax::Store => {
                let name = stack.pop().unwrap();
                let value = stack.pop().unwrap();
                variables.insert(name, value);
            }
            // @ (get)
            Pax::Load => {
                let name = stack.pop().unwrap();
                let value = *variables.get(&name).unwrap_or(&0);
                stack.push(value);
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
            // : (define function)
            Pax::Function => {
                let name = code[cindex];
                cindex += 1;
                // skip past ;
                function_table[name as usize] = cindex;
                while Pax::from_u8(code[cindex]) != Some(Pax::FunctionEnd) {
                    cindex += 1;
                }
                cindex += 1;
            }
            // nand
            Pax::Nand => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push((z ^ y) as u32);
            }
            // pushn
            Pax::Pushn => {
                let y = code[cindex];
                cindex += 1;
                stack.push(y as u32);
            }
            // recurse
            Pax::Recurse => {
                // walk backward
                while Pax::from_u8(code[cindex]) != Some(Pax::Function) {
                    cindex -= 1;
                }
                cindex += 2;
            }
            // call
            Pax::Call => {
                let name = stack.pop().unwrap();
                let function_start = function_table[name as usize];
                // eprintln!("function_start {:?} = {}", name, function_start);
                assert!(function_start != 0, "attempted to call undefined function {}", name);
                alt_stack.push(cindex as u32);
                cindex = function_start;
            }
            // ;
            Pax::FunctionEnd => {
                // eprintln!("[call] done: {:?} {:?}", alt_stack, variables.get(&0));
                cindex = alt_stack.pop().unwrap() as usize;
            }


            // *
            Pax::Multiply => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(b * d);
            },
            // -
            Pax::Subtract => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(d - b);
            }
            // %
            Pax::Remainder => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(d % b);
            }
            // dup
            Pax::Dup => {
                let ab = stack.pop().unwrap();
                stack.push(ab);
                stack.push(ab);
            }
            // swap
            Pax::Swap => {
                let y = stack.pop().unwrap();
                let u = stack.pop().unwrap();
                stack.push(y);
                stack.push(u);
            }
            // rot
            Pax::Rotate => {
                let x = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                let z = stack.pop().unwrap();
                stack.push(y);
                stack.push(z);
                stack.push(x);
            },
            // pack
            Pax::Pack => {
                let d = stack.pop().unwrap() as u32;
                let e = stack.pop().unwrap() as u32;
                let b = stack.pop().unwrap() as u32;
                let z = stack.pop().unwrap() as u32;
                let y = (d << 24) | (e << 16) | (b << 8) | z;
                stack.push(y);
            }
            // if
            Pax::If => {
                let y = stack.pop().unwrap();
                if y == 0 {
                    // skip until 'else'
                    while Pax::from_u8(code[cindex]) != Some(Pax::Else) {
                        cindex += 1;
                    }
                    cindex += 1;
                }
            }
            // else; skip until 'then'
            Pax::Else => while Pax::from_u8(code[cindex]) != Some(Pax::Then) {
                cindex += 1;
            },
            // then
            Pax::Then => {},
            // ==
            Pax::Equals => {
                let y = stack.pop().unwrap();
                let z = stack.pop().unwrap();
                stack.push((z == y) as u32);
            }
            // drop
            Pax::Drop => {
                stack.pop().unwrap();
            }
            // or
            Pax::Or => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push((z != 0 || y != 0) as u32)
            }
            // and
            Pax::And => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push((z != 0u32 && y != 0u32) as u32);
            }
            _ => panic!("unknown op code {}", op),
        }
    }
    stack
}
