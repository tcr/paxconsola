#![allow(deprecated)]

// use num_derive::*;
use maplit::*;
use regex::Regex;
use std::io::prelude::*;
use std::io;
use std::fs::File;
use std::env;
use std::process::exit;
// use std::io::Cursor;
use termion::{clear, cursor, style};
use termion::raw::IntoRawMode;
use termion::input::TermRead;
// use termion::event::Key;

const ENABLE_GRAPHICS: bool = true;

macro_rules! die {
    ($($tok:tt)+) => {{
        let stderr = io::stderr();
        let mut stderr = stderr.lock();
        let _ = writeln!(stderr, $($tok)+);
        exit(1)
    }}
}

const PRELUDE: &str = r"

: cells ;

\ Positions synced with VM (for now)
variable graphics 575 cells allot \ 0-575
variable last-key \ 576
variable random-register \ 577

variable  temp \ 578
: swap   >r temp ! r> temp @ ;
: over   >r temp ! temp @ r> temp @ ;

: random random-register @ swap % ;

: 1+   1 + ;
: 1-   -1 + ;
: +!   dup >r @ + r> ! ;

";

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
        let mut bytes = PRELUDE.as_bytes().to_owned();
        bytes.extend(&buffer);
        let script = compile_forth(bytes);
        forth(script);
    // }
}

#[derive(Debug, Clone, PartialEq)]
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
    ConstantName(isize),
    CommentParens,
    Variable,
}

fn compile_forth(buffer: Vec<u8>) -> Vec<Pax> {
    let mut code = String::from_utf8_lossy(&buffer).to_string();

    // Strip comments
    let re_comments = Regex::new(r"(?m)\\.*$").unwrap();
    code = re_comments.replace_all(&code, "").to_string();

    let parser = Parser::new(&code);

    let mut parse_mode = ParseMode::Default;
    let mut output = vec![];
    let mut functions = hashmap![];
    let mut variables = hashmap![];
    let mut variable_offset = 0;
    let mut constants = hashmap![];
    let mut previous_tokens = vec![];
    for token in parser {
        // eprintln!("[token] {:?}", token);
        previous_tokens.push(token.clone());

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
            ParseMode::Variable => {
                match token {
                    Token::Word(ref word) => {
                        variables.insert(word.to_string(), variable_offset);
                        variable_offset += 1;
                    }
                    _ => panic!("expected variable name"),
                }
                parse_mode = ParseMode::Default;
            }
            ParseMode::FunctionName => {
                match token {
                    Token::Word(ref word) => {
                        let idx = functions.len() as u8;
                        functions.insert(word.to_string(), idx);
                        output.push(Pax::Function(idx as usize));
                    }
                    _ => panic!("expected function name"),
                }
                parse_mode = ParseMode::Default;
            }
            ParseMode::ConstantName(value) => {
                match token {
                    Token::Word(ref word) => {
                        constants.insert(word.to_string(), value);
                    }
                    _ => panic!("expected constant name"),
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

                        // Skip comments
                        if word == "variable" {
                            parse_mode = ParseMode::Variable;
                            continue;
                        }

                        // Constants shadow all terms
                        if constants.contains_key(word.as_str()) {
                            output.push(Pax::Pushn(constants[word.as_str()] as isize));
                            continue;
                        }
                        // Functions shadow all terms
                        if functions.contains_key(word.as_str()) {
                            output.push(Pax::Pushn(functions[word.as_str()] as isize));
                            output.push(Pax::Call);
                            continue;
                        }
                        // Variables shadow all terms
                        if variables.contains_key(word.as_str()) {
                            output.push(Pax::Pushn(variables[word.as_str()] as isize));
                            continue;
                        }

                        match word.as_str() {
                            // compiler keyword
                            "allot" => {
                                if previous_tokens[previous_tokens.len() - 2] == Token::Word("cells".to_string()) {
                                    let cells = &previous_tokens[previous_tokens.len() - 3];
                                    match cells {
                                        Token::Word(_) => panic!("Expected literal"),
                                        Token::Literal(cells) => {
                                            eprintln!("allocating {}", cells);
                                            output.pop(); // Call
                                            output.pop(); // "cells"
                                            output.pop(); // value
                                            variable_offset += cells;
                                        }
                                    }
                                } else {
                                    panic!("expected cells");
                                }
                            }
                            // compiler keyword
                            "constant" => {
                                let cells = &previous_tokens[previous_tokens.len() - 2];
                                match cells {
                                    Token::Word(_) => panic!("Expected literal"),
                                    Token::Literal(value) => {
                                        eprintln!("constant {}", value);
                                        output.pop(); // value

                                        parse_mode = ParseMode::ConstantName(*value);
                                    }
                                }
                            }

                            // pax
                            "+" => output.push(Pax::Add),
                            ">r" => output.push(Pax::AltPush),
                            "r>" => output.push(Pax::AltPop),
                            "!" => output.push(Pax::Store),
                            "@" => output.push(Pax::Load),
                            // pax debug
                            "print" => output.push(Pax::Print),
                            "debugger" => output.push(Pax::Debugger),

                            "*" => output.push(Pax::Multiply),
                            "-" => output.push(Pax::Subtract),
                            "%" => output.push(Pax::Remainder),
                            "dup" => output.push(Pax::Dup),
                            "rot" => output.push(Pax::Rotate),
                            ":" => {
                                parse_mode = ParseMode::FunctionName;
                            }
                            ";" => output.push(Pax::Exit),
                            "recurse" => output.push(Pax::Recurse),
                            "pack" => output.push(Pax::Pack),
                            "if" => output.push(Pax::If),
                            "else" => output.push(Pax::Else),
                            "then" => output.push(Pax::Then),
                            "==" => output.push(Pax::Equals),
                            "=" => output.push(Pax::Equals),
                            "drop" => output.push(Pax::Drop),
                            "or" => output.push(Pax::Or),
                            "and" => output.push(Pax::And),
                            "nand" => output.push(Pax::Nand),
                            "sleep" => output.push(Pax::Sleep),

                            "do" => output.push(Pax::Do),
                            "loop" => output.push(Pax::Loop),
                            "+loop" => output.push(Pax::PlusLoop),
                            "i" => output.push(Pax::IIndex),
                            "j" => output.push(Pax::JIndex),
                            "begin" => output.push(Pax::Begin),
                            "until" => output.push(Pax::Until),
                            _ => {
                                panic!("unknown value: {:?}", word);
                            }
                        }
                    }
                    Token::Literal(lit) => {
                        output.push(Pax::Pushn(lit as isize));
                    }
                }
            }
        }
    }

    return output;
}

#[derive(Debug, PartialEq, Clone)]
enum Pax {
    // pax
    // todo noop
    Load,
    Call,
    Exit,
    Pushn(isize), // (literal: u<N>)
    AltPop, 
    Add,
    Nand,
    AltPush,
    // todo 0branch
    Store,
    // pax debug
    Print,
    Debugger,
    Sleep, // todo: should be "yieldframe"

    Function(usize), // (index: u8)
    Recurse,
    Multiply,
    Subtract,
    Pack,
    Rotate,
    Dup,
    Remainder,
    And,
    Or,
    Equals,
    Drop,
    If,
    Else,
    Then,

    Do,
    Loop,
    PlusLoop,
    IIndex,
    JIndex,
    Begin,
    Until,
}

fn forth(code: Vec<Pax>) -> Vec<u32> {
    // Pre-allocate some space. Keeps short programs with small stacks from
    // spending time up front repeatedly re-allocating the stacks.
    let mut stack: Vec<u32> = vec![];
    let mut alt_stack: Vec<u32> = vec![];
    // (index, limit, loop start)
    let mut loop_stack: Vec<(u32, u32, usize)> = Vec::with_capacity(32);

    // TODO could look up max variable allocation from compiled artifact.
    let mut variables: Vec<u32> = vec![0; 1024*64];

    // To avoid allocating every time we define a function, store them all in
    // the same Vec, terminate them with a 17 byte (can't appear in function
    // definitions), and put a pointer to them in function_table.
    let mut function_table: Vec<usize> = vec![0; 256];

    let mut do_level: Vec<usize> = vec![0];

    // NOTE: this could be significantly faster if we loosened the stack
    // abstraction a bit but forth really is all about stacks.

    let mut use_graphics = false;

    // eprintln!("[code] {:?}", code);
    let mut cindex = 0;
    let mut frame = 0;
    while cindex < code.len() {
        let op = code[cindex].clone();
        cindex += 1;
        
        // eprintln!("[op#{:>4}]  {:<12}   stack: {:?}", format!("{}", cindex - 1), format!("{:?}", op), stack);
        match op {
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
            Pax::Begin => {
                loop_stack.push((0, 0, cindex));
            }
            Pax::Until => {
                let condition = stack.pop().unwrap();
                if condition == 0 {
                    cindex = loop_stack.last().unwrap().2;
                } else {
                    loop_stack.pop();
                }
            }

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
                stack.push(b.wrapping_add(d));
            }
            // ! (store value in variable)
            Pax::Store => {
                let name = stack.pop().unwrap();
                let value = stack.pop().unwrap();
                variables[name as usize] = value;

                if ENABLE_GRAPHICS {
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
            // : (define function)
            Pax::Function(findex) => {
                // skip past ;
                function_table[findex] = cindex;
                loop {
                    if let Pax::Exit = code[cindex] {
                        break;
                    }
                    cindex += 1;
                }
                cindex += 1;
            }
            // nand
            Pax::Nand => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push(!(z & y));
            }
            // pushn
            Pax::Pushn(lit) => {
                stack.push(lit as u32);
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
                std::thread::sleep_ms(time as _);
                frame += 1;

                if frame == 4 {
                    // HACK fill in last-key
                    variables[576] = 38;
                } else if frame == 12 {
                    // HACK fill in last-key
                    variables[576] = 37;
                }
            }
            // recurse
            Pax::Recurse => {
                // walk backward
                loop {
                    if let Pax::Function(_) = code[cindex] {
                        break;
                    }
                    cindex -= 1;
                }
                cindex += 1;
            }
            // call
            Pax::Call => {
                let name = stack.pop().unwrap();
                let function_start = function_table[name as usize];
                // eprintln!("function_start {:?} = {}", name, function_start);
                assert!(function_start != 0, "attempted to call undefined function {}", name);
                alt_stack.push(cindex as u32);
                cindex = function_start;
                do_level.push(0);
            }
            // ;
            Pax::Exit => {
                // eprintln!("[call] done: {:?} {:?}", alt_stack, variables.get(&0));
                cindex = alt_stack.pop().unwrap() as usize;
                do_level.pop();
            }


            // *
            Pax::Multiply => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(b.wrapping_mul(d));
            },
            // -
            Pax::Subtract => {
                let b = stack.pop().unwrap();
                let d = stack.pop().unwrap();
                stack.push(d.wrapping_sub(b));
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
            // rot
            Pax::Rotate => {
                let n3 = stack.pop().unwrap();
                let n2 = stack.pop().unwrap();
                let n1 = stack.pop().unwrap();
                stack.push(n2);
                stack.push(n3);
                stack.push(n1);
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
                    while code[cindex] != Pax::Else && code[cindex] != Pax::Then {
                        cindex += 1;
                    }
                    cindex += 1;
                }
            }
            // else; skip until 'then'
            Pax::Else => while code[cindex] != Pax::Then {
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
                stack.push(z | y)
            }
            // and
            Pax::And => {
                let z = stack.pop().unwrap();
                let y = stack.pop().unwrap();
                stack.push((z & y) as u32);
            }
        }
    }
    stack
}
