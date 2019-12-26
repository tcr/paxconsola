use crate::*;
use maplit::*;
use regex::Regex;

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

        let re_int = Regex::new(r"(?s)^(\-?\$[a-fA-F0-9]+|\-?\d+)(\s+.*?)?$").unwrap();
        let re_word = Regex::new(r"(?s)^(\S*)(\s+.*?)?$").unwrap();

        let matches = re_int.captures(&code_input);
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

pub enum ParseMode {
    Default,
    FunctionName,
    ConstantName(isize),
    CommentParens,
    Variable,
}

pub fn parse_forth(buffer: Vec<u8>) -> Vec<Pax> {
    let mut code = String::from_utf8_lossy(&buffer).to_string();

    // Strip comments
    let re_comments = Regex::new(r"(?m)\\.*$").unwrap();
    code = re_comments.replace_all(&code, "").to_string();

    let parser = Parser::new(&code);

    let mut parse_mode = ParseMode::Default;
    let mut output = vec![];
    let mut functions = hashmap![];
    let mut function_offset = 0;
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
                        functions.insert(word.to_string(), function_offset);
                        output.push(Pax::Function(function_offset));
                        function_offset += 1;
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

    return output;
}
