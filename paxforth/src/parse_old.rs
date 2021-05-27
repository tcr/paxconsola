//! Legacy parsing logic.

use crate::prelude::*;
use crate::*;
use indexmap::IndexMap;
use lazy_static::*;
use regex::Regex;
use serde::*;

// Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone, Serialize, Deserialize)]
pub enum Pax {
    Drop,

    BranchTarget(usize),
    OldBranchTarget,

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

    Abort,

    Print,
}

pub type PaxSpan = Vec<Located<Pax>>;

pub type PaxProgram = IndexMap<String, Vec<Block>>;

// Value for WebAssembly
// const BASE_VARIABLE_OFFSET: usize = 10000;
// Value for Gameboy
// const BASE_VARIABLE_OFFSET: usize = 49216;
// Value for C64
pub const BASE_VARIABLE_OFFSET: usize = 0x9000;


/**
 * Blocks
 */

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Block {
    ExitBlock(PaxSpan),
    JumpAlways(PaxSpan),
    JumpIf0Block(PaxSpan),
    BranchTargetBlock(PaxSpan),
    CallBlock(PaxSpan),
}

impl Block {
    pub fn commands(&'_ self) -> &'_ PaxSpan {
        match self {
            Block::ExitBlock(ref commands) => commands,
            Block::JumpIf0Block(ref commands) => commands,
            Block::JumpAlways(ref commands) => commands,
            Block::BranchTargetBlock(ref commands) => commands,
            Block::CallBlock(ref commands) => commands,
        }
    }

    pub fn commands_mut(&'_ mut self) -> &'_ mut PaxSpan {
        match self {
            Block::ExitBlock(ref mut commands) => commands,
            Block::JumpIf0Block(ref mut commands) => commands,
            Block::JumpAlways(ref mut commands) => commands,
            Block::BranchTargetBlock(ref mut commands) => commands,
            Block::CallBlock(ref mut commands) => commands,
        }
    }
}

#[derive(Debug, Clone)]
pub struct BlockBuilder {
    pub current_block: PaxSpan,
    pub blocks: Vec<Block>,
}

impl BlockBuilder {
    pub fn new() -> BlockBuilder {
        BlockBuilder {
            current_block: vec![],
            blocks: vec![],
        }
    }

    pub fn record_op(&mut self, op: &Located<Pax>) {
        self.current_block.push(op.to_owned());
    }

    pub fn exit_block(&mut self) {
        self.blocks
            .push(Block::ExitBlock(self.current_block.clone()));
        self.reset();
    }

    pub fn jump_if_0_block(&mut self) {
        self.blocks
            .push(Block::JumpIf0Block(self.current_block.clone()));
        self.reset();
    }

    pub fn jump_always_block(&mut self) {
        self.blocks
            .push(Block::JumpAlways(self.current_block.clone()));
        self.reset();
    }

    pub fn branch_target_block(&mut self) {
        self.blocks
            .push(Block::BranchTargetBlock(self.current_block.clone()));
        self.reset();
    }

    pub fn call_block(&mut self) {
        self.blocks
            .push(Block::CallBlock(self.current_block.clone()));
        self.reset();
    }

    pub fn reset(&mut self) {
        self.current_block = vec![];
    }
}

/**
 * Marker groups
 */

#[derive(Debug)]
pub struct MarkerGroup {
    name: String,
    target_indices: Vec<usize>,
    source_index: Option<usize>,
}


/**
 * Parsing
 */

pub enum ParseMode {
    Default,
    FunctionName,
    ConstantName(isize),
    CommentParens,
    Variable,
}

pub type Program = IndexMap<String, PaxSpan>;

struct StackAbstraction {
    stack: Vec<(String, PaxSpan)>,
    _current_function: String,
    block_builder: BlockBuilder,
}

impl StackAbstraction {

    pub fn record_op(&mut self, op: Located<Pax>) {
        self.stack.last_mut().unwrap().1.push(op.clone());
        self.block_builder.record_op(&op);
    }

    pub fn exit_block(&mut self) {
        self.block_builder.exit_block();
    }

    pub fn jump_if_0_block(&mut self) {
        self.block_builder.jump_if_0_block();
    }

    pub fn jump_always_block(&mut self) {
        self.block_builder.jump_always_block();
    }

    pub fn branch_target_block(&mut self) {
        self.block_builder.branch_target_block();
    }

    pub fn call_block(&mut self) {
        self.block_builder.call_block();
    }

    pub fn reset(&mut self) {
        self.block_builder.reset();
    }

    // rest

    fn in_function(&self) -> bool {
        self._current_function != "main"
    }

    fn in_main(&self) -> bool {
        self._current_function == "main"
    }

    fn get_main(&self) -> PaxSpan {
        self.stack[0].clone().1
    }

    fn current(&'_ mut self) -> &'_ mut PaxSpan {
        &mut self.stack.last_mut().unwrap().1
    }

    fn current_pop(&mut self) {
        self.stack.last_mut().unwrap().1.pop();
    }

    fn push_function(&mut self, (name, contents): (String, PaxSpan)) {
        self._current_function = name.clone();
        self.stack.push((name, contents));
    }

    fn pop_function(&mut self) -> Option<(String, PaxSpan)> {
        self._current_function = format!("main");
        self.stack.pop()
    }

    fn new_marker_group(&mut self, name: &str, pos: Pos) -> MarkerGroup {
        let index = self.current().len();
        self.record_op((Pax::OldBranchTarget, pos));
        self.branch_target_block();
        MarkerGroup {
            name: name.to_string(),
            target_indices: vec![],
            source_index: Some(index),
        }
    }

    fn set_target(&mut self, marker_group: &mut MarkerGroup, pos: Pos) {
        assert!(marker_group.source_index.is_none());
        let index = self.current().len();
        self.record_op((Pax::OldBranchTarget, pos));
        marker_group.source_index = Some(index);

        let output = self.current();
        for target in &marker_group.target_indices {
            match output[*target].0 {
                Pax::JumpIf0(_) => {
                    output[*target].0 = Pax::JumpIf0(index);
                }
                Pax::JumpAlways(_) => {
                    output[*target].0 = Pax::JumpAlways(index);
                }
                _ => {
                    unreachable!();
                }
            }
        }
    }

    fn jump_if_0(&mut self, marker_group: &mut MarkerGroup, pos: Pos) {
        let index = self.current().len();
        self.record_op((Pax::JumpIf0(marker_group.source_index.unwrap_or(0)), pos));
        marker_group.target_indices.push(index);
        self.jump_if_0_block();
    }

    fn jump_always(&mut self, marker_group: &mut MarkerGroup, pos: Pos) {
        let index = self.current().len();
        self.record_op((Pax::JumpAlways(marker_group.source_index.unwrap_or(0)), pos));
        marker_group.target_indices.push(index);
        self.jump_always_block();
    }
}

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
    let mut stack = StackAbstraction {
        stack: vec![
            ("main".to_string(), vec![])
        ],
        _current_function: format!("main"),
        block_builder: BlockBuilder::new(),
    };

    let mut parse_mode = ParseMode::Default;
    let mut previous_tokens: Vec<Token> = vec![];

    // let mut code_iter = code.iter().enumerate().peekable();
    for (token, mut pos) in parser {
        pos.function = stack._current_function.clone();

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
                        stack.record_op((
                            Pax::PushLiteral(constants[word.as_str()] as isize),
                            pos,
                        ));
                    }
                    // Functions (shadows all terms)
                    Token::Word(word) if functions.contains_key(&word) => {
                        stack.record_op((Pax::Call(word.to_string()), pos));
                        stack.call_block();

                    }
                    // Variables (shadows all terms)
                    Token::Word(word) if variables.contains_key(word.as_str()) => {
                        stack.record_op((
                            Pax::PushLiteral(variables[word.as_str()] as isize),
                            pos,
                        ));
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
                        functions.insert(name, body);
                    }

                    // Flow control
                    Token::Word(word) if word == "recurse" => {
                        // Address root flow group
                        stack.jump_always(&mut flow_markers[0], pos.clone());
                    }
                    Token::Word(word) if word == "begin" => {
                        flow_markers.push(stack.new_marker_group(
                            "<begin>",
                            pos.clone(),
                        ));
                    }
                    Token::Word(word) if word == "until" => {
                        let mut group =
                            flow_markers.pop().expect("did not match marker group");
                        assert_eq!(group.name, "<begin>", "expected begin loop");
                        stack.jump_if_0(&mut group, pos.clone());
                        used_flow_markers.push(group);
                    }
                    Token::Word(word) if word == "do" => {
                        stack.record_op((Pax::AltPush, pos.clone()));
                        stack.record_op((Pax::AltPush, pos.clone()));
                        flow_markers.push(stack.new_marker_group(
                            "<do>",
                            pos.clone(),
                        ));
                    }
                    Token::Word(word) if word == "loop" => {
                        // TODO just inline loopimpl here?
                        let name = "loopimpl";
                        if !functions.contains_key(name) {
                            panic!("no loopimpl defn found");
                        }
                        stack.record_op((Pax::Call(name.to_string()), pos.clone()));
                        stack.call_block();

                        let mut group =
                            flow_markers.pop().expect("did not match marker group");
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
                        if !functions.contains_key(name) {
                            panic!("no -loopimpl defn found");
                        }
                        stack.record_op((Pax::Call(name.to_string()), pos.clone()));

                        let mut group =
                            flow_markers.pop().expect("did not match marker group");
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
                        let mut if_group =
                            flow_markers.pop().expect("did not match marker group");
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
    assert!(stack.in_main(), "did not exhaust all functions");
    let mut output = stack.get_main();
    output.push((Pax::Exit, Default::default()));
    functions.get_mut("main").unwrap().extend(output);
}

pub fn parse_forth(contents: &str, filename: Option<&str>) -> Program {
    let buffer = contents.as_bytes().to_owned();
    let mut program = IndexMap::new();
    parse_forth_inner(
        &mut program,
        PRELUDE.as_bytes().to_vec(),
        Some("src/prelude.rs"),
    );
    parse_forth_inner(&mut program, buffer, filename);
    program
}
