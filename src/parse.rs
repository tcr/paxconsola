use crate::*;
use regex::Regex;
use lazy_static::*;
use indexmap::IndexMap;

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
        lazy_static! {
            static ref RE_INT: Regex = Regex::new(r"(?s)^(\-?\$[a-fA-F0-9]+|\-?\d+)(\s+.*?)?$").unwrap();
            static ref RE_WORD: Regex = Regex::new(r"(?s)^(\S*)(\s+.*?)?$").unwrap();
        }

        let code_input = self.code.trim_start().to_string();
        if code_input.is_empty() {
            return None;
        }

        let matches = RE_INT.captures(&code_input);
        match matches {
            Some(cap) => {
                self.code = cap[2].to_string();
                if let Some(index) = cap[1].find("$") {
                    return Some(Token::Literal(isize::from_str_radix(&cap[1][index+1..], 16).unwrap()));
                } else {
                    return Some(Token::Literal(cap[1].parse::<isize>().unwrap()));
                }
            }
            _ => {}
        }

        let matches = RE_WORD.captures(&code_input);
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

pub enum ParseMode {
    Default,
    FunctionName,
    ConstantName(isize),
    CommentParens,
    Variable,
}

#[derive(Debug)]
pub struct MarkerGroup {
    #[allow(unused)]
    name: String,
    target_indices: Vec<usize>,
    source_index: usize,
}

impl MarkerGroup {
    fn new(name: String, index: usize) -> MarkerGroup {
        MarkerGroup {
            name,
            target_indices: vec![],
            source_index: index,
        }
    }

    fn push_marker(&mut self, output: &mut Vec<Pax>) {
        let index = output.len();
        output.push(Pax::Pushn(self.source_index as isize));
        self.target_indices.push(index);
    }

    fn update(&self, output: &mut Vec<Pax>) {
        for target in &self.target_indices {
            // println!("[{}]: {:?}", self.name, target);
            output[*target] = Pax::Pushn(self.source_index as isize);
        }
    }
}

// in a loop,
// slice from function beginning to end,
// adjust all markers in existing code,
// adjust all markers in new code,
// append to the end of the opcode list

pub fn parse_forth(buffer: Vec<u8>) -> Vec<Pax> {
    lazy_static! {
        static ref RE_COMMENTS: Regex = Regex::new(r"(?m)\\.*$").unwrap();
    }

    let mut code = String::from_utf8_lossy(&buffer).to_string();

    // Strip comments
    code = RE_COMMENTS.replace_all(&code, "").to_string();

    let parser = Parser::new(&code);

    let mut output: Vec<Pax> = vec![];
    let mut constants: IndexMap<String, isize> = IndexMap::new(); // only u16 literals
    let mut functions: IndexMap<String, MarkerGroup> = IndexMap::new();
    let mut variables: IndexMap<String, usize> = IndexMap::new(); // stack-pushed positions
    let mut variable_offset: usize = 0;

    let mut parse_mode = ParseMode::Default;
    let mut previous_tokens: Vec<Token> = vec![];
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
                        let function_offset = output.len() + 1;
                        output.push(Pax::Function);

                        let group = MarkerGroup::new(word.to_owned(), function_offset);
                        functions.insert(word.to_string(), group);
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
                        if let Some(group) = functions.get_mut(word.as_str()) {
                            group.push_marker(&mut output);
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
                                    // Hack for removing cells reference from fn group
                                    functions.get_mut("cells").unwrap().target_indices.pop();

                                    let cells = &previous_tokens[previous_tokens.len() - 3];
                                    match cells {
                                        Token::Word(_) => panic!("Expected literal"),
                                        Token::Literal(cells) => {
                                            // eprintln!("allocating {}", cells);
                                            output.pop(); // Call
                                            output.pop(); // "cells"
                                            output.pop(); // value
                                            variable_offset += *cells as usize;
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
                                        // eprintln!("constant {}", value);
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

                            "=" => output.push(Pax::Equals),
                            "*" => output.push(Pax::Multiply),
                            "%" => output.push(Pax::Remainder),
                            ":" => {
                                parse_mode = ParseMode::FunctionName;
                            }
                            ";" => output.push(Pax::Exit),
                            "recurse" => output.push(Pax::Recurse),
                            "if" => output.push(Pax::If),
                            "else" => output.push(Pax::Else),
                            "then" => output.push(Pax::Then),
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

    output.push(Pax::Stop);

    if true {
        const FUNC_OPCODE_ADJUST: usize = 1;


        let keys = functions.keys().cloned().collect::<Vec<_>>();

        // Move first function to end
        for key in keys {
            let func = functions.get_mut(&key).unwrap();

            let offset_start = func.source_index - FUNC_OPCODE_ADJUST;
            let mut offset_end = offset_start;
            while output[offset_end] != Pax::Exit {
                offset_end += 1;
            }
            offset_end += 1;
            let adjust = offset_end - offset_start;

            // Extract this function, re-append to end.
            let func_code: Vec<_> = output.splice(offset_start..offset_end, vec![]).collect();
            let new_func_offset = output.len();
            output.extend(func_code);
            // Update function position.

            // Now relocate all other indexes.
            for func in functions.values_mut() {
                if func.source_index == offset_start + FUNC_OPCODE_ADJUST {
                    func.source_index = new_func_offset + FUNC_OPCODE_ADJUST;
                } else if func.source_index > offset_start {
                    func.source_index -= adjust;
                }

                for target in &mut func.target_indices {
                    if *target >= offset_end {
                        // after function
                        *target -= adjust;
                    } else if *target >= offset_start && *target < offset_end {
                        // inside function
                        *target += new_func_offset - offset_start;
                    }
                }
            }
        }
    }

    // Finalize function positions
    for function in functions.values() {
        function.update(&mut output);
    }

    return output;
}
