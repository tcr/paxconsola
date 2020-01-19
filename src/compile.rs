#![allow(dead_code)]

use indexmap::{IndexSet, IndexMap};
use crate::*;
use lazy_static::*;
use regex::Regex;
use percent_encoding::{utf8_percent_encode, NON_ALPHANUMERIC, AsciiSet};
use std::iter::FromIterator;

fn name_slug(name: &str) -> String {
    const NON_ALPHA: AsciiSet = NON_ALPHANUMERIC.remove(b'_');
    utf8_percent_encode(name, &NON_ALPHA).to_string().replace("%", "").to_string()
}

#[derive(Debug, PartialEq, Clone)]
pub enum GbIr {
    Metadata(String),

    // ( a -- a a )
    Dup,                        // dup hl onto stack
    // ( a -- value )
    ReplaceLiteral(u16),      // TOS = $nn
    // ( a b -- b )
    NipIntoDE,                  // store [stack - 1] into de
    // ( a -- a )
    CopyToA,                    // copy TOS to register A
    // ( a -- a )
    CopyToE,                    // copy TOS to register E
    // ( a -- a )
    CopyToDE,             // copy TOS to register DE
    // ( a -- )
    Pop,                        // pop stack, load TOS into hl
    // ( -- )
    Call(String),
    // ( -- )
    Ret,
    // ( addr -- value )
    ReplaceLoad,
    // ( -- value )
    ReplaceLoadDirect(u16),
    // ( addr -- addr )
    StoreDE,
    // ( -- )
    JumpIfDEIs0(String),         // label destination
    // ( a -- result )
    ReplaceAddWithDE,
    // ( a -- result )
    ReplaceNandWithDE,
    // ( addr -- )
    PushRetAddr,
    // ( -- )
    AltDupFromTOS,
    // ( a -- peek )
    AltPop,

    // ( addr -- value )
    ReplaceLoad8,
    // ( addr -- addr )
    StoreDE8,

    Label(String),
    SetE(u8),
    Invert,
    Inc,
}

fn translate_to_gb(i: usize, op: Pax) -> Vec<GbIr> {
    match op {
        Pax::Metadata(s) => vec![
            GbIr::Metadata(s),
        ],
        // ( -- value )
        Pax::PushLiteral(value) => vec![
            GbIr::Dup,
            GbIr::ReplaceLiteral(value as _),
        ],
        // ( address -- value )
        Pax::Load => vec![
            GbIr::ReplaceLoad,
        ],
        // ( address -- value )
        Pax::Load8 => vec![
            GbIr::ReplaceLoad8,
        ],
        // ( value address -- )
        Pax::Store => vec![
            GbIr::NipIntoDE,
            GbIr::StoreDE,
            GbIr::Pop,
        ],
        // ( value address -- )
        Pax::Store8 => vec![
            GbIr::NipIntoDE,
            GbIr::StoreDE8,
            GbIr::Pop,
        ],
        // ( cond -- )
        Pax::JumpIf0(offset) => vec![
            GbIr::CopyToDE,
            GbIr::Pop,
            GbIr::JumpIfDEIs0(format!(".target_{}", offset)),
        ],
        // ( address -- )
        Pax::Call(target) => vec![
            GbIr::Call(format!("PAX_FN_{}", name_slug(&target))),
        ],
        // ( -- )
        Pax::Exit => vec![
            GbIr::Ret
        ],
        // ( a b -- c )
        Pax::Add => vec![
            GbIr::NipIntoDE,
            GbIr::ReplaceAddWithDE,
        ],
        // ( a b -- c )
        Pax::Nand => vec![
            GbIr::NipIntoDE,
            GbIr::ReplaceNandWithDE,
        ],
        // ( a -- )
        Pax::AltPush => vec![
            GbIr::AltDupFromTOS,
            GbIr::Pop,
        ],
        // ( a -- )
        Pax::AltPop => vec![
            GbIr::Dup,
            GbIr::AltPop,
        ],
        Pax::Print => vec![
            // nah
        ],
        // ( -- )
        Pax::BranchTarget => vec![
            GbIr::Label(format!(".target_{}", i)),
        ],
        op => {
            panic!("not yet implemented: {:?}", op);
        }
    }
}

lazy_static! {
    static ref RE_TRIM_GB: Regex = Regex::new(r"^\s*?\n|\n\s*?$").unwrap();
}

macro_rules! gb_output {
    ($fmt:expr) => (
        println!("{}", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n")), ""))
    );
    ($fmt:expr, $($arg:tt)*) => (
        println!("{}", RE_TRIM_GB.replace_all(&format!(concat!($fmt, "\n"), $($arg)*), ""))
    );
}

pub fn cross_compile_ir_gb(op: GbIr) {
    gb_output!("
    ; [gb_ir] {:?}
        ", op);
    match op {
        GbIr::Label(label) => gb_output!("
{}:
        ", label),

        GbIr::Metadata(s) => gb_output!("
    ; [metadata] {:?}
PAX_FN_{}:
        ", s, name_slug(&s)),
        GbIr::Dup => {
            gb_output!("
    dec c
    ld a, h
    ld [c], a
    dec c
    ld a, l
    ld [c], a
            ");
        }
        GbIr::Pop => {
            gb_output!("
    ld a, [c]
    ld l, a
    inc c
    ld a, [c]
    ld h, a
    inc c
            ");
        }
        GbIr::ReplaceLiteral(lit) => {
            gb_output!("
    ld hl,{lit}
            ", lit=lit);
        }
        GbIr::NipIntoDE => {
            gb_output!("
    ; Move second item to TOS
    ld a, [c]
    ld e, a
    inc c
    ld a, [c]
    ld d, a
    inc c
            ");
        }
        GbIr::CopyToE => {
            gb_output!("
    ld e,l
            ");
        }
        GbIr::SetE(value) => {
            gb_output!("
    ld e,{}
            ", value);
        }
        GbIr::CopyToDE => {
            gb_output!("
    ld e,l
    ld d,h
            ");
        }
        GbIr::CopyToA => {
            gb_output!("
    ; Move to accumulator for comparison
    ld a,l
            ");
        }
        GbIr::ReplaceLoad =>  {
            gb_output!("
    ldi a, [hl]
    ld b, a
    ldd a, [hl]
    ld h, a
    ld l, b
            ");
        }
        GbIr::ReplaceLoadDirect(addr) =>  {
            gb_output!("
    ld a, [{}]
    ld l, a
    ld a, [{}+1]
    ld h, a
            ", addr, addr);
        }
        GbIr::ReplaceLoad8 =>  {
            gb_output!("
.wait:
    ld   a,[$0FF41]
    bit  1,a       ; Wait until Mode is 0 or 1
    jr   nz,.wait

    ld a, [hl]
    ld l, a
    xor a
    ld h, a
            ");
        }
        GbIr::StoreDE8 => {
            // HACK wait for VRAM to be available
            gb_output!("
.wait:
    ld   a,[$0FF41]
    bit  1,a       ; Wait until Mode is 0 or 1
    jr   nz,.wait

    ld a, e
    ld [hl],a
            ");
        }
        GbIr::StoreDE => {
            gb_output!("
    ld a, e
    ldi [hl],a
    ld a, d
    ldd [hl],a
            ");
        }
        GbIr::PushRetAddr => {
            gb_output!("
    push hl
            ");
        }
        GbIr::JumpIfDEIs0(addr) => {
            gb_output!("
    ld a,d
    or e
    jp z,{}
            ", addr);
        }
        GbIr::ReplaceAddWithDE => {
            gb_output!("
    add hl, de
            ");
        }
        GbIr::ReplaceNandWithDE => {
            gb_output!("
    ld a,l
    and a,e
    cpl
    ld l,a
    ld a,h
    and a,d
    cpl
    ld h,a
            ");
        }
        GbIr::Invert => {
            gb_output!("
    ld a,l
    cpl
    ld l,a
    ld a,h
    cpl
    ld h,a
            ");
        }
        GbIr::AltDupFromTOS => {
            gb_output!("
    push hl
            ");
        }
        GbIr::AltPop => {
            gb_output!("
    pop hl
            ");
        }
        GbIr::Inc => {
            gb_output!("
    inc hl
            ");
        }
        GbIr::Ret => {
            gb_output!("
    ret






; function start
            ");
        }
        GbIr::Call(label) => {
            gb_output!("
    call {}
            ", label);
        }
    }
}

// FIXME TODO make all labels one of Parameter(i), Temporary(i), or Return(i) instead of S0, A1, etc

// TODO use these to model stacks and merging logic, converge on ExitStack after minimizing loops
// once there's full coverage of all/most functions, can refactor GbIr generation to do explicit
// loads (for example).
// can also do function inlining. Splice in Pax Ir, readjust JumpIf0 targets
// and rename temporaries / converge arguments / convert return values. If inlining works do auto
// inline for up to N opcodes (determined from stack vector) and see if there is speed improvement
// or,
// recursively solve call ependencies to correct local stacks

/*
pub fn generate_dataflow(program: Program) {
    let mut program_stacks = IndexMap::new();
    for (name, code) in program {
        let mut stack = StackGroup::new();

        // Create dataflow analysis
        for op in code {
            // eprintln!("{:?}", op.0);
            stack.record_op(&op);

            match op.0 {
                Pax::Metadata(_) | Pax::Debugger => {
                    // noop
                }
                Pax::AltPush | Pax::Sleep | Pax::Print => {
                    stack.pop(true);
                }
                Pax::Load | Pax::Load8 => {
                    let s0 = stack.pop(true);
                    stack.push(&[s0]);
                }
                Pax::Add | Pax::Nand => {
                    let s0 = stack.pop(false);
                    let s1 = stack.pop(false);
                    stack.push(&[s0, s1]);
                }
                Pax::Store | Pax::Store8 => {
                    stack.pop(true);
                    stack.pop(true);
                }
                Pax::AltPop | Pax::PushLiteral(_) => {
                    stack.push(&[]);
                }
                Pax::Exit | Pax::Call(_) | Pax::BranchTarget | Pax::JumpIf0(_) => {
                    // We'll resolve these in later passes.
                    // next block
                    // eprintln!("---> stack for {} opcodes: {:?}", fnlen, stack.values);
                    stack.reset();
                }
            }
            // eprintln!(" ... [stack: {:?}]", stack.stack);
        }
        stack.reset();
        program_stacks.insert(name, stack.history);

        // program_stacks.get_mut(&name).unwrap().push(stack);
        // eprintln!("{:?}", program_stacks.get(&name));
    }

    for (name, stacks) in &program_stacks {
        eprintln!("{}:", name);
        for commands in stacks {
            for command in commands {
                eprintln!(
                    "    {:?}",
                    command,
                );
            }
            eprintln!(
                "    ---",
            );
        }
    }

    #[derive(Clone, Debug)]
    pub struct StackMap(IndexMap<String, Vec<StackInfo>>);

    impl StackMap {
        fn each_ir<T>(&mut self, name: &str, mut func: impl FnMut(Pax) -> T) -> Vec<T> {
            let mut values = vec![];
            for stack in self.0.get(name).unwrap() {
                for command in stack {
                    values.push(func(command.0.to_owned()));
                }
            }
            values
        }

        fn names(&self) -> Vec<String> {
            self.0.keys().cloned().collect()
        }

        fn merge_stacks(&mut self, name: &str, func: impl Fn(usize, Pax) -> bool) {
            let stacks = self.0.get(name).unwrap();

            let mut command_index = 0;
            let mut stack_append = vec![];
            for commands in stacks.clone() {
                command_index += commands.len();
                stack_append.push(func(command_index - 1, commands.last().map(|x| x.0.clone()).unwrap()));
            }

            let mut result_stacks = vec![];
            let mut start_with = vec![];
            for (commands, append) in stacks.clone().into_iter().zip(stack_append.into_iter()) {
                start_with.extend(commands);
                if !append {
                    result_stacks.push(start_with.clone());
                    // clear start_with array
                    start_with = vec![];
                }
            }
            self.0.insert(name.to_string(), result_stacks);
        }
    }

    let mut functions = StackMap(program_stacks.clone());

    // Connect unused BranchTargets.
    for name in functions.names() {
        // List jump targets for this function.
        let mut used_targets = IndexSet::new();
        functions.each_ir(&name, |ir| {
            if let Pax::JumpIf0(target) = ir {
                used_targets.insert(target);
            }
        });

        functions.merge_stacks(&name, |command_index, command| {
            eprintln!("command_index: {:?}", command_index);
            if let Pax::BranchTarget = command {
                !used_targets.contains(&command_index)
            } else {
                false
            }
        });
    }
    eprintln!();
    eprintln!();

    // Index which functions have just one stack.
    for _ in 0..4 {
        let mut functions_single = IndexSet::new();
        for name in functions.names() {
            if functions.0.get(&name).unwrap().len() == 1 {
                functions_single.insert(name.to_owned());
            }
        }
        eprintln!("single fns: {:?}", functions_single);
        eprintln!();

        // Merge resulting call stacks that have unified input stacks.
        for name in functions.names() {
            functions.merge_stacks(&name, |_, ir| {
                if let Pax::Call(name) = ir {
                    functions_single.contains(&name)
                } else {
                    false
                }
            });
        }
    }

    for (name, stacks) in &functions.0 {
        eprintln!("{}:", name);
        eprintln!(
            "    stacks {}",
            stacks.len()
        );

        for stack in stacks {
            eprintln!("     - {:?}", stack.last());
        }
    }
}
*/


/// (opcode, data registers, return registers, temp register)
pub type Analyzed<T> = (T, Vec<String>, Vec<String>, Option<String>);

pub type BlockSpan = Vec<Analyzed<Located<SuperPax>>>;

pub type DataRegs = Vec<String>;

#[derive(Debug, Clone)]
pub enum Block {
    // (Vec of dataflow analyzed/position-based commands, data stack registers, global registers analysis.)
    ExitBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
    JumpIf0Block(BlockSpan, DataRegs, IndexMap<String, StackItem>),
    BranchTargetBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
    CallBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
}

impl Block {
    fn commands(&'_ self) -> &'_ BlockSpan {
        match self {
            Block::ExitBlock(ref commands, ..) => commands,
            Block::JumpIf0Block(ref commands, ..) => commands,
            Block::BranchTargetBlock(ref commands, ..) => commands,
            Block::CallBlock(ref commands, ..) => commands,
        }
    }

    fn registers(&'_ self) -> &'_ IndexMap<String, StackItem> {
        match self {
            Block::ExitBlock(.., ref regs) => regs,
            Block::JumpIf0Block(.., ref regs) => regs,
            Block::BranchTargetBlock(.., ref regs) => regs,
            Block::CallBlock(.., ref regs) => regs,
        }
    }

    fn enter_stack(&self) -> DataRegs {
        match self {
            Block::ExitBlock(_, ref start_stack, _) => start_stack.clone(),
            Block::JumpIf0Block(_, ref start_stack, _) => start_stack.clone(),
            Block::BranchTargetBlock(_, ref start_stack, _) => start_stack.clone(),
            Block::CallBlock(_, ref start_stack, _) => start_stack.clone(),
        }
    }

    fn exit_stack(&self) -> Option<Vec<String>> {
        self.commands().last().map(|a| a.1.clone())
    }
}

#[derive(Debug, Clone)]
struct StackGroup {
    index: usize,
    data_stack: Vec<String>,
    return_stack: Vec<String>,
    temp: Option<String>,
    values: IndexMap<String, StackItem>,
    current_block: BlockSpan,
    blocks: Vec<Block>,
    start_stack: Vec<String>,
}

#[derive(Debug, Clone)]
pub struct StackItem {
    id: String,
    ancestors: IndexSet<String>,
    literal: Option<isize>,
}

impl StackGroup {
    fn new() -> StackGroup {
        StackGroup {
            index: 0,
            data_stack: vec![],
            return_stack: vec![],
            temp: None,
            values: IndexMap::new(),
            current_block: vec![],
            blocks: vec![],
            start_stack: vec![],
        }
    }

    fn record_op(&mut self, op: &Located<SuperPax>) {
        self.current_block.push((op.to_owned(), self.data_stack.clone(), self.return_stack.clone(), self.temp.clone()));
    }

    fn drop_last_op(&mut self) {
        self.current_block.pop();
    }

    fn exit_block(&mut self) {
        self.blocks.push(Block::ExitBlock(self.current_block.clone(), self.start_stack.clone(), self.values.clone()));
        self.reset();
    }

    fn jump_if_0_block(&mut self) {
        self.blocks.push(Block::JumpIf0Block(self.current_block.clone(), self.start_stack.clone(), self.values.clone()));
        self.reset();
    }

    fn branch_target_block(&mut self) {
        self.blocks.push(Block::BranchTargetBlock(self.current_block.clone(), self.start_stack.clone(), self.values.clone()));
        self.reset();
    }

    fn call_block(&mut self) {
        self.blocks.push(Block::CallBlock(self.current_block.clone(), self.start_stack.clone(), self.values.clone()));
        self.reset();
    }

    fn reset(&mut self) {
        // self.index = 0;
        self.data_stack = vec![];
        self.return_stack = vec![];
        self.values = IndexMap::new();
        self.current_block = vec![];
        self.start_stack = vec![];
    }

    fn push_literal(&mut self, value: isize) -> String {
        let target = format!("L{}", self.index);
        self.index += 1;

        self.data_stack.push(target.clone());
        self.values.insert(target.clone(), StackItem {
            id: target.clone(),
            ancestors: IndexSet::new(),
            literal: Some(value),
        });
        target
    }

    fn push_data(&mut self, ancestors: &[String]) {
        let value = format!("T{}", self.index);
        self.index += 1;

        self.data_stack.push(value.clone());
        self.values.insert(value.clone(), StackItem {
            id: value.clone(),
            ancestors: IndexSet::from_iter(ancestors.to_owned().into_iter()),
            literal: None,
        });
    }

    fn push_return_stack(&mut self) -> String {
        let reg = self.pop_data(false);
        self.return_stack.push(reg.clone());
        reg
    }

    fn pop_return_stack(&mut self) -> String {
        let ret = if let Some(ret) = self.return_stack.pop() {
            ret
        } else {
            let value = format!("R{}", self.index);
            self.index += 1;

            // TODO insertion
            for command in &mut self.current_block {
                command.2.insert(0, value.clone());
            }

            self.values.insert(value.clone(), StackItem {
                id: value.clone(),
                ancestors: IndexSet::new(),
                literal: None,
            });
            value
        };
        self.data_stack.push(ret.clone());
        ret
    }

    fn pop_data(&mut self, stored: bool) -> String {
        // If there is a register on the data stack, pop it.
        if let Some(value) = self.data_stack.pop() {
            let mut iter = vec![value.clone()];

            if stored {
                while let Some(iter_value) = iter.pop() {
                    let value_item = self.values.get_mut(&iter_value).unwrap();
                    iter.extend(value_item.ancestors.clone());
                }
            }

            value
        } else {
            // Otherwise, create a new argument and inject it.
            let value = format!("D{}", self.index);
            self.index += 1;

            // TODO insertion
            self.start_stack.insert(0, value.clone());
            for command in &mut self.current_block {
                command.1.insert(0, value.clone());
            }

            self.values.insert(value.clone(), StackItem {
                id: value.clone(),
                ancestors: IndexSet::new(),
                literal: None,
            });
            value
        }
    }

    fn load_temp(&mut self) -> (String, String) {
        let target = self.temp.clone().unwrap();
        self.data_stack.push(target.clone());

        // Bump temporary counter
        let next_target = format!("{}{}", &self.temp.as_ref().unwrap()[0..1], self.index);
        self.temp = Some(next_target.clone());
        self.index += 1;
        let mut stack_item = self.values.get(&target).unwrap().clone();
        stack_item.id = next_target.clone();
        self.values.insert(next_target.clone(), stack_item);
        (target, next_target)
    }

    fn store_temp(&mut self) -> String {
        let ret = self.pop_data(false);
        self.temp = Some(ret.clone());
        ret
    }
}

// Extends the regular Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone)]
pub enum SuperPax {
    Pax(Pax),
    Drop,

    BranchTarget(usize),

    // PushLiteral(temp reg pushed to stack, value)
    PushLiteral(String, isize),

    // AltPop(register that was popped)
    AltPop(String),
    // AltPush(register that was pushed)
    AltPush(String),
    // LoadTemp(temp reg pushed to data stack, upserted temp reg)
    LoadTemp(String, String),
    // StoreTemp(data reg stored in temp, upserted temp reg)
    StoreTemp(String),
}


// first: literal -> see if used,
//     if added to (become temporary), check if temporary is dropped (default true?)
//     else if stored to temp...

// or, walk backward from last stack position and use, and only recover it when needed

pub type SuperSpan = Vec<Located<SuperPax>>;

fn propagate_constants(program: Program) {
    // First we want to analyze the whole program and identify basic blocks.
    let mut program_stacks = IndexMap::new();
    for (name, code) in program {
        let mut stack = StackGroup::new();

        // Create dataflow analysis
        let mut code_iter = code.iter().enumerate().peekable();
        while let Some((i, op)) = code_iter.next() {
            match op.0 {
                Pax::PushLiteral(value) => {
                    // Temp values
                    if value == 49216 {
                        // SuperPax::LoadTemp
                        if let Some((_, &(Pax::Load, _))) = code_iter.peek() {
                            let (target, next_target) = stack.load_temp();
                            stack.record_op(&(SuperPax::LoadTemp(
                                target,
                                next_target,
                            ), op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                        // SuperPax::StoreTemp
                        if let Some((_, &(Pax::Store, _))) = code_iter.peek() {
                            let reg = stack.store_temp();
                            stack.record_op(&(SuperPax::StoreTemp(reg), op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                    }
                }
                Pax::JumpIf0(target) => {
                    // SuperPax::Drop
                    if let Some((_, &(Pax::BranchTarget, _))) = code_iter.peek() {
                        if target == i + 1 {
                            stack.pop_data(false);
                            stack.record_op(&(SuperPax::Drop, op.1.clone()));

                            code_iter.next();
                            continue;
                        }
                    }
                }
                _ => {}
            }

            // eprintln!("{:?}", op.0);
            match op.0 {
                Pax::PushLiteral(value) => {
                    let target = stack.push_literal(value);
                    stack.record_op(&(SuperPax::PushLiteral(target, value), op.1.clone()));
                    continue;
                }
                Pax::BranchTarget => {
                    // FIXME this should inline the block number, not the opcode number
                    stack.record_op(&(SuperPax::BranchTarget(i), op.1.clone()));
                    stack.branch_target_block();
                    continue;
                },

                Pax::Metadata(_) |
                Pax::Debugger => {
                    // noop
                }
                Pax::Sleep |
                Pax::Print => {
                    stack.pop_data(true);
                }
                Pax::AltPush => {
                    let reg = stack.push_return_stack();
                    stack.record_op(&(SuperPax::AltPush(reg), op.1.clone()));
                    continue;
                }
                Pax::AltPop => {
                    let reg = stack.pop_return_stack();
                    stack.record_op(&(SuperPax::AltPop(reg), op.1.clone()));
                    continue;
                }
                Pax::Load |
                Pax::Load8 => {
                    let s0 = stack.pop_data(true);
                    stack.push_data(&[s0]);
                }
                Pax::Add |
                Pax::Nand => {
                    let s0 = stack.pop_data(false);
                    let s1 = stack.pop_data(false);
                    stack.push_data(&[s0, s1]);
                }
                Pax::Store |
                Pax::Store8 => {
                    stack.pop_data(false);
                    stack.pop_data(true);
                }

                Pax::Exit => {}
                Pax::Call(_) => {},
                Pax::JumpIf0(target) => {
                    stack.pop_data(false);
                },
            }

            // inject
            stack.record_op(&(SuperPax::Pax(op.0.clone()), op.1));

            // close blocks
            match op.0 {
                Pax::Exit => stack.exit_block(),
                Pax::Call(_) => stack.call_block(),
                Pax::JumpIf0(target) => stack.jump_if_0_block(),
                _ => {},
            }

            // eprintln!(" ... [stack: {:?}]", stack.stack);
        }

        let mut jump_targets = IndexMap::new();
        let mut branch_targets = IndexMap::new();
        for block in &stack.blocks {
            for op in block.commands() {
                match op.0 {
                    (SuperPax::BranchTarget(target), pos) => {
                        branch_targets.insert(target, op.1.clone());
                    },
                    (SuperPax::Pax(Pax::JumpIf0(target)), pos) => {
                        jump_targets.insert(target, op.1.clone());
                    },
                    _ => {},
                }
            }
        }
        // Uncomment if can merge keys set to IndexSet
        // assert!(jump_targets.is_subset(&branch_targets), "jump to non-branch targets");

        eprintln!("----> jump:   {:?}", jump_targets);
        eprintln!("      branch: {:?}", branch_targets);

        // stack.reset();
        program_stacks.insert(name, stack.blocks);

        // program_stacks.get_mut(&name).unwrap().push(stack);
        // eprintln!("{:?}", program_stacks.get(&name));
    }

    // NOTE debug values
    for (name, stack_blocks) in &program_stacks {
        if name != "main" {
            continue;
        }

        for block in &stack_blocks[0..3] {
            let mut reg_blacklist = IndexSet::new();

            let mut command_count = 0;
            let new_commands = block.commands().iter().rev().map(|command| {
                // eprintln!("{:?}\n----> {:?}", command.0, reg_blacklist);
                let mut result = (command.0).0.clone();

                match &result {
                    SuperPax::LoadTemp(reg, next_reg) if reg_blacklist.contains(reg) => {
                        return None;
                    }
                    SuperPax::AltPush(reg) if reg_blacklist.contains(reg) => {
                        return None;
                    }
                    SuperPax::AltPop(reg) if reg_blacklist.contains(reg) => {
                        return None;
                    }
                    SuperPax::PushLiteral(reg, _) if reg_blacklist.contains(reg) => {
                        return None;
                    }
                    SuperPax::StoreTemp(reg) if reg_blacklist.contains(reg) => {
                        return None;
                    }
                    _ => {}
                }

                if command.1.last().map(|reg| reg.starts_with("L")).unwrap_or(false) {
                    let reg = command.1.last().unwrap().clone();
                    if let Some(StackItem { literal: Some(lit), .. }) = block.registers().get(&reg) {
                        // eprintln!("      ^-> {:?} <= {:?}", reg.clone(), lit);
                        match &result {
                            SuperPax::AltPop(target_reg) if reg == *target_reg => {
                                reg_blacklist.insert(target_reg.clone());
                                result = SuperPax::PushLiteral(target_reg.clone(), *lit);
                            }
                            SuperPax::LoadTemp(target_reg, next_reg) if reg == *target_reg => {
                                reg_blacklist.insert(target_reg.clone());
                                result = SuperPax::PushLiteral(target_reg.clone(), *lit);
                            }
                            _ => {}
                        }
                    }
                }

                Some(result)
            }).collect::<Vec<_>>().into_iter().rev().collect::<Vec<_>>();

            for command in new_commands {
                eprintln!(
                    "    {:?}",
                    command,
                );
                command_count += 1;
            }

            eprintln!(
                "\n  {} entries out of {}.\n  ---",
                command_count,
                block.commands().len(),
            );
        }

        eprintln!("{}:", name);
        for (i, block) in stack_blocks[0..11].iter().enumerate() {
            eprintln!("block[{}]", i);
            for command in block.commands() {
                eprintln!(
                    "    {:?}:",
                    (command.0).0,
                );
                eprintln!(
                    "                        data: {:?}",
                    command.1,
                );
                eprintln!(
                    "                        retn: {:?}",
                    command.2,
                );
                eprintln!(
                    "                        temp: {}",
                    command.3.clone().unwrap_or("".to_string()),
                );
                eprintln!();
            }
            eprintln!(
                "\n  {} entries.\n  ---",
                block.commands().len(),
            );
        }
    }
    eprintln!();
    eprintln!();
    eprintln!();
    eprintln!();
    eprintln!();
    eprintln!();

    // TODO could rewrite argument detection structure to be its own pass
    // instead of computing in flow analysis below; arg count is static for whole fn


    // TODO this implements a dataflow iterator that walks over blocks in the graph and
    // queues branching statements (nonzero path) for later.
    for (name, stack_blocks) in &program_stacks {
        if name != "main" {
            continue;
        }

        {
            let mut visited = IndexSet::new();
            let mut conditions = std::collections::VecDeque::<usize>::new();
            conditions.push_front(0);
            while let Some(cond) = conditions.pop_back() {
                // index of block iteration
                let mut previous_block: Option<DataRegs> = None;
                let mut i = cond;
                'block: while i < stack_blocks.len() {
                    let block: &Block = &stack_blocks[i];

                    if visited.contains(&i) {
                        println!("unified[{}], ending block search.", i);
                        break;
                    }

                    println!("block[{}]", i);

                    // Check if we can merge stack with previous block.
                    let truncated = if let Some(ref last) = previous_block {
                        // println!("merge? with previous block: {:?}", last);
                        // println!("                   current: {:?}", block.enter_stack());
                        let mut truncated = last.clone().into_iter().rev().skip(block.enter_stack().len()).rev().collect::<DataRegs>();
                        let mut trunc2 = truncated.clone();
                        trunc2.extend(block.enter_stack());
                        // println!("                    merged: {:?}", trunc2);

                        // FIXME propagate registers literal values from previous block into this one
                        // create a rewrite map for all registers here on out.
                        // replace all registers when printing with it.
                        // more importantly use that register literal information for optimization targets.
                        // make compatible with literal propagation over branches though.
                        // then can be used to optimize whole functions.

                        truncated
                    } else {
                        vec![]
                    };

                    // Print stack stack.
                    {
                        let mut trunc2 = truncated.clone();
                        trunc2.extend(block.enter_stack());
                        println!("    {:?}", trunc2);
                    }

                    for command in block.commands() {
                        let mut trunc2 = truncated.clone();
                        trunc2.extend(command.1.clone());
                        println!("  {:?}\n    {:?}", (command.0).0, trunc2);
                    }
                    visited.insert(i);

                    match block.commands().last() {
                        Some(((SuperPax::BranchTarget(target), ..), ..)) => {
                            // Only stop if flag is passed in saying to stop.
                        }
                        Some(((SuperPax::Pax(Pax::JumpIf0(target)), ..), ..)) => {
                            // noop
                            // let commands = blocks[i].commands();
                            let mut is_absolute = false;
                            if block.commands().len() > 1 {
                                if let Some(((SuperPax::PushLiteral(.., 0), ..), ..)) = block.commands().get(block.commands().len() - 2) {
                                    is_absolute = true;
                                }
                            }

                            // Jump immediate
                            for (b_index, b) in stack_blocks.iter().enumerate() {
                                if let Some(((SuperPax::BranchTarget(bt), ..), ..)) = b.commands().last() {
                                    if bt == target {
                                        // Invoke branch as though we jumped (nonzero).
                                        // b_index + 1 is the block following the BranchTarget we're jumping to.
                                        if is_absolute {
                                            i = b_index + 1;
                                            println!("  absolute jump: {:?}", i);
                                            continue 'block;
                                        } else {
                                            // only iterate future branches, not reverse ones (which are loops)
                                            if b_index + 1 > i {
                                                conditions.push_front(b_index + 1);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        _ => {}
                    }

                    i += 1;
                    let mut trunc2 = truncated.clone();
                    trunc2.extend(block.exit_stack().unwrap_or(vec![]));
                    previous_block = Some(trunc2);
                }
                println!("next cond.\n");
            }
        }

        // eprintln!("{}:", name);
        // for block in stack_blocks {
        //     for command in block.commands() {
        //         eprintln!(
        //             "    {:?}:",
        //             (command.0).0,
        //         );
        //         eprintln!(
        //             "                        data: {:?}",
        //             command.1,
        //         );
        //         eprintln!(
        //             "                        retn: {:?}",
        //             command.2,
        //         );
        //         eprintln!(
        //             "                        temp: {}",
        //             command.3.clone().unwrap_or("".to_string()),
        //         );
        //         eprintln!();
        //     }
        //     eprintln!(
        //         "\n  {} entries.\n  ---",
        //         block.commands().len(),
        //     );
        // }
    }
}

pub fn cross_compile_forth_gb(program: Program) {
    propagate_constants(program);
    std::process::exit(0);

    for (_name, code) in program {
        let mut result = vec![];
        for (i, (op, _pos)) in code.iter().enumerate() {
            result.extend(translate_to_gb(i, op.to_owned()));
        }

        // In-place optimizations.
        const OPTIMIZE: bool = true;
        const PASSES: usize = 3;
        if OPTIMIZE {
            for _ in 0..PASSES {
                let mut i = 0;
                while i < result.len() {
                    let op = &result[i];
                    i += 1;

                    match op {
                        GbIr::Pop => {
                            if let (Some(GbIr::Dup), Some(GbIr::ReplaceLiteral(_))) = (result.get(i), result.get(i + 1)) {
                                eprintln!("optimizing [pop, dup, replace literal]");
                                i -= 1;
                                let _ = result.splice(i..i+2, vec![]);
                                continue;
                            }
                        }
                        GbIr::ReplaceLiteral(addr) => {
                            let addr = *addr;
                            if let Some(GbIr::ReplaceLoad) = result.get(i) {
                                eprintln!("optimizing [replace literal, replace load]");
                                i -= 1;
                                let _ = result.splice(i..i+2, vec![
                                    GbIr::ReplaceLoadDirect(addr)
                                ]);
                                continue;
                            }
                        }
                        GbIr::CopyToDE => {
                            if let (Some(GbIr::ReplaceLiteral(65535)), Some(GbIr::ReplaceNandWithDE)) = (result.get(i), result.get(i + 1)) {
                                eprintln!("optimizing [copy to de, replace literal -1, replace nand with de]");
                                i -= 1;
                                let _ = result.splice(i..i+3, vec![
                                    GbIr::Invert
                                ]);
                                continue;
                            }

                            if let (Some(GbIr::ReplaceLiteral(1)), Some(GbIr::ReplaceAddWithDE)) = (result.get(i), result.get(i + 1)) {
                                eprintln!("optimizing [copy to de, replace literal 1, replace add with de]");
                                i -= 1;
                                let _ = result.splice(i..i+3, vec![
                                    GbIr::Inc,
                                ]);
                                continue;
                            }

                            if let (Some(GbIr::Pop), Some(GbIr::JumpIfDEIs0(ref label1)), Some(GbIr::Label(ref label2))) = (result.get(i), result.get(i+1), result.get(i+2)) {
                                if label1 == label2 {
                                    eprintln!("optimizing [copy to de, pop, jump to next label, next label]");
                                    i -= 1;
                                    let _ = result.splice(i..i+4, vec![
                                        GbIr::Pop,
                                    ]);
                                }
                            }
                        }

                        GbIr::Dup => {
                            if let (Some(GbIr::ReplaceLiteral(value)), Some(GbIr::NipIntoDE)) = (result.get(i), result.get(i + 1)) {
                                let value = *value;
                                eprintln!("optimizing [dup, replace literal, nip]");
                                i -= 1;
                                let _ = result.splice(i..i+3, vec![
                                    GbIr::CopyToDE,
                                    GbIr::ReplaceLiteral(value)
                                ]);
                                continue;
                            }

                            // TODO could this can be uncommented once it works with DE values? just
                            // we don't have to assume u8
                            // if let (Some(GbIr::ReplaceLiteral(value)), Some(GbIr::CopyToDE), Some(GbIr::Pop)) = (result.get(i), result.get(i + 1), result.get(1 + 2)) {
                            //     let value = *value;
                            //     eprintln!("optimizing [dup, replace literal, copy to e, pop]");
                            //     i -= 1;
                            //     let _ = result.splice(i..i+4, vec![
                            //         GbIr::SetDE(value as u8),
                            //     ]);
                            //     continue;
                            // }
                        }
                        _ => {}
                    }
                }
            }
        }

        for gbir in result {
            cross_compile_ir_gb(gbir);
            println!();
        }

        /*
        for (i, (op, pos)) in code.iter().enumerate() {
            println!("
    ; [pax_ir:{}] {:?}, file.fs:{}
            ", i, op, pos);

            translate_to_gb(i, op.to_owned()).into_iter().for_each(|g| cross_compile_ir_gb(g));
        }
        */
    }
}
