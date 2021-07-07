//! Modern parsing logic.

pub mod parse_util;
pub mod put_back;
pub mod tokenizer;

use crate::*;
use indexmap::IndexMap;
pub use parse_util::*;
pub use tokenizer::*;

/**
 * Internal parse logic for code (whether it is prelude, code, etc.)
 */
fn parse_forth_inner(program: &mut PaxProgramBuilder, source_code: &str, filename: Option<&str>) {
    // Definition maps.
    let mut constants: IndexMap<String, isize> = IndexMap::new(); // only u16 literals
    let mut variables: IndexMap<String, usize> = IndexMap::new(); // stack-pushed positions
    let mut variable_offset: usize = BASE_VARIABLE_OFFSET;

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
        pos.function = program._current_function.clone();

        // eprintln!("[token] {:?} at {:?}", token, pos);
        previous_tokens.push(token.clone());

        // Handle different parse modes.
        match parse_mode {
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

                        // program
                        //     .current()
                        //     .op(&(Pax::Metadata(word.to_string()), pos.clone()));

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
        let word = match token {
            // Literals (e.g. numbers)
            Token::Literal(lit) => {
                program.current().op(&(Pax::PushLiteral(lit as isize), pos));
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

                let str_offset = variable_offset;
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
                            Token::Literal(variable_offset as isize),
                            Token::Word("!".to_string()),
                        ],
                    );
                    variable_offset += 1;
                }
                variable_offset += 1; // null byte
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

                // Flow control for recurse
                let group = program
                    .current()
                    .forward_branch_target(":noname", pos.clone());
                block_refs.push(group);
            }

            // Constants (shadows all terms)
            word if constants.contains_key(word) => {
                program
                    .current()
                    .op(&(Pax::PushLiteral(constants[word] as isize), pos));
            }
            // Functions (shadows all terms)
            word if program.program.contains_key(word) => {
                program
                    .current()
                    .exit_block((PaxTerm::Call(word.to_string()), pos));
            }
            // Variables (shadows all terms)
            word if variables.contains_key(word) => {
                program
                    .current()
                    .op(&(Pax::PushLiteral(variables[word] as isize), pos));
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
                            variable_offset += (*cells as usize) * 2;
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
                assert_eq!(block_refs.len(), 1, "expected flow stack with just recurse");

                block_refs.pop();
                program.current().exit_block((PaxTerm::Exit, pos.clone()));

                // Parse following IS token.
                match parser_iter.next() {
                    Some((Token::Word(word), _defer_pos)) if word == "is" => {
                        match parser_iter.next() {
                            Some((Token::Word(word), _defer_pos)) => {
                                program.rename_function(word);
                            }
                            _ => {
                                panic!("Expected word to follow 'is'")
                            }
                        }
                    }
                    Some(token) => parser_iter.put_back(token),
                    _ => {}
                }

                // Extract function into its own body.
                program.exit_function();
            }

            /* Flow control */
            // Recursion
            "recurse" => {
                // Address root flow group
                program
                    .current()
                    .jump_always(&mut block_refs[0], pos.clone());
            }

            // Loops
            "begin" => {
                let group = BlockReference::new("<begin-leave>", None);
                block_refs.push(group);

                block_refs.push(
                    program
                        .current()
                        .forward_branch_target("<begin>", pos.clone()),
                );
            }
            "until" => {
                let mut group = block_refs.pop().expect("did not match marker group");
                assert_eq!(group.label, "<begin>", "expected begin loop");
                program.current().jump_if_0(&mut group, pos.clone());

                let mut leave_group = block_refs
                    .pop()
                    .expect(&format!("did not match marker group: {:?}", block_refs));
                assert_eq!(
                    leave_group.label, "<begin-leave>",
                    "expected begin-leave loop"
                );
                program.current().set_target(&mut leave_group, pos);
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
                program.current().op(&(Pax::PushLiteral(0), pos.clone()));
                program.current().jump_if_0(&mut queue[0], pos.clone());
                for group in queue.into_iter() {
                    block_refs.push(group);
                }
            }
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

            // case .. of .. endof .. endcase
            "case" => {
                push_tokens(&mut parser_iter, &pos, &[Token::Word("begin".to_string())]);
            }
            "endcase" => {
                push_tokens(
                    &mut parser_iter,
                    &pos,
                    &[
                        Token::Word("drop".to_string()),
                        Token::Literal(1),
                        Token::Word("until".to_string()),
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
                        Token::Word("drop".to_string()),
                    ],
                );
            }

            // counting loops
            "do" => {
                program.current().op(&(Pax::AltPush, pos.clone()));
                program.current().op(&(Pax::AltPush, pos.clone()));
                block_refs.push(program.current().forward_branch_target("<do>", pos.clone()));
            }
            "loop" => {
                // TODO just inline loopimpl here?
                let name = "loopimpl";
                if !program.program.contains_key(name) {
                    panic!("no loopimpl defn found");
                }
                program
                    .current()
                    .exit_block((PaxTerm::Call(name.to_string()), pos.clone()));

                let mut group = block_refs.pop().expect("did not match marker group");
                assert_eq!(group.label, "<do>", "expected do loop");
                program.current().jump_if_0(&mut group, pos.clone());

                // TODO need a concat method
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
            }
            "-loop" => {
                let name = "-loopimpl";
                if !program.program.contains_key(name) {
                    panic!("no -loopimpl defn found");
                }
                program
                    .current()
                    .exit_block((PaxTerm::Call(name.to_string()), pos.clone()));

                let mut group = block_refs.pop().expect("did not match marker group");
                assert_eq!(group.label, "<do>", "expected do loop");
                program.current().jump_if_0(&mut group, pos.clone());

                // TODO need a concat method
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
                program.current().op(&(Pax::AltPop, pos.clone()));
                program.current().op(&(Pax::Drop, pos.clone()));
            }

            // "if" statements
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

                program.current().op(&(Pax::PushLiteral(0), pos.clone())); // Always yes
                program.current().jump_if_0(&mut else_group, pos.clone());

                // TODO
                // else_group.x(current(&mut stack), pos.clone());

                block_refs.push(else_group);
                program.current().set_target(&mut if_group, pos.clone());
            }
            "then" | "endif" => {
                let mut else_group = block_refs
                    .pop()
                    .expect(&format!("did not match marker group: {:?}", block_refs));
                program.current().set_target(&mut else_group, pos);
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
            "temp@" => program.current().op(&(Pax::LoadTemp, pos)),
            "temp!" => program.current().op(&(Pax::StoreTemp, pos)),

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

pub fn parse_to_pax(contents: &str, filename: Option<&str>) -> PaxProgram {
    let mut stack = PaxProgramBuilder::new();

    // Parse PRELUDE.
    parse_forth_inner(&mut stack, PRELUDE, Some("src/prelude.fth"));
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
