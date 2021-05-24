//! Legacy parsing logic.

use crate::prelude::*;
use crate::*;
use indexmap::{IndexMap, IndexSet};
use lazy_static::*;
use regex::Regex;

#[derive(Debug, PartialEq, Clone)]
pub enum PaxOld {
    Drop,

    BranchTarget,

    PushLiteral(isize),

    AltPop,
    AltPush,
    LoadTemp,
    StoreTemp,

    Metadata(String),
    Exit,

    Call(String),
    Add,
    Nand,

    Load,
    Load8,
    Store8,
    Store,

    JumpIf0(usize),
    JumpAlways(usize),

    Print,
}

pub enum ParseMode {
    Default,
    FunctionName,
    ConstantName(isize),
    CommentParens,
    Variable,
}

pub type Span = Vec<Located<PaxOld>>;

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
        output.push((PaxOld::BranchTarget, pos));
        MarkerGroup {
            name: name.to_string(),
            target_indices: vec![],
            source_index: Some(index),
        }
    }

    fn set_target(&mut self, output: &mut Span, pos: Pos) {
        assert!(self.source_index.is_none());
        let index = output.len();
        output.push((PaxOld::BranchTarget, pos));
        self.source_index = Some(index);

        for target in &self.target_indices {
            match output[*target].0 {
                PaxOld::JumpIf0(_) => {
                    output[*target].0 = PaxOld::JumpIf0(index);
                }
                PaxOld::JumpAlways(_) => {
                    output[*target].0 = PaxOld::JumpAlways(index);
                }
                _ => {
                    unreachable!();
                }
            }
        }
    }

    fn jump_if_0(&mut self, output: &mut Span, pos: Pos) {
        let index = output.len();
        output.push((PaxOld::JumpIf0(self.source_index.unwrap_or(0)), pos));
        self.target_indices.push(index);
    }

    fn jump_always(&mut self, output: &mut Span, pos: Pos) {
        let index = output.len();
        output.push((PaxOld::JumpAlways(self.source_index.unwrap_or(0)), pos));
        self.target_indices.push(index);
    }
}

pub type Program = IndexMap<String, Span>;

fn parse_forth_inner(functions: &mut Program, buffer: Vec<u8>, filename: Option<&str>) {
    lazy_static! {
        static ref RE_COMMENTS: Regex = Regex::new(r"(?m)\\.*$").unwrap();
    }

    let mut code = String::from_utf8_lossy(&buffer).to_string();

    // Strip comments
    code = RE_COMMENTS.replace_all(&code, "").to_string();

    let parser = Tokenizer::new(filename.unwrap_or("<memory>"), &code);

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
    let mut current_function = "main".to_string();
    for (token, mut pos) in parser {
        pos.function = current_function.clone();

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

                        current_function = word.clone();
                        current(&mut stack).push((PaxOld::Metadata(word.to_string()), pos.clone()));

                        // Flow control for recurse
                        let group = MarkerGroup::new_target(word, current(&mut stack), pos.clone());
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
                        current(&mut stack).push((PaxOld::PushLiteral(lit as isize), pos));
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
                            current(&mut stack).push((
                                PaxOld::PushLiteral(constants[word.as_str()] as isize),
                                pos,
                            ));
                            continue;
                        }
                        // Functions shadow all terms
                        if functions.contains_key(&word) {
                            current(&mut stack).push((PaxOld::Call(word.to_string()), pos));
                            continue;
                        }
                        // Variables shadow all terms
                        if variables.contains_key(word.as_str()) {
                            current(&mut stack).push((
                                PaxOld::PushLiteral(variables[word.as_str()] as isize),
                                pos,
                            ));
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
                                current(&mut stack).push((PaxOld::Exit, pos.clone()));

                                // Extract function into its own body.
                                let (name, body) = stack.pop().unwrap();
                                functions.insert(name, body);

                                current_function = "main".to_string();
                            }

                            // Flow control
                            "recurse" => {
                                // Address root flow group
                                flow_markers[0].jump_always(current(&mut stack), pos.clone());
                                continue;
                            }
                            "begin" => {
                                flow_markers.push(MarkerGroup::new_target(
                                    "<begin>",
                                    current(&mut stack),
                                    pos.clone(),
                                ));
                            }
                            "until" => {
                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<begin>", "expected begin loop");
                                group.jump_if_0(current(&mut stack), pos.clone());
                                used_flow_markers.push(group);
                            }
                            "do" => {
                                current(&mut stack).push((PaxOld::AltPush, pos.clone()));
                                current(&mut stack).push((PaxOld::AltPush, pos.clone()));
                                flow_markers.push(MarkerGroup::new_target(
                                    "<do>",
                                    current(&mut stack),
                                    pos.clone(),
                                ));
                            }
                            "loop" => {
                                // TODO just inline loopimpl here?
                                let name = "loopimpl";
                                if !functions.contains_key(name) {
                                    panic!("no loopimpl defn found");
                                }
                                current(&mut stack)
                                    .push((PaxOld::Call(name.to_string()), pos.clone()));

                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<do>", "expected do loop");
                                group.jump_if_0(current(&mut stack), pos.clone());
                                used_flow_markers.push(group);

                                // TODO need a concat method
                                current(&mut stack).push((PaxOld::AltPop, pos.clone()));
                                current(&mut stack).push((PaxOld::Drop, pos.clone()));
                                current(&mut stack).push((PaxOld::AltPop, pos.clone()));
                                current(&mut stack).push((PaxOld::Drop, pos.clone()));
                            }
                            "-loop" => {
                                let name = "-loopimpl";
                                if !functions.contains_key(name) {
                                    panic!("no -loopimpl defn found");
                                }
                                current(&mut stack)
                                    .push((PaxOld::Call(name.to_string()), pos.clone()));

                                let mut group =
                                    flow_markers.pop().expect("did not match marker group");
                                assert_eq!(group.name, "<do>", "expected do loop");
                                group.jump_if_0(current(&mut stack), pos.clone());
                                used_flow_markers.push(group);

                                // TODO need a concat method
                                current(&mut stack).push((PaxOld::AltPop, pos.clone()));
                                current(&mut stack).push((PaxOld::Drop, pos.clone()));
                                current(&mut stack).push((PaxOld::AltPop, pos.clone()));
                                current(&mut stack).push((PaxOld::Drop, pos.clone()));
                            }
                            "if" => {
                                let mut group = MarkerGroup::new("<if>", None);
                                group.jump_if_0(current(&mut stack), pos);

                                flow_markers.push(group);
                            }
                            "else" => {
                                let mut if_group =
                                    flow_markers.pop().expect("did not match marker group");
                                let mut else_group = MarkerGroup::new("<else>", None);

                                current(&mut stack).push((PaxOld::PushLiteral(0), pos.clone())); // Always yes
                                else_group.jump_if_0(current(&mut stack), pos.clone());

                                // TODO
                                // else_group.x(current(&mut stack), pos.clone());

                                flow_markers.push(else_group);
                                if_group.set_target(current(&mut stack), pos.clone());
                                used_flow_markers.push(if_group);
                            }
                            "then" => {
                                let mut else_group =
                                    flow_markers.pop().expect("did not match marker group");
                                else_group.set_target(current(&mut stack), pos);
                                used_flow_markers.push(else_group);
                            }

                            // Opcodes
                            "+" => current(&mut stack).push((PaxOld::Add, pos)),
                            ">r" => current(&mut stack).push((PaxOld::AltPush, pos)),
                            "r>" => current(&mut stack).push((PaxOld::AltPop, pos)),
                            "!" => current(&mut stack).push((PaxOld::Store, pos)),
                            "@" => current(&mut stack).push((PaxOld::Load, pos)),
                            "nand" => current(&mut stack).push((PaxOld::Nand, pos)),
                            "print" => current(&mut stack).push((PaxOld::Print, pos)),
                            "c!" => current(&mut stack).push((PaxOld::Store8, pos)),
                            "c@" => current(&mut stack).push((PaxOld::Load8, pos)),
                            "drop" => current(&mut stack).push((PaxOld::Drop, pos)),

                            "temp@" => current(&mut stack).push((PaxOld::LoadTemp, pos)),
                            "temp!" => current(&mut stack).push((PaxOld::StoreTemp, pos)),

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
    output.push((PaxOld::Exit, Default::default()));
    functions.get_mut("main").unwrap().extend(output);
}

pub fn parse_forth(buffer: Vec<u8>, filename: Option<&str>) -> Program {
    let mut program = IndexMap::new();
    parse_forth_inner(
        &mut program,
        PRELUDE.as_bytes().to_vec(),
        Some("src/prelude.rs"),
    );
    parse_forth_inner(&mut program, buffer, filename);
    program
}
