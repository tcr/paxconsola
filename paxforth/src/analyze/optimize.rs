use crate::analyze::walker::*;
use crate::analyze::*;
use crate::*;
use indexmap::IndexSet;
use log::*;
use std::collections::{HashMap, HashSet};

/// Given a block and analysis, propagate the literal values loaded in this function
/// if detected and then blacklist their containing registers. Iterates backward.
fn propagate_literals_in_block(
    analyzed_block: &AnalyzedBlock,
    // registers: RegFile,
    reg_blacklist: &mut IndexSet<StackValue>,
) -> Block {
    let mut result_opcodes = vec![];

    // The stack ahead of us, e.g. what the current command computed.
    let mut next_stack = match analyzed_block.terminator.clone() {
        ((PaxTerm::Exit, _), stack) => {
            // Blacklist previous temp value.
            if let Some(ref temp_reg) = stack.temp() {
                reg_blacklist.insert(temp_reg.clone());
            }
            stack.clone()
        }
        (_, stack) => stack.clone(),
    };
    info!("    [terminator] {:?}", analyzed_block.terminator.0 .0);

    // Iterate backward over opcodes.
    for (_i, (opcode, stack)) in analyzed_block.opcodes.iter().enumerate().rev() {
        // eprintln!("{:?}\n-- {:?}", command, reg_blacklist);
        // let stack: StackState = analysis.result()[i].clone();

        let mut skip_entry = false;
        match &opcode.0 {
            // If the register is in a blacklist, drop this command.
            Pax::PushLiteral(_) => {
                let reg = next_stack.data().last().unwrap();
                if reg_blacklist.contains(&*reg) {
                    info!("   [push-literal] Skipping {:?}", reg);
                    skip_entry = true;
                }
            }
            Pax::AltPop => {
                let reg = next_stack.data().last().unwrap();
                if reg_blacklist.contains(&*reg) {
                    info!("        [alt-pop] Skipping {:?}", reg);
                    skip_entry = true;
                } else {
                    if let StackValue::IntValue(_n, literal) = reg {
                        info!("        [alt-pop] Replacing with {:?}", literal);
                        result_opcodes.insert(0, (Pax::PushLiteral(*literal), opcode.1.clone()));
                        reg_blacklist.insert(reg.clone());
                        skip_entry = true;
                    }
                }
            }
            Pax::AltPush => {
                let reg = next_stack.alt().last().unwrap();
                if reg_blacklist.contains(&*reg) {
                    info!("       [alt-push] Skipping {:?}", reg);
                    skip_entry = true;
                    // } else {
                    // result_opcodes.insert(0, opcode.clone());
                }
            }
            Pax::StoreTemp => {
                // Blacklist previous temp value.
                // if let Some(ref temp_reg) = stack.temp() {
                //     reg_blacklist.insert(temp_reg.clone());
                // }

                let reg = next_stack.temp().as_ref().unwrap();
                if reg_blacklist.contains(&*reg) {
                    info!("     [store-temp] Skipping {:?}", reg);
                    skip_entry = true;
                    // } else {
                    //     result_opcodes.insert(0, opcode.clone());
                }
            }
            Pax::LoadTemp => {
                // let next_reg = stack.temp().as_ref().unwrap();
                let reg = next_stack.data().last().unwrap();

                if reg_blacklist.contains(&*reg) {
                    info!("      [load-temp] Skipping {:?}", reg);
                    skip_entry = true;
                } else {
                    if let StackValue::IntValue(_n, literal) = reg {
                        info!("      [load-temp] Replacing with {:?}", literal);
                        result_opcodes.insert(0, (Pax::PushLiteral(*literal), opcode.1.clone()));
                        reg_blacklist.insert(reg.clone());
                        skip_entry = true;
                    }
                }
            }

            // // Blacklist is viral.
            Pax::Add | Pax::Nand => {
                let reg = next_stack.data().last().unwrap();

                // If the computed register is discarded, discard both inputs.
                if reg_blacklist.contains(&*reg) {
                    // TODO want an easy way to specify last_two
                    let input_regs = stack.data().iter().rev().take(2).rev().collect::<Vec<_>>();
                    for reg in input_regs {
                        reg_blacklist.insert(reg.to_owned());
                        // REVIEW need a better detection mechanism
                        if let StackValue::DataParam(_) = reg {
                            result_opcodes.insert(0, (Pax::Drop, opcode.1.clone()));
                        }
                    }
                    skip_entry = true;
                }
            }

            // Drop command can ignore their values entirely.
            Pax::Drop => {
                let reg = stack.data().last().unwrap();
                match reg {
                    StackValue::Value(_) | StackValue::IntValue(_, _) => {
                        info!("           [drop] Skipping {:?}", reg.clone());
                        reg_blacklist.insert(reg.clone());
                        skip_entry = true;
                    }
                    _ => {}
                }
            }

            _ => {}
        }

        // Insert this opcode.
        if !skip_entry {
            result_opcodes.insert(0, opcode.clone());
        }

        // Cache this stack for the next iteration.
        next_stack = stack.clone();
    }
    info!("");

    // Expand aliases.
    // TODO can this happen instantaneously?
    // for alias in &registers.aliases {
    //     if reg_blacklist.contains(&alias.0) {
    //         reg_blacklist.insert(alias.1.clone());
    //     }
    //     if reg_blacklist.contains(&alias.1) {
    //         reg_blacklist.insert(alias.0.clone());
    //     }
    // }

    Block::new(result_opcodes, analyzed_block.terminator.0.clone())
}

// Register index.
type RegIndex = usize;

#[derive(Debug, Clone)]
struct RegState {
    index: RegIndex,
    data: Vec<RegIndex>,
    ret: Vec<RegIndex>,
    temp: RegIndex,
}

impl RegState {
    fn new() -> RegState {
        RegState {
            index: 1,
            data: vec![],
            ret: vec![],
            temp: 0,
        }
    }
}

impl RegState {
    fn size(&self) -> (usize, usize) {
        (self.data.len(), self.ret.len())
    }
}

#[derive(Debug, Clone)]
struct RegInfo {
    data_param: bool,
    alt_param: bool,
    literal: Option<PaxLiteral>,
    phi: HashSet<RegIndex>,
}

pub struct PaxAnalyzerWalker {
    buffer: String,
    reg_state: RegState,
    reg_info: HashMap<RegIndex, RegInfo>,

    entry_cache: HashMap<WalkerLevel, RegState>,
    result_cache: HashMap<WalkerLevel, Vec<RegState>>,
    has_leave: HashSet<WalkerLevel>,
}

impl PaxAnalyzerWalker {
    fn new() -> PaxAnalyzerWalker {
        PaxAnalyzerWalker {
            buffer: String::new(),
            reg_state: RegState::new(),
            reg_info: HashMap::new(),
            entry_cache: HashMap::new(),
            result_cache: HashMap::new(),
            has_leave: HashSet::new(),
        }
    }

    fn push(&mut self, string: &str) {
        self.buffer.push_str(string);
        self.buffer.push_str("\n");
    }

    // Data Stack

    fn new_reg(&mut self) -> RegIndex {
        let pos = self.reg_state.index;
        self.reg_state.index += 1;

        self.reg_info.insert(
            pos,
            RegInfo {
                data_param: false,
                alt_param: false,
                literal: None,
                phi: HashSet::new(),
            },
        );

        pos
    }

    fn data_push(&mut self) -> RegIndex {
        let pos = self.new_reg();
        self.reg_state.data.push(pos);
        pos
    }

    fn data_push_reg(&mut self, reg: RegIndex) -> RegIndex {
        self.reg_state.data.push(reg);
        reg
    }

    fn data_push_literal(&mut self, literal: PaxLiteral) {
        let reg = self.data_push();

        self.reg_info.get_mut(&reg).unwrap().literal = Some(literal);
    }

    fn data_pop(&mut self) -> RegIndex {
        self.reg_state.data.pop().unwrap_or_else(|| self.new_reg())
    }

    fn ret_push(&mut self, reg: RegIndex) -> RegIndex {
        self.reg_state.ret.push(reg);
        reg
    }

    fn ret_pop(&mut self) -> RegIndex {
        self.reg_state.ret.pop().unwrap()
    }

    fn data_push_temp(&mut self) {
        self.reg_state.data.push(self.reg_state.temp);
        self.reg_state.temp = self.new_reg();
    }

    fn data_pop_temp(&mut self) {
        let reg = self.data_pop();
        self.reg_state.temp = reg;
    }

    fn fork(&mut self) {
        let mut data: Vec<RegIndex> = self.reg_state.data.drain(0..).collect();
        data = data.into_iter().map(|_| self.new_reg()).collect();
        self.reg_state.data = data;

        let mut ret: Vec<RegIndex> = self.reg_state.ret.drain(0..).collect();
        ret = ret.into_iter().map(|_| self.new_reg()).collect();
        self.reg_state.ret = ret;

        self.reg_state.temp = self.new_reg();
    }

    fn apply_phi_to_info(&mut self, source: &RegState, apply: &RegState) {
        if source.size() != apply.size() {
            error!(
                "Phi applied to mismatched source: {:?} apply: {:?}",
                source.size(),
                apply.size()
            );
        }
    }
}

type WithRegState<T> = (T, RegState);

#[derive(Debug, Clone)]
pub struct RegStateBlock {
    initial_state: RegState,
    opcodes: WithRegState<Located<Pax>>,
    terminator: WithRegState<Located<PaxTerm>>,
}

/**
 * Implements `opcode()` and `terminator()` for PaxAnalyzerWalker.
 */
impl PaxWalker for PaxAnalyzerWalker {
    fn opcode(&mut self, op: &Located<Pax>, _stack: &[WalkerLevel]) {
        self.push(&format!(";; {:?}", &op.0));
        match &op.0 {
            Pax::PushLiteral(lit) => {
                self.data_push_literal(*lit);
            }
            Pax::Add | Pax::Nand => {
                self.data_pop();
                self.data_pop();
                self.data_push();
            }
            Pax::Drop => {
                self.data_pop();
            }
            Pax::AltPop => {
                let reg = self.ret_pop();
                self.data_push_reg(reg);
            }
            Pax::AltPush => {
                let reg = self.data_pop();
                self.ret_push(reg);
            }
            Pax::StoreTemp => {
                self.data_pop_temp();
            }
            Pax::LoadTemp => {
                self.data_push_temp();
            }
            Pax::Load | Pax::Load8 => {
                self.data_pop();
                self.data_push();
            }
            Pax::Store | Pax::Store8 => {
                self.data_pop();
                self.data_pop();
            }
            Pax::Print | Pax::Emit => {
                self.data_pop();
            }
            Pax::Abort | Pax::Debugger => {
                // ignore
            }
        }
        // eprintln!("------- {:?} ({:?})", op.0, self.reg_state.size());
    }

    fn terminator(
        &mut self,
        terminator: &Located<PaxTerm>,
        current: &WalkerLevel,
        stack: &[WalkerLevel],
    ) {
        match &terminator.0 {
            PaxTerm::Exit => {}
            PaxTerm::Call(ref s) => {
                panic!("cannot handle PaxTerm::Call yet without fn arity {:?}", s);
                // self.push(&format!("    i32.const {}", 0)); // dummy value
                // self.push(&format!("    call $return_push"));
                // self.push(&format!("    call $fn_{}", name_slug(s)));
                // self.push(&format!("    call $return_pop"));
                // self.push(&format!("    call $drop"));
            }

            /* branches */
            PaxTerm::JumpIf0(_) => {
                // Enter if branch.
                self.data_pop();

                // Save entry state.
                self.entry_cache
                    .insert(current.to_owned(), self.reg_state.clone());

                // Also save as first result state.
                self.result_cache
                    .entry(current.to_owned())
                    .or_insert(vec![])
                    .push(self.reg_state.clone());

                // Load entry state.
                self.reg_state = self.entry_cache[current].clone();
            }
            PaxTerm::JumpElse(_) => {
                // Enter else branch.

                // Remove entry state since we have an else block.
                self.result_cache.get_mut(&current).unwrap().remove(0);

                if self.has_leave.contains(&current) {
                    // skip if with "leave" in it
                    // but remove this has_leave
                    self.has_leave.remove(&current);
                    self.result_cache.get_mut(&current).unwrap().pop();
                } else {
                    // Save "if" block result state.
                    self.result_cache
                        .get_mut(&current)
                        .unwrap()
                        .push(self.reg_state.clone());
                }

                // Load entry state.
                self.reg_state = self.entry_cache[current].clone();
            }
            PaxTerm::JumpTarget(_) => {
                // End of an "if" or "else" block

                if self.has_leave.contains(&current) {
                    // Remove last branch from result_cache.
                    self.result_cache.get_mut(&current).unwrap().pop();
                } else {
                    // Save "else" block result state.
                    let results_reg = self.result_cache.get_mut(&current).unwrap();
                    results_reg.push(self.reg_state.clone());
                }

                // Grab reference to result_cache.
                let results_reg = self.result_cache.get_mut(&current).unwrap();
                // eprintln!("[leave] {:?} vs {:?}", self.has_leave, current);
                // eprintln!("here are results1 {:?}", results_reg);
                // eprintln!("here are results2 {:?}", self.reg_state);

                // Calculate next RegState.
                if results_reg.is_empty() {
                    // Phi as result of an "if" with "leave" so the only
                    // result is the entry result.
                    self.reg_state = self.entry_cache[current].clone();
                } else {
                    // Phi will be equal in size to state of if...else...then.
                    self.fork();
                }

                // Apply branches as phi..
                let forked_state = self.reg_state.clone();
                let results = self.result_cache[current].clone();
                warn!(
                    "Applying jump result as phi... ({:?}, {})",
                    terminator.0, terminator.1
                );
                for apply in &results {
                    self.apply_phi_to_info(&forked_state, apply);
                }

                // TODO merge output state
                // eprintln!(
                //     "JumpTarget: {:?}",
                //     self.result_cache[current]
                //         .iter()
                //         .map(|x| x.size())
                //         .collect::<Vec<_>>()
                // );
            }

            /* loops */
            PaxTerm::LoopTarget(_) => {
                // Enter loop.

                // Save entry state.
                let previous_state = self.reg_state.clone();

                // Start loop with a clean state.
                self.fork();
                self.entry_cache
                    .insert(current.to_owned(), self.reg_state.clone());

                // Apply state entering loop as a phi state.
                warn!(
                    "Applying loop pre-entry as phi... ({:?}, {})",
                    terminator.0, terminator.1
                );
                self.apply_phi_to_info(&self.reg_state.clone(), &previous_state);
            }
            PaxTerm::LoopLeave(_) => {
                // Leave loop.

                // Save result state.
                self.result_cache
                    .entry(current.to_owned())
                    .or_insert(vec![])
                    .push(self.reg_state.clone());

                // Add to hashset.
                self.has_leave.insert(stack.last().unwrap().to_owned());
            }
            PaxTerm::LoopIf0(_) => {
                // Exit loop.
                self.data_pop();

                // Save result state.
                let result_state = self.reg_state.clone();
                self.result_cache
                    .entry(current.to_owned())
                    .or_insert(vec![])
                    .push(result_state.clone());

                // Apply state exiting loop as a phi state.
                let entry_state = self.entry_cache[current].clone();
                warn!(
                    "Applying loop entry as phi... ({:?}, {})",
                    terminator.0, terminator.1
                );
                self.apply_phi_to_info(&entry_state, &result_state);

                // Exit loop with a clean state.
                // eprintln!(
                //     "LoopIf0: {:?}",
                //     self.result_cache[current]
                //         .iter()
                //         .map(|x| x.size())
                //         .collect::<Vec<_>>()
                // );
                self.fork();

                // Apply states exiting loop as a phi state.
                let source = &self.reg_state.clone();
                warn!(
                    "Applying loop exit as phi... ({:?}, {})",
                    terminator.0, terminator.1
                );
                for apply in &self.result_cache[current].clone() {
                    self.apply_phi_to_info(source, apply);
                }
            }
        }
        // eprintln!("------> {:?} ({:?})", terminator.0, self.reg_state.size());
    }
}

/**
 * SECRET ACTUAL OPTIMIZER FUNCTION
 */
pub fn propagate_registers(program: &PaxProgram, name: &str) -> Vec<Block> {
    let blocks = program.get(name).unwrap();

    let mut walker = PaxAnalyzerWalker::new();
    structured_walk(&mut walker, blocks);

    // eprintln!("reg_info: {:?}", walker.reg_info);

    blocks.to_owned()
}

/// Analyse stack values and produce a register mapping for values as they
/// move through the function. Then propagate registers.
pub fn propagate_registers_2(program: &PaxProgram, name: &str) -> Vec<Block> {
    // blocks: &[Block], graph: &BlockGraph
    let mut facts = ProgramFacts::new(&program);
    let analysis = facts.function_analyze(name);

    let graph = &analysis.0;
    let blocks = program.get(name).unwrap();

    // Propagate dependencies backward in reverse topological order.
    let mut blocks = blocks.to_owned();
    let mut reg_blacklist = IndexSet::new();
    info!("[analyze_graph] propagate dependencies backward.");
    for block_index in graph.target_sequence().keys().rev() {
        let block = &mut blocks[*block_index];
        let analyzed_block = analysis
            .1
            .get(block_index)
            .expect("Expected analysis for block index {}");

        // Perform dead register elimination and update block.
        *block = propagate_literals_in_block(
            analyzed_block,
            // analysis.registers.clone(),
            &mut reg_blacklist,
        );
    }

    blocks
}
