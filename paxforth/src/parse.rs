//! Modern parsing logic.

use crate::parse_util::*;
use crate::prelude::*;
use crate::*;
use indexmap::IndexMap;
use lazy_static::*;
use regex::Regex;

/**
 * Internal parse logic for code (whether it is prelude, code, etc.)
 */
fn parse_forth_inner(program: &mut PaxProgramBuilder, source_code: &str, filename: Option<&str>) {
    lazy_static! {
        static ref RE_COMMENTS: Regex = Regex::new(r"(?m)\\.*$").unwrap();
    }

    // Definition maps.
    let mut constants: IndexMap<String, isize> = IndexMap::new(); // only u16 literals
    let mut variables: IndexMap<String, usize> = IndexMap::new(); // stack-pushed positions
    let mut variable_offset: usize = BASE_VARIABLE_OFFSET;

    // Block references.
    let mut block_refs: Vec<BlockReference> = vec![];

    // Strip comments
    let code = RE_COMMENTS.replace_all(source_code, "").to_string();

    // Evaluate different parsing modes.
    let mut parse_mode = ParseMode::Default;
    let mut previous_tokens: Vec<Token> = vec![];
    let parser = Tokenizer::new(filename.unwrap_or("<memory>"), &code);
    for (token, mut pos) in parser {
        pos.function = program._current_function.clone();

        // eprintln!("[token] {:?} at {:?}", token, pos);
        previous_tokens.push(token.clone());

        // Handle different parse modes.
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
                continue;
            }
            ParseMode::Variable => {
                match token {
                    Token::Word(ref word) => {
                        variables.insert(word.to_string(), variable_offset);
                        variable_offset += 2;
                    }
                    _ => panic!("expected variable name"),
                }
                parse_mode = ParseMode::Default;
                continue;
            }
            ParseMode::FunctionName => {
                match token {
                    Token::Word(ref word) => {
                        program.enter_function(word.to_string());

                        program
                            .current()
                            .op(&(Pax::Metadata(word.to_string()), pos.clone()));

                        // Flow control for recurse
                        let group = program.current().forward_branch_target(word, pos.clone());
                        block_refs.push(group);
                    }
                    _ => panic!("expected function name"),
                }
                parse_mode = ParseMode::Default;
                continue;
            }
            ParseMode::ConstantName(value) => {
                match token {
                    Token::Word(ref word) => {
                        constants.insert(word.to_string(), value);
                    }
                    _ => panic!("expected constant name"),
                }
                parse_mode = ParseMode::Default;
                continue;
            }

            // Default parsing mode so we fall through (through to reduce indentation)
            ParseMode::Default => {}
        }

        // ParseMode::Default =>
        match token {
            // Literals (e.g. numbers)
            Token::Literal(lit) => {
                program.current().op(&(Pax::PushLiteral(lit as isize), pos));
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
                program
                    .current()
                    .op(&(Pax::PushLiteral(constants[word.as_str()] as isize), pos));
            }
            // Functions (shadows all terms)
            Token::Word(word) if program.program.contains_key(&word) => {
                program.current().op(&(Pax::Call(word.to_string()), pos));
                program.current().exit_block();
            }
            // Variables (shadows all terms)
            Token::Word(word) if variables.contains_key(word.as_str()) => {
                program
                    .current()
                    .op(&(Pax::PushLiteral(variables[word.as_str()] as isize), pos));
            }

            // Compiler keywords
            Token::Word(word) if word == "allot" => {
                if previous_tokens[previous_tokens.len() - 2] == Token::Word("cells".to_string()) {
                    let cells = &previous_tokens[previous_tokens.len() - 3];
                    match cells {
                        Token::Word(_) => panic!("Expected literal"),
                        Token::Literal(cells) => {
                            // eprintln!("allocating {}", cells);
                            program.current().current_block.pop(); // "cells"
                            program.current().current_block.pop(); // value
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
                        program.current().current_block.pop(); // value

                        parse_mode = ParseMode::ConstantName(*value);
                    }
                }
            }

            // Function delimiters
            Token::Word(word) if word == ":" => {
                assert!(!program.in_function(), "cannot nest functions");
                assert_eq!(block_refs.len(), 0, "expected empty flow stack");

                parse_mode = ParseMode::FunctionName;
            }
            Token::Word(word) if word == ";" => {
                assert!(program.in_function(), "expected to be inside a function");
                assert_eq!(block_refs.len(), 1, "expected flow stack with just recurse");

                block_refs.pop();
                program.current().op(&(Pax::Exit, pos.clone()));
                program.current().exit_block();

                // Extract function into its own body.
                program.exit_function();
            }

            // Flow control
            Token::Word(word) if word == "recurse" => {
                // Address root flow group
                program
                    .current()
                    .jump_always(&mut block_refs[0], pos.clone());
            }
            Token::Word(word) if word == "begin" => {
                block_refs.push(
                    program
                        .current()
                        .forward_branch_target("<begin>", pos.clone()),
                );
            }
            Token::Word(word) if word == "until" => {
                let mut group = block_refs.pop().expect("did not match marker group");
                assert_eq!(group.label, "<begin>", "expected begin loop");
                program.current().jump_if_0(&mut group, pos.clone());
            }
            Token::Word(word) if word == "do" => {
                program.current().op(&(Pax::AltPush, pos.clone()));
                program.current().op(&(Pax::AltPush, pos.clone()));
                block_refs.push(program.current().forward_branch_target("<do>", pos.clone()));
            }
            Token::Word(word) if word == "loop" => {
                // TODO just inline loopimpl here?
                let name = "loopimpl";
                if !program.program.contains_key(name) {
                    panic!("no loopimpl defn found");
                }
                program
                    .current()
                    .op(&(Pax::Call(name.to_string()), pos.clone()));
                program.current().exit_block();

                let mut group = block_refs.pop().expect("did not match marker group");
                assert_eq!(group.label, "<do>", "expected do loop");
                program.current().jump_if_0(&mut group, pos.clone());

                // TODO need a concat method
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
            }
            Token::Word(word) if word == "-loop" => {
                let name = "-loopimpl";
                if !program.program.contains_key(name) {
                    panic!("no -loopimpl defn found");
                }
                program
                    .current()
                    .op(&(Pax::Call(name.to_string()), pos.clone()));
                program.current().exit_block();

                let mut group = block_refs.pop().expect("did not match marker group");
                assert_eq!(group.label, "<do>", "expected do loop");
                program.current().jump_if_0(&mut group, pos.clone());

                // TODO need a concat method
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
            }
            Token::Word(word) if word == "if" => {
                let mut group = BlockReference::new("<if>", None);
                program.current().jump_if_0(&mut group, pos);

                block_refs.push(group);
            }
            Token::Word(word) if word == "else" => {
                let mut if_group = block_refs.pop().expect("did not match marker group");
                let mut else_group = BlockReference::new("<else>", None);

                program.current().op(&(Pax::PushLiteral(0), pos.clone())); // Always yes
                program.current().jump_if_0(&mut else_group, pos.clone());

                // TODO
                // else_group.x(current(&mut stack), pos.clone());

                block_refs.push(else_group);
                program.current().set_target(&mut if_group, pos.clone());
            }
            Token::Word(word) if word == "then" => {
                let mut else_group = block_refs.pop().expect("did not match marker group");
                program.current().set_target(&mut else_group, pos);
            }

            // Opcodes
            Token::Word(word) if word == "+" => program.current().op(&(Pax::Add, pos)),
            Token::Word(word) if word == ">r" => program.current().op(&(Pax::AltPush, pos)),
            Token::Word(word) if word == "r>" => program.current().op(&(Pax::AltPop, pos)),
            Token::Word(word) if word == "!" => program.current().op(&(Pax::Store, pos)),
            Token::Word(word) if word == "@" => program.current().op(&(Pax::Load, pos)),
            Token::Word(word) if word == "nand" => program.current().op(&(Pax::Nand, pos)),
            Token::Word(word) if word == "print" => program.current().op(&(Pax::Print, pos)),
            Token::Word(word) if word == "c!" => program.current().op(&(Pax::Store8, pos)),
            Token::Word(word) if word == "c@" => program.current().op(&(Pax::Load8, pos)),
            Token::Word(word) if word == "drop" => program.current().op(&(Pax::Drop, pos)),
            Token::Word(word) if word == "abort" => program.current().op(&(Pax::Abort, pos)),

            // Temp values
            Token::Word(word) if word == "temp@" => program.current().op(&(Pax::LoadTemp, pos)),
            Token::Word(word) if word == "temp!" => program.current().op(&(Pax::StoreTemp, pos)),

            // Unknown word
            Token::Word(word) => {
                panic!("unknown value: {:?}", word);
            }
        }
    }

    // Finish "main" function.
    assert_eq!(block_refs.len(), 0, "did not exhaust all flow markers");
    assert!(!program.in_function(), "did not finish all functions");
}

pub fn parse_to_pax(contents: &str, filename: Option<&str>) -> PaxProgram {
    let mut stack = PaxProgramBuilder::new();

    // Parse PRELUDE.
    parse_forth_inner(&mut stack, PRELUDE, Some("src/prelude.rs"));
    // Parse contents.
    parse_forth_inner(&mut stack, contents, filename);

    // Add final exit termination opcode.
    stack.current().op(&(Pax::Exit, Default::default()));
    stack.current().exit_block();

    // Convert StackAbstraction into program.
    let mut program = stack.result();

    // Optimize PushLiteral(0), JumpIf0(x) to JumpAlways(x)
    // TODO figure out why this is necessary for wasm target
    for (_name, blocks) in &mut program {
        for block in blocks {
            if let Some((Pax::PushLiteral(0), _)) = block.commands().iter().rev().nth(1) {
                if let Some((Pax::JumpIf0(dest), _)) = block.commands().iter().rev().next() {
                    let mut new_span = block.commands().clone();

                    // Pop opcodes PushLiteral(0), JumpIf0(x)
                    let (_, pos) = new_span.pop().unwrap();
                    new_span.pop();

                    // Push the new JumpAlways instruction and create a block.
                    new_span.push((Pax::JumpAlways(*dest), pos));
                    *block = Block::new(new_span);
                }
            }
        }
    }

    program
}
