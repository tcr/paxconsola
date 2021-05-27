//! Modern parsing logic.

use crate::parse_util::*;
use crate::prelude::*;
use crate::*;
use indexmap::IndexMap;
use lazy_static::*;
use regex::Regex;
use serde::*;

pub use crate::parse_util::{Block, BlockBuilder, Pax, PaxProgram, PaxSpan, BASE_VARIABLE_OFFSET};

/**
 * Internal parse logic for code (whether it is prelude, code, etc.)
 */
fn parse_forth_inner(stack: &mut StackAbstraction, source_code: &str, filename: Option<&str>) {
    lazy_static! {
        static ref RE_COMMENTS: Regex = Regex::new(r"(?m)\\.*$").unwrap();
    }

    // Definition maps.
    let mut constants: IndexMap<String, isize> = IndexMap::new(); // only u16 literals
    let mut variables: IndexMap<String, usize> = IndexMap::new(); // stack-pushed positions
    let mut variable_offset: usize = BASE_VARIABLE_OFFSET;

    // Flow markers.
    let mut flow_markers: Vec<MarkerGroup> = vec![];
    let mut used_flow_markers: Vec<MarkerGroup> = vec![];

    // Strip comments
    let code = RE_COMMENTS.replace_all(source_code, "").to_string();

    // Iterate through tokenized code.
    let mut parse_mode = ParseMode::Default;
    let mut previous_tokens: Vec<Token> = vec![];
    let parser = Tokenizer::new(filename.unwrap_or("<memory>"), &code);
    for (token, mut pos) in parser {
        pos.function = stack._current_function.clone();

        // eprintln!("[token] {:?} at {:?}", token, pos);
        previous_tokens.push(token.clone());

        // Handle different parse modes.
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
                        stack.push_function((word.to_string(), vec![]));

                        stack.record_op((Pax::Metadata(word.to_string()), pos.clone()));

                        // Flow control for recurse
                        let group = stack.new_marker_group(word, pos.clone());
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

            // Standard parsing mode.
            ParseMode::Default => {
                match token {
                    // Literals (e.g. numbers)
                    Token::Literal(lit) => {
                        stack.record_op((Pax::PushLiteral(lit as isize), pos));
                    }

                    // Parse mode for comments (inside parentheses)
                    Token::Word(word) if word == "(" => {
                        parse_mode = ParseMode::CommentParens;
                    }
                    // Parse mode for variables
                    Token::Word(word) if word == "variable" => {
                        parse_mode = ParseMode::Variable;
                    }

                    // Constants (shadows all terms)
                    Token::Word(word) if constants.contains_key(word.as_str()) => {
                        stack.record_op((Pax::PushLiteral(constants[word.as_str()] as isize), pos));
                    }
                    // Functions (shadows all terms)
                    Token::Word(word) if stack.functions.contains_key(&word) => {
                        stack.record_op((Pax::Call(word.to_string()), pos));
                        stack.call_block();
                    }
                    // Variables (shadows all terms)
                    Token::Word(word) if variables.contains_key(word.as_str()) => {
                        stack.record_op((Pax::PushLiteral(variables[word.as_str()] as isize), pos));
                    }

                    // Compiler keywords
                    Token::Word(word) if word == "allot" => {
                        if previous_tokens[previous_tokens.len() - 2]
                            == Token::Word("cells".to_string())
                        {
                            let cells = &previous_tokens[previous_tokens.len() - 3];
                            match cells {
                                Token::Word(_) => panic!("Expected literal"),
                                Token::Literal(cells) => {
                                    // eprintln!("allocating {}", cells);
                                    stack.current_pop(); // "cells"
                                    stack.current_pop(); // value
                                    variable_offset += (*cells as usize) * 2;
                                }
                            }
                        } else {
                            panic!("expected cells");
                        }
                    }
                    Token::Word(word) if word == "constant" => {
                        let cells = &previous_tokens[previous_tokens.len() - 2];
                        match cells {
                            Token::Word(_) => panic!("Expected literal"),
                            Token::Literal(value) => {
                                stack.current_pop(); // value

                                parse_mode = ParseMode::ConstantName(*value);
                            }
                        }
                    }

                    // Function delimiters
                    Token::Word(word) if word == ":" => {
                        assert!(stack.in_main(), "cannot nest functions");
                        assert_eq!(flow_markers.len(), 0, "expected empty flow stack");

                        parse_mode = ParseMode::FunctionName;
                    }
                    Token::Word(word) if word == ";" => {
                        assert!(stack.in_function(), "expected to be inside a function");
                        assert_eq!(
                            flow_markers.len(),
                            1,
                            "expected flow stack with just recurse"
                        );

                        let recurse_group = flow_markers.pop().unwrap();
                        used_flow_markers.push(recurse_group);
                        stack.record_op((Pax::Exit, pos.clone()));
                        stack.exit_block();

                        // Extract function into its own body.
                        let (name, body) = stack.pop_function().unwrap();
                    }

                    // Flow control
                    Token::Word(word) if word == "recurse" => {
                        // Address root flow group
                        stack.jump_always(&mut flow_markers[0], pos.clone());
                    }
                    Token::Word(word) if word == "begin" => {
                        flow_markers.push(stack.new_marker_group("<begin>", pos.clone()));
                    }
                    Token::Word(word) if word == "until" => {
                        let mut group = flow_markers.pop().expect("did not match marker group");
                        assert_eq!(group.name, "<begin>", "expected begin loop");
                        stack.jump_if_0(&mut group, pos.clone());
                        used_flow_markers.push(group);
                    }
                    Token::Word(word) if word == "do" => {
                        stack.record_op((Pax::AltPush, pos.clone()));
                        stack.record_op((Pax::AltPush, pos.clone()));
                        flow_markers.push(stack.new_marker_group("<do>", pos.clone()));
                    }
                    Token::Word(word) if word == "loop" => {
                        // TODO just inline loopimpl here?
                        let name = "loopimpl";
                        if !stack.functions.contains_key(name) {
                            panic!("no loopimpl defn found");
                        }
                        stack.record_op((Pax::Call(name.to_string()), pos.clone()));
                        stack.call_block();

                        let mut group = flow_markers.pop().expect("did not match marker group");
                        assert_eq!(group.name, "<do>", "expected do loop");
                        stack.jump_if_0(&mut group, pos.clone());
                        used_flow_markers.push(group);

                        // TODO need a concat method
                        stack.record_op((Pax::AltPop, pos.clone()));
                        stack.record_op((Pax::Drop, pos.clone()));
                        stack.record_op((Pax::AltPop, pos.clone()));
                        stack.record_op((Pax::Drop, pos.clone()));
                    }
                    Token::Word(word) if word == "-loop" => {
                        let name = "-loopimpl";
                        if !stack.functions.contains_key(name) {
                            panic!("no -loopimpl defn found");
                        }
                        stack.record_op((Pax::Call(name.to_string()), pos.clone()));

                        let mut group = flow_markers.pop().expect("did not match marker group");
                        assert_eq!(group.name, "<do>", "expected do loop");
                        stack.jump_if_0(&mut group, pos.clone());
                        used_flow_markers.push(group);

                        // TODO need a concat method
                        stack.record_op((Pax::AltPop, pos.clone()));
                        stack.record_op((Pax::Drop, pos.clone()));
                        stack.record_op((Pax::AltPop, pos.clone()));
                        stack.record_op((Pax::Drop, pos.clone()));
                    }
                    Token::Word(word) if word == "if" => {
                        let mut group = MarkerGroup {
                            name: format!("<if>"),
                            target_indices: vec![],
                            source_index: None,
                        };
                        stack.jump_if_0(&mut group, pos);

                        flow_markers.push(group);
                    }
                    Token::Word(word) if word == "else" => {
                        let mut if_group = flow_markers.pop().expect("did not match marker group");
                        let mut else_group = MarkerGroup {
                            name: format!("<else>"),
                            target_indices: vec![],
                            source_index: None,
                        };

                        stack.record_op((Pax::PushLiteral(0), pos.clone())); // Always yes
                        stack.jump_if_0(&mut else_group, pos.clone());

                        // TODO
                        // else_group.x(current(&mut stack), pos.clone());

                        flow_markers.push(else_group);
                        stack.set_target(&mut if_group, pos.clone());
                        used_flow_markers.push(if_group);
                    }
                    Token::Word(word) if word == "then" => {
                        let mut else_group =
                            flow_markers.pop().expect("did not match marker group");
                        stack.set_target(&mut else_group, pos);
                        used_flow_markers.push(else_group);
                    }

                    // Opcodes
                    Token::Word(word) if word == "+" => stack.record_op((Pax::Add, pos)),
                    Token::Word(word) if word == ">r" => stack.record_op((Pax::AltPush, pos)),
                    Token::Word(word) if word == "r>" => stack.record_op((Pax::AltPop, pos)),
                    Token::Word(word) if word == "!" => stack.record_op((Pax::Store, pos)),
                    Token::Word(word) if word == "@" => stack.record_op((Pax::Load, pos)),
                    Token::Word(word) if word == "nand" => stack.record_op((Pax::Nand, pos)),
                    Token::Word(word) if word == "print" => stack.record_op((Pax::Print, pos)),
                    Token::Word(word) if word == "c!" => stack.record_op((Pax::Store8, pos)),
                    Token::Word(word) if word == "c@" => stack.record_op((Pax::Load8, pos)),
                    Token::Word(word) if word == "drop" => stack.record_op((Pax::Drop, pos)),
                    Token::Word(word) if word == "abort" => stack.record_op((Pax::Abort, pos)),

                    // Temp values
                    Token::Word(word) if word == "temp@" => stack.record_op((Pax::LoadTemp, pos)),
                    Token::Word(word) if word == "temp!" => stack.record_op((Pax::StoreTemp, pos)),

                    Token::Word(word) => {
                        panic!("unknown value: {:?}", word);
                    }
                }
            }
        }
    }

    // Finish "main" function.
    assert_eq!(flow_markers.len(), 0, "did not exhaust all flow markers");
    assert!(stack.in_main(), "did not finish all functions");
}

pub fn parse_to_pax(contents: &str, filename: Option<&str>) -> PaxProgram {
    let mut stack = StackAbstraction::new();

    // Parse PRELUDE.
    parse_forth_inner(&mut stack, PRELUDE, Some("src/prelude.rs"));
    // Parse contents.
    parse_forth_inner(&mut stack, contents, filename);

    // Add final exit termination opcode.
    stack.functions["main"].push((Pax::Exit, Default::default()));

    // convert_to_pax()
    let mut program_stacks = IndexMap::new();
    for (name, code) in stack.functions {
        // Load indexes of BranchTarget opcodes.
        let mut loc_to_block = IndexMap::new();
        let mut block_index = 0;
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            match op.0 {
                Pax::OldBranchTarget => {
                    loc_to_block.insert(i, block_index);
                    block_index += 1;
                }
                Pax::Call(_) | Pax::Exit => {
                    block_index += 1;
                }
                Pax::JumpIf0(target) => {
                    if let Some((_, &(Pax::OldBranchTarget, _))) = code_iter.peek() {
                        if target == i + 1 {
                            code_iter.next();
                            continue;
                        }
                    }
                    block_index += 1;
                }
                _ => {}
            }
        }

        // Convert to block list.
        let mut stack = BlockBuilder::new();
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            // Peek matching.
            match op.0 {
                Pax::PushLiteral(value) => {
                    // Jump Always
                    if value == 0 {
                        if let Some((_, &(Pax::JumpIf0(ref target), _))) = code_iter.peek() {
                            stack.record_op(&(Pax::JumpAlways(loc_to_block[target]), op.1.clone()));
                            stack.jump_always_block();
                            code_iter.next();
                            continue;
                        }
                    }
                }
                Pax::JumpIf0(target) => {
                    // Pax::Drop
                    if let Some((_, &(Pax::OldBranchTarget, _))) = code_iter.peek() {
                        if target == i + 1 {
                            stack.record_op(&(Pax::Drop, op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                    }
                }
                _ => {}
            }

            // Opcode matching.
            match op.0 {
                Pax::Exit => {
                    stack.record_op(&(Pax::Exit, op.1.clone()));
                    stack.exit_block();
                }
                Pax::Call(ref arg) => {
                    stack.record_op(&(Pax::Call(arg.clone()), op.1.clone()));
                    stack.call_block();
                }
                Pax::JumpAlways(ref target) => {
                    stack.record_op(&(Pax::JumpAlways(loc_to_block[target]), op.1.clone()));
                    stack.jump_always_block();
                }
                Pax::JumpIf0(ref target) => {
                    stack.record_op(&(Pax::JumpIf0(loc_to_block[target]), op.1.clone()));
                    stack.jump_if_0_block();
                }
                Pax::OldBranchTarget => {
                    // TODO this should inline the block number, not the opcode number
                    stack.record_op(&(Pax::BranchTarget(loc_to_block[&i]), op.1.clone()));
                    stack.branch_target_block();
                }
                Pax::BranchTarget(_) => unreachable!(),

                _ => {
                    stack.record_op(&(op.0.clone(), op.1.clone()));
                }
            }
        }

        program_stacks.insert(name, stack.blocks);
    }

    program_stacks
}
