#![allow(dead_code)]

use indexmap::{IndexSet, IndexMap};
use crate::*;
use lazy_static::*;
use regex::Regex;
use percent_encoding::{utf8_percent_encode, NON_ALPHANUMERIC, AsciiSet};
use std::iter::FromIterator;
use itertools::Itertools;

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

pub type StackInfo = Vec<(Pax, Pos, Vec<String>)>;

#[derive(Debug, Clone)]
struct StackGroup {
    args: usize,
    index: usize,
    stack: Vec<String>,
    values: IndexMap<String, StackItem>,
    code: StackInfo,
    history: Vec<StackInfo>,
}

#[derive(Debug, Clone)]
pub struct StackItem {
    id: String,
    ancestors: IndexSet<String>,
    stored: bool,
}

impl StackGroup {
    fn new() -> StackGroup {
        StackGroup {
            args: 0,
            index: 0,
            stack: vec![],
            values: IndexMap::new(),
            code: vec![],
            history: vec![],
        }
    }

    fn record_op(&mut self, op: &(Pax, Pos)) {
        self.code.push((op.0.clone(), op.1.clone(), self.stack.clone()));
    }

    fn reset(&mut self) {
        if !self.code.is_empty() {
            self.history.push(self.code.clone());
        }

        self.index = 0;
        self.stack = vec![];
        self.values = IndexMap::new();
        self.code = vec![];
    }

    fn push(&mut self, ancestors: &[String]) {
        let value = format!("S{}", self.index);
        self.index += 1;

        self.stack.push(value.clone());
        self.values.insert(value.clone(), StackItem {
            id: value.clone(),
            ancestors: IndexSet::from_iter(ancestors.to_owned().into_iter()),
            stored: false,
        });
    }

    fn pop(&mut self, stored: bool) -> String {
        if let Some(value) = self.stack.pop() {
            let mut iter = vec![value.clone()];

            if stored {
                while let Some(iter_value) = iter.pop() {
                    let value_item = self.values.get_mut(&iter_value).unwrap();
                    value_item.stored = true;
                    iter.extend(value_item.ancestors.clone());
                }
            }

            value
        } else {
            let value = format!("A{}", self.args);
            self.args += 1;

            self.stack.insert(0, value.clone());

            self.values.insert(value.clone(), StackItem {
                id: value.clone(),
                ancestors: IndexSet::new(),
                stored: false,
            });
            value
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
pub enum Stack {
    ExitStack(StackInfo),
    StopStack(StackInfo),
    JumpIf0Stack(StackInfo),
    BranchTargetStack(StackInfo),
    CallStack(StackInfo),
}

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

pub fn cross_compile_forth_gb(program: Program) {
    // generate_dataflow(program);
    // std::process::exit(0);

    for (name, code) in program {
        let mut result = vec![];
        for (i, (op, pos)) in code.iter().enumerate() {
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
