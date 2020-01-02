use crate::*;
use indexmap::IndexMap;
use lazy_static::*;
use regex::Regex;

#[derive(Debug, Clone, PartialEq)]
pub enum Token {
    Word(String),
    Literal(isize),
}

#[derive(Debug, Clone)]
pub struct Parser {
    pub code: String,
    pub pos: Pos,
}

impl Parser {
    pub fn new(code: &str) -> Parser {
        Parser {
            code: code.to_string(),
            pos: Pos {
                line: 1,
                col: 1,
            }
        }
    }

    pub fn move_forward(&mut self, length: usize) -> Pos {
        for c in self.code[..length].chars() {
            if c == '\n' {
                self.pos.line += 1;
                self.pos.col = 1;
            } else {
                self.pos.col += 1;
            }
        }
        self.code = self.code[length..].to_string();
        self.pos.clone()
    }
}

impl Iterator for Parser {
    type Item = Located<Token>;

    fn next(&mut self) -> Option<Located<Token>> {
        lazy_static! {
            static ref RE_INT: Regex =
                Regex::new(r"(?s)^(\-?\$[a-fA-F0-9]+|\-?\d+)(\s+.*?)?$").unwrap();
            static ref RE_WORD: Regex = Regex::new(r"(?s)^(\S*)(\s+.*?)?$").unwrap();
        }

        let code_input = self.code.trim_start().to_string();
        if code_input.is_empty() {
            return None;
        }
        let pos_at = self.move_forward(self.code.len() - code_input.len());

        let matches = RE_INT.captures(&code_input);
        match matches {
            Some(cap) => {
                self.move_forward(self.code.len() - cap[2].len());

                if let Some(index) = cap[1].find("$") {
                    return Some((Token::Literal(
                        isize::from_str_radix(&cap[1][index + 1..], 16).unwrap(),
                    ), pos_at));
                } else {
                    return Some((Token::Literal(
                        cap[1].parse::<isize>().unwrap(),
                    ), pos_at));
                }
            }
            _ => {}
        }

        let matches = RE_WORD.captures(&code_input);
        match matches {
            Some(cap) => {
                self.move_forward(self.code.len() - cap[2].len());
                return Some((Token::Word(cap[1].to_string()), pos_at));
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
    fn new(name: &str, index: usize) -> MarkerGroup {
        MarkerGroup {
            name: name.to_string(),
            target_indices: vec![],
            source_index: index,
        }
    }

    fn push_marker(&mut self, output: &mut Vec<Located<Pax>>, pos: Pos) {
        let index = output.len();
        output.push((Pax::PushLabel(self.source_index as isize), pos));
        self.target_indices.push(index);
    }

    fn update(&self, output: &mut Vec<Located<Pax>>) {
        for target in &self.target_indices {
            // println!("[{}]: {:?}", self.name, target);
            output[*target].0 = Pax::PushLabel(self.source_index as isize);
        }
    }
}

pub fn parse_forth(buffer: Vec<u8>) -> Vec<Located<Pax>> {
    lazy_static! {
        static ref RE_COMMENTS: Regex = Regex::new(r"(?m)\\.*$").unwrap();
    }

    let mut code = String::from_utf8_lossy(&buffer).to_string();

    // Strip comments
    code = RE_COMMENTS.replace_all(&code, "").to_string();

    let parser = Parser::new(&code);

    let mut output: Vec<Located<Pax>> = vec![];
    let mut constants: IndexMap<String, isize> = IndexMap::new(); // only u16 literals
    let mut functions: Vec<MarkerGroup> = vec![];
    let mut variables: IndexMap<String, usize> = IndexMap::new(); // stack-pushed positions
    let mut variable_offset: usize = 0;
    let mut flow_markers: Vec<MarkerGroup> = vec![];
    let mut used_flow_markers: Vec<MarkerGroup> = vec![];

    let mut parse_mode = ParseMode::Default;
    let mut previous_tokens: Vec<Token> = vec![];
    for (token, pos) in parser {
        // eprintln!("[token] {:?} at {:?}", token, pos);
        previous_tokens.push(token.clone());

        match parse_mode {
            ParseMode::CommentParens => match token {
                Token::Word(ref word) => {
                    if word == ")" {
                        parse_mode = ParseMode::Default;
                    }
                }
                _ => {}
            },
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
                        // output.push(Pax::Function);
                        let function_offset = output.len(); // don't include first word

                        let group = MarkerGroup::new(word, function_offset);
                        functions.push(group);

                        output.push((Pax::Metadata(word.to_string()), pos));
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
                            output.push((Pax::PushLiteral(constants[word.as_str()] as isize), pos));
                            continue;
                        }
                        // Functions shadow all terms
                        if let Some(group) = functions.iter_mut().find(|c| c.name == word) {
                            group.push_marker(&mut output, pos);
                            output.push((Pax::Call, pos));
                            continue;
                        }
                        // Variables shadow all terms
                        if variables.contains_key(word.as_str()) {
                            output.push((Pax::PushLiteral(variables[word.as_str()] as isize), pos));
                            continue;
                        }

                        match word.as_str() {
                            // compiler keyword
                            "allot" => {
                                if previous_tokens[previous_tokens.len() - 2]
                                    == Token::Word("cells".to_string())
                                {
                                    // Hack for removing cells reference from fn group
                                    functions
                                        .iter_mut()
                                        .find(|c| c.name == "cells")
                                        .unwrap()
                                        .target_indices
                                        .pop();

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

                            // flow control
                            "recurse" => {
                                output.push((Pax::PushLiteral(0), pos));
                                let group = functions.last_mut().unwrap();
                                group.push_marker(&mut output, pos);
                                output.push((Pax::JumpIf0, pos));
                                continue;
                            }
                            "begin" => {
                                flow_markers.push(MarkerGroup::new("<begin>", output.len()));
                            }
                            "until" => {
                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<begin>", "expected begin loop");
                                group.push_marker(&mut output, pos);
                                output.push((Pax::JumpIf0, pos));
                                used_flow_markers.push(group);
                            }
                            "do" => {
                                output.push((Pax::AltPush, pos));
                                output.push((Pax::AltPush, pos));
                                flow_markers.push(MarkerGroup::new("<do>", output.len()));
                            }
                            "loop" => {
                                let group = functions
                                    .iter_mut()
                                    .find(|c| c.name == "loopimpl")
                                    .expect("no :loopimpl defn found");
                                group.push_marker(&mut output, pos);
                                output.push((Pax::Call, pos));

                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<do>", "expected do loop");
                                group.push_marker(&mut output, pos);
                                output.push((Pax::JumpIf0, pos));
                                used_flow_markers.push(group);
                            }
                            "-loop" => {
                                let group = functions
                                    .iter_mut()
                                    .find(|c| c.name == "-loopimpl")
                                    .expect("no :loopimpl defn found");
                                group.push_marker(&mut output, pos);
                                output.push((Pax::Call, pos));

                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<do>", "expected do loop");
                                group.push_marker(&mut output, pos);
                                output.push((Pax::JumpIf0, pos));
                                used_flow_markers.push(group);
                            }
                            "if" => {
                                let mut group = MarkerGroup::new("<if>", output.len());
                                group.push_marker(&mut output, pos);
                                output.push((Pax::JumpIf0, pos));

                                flow_markers.push(group);
                            }
                            "else" => {
                                let mut if_group =
                                    flow_markers.pop().expect("did not match marker group");
                                let mut else_group = MarkerGroup::new("<else>", output.len());
                                output.push((Pax::PushLiteral(0), pos)); // Always yes
                                else_group.push_marker(&mut output, pos);
                                output.push((Pax::JumpIf0, pos));

                                flow_markers.push(else_group);

                                if_group.source_index = output.len();
                                used_flow_markers.push(if_group);
                            }
                            "then" => {
                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                group.source_index = output.len();
                                used_flow_markers.push(group);
                            }

                            // pax
                            "+" => output.push((Pax::Add, pos)),
                            ">r" => output.push((Pax::AltPush, pos)),
                            "r>" => output.push((Pax::AltPop, pos)),
                            "!" => output.push((Pax::Store, pos)),
                            "@" => output.push((Pax::Load, pos)),
                            "nand" => output.push((Pax::Nand, pos)),
                            // pax debug
                            "print" => output.push((Pax::Print, pos)),
                            "debugger" => output.push((Pax::Debugger, pos)),

                            "=" => output.push((Pax::Equals, pos)),
                            "%" => output.push((Pax::Remainder, pos)),

                            ":" => {
                                assert_eq!(flow_markers.len(), 0, "expected empty loop stack");
                                parse_mode = ParseMode::FunctionName;
                            }
                            ";" => output.push((Pax::Exit, pos)),

                            "c!" => output.push((Pax::Store8, pos)),
                            "c@" => output.push((Pax::Load8, pos)),

                            "sleep" => output.push((Pax::Sleep, pos)),

                            _ => {
                                panic!("unknown value: {:?}", word);
                            }
                        }
                    }
                    Token::Literal(lit) => {
                        output.push((Pax::PushLiteral(lit as isize), pos));
                    }
                }
            }
        }
    }

    assert_eq!(flow_markers.len(), 0, "did not exhaust all flow markers");

    output.push((Pax::Stop, Default::default()));

    // eprintln!("---> {:?}", output);

    if true {
        let keys = 0..functions.len();

        // Move first function to end
        for key in keys {
            let func = &mut functions[key];
            // eprintln!("moving {:?} to end", func.name);

            let offset_start = func.source_index;
            let mut offset_end = offset_start;
            while output[offset_end].0 != Pax::Exit {
                offset_end += 1;
            }
            offset_end += 1;
            let adjust = offset_end - offset_start;

            // Extract this function, re-append to end.
            let func_code: Vec<_> = output.splice(offset_start..offset_end, vec![]).collect();
            let new_func_offset = output.len();
            output.extend(func_code);
            let adjust_inner = new_func_offset - offset_start;
            // Update function position.

            // Now relocate all other indexes.
            let mut groups = vec![];
            groups.extend(functions.iter_mut());
            groups.extend(used_flow_markers.iter_mut());
            for func in groups {
                if func.source_index >= offset_end {
                    // eprintln!("----> func.source_index {:?} -= adjust {:?}", func, adjust);
                    func.source_index -= adjust;
                } else if func.source_index >= offset_start {
                    // eprintln!("----> func.source_index {:?} += adjust {:?}", func, adjust);
                    func.source_index += adjust_inner;
                }

                for target in &mut func.target_indices {
                    if *target >= offset_end {
                        // after function
                        *target -= adjust;
                    } else if *target >= offset_start {
                        // inside function
                        *target += new_func_offset - offset_start;
                    }
                }
            }
        }
    }

    // Finalize function positions
    let mut groups = vec![];
    groups.extend(functions.iter_mut());
    groups.extend(used_flow_markers.iter_mut());
    for function in groups {
        function.update(&mut output);
    }

    return output;
}
