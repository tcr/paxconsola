use maplit::*;
use regex::Regex;
use std::collections::{BTreeMap, VecDeque};
use std::io::prelude::*;
use std::io;
use std::fs::File;
use std::env;
use std::process::exit;

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

    if path.to_string_lossy().ends_with(".bytes") {
        // Read as bytecode
        forth(buffer);
    } else {
        // Read as source
        let script = compile_forth(buffer);
        forth(script);
    }
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
                            output.push(21);
                            output.push(functions[word.as_str()]);
                            output.push(19);
                            continue;
                        }

                        match word.as_str() {
                            "print" => output.push(0u8), // pax+
                            "+" => output.push(1), // pax
                            ">r" => output.push(6), // pax
                            "r>" => output.push(7), // pax
                            "!" => output.push(8), // pax
                            "@" => output.push(9), // pax

                            "*" => output.push(2),
                            "-" => output.push(3),
                            "/" => output.push(4),
                            "%" => output.push(5),
                            "dup" => output.push(10),
                            "swap" => output.push(11),
                            "rot" => output.push(12),
                            "tuck" => output.push(13),
                            "2dup" => output.push(14),
                            "2swap" => output.push(15),
                            ":" => {
                                output.push(16);
                                parse_mode = ParseMode::FunctionName;
                            }
                            ";" => output.push(17),
                            "recurse" => {
                                output.push(21);
                                output.push(18);
                                output.push(19);
                            },
                            // "call" => output.push(19),
                            "push" => output.push(20),
                            // "pushn" => output.push(21),
                            "push1" => output.push(22),
                            "push2" => output.push(23),
                            "push3" => output.push(24),
                            "if" => output.push(25),
                            "else" => output.push(26),
                            "then" => output.push(27),
                            "==" => output.push(28),
                            ">" => output.push(29),
                            "<" => output.push(30),
                            "drop" => output.push(31),
                            "Stop" => output.push(32),
                            "or" => output.push(34),
                            "and" => output.push(35),
                            "nand" => output.push(36),
                            _ => {
                                panic!("unknown value: {:?}", word);
                            }
                        }
                    }
                    Token::Literal(lit) => {
                        if lit > 255 {
                            panic!("Cannot convert {} to u8", lit);
                        }
                        output.push(21);
                        output.push(lit as u8);
                    }
                }
            }
        }
    }

    return output;
}

fn forth(buffer: Vec<u8>) -> Vec<u32> {
    // In-place reversal
    let mut code = VecDeque::from(buffer);

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

    while let Some(op) = code.pop_front() {
        match op {
            //print
            0u8 => {
                // Take the top three items from the stack.
                for &b in stack.iter().rev().take(3) {
                    println!("{}", b);
                }
            }
            // +
            1u8 => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(b+d);
            }
            // ! (store value in variable)
            8u8 => {
                let name = stack.pop().unwrap();
                let value = stack.pop().unwrap();
                variables.insert(name, value);
            }
            // @ (get)
            9u8 => {
                let name = stack.pop().unwrap();
                let value = *variables.get(&name).unwrap_or(&0);
                stack.push(value);
            }
            // >r
            6u8 => {
                let b = stack.pop().unwrap();
                alt_stack.push(b);
            }
            // r>
            7u8 => {
                let b = alt_stack.pop().unwrap();
                stack.push(b);
            }
            // : (define function)
            16u8 => {
                let name = code.pop_front().unwrap();
                function_code.push(17u8);
                loop {
                    match code.pop_front().expect("unterminated function") {
                        17u8 => break,
                        18u8 => function_code.push(name),
                        op => function_code.push(op),
                    }
                }
                function_table[name as usize] = function_code.len();
            }
            17u8|18u8 => unreachable!(),
            // nand
            36u8 => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push((z ^ y) as u32);
            }
            //pushn
            21u8 => {
                let y = code.pop_front().unwrap();
                stack.push(y as u32);
            }
            //demo
            37u8 => {
                eprintln!("[call] done: {:?} {:?}", alt_stack, variables.get(&0));
                // alt_stack.pop();
            }
            // call
            19u8 => {
                let name = stack.pop().unwrap();
                let function_start = function_table[name as usize];
                code.push_front(37);
                assert!(function_start != 0, "attempted to call undefined function {}", name);
                for &byte in function_code[..function_start].iter().rev() {
                    match byte {
                        17u8 => break,
                        _ => code.push_front(byte),
                    }
                }
                // alt_stack.push(0);
                eprintln!("[call] enter: {:?} {:?}", alt_stack, variables.get(&0));
            }


            // *
            2u8 => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(b*d);
            },
            // -
            3u8 => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(d-b);
            }
            4u8 => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(b/d);
            }
            // %
            5u8 => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push( d % b );
            }
            //dup
            10u8 => {
                let ab = stack.pop().unwrap();
                stack.push(ab);
                stack.push(ab);
            }
            // swap
            11u8 => {
                let y = stack.pop().unwrap();
                let u = stack.pop().unwrap();
                stack.push(y);
                stack.push(u);
            }
            //rot
            12u8 => {
                let x = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                let z = stack.pop().unwrap();
                stack.push(y);
                stack.push(z);
                stack.push(x);
            },
            // tuck
            13u8 => {
                let x = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                let z = stack.pop().unwrap();
                stack.push(z);
                stack.push(x);
                stack.push(y);
            },
            // 2dup
            14u8 => {
                let x = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push(y);
                stack.push(x);
                stack.push(y);
                stack.push(x);
            }
            // 2swap
            15u8 => {
                let x = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                let x2 = stack.pop().unwrap();
                let y2 = stack.pop().unwrap();
                stack.push(y);
                stack.push(x);
                stack.push(y2);
                stack.push(x2);
            }
            // push
            20u8 => {
                let b = stack.pop().unwrap();
                for _ in 0..b {
                    let d = code.pop_front().unwrap();
                    stack.push(d as u32);
                }
            }
            //push1..3
            22u8|23u8|24u8 => {
                let count = op - 21;
                for _ in 0..count {
                    let d = stack.pop().unwrap() as u32;
                    let e = stack.pop().unwrap() as u32;
                    let b = stack.pop().unwrap() as u32;
                    let z = stack.pop().unwrap() as u32;
                    let y = (d << 24) | (e << 16) | (b << 8) | z;
                    stack.push(y);
                }
            }
            // if
            25u8 => {
                let y = stack.pop().unwrap();
                if y == 0 {
                    // skip to else.
                    while code.pop_front().unwrap() != 26 { }
                }
            }
            // skip over else
            26u8 => while code.pop_front().unwrap() != 27 { },
            // endif
            27u8 => {},
            // ==
            28u8 => {
                let y = stack.pop().unwrap();
                let z = stack.pop().unwrap();
                stack.push((z == y) as u32);
            }
            // >
            29u8 => {
                let y = stack.pop().unwrap();
                let z = stack.pop().unwrap();
                stack.push((z > y) as u32);
            }
            // <
            30u8 => {
                let y = stack.pop().unwrap();
                let z = stack.pop().unwrap();
                stack.push((z < y) as u32);
            }
            // drop
            31u8 => {
                stack.pop().unwrap();
            }
            // Stop
            32u8 => break,
            // or
            34u8 => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push((z != 0 || y != 0) as u32)
            }
            // and
            35u8 => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push((z != 0u32 && y != 0u32) as u32);
            }
            _ => panic!("unknown op code {}", op),
        }
    }
    stack
}
