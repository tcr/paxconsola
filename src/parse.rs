use crate::*;
use indexmap::{IndexMap, IndexSet};
use lazy_static::*;
use regex::Regex;

pub enum ParseMode {
    Default,
    FunctionName,
    ConstantName(isize),
    CommentParens,
    Variable,
}

// Value for WebAssembly
// const BASE_VARIABLE_OFFSET: usize = 10000;
// Value for Gameboy
const BASE_VARIABLE_OFFSET: usize = 0xc040;

pub type Span = Vec<Located<Pax>>;

#[derive(Debug)]
pub struct MarkerGroup {
    #[allow(unused)]
    name: String,
    target_indices: Vec<usize>,
    source_index: Option<usize>,
}

impl MarkerGroup {
    fn new(name: &str, source_index: Option<usize>) -> MarkerGroup {
        MarkerGroup {
            name: name.to_string(),
            target_indices: vec![],
            source_index,
        }
    }

    fn new_target(name: &str, output: &mut Span, pos: Pos) -> MarkerGroup {
        let index = output.len();
        output.push((Pax::BranchTarget, pos));
        MarkerGroup {
            name: name.to_string(),
            target_indices: vec![],
            source_index: Some(index),
        }
    }

    fn set_target(&mut self, output: &mut Span, pos: Pos) {
        assert!(self.source_index.is_none());
        let index = output.len();
        output.push((Pax::BranchTarget, pos));
        self.source_index = Some(index);

        for target in &self.target_indices {
            output[*target].0 = Pax::JumpIf0(index);
        }
    }

    fn push_marker(&mut self, output: &mut Span, pos: Pos) {
        let index = output.len();
        output.push((Pax::JumpIf0(self.source_index.unwrap_or(0)), pos));
        self.target_indices.push(index);
    }
}

pub type Program = IndexMap<String, Span>;

pub fn parse_forth(buffer: Vec<u8>) -> Program {
    lazy_static! {
        static ref RE_COMMENTS: Regex = Regex::new(r"(?m)\\.*$").unwrap();
    }

    let mut code = String::from_utf8_lossy(&buffer).to_string();

    // Strip comments
    code = RE_COMMENTS.replace_all(&code, "").to_string();

    let parser = Tokenizer::new(&code);

    let mut functions: IndexMap<String, Span> = IndexMap::new();
    let mut constants: IndexMap<String, isize> = IndexMap::new(); // only u16 literals
    let mut variables: IndexMap<String, usize> = IndexMap::new(); // stack-pushed positions
    let mut variable_offset: usize = BASE_VARIABLE_OFFSET;

    let mut flow_markers: Vec<MarkerGroup> = vec![];
    let mut used_flow_markers: Vec<MarkerGroup> = vec![];

    // Start in "main" (the global function).
    functions.insert("main".to_string(), vec![]);

    // Create the function stack. Should always be at len 1 (main) or len 2 (inside a function)
    let mut stack: Vec<(String, Span)> = vec![("main".to_string(), vec![])];
    fn current(stack: &'_ mut Vec<(String, Span)>) -> &'_ mut Span {
        &mut stack.last_mut().unwrap().1
    }

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
                        variable_offset += 2;
                    }
                    _ => panic!("expected variable name"),
                }
                parse_mode = ParseMode::Default;
            }
            ParseMode::FunctionName => {
                match token {
                    Token::Word(ref word) => {
                        stack.push((word.to_string(), vec![]));

                        current(&mut stack).push((Pax::Metadata(word.to_string()), pos));

                        // Flow control for recurse
                        let group = MarkerGroup::new_target(word, current(&mut stack), pos);
                        flow_markers.push(group);
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
                    Token::Literal(lit) => {
                        current(&mut stack).push((Pax::PushLiteral(lit as isize), pos));
                    }
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
                            current(&mut stack)
                                .push((Pax::PushLiteral(constants[word.as_str()] as isize), pos));
                            continue;
                        }
                        // Functions shadow all terms
                        if functions.contains_key(&word) {
                            current(&mut stack).push((Pax::Call(word.to_string()), pos));
                            continue;
                        }
                        // Variables shadow all terms
                        if variables.contains_key(word.as_str()) {
                            current(&mut stack)
                                .push((Pax::PushLiteral(variables[word.as_str()] as isize), pos));
                            continue;
                        }

                        match word.as_str() {
                            // Compiler keywords
                            "allot" => {
                                if previous_tokens[previous_tokens.len() - 2]
                                    == Token::Word("cells".to_string())
                                {
                                    let cells = &previous_tokens[previous_tokens.len() - 3];
                                    match cells {
                                        Token::Word(_) => panic!("Expected literal"),
                                        Token::Literal(cells) => {
                                            // eprintln!("allocating {}", cells);
                                            current(&mut stack).pop(); // "cells"
                                            current(&mut stack).pop(); // value
                                            variable_offset += (*cells as usize) * 2;
                                        }
                                    }
                                } else {
                                    panic!("expected cells");
                                }
                            }
                            "constant" => {
                                let cells = &previous_tokens[previous_tokens.len() - 2];
                                match cells {
                                    Token::Word(_) => panic!("Expected literal"),
                                    Token::Literal(value) => {
                                        current(&mut stack).pop(); // value

                                        parse_mode = ParseMode::ConstantName(*value);
                                    }
                                }
                            }

                            // Function delimiters
                            ":" => {
                                assert_eq!(stack.len(), 1, "cannot nest functions");
                                assert_eq!(flow_markers.len(), 0, "expected empty flow stack");

                                parse_mode = ParseMode::FunctionName;
                            }
                            ";" => {
                                assert!(stack.len() == 2, "expected to be inside a function");
                                assert_eq!(
                                    flow_markers.len(),
                                    1,
                                    "expected flow stack with just recurse"
                                );

                                let recurse_group = flow_markers.pop().unwrap();
                                used_flow_markers.push(recurse_group);
                                current(&mut stack).push((Pax::Exit, pos));

                                // Extract function into its own body.
                                let (name, body) = stack.pop().unwrap();
                                functions.insert(name, body);
                            }

                            // Flow control
                            "recurse" => {
                                current(&mut stack).push((Pax::PushLiteral(0), pos));
                                // Address root flow group
                                flow_markers[0].push_marker(current(&mut stack), pos);
                                continue;
                            }
                            "begin" => {
                                flow_markers.push(MarkerGroup::new_target(
                                    "<begin>",
                                    current(&mut stack),
                                    pos,
                                ));
                            }
                            "until" => {
                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<begin>", "expected begin loop");
                                group.push_marker(current(&mut stack), pos);
                                used_flow_markers.push(group);
                            }
                            "do" => {
                                current(&mut stack).push((Pax::AltPush, pos));
                                current(&mut stack).push((Pax::AltPush, pos));
                                flow_markers.push(MarkerGroup::new_target(
                                    "<do>",
                                    current(&mut stack),
                                    pos,
                                ));
                            }
                            "loop" => {
                                let name = "loopimpl";
                                if !functions.contains_key(name) {
                                    panic!("no loopimpl defn found");
                                }
                                current(&mut stack).push((Pax::Call(name.to_string()), pos));

                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<do>", "expected do loop");
                                group.push_marker(current(&mut stack), pos);
                                used_flow_markers.push(group);
                            }
                            "-loop" => {
                                let name = "-loopimpl";
                                if !functions.contains_key(name) {
                                    panic!("no -loopimpl defn found");
                                }
                                current(&mut stack).push((Pax::Call(name.to_string()), pos));

                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<do>", "expected do loop");
                                group.push_marker(current(&mut stack), pos);
                                used_flow_markers.push(group);
                            }
                            "if" => {
                                let mut group = MarkerGroup::new("<if>", None);
                                group.push_marker(current(&mut stack), pos);

                                flow_markers.push(group);
                            }
                            "else" => {
                                let mut if_group =
                                    flow_markers.pop().expect("did not match marker group");
                                let mut else_group = MarkerGroup::new("<else>", None);
                                current(&mut stack).push((Pax::PushLiteral(0), pos)); // Always yes
                                else_group.push_marker(current(&mut stack), pos);

                                flow_markers.push(else_group);
                                if_group.set_target(current(&mut stack), pos);
                                used_flow_markers.push(if_group);
                            }
                            "then" => {
                                let mut else_group =
                                    flow_markers.pop().expect("did not match marker group");
                                else_group.set_target(current(&mut stack), pos);
                                used_flow_markers.push(else_group);
                            }

                            // Opcodes
                            "+" => current(&mut stack).push((Pax::Add, pos)),
                            ">r" => current(&mut stack).push((Pax::AltPush, pos)),
                            "r>" => current(&mut stack).push((Pax::AltPop, pos)),
                            "!" => current(&mut stack).push((Pax::Store, pos)),
                            "@" => current(&mut stack).push((Pax::Load, pos)),
                            "nand" => current(&mut stack).push((Pax::Nand, pos)),

                            "print" => current(&mut stack).push((Pax::Print, pos)),
                            "debugger" => current(&mut stack).push((Pax::Debugger, pos)),

                            "c!" => current(&mut stack).push((Pax::Store8, pos)),
                            "c@" => current(&mut stack).push((Pax::Load8, pos)),

                            "sleep" => current(&mut stack).push((Pax::Sleep, pos)),

                            _ => {
                                panic!("unknown value: {:?}", word);
                            }
                        }
                    }
                }
            }
        }
    }

    // Finish "main" function.
    assert_eq!(flow_markers.len(), 0, "did not exhaust all flow markers");
    assert_eq!(stack.len(), 1, "did not exhaust all functions");
    let (_main, mut output) = stack.pop().unwrap();
    output.push((Pax::Exit, Default::default()));
    functions.get_mut("main").unwrap().extend(output);

    // Strip unused functions.
    if true {
        let mut used = IndexSet::<String>::new();
        used.insert("main".to_string());
        for (_name, body) in &functions {
            for op in body {
                match &op.0 {
                    Pax::Call(word) => {
                        used.insert(word.to_string());
                    }
                    _ => {}
                }
            }
        }
        functions = functions
            .into_iter()
            .filter(|(k, _)| used.contains(k))
            .collect();
    }

    functions
}

/*
if true {
    let keys = 0..functions.len();

    // Move first function to end
    for key in keys {
        let func = &mut functions[key];
        // eprintln!("moving {:?} to end", func.name);

        let start = func.source_index.unwrap();
        let mut end = start;
        while output[end].0 != Pax::Exit {
            end += 1;
        }
        end += 1;

        // Extract this function, re-append to end.
        let func_code: Vec<_> = output.splice(start..end, vec![]).collect();
        let new_func_offset = output.len();
        output.extend(func_code);
        let adjust_inner = new_func_offset - start;

        // Relocate all marker groups.
        let mut groups = vec![];
        groups.extend(functions.iter_mut());
        for func in groups {
            if func.source_index.unwrap() >= end {
                // eprintln!("----> func.source_index {:?} -= adjust {:?}", func, adjust);
                *func.source_index.as_mut().unwrap() -= end - start;
            } else if func.source_index.unwrap() >= start {
                // eprintln!("----> func.source_index {:?} += adjust {:?}", func, adjust);
                *func.source_index.as_mut().unwrap() += adjust_inner;
            }
        }
    }
}

return output;
*/
