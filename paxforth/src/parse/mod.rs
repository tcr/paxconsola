//! Modern parsing logic.

pub mod parse_util;
pub mod put_back;
pub mod tokenizer;

use crate::*;
pub use parse_util::*;
pub use tokenizer::*;

/**
 * Internal parse logic for code (whether it is prelude, code, etc.)
 */
fn parse_forth_inner(program: &mut PaxProgramBuilder, source_code: &str, filename: Option<&str>) {
    // Block references.
    let mut block_refs: Vec<BlockReference> = vec![];

    // Evaluate different parsing modes.
    let mut parse_mode = ParseMode::Default;
    let mut previous_tokens: Vec<Token> = vec![];
    let parser = Tokenizer::new(filename.unwrap_or("<memory>"), &source_code);

    let mut parser_iter = put_back::put_back_n(parser);

    fn push_tokens<I: Iterator<Item = Located<Token>>>(
        parser: &mut put_back::PutBackN<I>,
        pos: &Pos,
        tokens: &[Token],
    ) {
        for token in tokens.iter().rev() {
            parser.put_back((token.to_owned(), pos.clone()));
        }
    }

    while let Some((token, mut pos)) = parser_iter.next() {
        pos.function = program.current_function().to_string();

        // eprintln!("[token] {:?} at {:?}", token, pos);
        previous_tokens.push(token.clone());

        // Handle different parse modes.
        match parse_mode {
            ParseMode::Variable => {
                match token {
                    Token::Word(ref word) => {
                        program
                            .variables
                            .insert(word.to_string(), program.variable_offset);
                        program.variable_offset += 2;
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
                    }
                    _ => panic!("expected function name"),
                }
                parse_mode = ParseMode::Default;
                continue;
            }
            ParseMode::ConstantName(value) => {
                match token {
                    Token::Word(ref word) => {
                        program
                            .constants
                            .insert(word.to_string(), value as PaxLiteral);
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
        let word = match token {
            // Literals (e.g. numbers)
            Token::Literal(lit) => {
                program
                    .current()
                    .op(&(Pax::PushLiteral(lit as PaxLiteral), pos));
                continue;
            }

            Token::Word(word) => word,
        };

        match word.as_str() {
            // Parenthetical comments
            "(" => {
                parser_iter.iter.consume_until(')');
                parser_iter.iter.move_forward(1); // Skip end paren
            }
            // Single-line comments
            "\\" => {
                parser_iter.iter.consume_until('\n');
                parser_iter.iter.move_forward(1); // Skip newline
            }

            // Strings
            "s\"" | ".\"" => {
                parser_iter.iter.move_forward(1); // Skip following space
                let raw_str = parser_iter.iter.consume_string_end();
                parser_iter.iter.move_forward(1); // Skip last quote

                let str_offset = program.variable_offset;
                let s = snailquote::unescape(&format!("\"{}\"", raw_str)).unwrap();

                if word == ".\"" {
                    push_tokens(&mut parser_iter, &pos, &[Token::Word("type".to_string())]);
                }

                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Literal(str_offset as isize),
                        Token::Literal(s.chars().count() as isize),
                    ],
                );

                for c in s.chars() {
                    push_tokens(
                        &mut parser_iter,
                        &pos,
                        &[
                            Token::Literal(c as isize),
                            Token::Literal(program.variable_offset as isize),
                            Token::Word("!".to_string()),
                        ],
                    );
                    program.variable_offset += 1;
                }
                program.variable_offset += 1; // null byte
            }

            // Parse mode for variables
            "variable" => {
                parse_mode = ParseMode::Variable;
            }

            // Parse mode for defer
            "defer" => match parser_iter.next() {
                Some((Token::Word(word), _defer_pos)) => {
                    program.defer_function(word.to_string());
                }
                _ => {
                    panic!("Expected word following 'defer'");
                }
            },
            ":noname" => {
                // We just call anon functions ":noname"
                program.enter_function(":noname".to_string());
            }

            // Constants (shadows all terms)
            word if program.constants.contains_key(word) => {
                let value = program.constants[word] as PaxLiteral;
                program.current().op(&(Pax::PushLiteral(value), pos));
            }
            // Extern Functions (shadows all terms)
            word if program.extern_calls.contains(word) => {
                program
                    .current()
                    .exit_block((PaxTerm::ExternCall(word.to_string()), pos));
            }
            // Functions (shadows all terms)
            word if program.program.contains_key(word) => {
                program
                    .current()
                    .exit_block((PaxTerm::Call(word.to_string()), pos));
            }
            // Variables (shadows all terms)
            word if program.variables.contains_key(word) => {
                let value = program.variables[word] as PaxLiteral;
                program.current().op(&(Pax::PushLiteral(value), pos));
            }

            // Compiler keywords
            "allot" => {
                if previous_tokens[previous_tokens.len() - 2] == Token::Word("cells".to_string()) {
                    let cells = &previous_tokens[previous_tokens.len() - 3];
                    match cells {
                        Token::Word(_) => panic!("Expected literal"),
                        Token::Literal(cells) => {
                            // eprintln!("allocating {}", cells);
                            program.current().current_block.pop(); // "cells"
                            program.current().current_block.pop(); // value
                            program.variable_offset += (*cells as usize) * 2;
                            program.current().op(&(Pax::Drop, pos)); // value
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
                        program.current().current_block.pop(); // value

                        parse_mode = ParseMode::ConstantName(*value);
                    }
                }
            }
            "extern" => {
                // Parse following IS token.
                match parser_iter.next() {
                    Some((Token::Word(word), _defer_pos)) => {
                        program.extern_function(word);
                    }
                    _ => panic!("Expected word to follow 'extern'"),
                }
            }

            /* Opcodes */
            "+" => program.current().op(&(Pax::Add, pos)),
            ">r" => program.current().op(&(Pax::AltPush, pos)),
            "r>" => program.current().op(&(Pax::AltPop, pos)),
            "!" => program.current().op(&(Pax::Store, pos)),
            "@" => program.current().op(&(Pax::Load, pos)),
            "nand" => program.current().op(&(Pax::Nand, pos)),
            "print" | "." => program.current().op(&(Pax::Print, pos)),
            "emit" => program.current().op(&(Pax::Emit, pos)),
            "c!" => program.current().op(&(Pax::Store8, pos)),
            "c@" => program.current().op(&(Pax::Load8, pos)),
            "drop" => program.current().op(&(Pax::Drop, pos)),
            "abort" => program.current().op(&(Pax::Abort, pos)),
            "debugger" => program.current().op(&(Pax::Debugger, pos)),

            // Temp values
            "temp@" => program.current().op(&(Pax::TempLoad, pos)),
            "temp!" => program.current().op(&(Pax::TempStore, pos)),

            // Function delimiters
            ":" => {
                assert!(!program.in_function(), "cannot nest functions");
                assert_eq!(block_refs.len(), 0, "expected empty flow stack");

                parse_mode = ParseMode::FunctionName;
            }
            ";" => {
                assert!(
                    program.in_function(),
                    "expected to find ';' inside a function"
                );

                block_refs.pop();
                program.current().exit_block((PaxTerm::Exit, pos.clone()));

                // Parse following IS token.
                match parser_iter.next() {
                    Some((Token::Word(word), _defer_pos)) if word == "is" => {
                        match parser_iter.next() {
                            Some((Token::Word(word), _defer_pos)) => {
                                program.rename_function(word);
                            }
                            _ => panic!("Expected word to follow 'is'"),
                        }
                    }
                    Some(token) => parser_iter.put_back(token),
                    _ => {}
                }

                // Extract function into its own body.
                program.exit_function();
            }

            /* if .. else .. then */
            "if" => {
                let mut group = BlockReference::new("<if>", None);
                program.current().jump_if_0(&mut group, pos);

                block_refs.push(group);
            }
            "else" => {
                let mut if_group = block_refs
                    .pop()
                    .expect(&format!("did not match marker group: {:?}", block_refs));
                let mut else_group = BlockReference::new("<else>", None);

                program.current().jump_else(&mut else_group, pos.clone());

                block_refs.push(else_group);
                program.current().set_else_target(&mut if_group);
            }
            "then" | "endif" => {
                let mut else_group = block_refs
                    .pop()
                    .expect(&format!("did not match marker group: {:?}", block_refs));
                program.current().set_jump_target(&mut else_group, pos);
            }

            /* begin .. until */
            "begin" => {
                let group = BlockReference::new("<begin-leave>", None);
                block_refs.push(group);

                block_refs.push(program.current().loop_target("<begin>", pos.clone()));
            }
            "until" => {
                let mut group = block_refs.pop().expect("did not match marker group");
                assert_eq!(group.label, "<begin>", "expected begin loop");
                program.current().loop_if_0(&mut group, pos.clone());

                let mut leave_group = block_refs
                    .pop()
                    .expect(&format!("did not match marker group: {:?}", block_refs));
                assert_eq!(
                    leave_group.label, "<begin-leave>",
                    "expected begin-leave loop"
                );
                program.current().set_branch_target(&mut leave_group);
            }
            "leave" => {
                let mut queue = vec![];
                while let Some(group) = block_refs.pop() {
                    let is_begin = group.label == "<begin-leave>";
                    queue.insert(0, group);
                    if is_begin {
                        break;
                    }
                }
                // program.current().op(&(Pax::PushLiteral(0), pos.clone()));
                program.current().loop_leave(&mut queue[0], pos.clone());
                for group in queue.into_iter() {
                    block_refs.push(group);
                }
            }

            /* while .. repeat (constructed) */
            "while" => {
                push_tokens(&mut parser_iter, &pos, &[Token::Word("if".to_string())]);
            }
            "repeat" => {
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Literal(0),
                        Token::Word("else".to_string()),
                        Token::Literal(1),
                        Token::Word("then".to_string()),
                        Token::Word("until".to_string()),
                    ],
                );
            }

            /* case .. of .. endof .. endcase (constructed) */
            "case" => {
                push_tokens(&mut parser_iter, &pos, &[Token::Word("begin".to_string())]);
            }
            "endcase" => {
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Literal(1),
                        Token::Word("until".to_string()),
                        Token::Word("drop".to_string()),
                    ],
                );
            }
            "endof" => {
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Word("leave".to_string()),
                        Token::Word("then".to_string()),
                    ],
                );
            }
            "of" => {
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Word("over".to_string()),
                        Token::Word("=".to_string()),
                        Token::Word("if".to_string()),
                    ],
                );
            }

            /* do .. loop/-loop (constructed) */
            "do" => {
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Word(">r".to_string()),
                        Token::Word(">r".to_string()),
                        Token::Word("begin".to_string()),
                    ],
                );
            }
            "loop" => {
                let name = "loopimpl";
                if !program.program.contains_key(name) {
                    panic!("no loopimpl defn found");
                }
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Word(name.to_string()),
                        Token::Word("until".to_string()),
                        Token::Word("r>".to_string()),
                        Token::Word("drop".to_string()),
                        Token::Word("r>".to_string()),
                        Token::Word("drop".to_string()),
                    ],
                );
            }
            "-loop" => {
                let name = "-loopimpl";
                if !program.program.contains_key(name) {
                    panic!("no -loopimpl defn found");
                }
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Word(name.to_string()),
                        Token::Word("until".to_string()),
                        Token::Word("r>".to_string()),
                        Token::Word("drop".to_string()),
                        Token::Word("r>".to_string()),
                        Token::Word("drop".to_string()),
                    ],
                );
            }

            // Unknown word
            word => {
                panic!("unknown value: {:?}", word);
            }
        }
    }

    // Finish "main" function.
    assert_eq!(block_refs.len(), 0, "did not exhaust all flow markers");
    assert!(!program.in_function(), "did not finish all functions");
}

pub fn parse_to_pax(
    contents: &str,
    filename: Option<&str>,
    preludes: Vec<(PathBuf, String)>,
) -> PaxProgram {
    let mut stack = PaxProgramBuilder::new();

    // Parse preludes.
    for (key, prelude) in preludes {
        let arg_str = key.to_string_lossy().to_string();
        dbg!(key);
        parse_forth_inner(&mut stack, &prelude, Some(arg_str.as_str()));
    }

    // Parse contents.
    parse_forth_inner(&mut stack, contents, filename);

    // Add final exit termination opcode.
    stack
        .current()
        .exit_block((PaxTerm::Exit, Default::default()));

    // Convert StackAbstraction into program.
    let mut result = stack.result();

    // Move "main" entry to the end for better console logging.
    let main = result.remove("main").unwrap();
    result.insert("main".to_string(), main);

    result
}
