use crate::analyze::walker::*;
use crate::*;
use log::*;
use maplit::btreemap;
use std::collections::{BTreeMap, HashMap, HashSet};

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
    dropped: bool,
    consumed: bool,
}

impl RegInfo {
    fn new() -> RegInfo {
        RegInfo {
            data_param: false,
            alt_param: false,
            literal: None,
            phi: HashSet::new(),
            dropped: false,
            consumed: false,
        }
    }
}

pub struct PaxAnalyzerWalker {
    reg_state: RegState,
    reg_info: BTreeMap<RegIndex, RegInfo>,

    entry_cache: HashMap<WalkerLevel, RegState>,
    result_cache: HashMap<WalkerLevel, Vec<RegState>>,
    has_leave: HashSet<WalkerLevel>,

    block_initial_state: Option<RegState>,
    block_opcodes: Vec<WithRegState<Located<Pax>>>,
    blocks: Vec<RegStateBlock>,
}

impl PaxAnalyzerWalker {
    fn new() -> PaxAnalyzerWalker {
        PaxAnalyzerWalker {
            reg_state: RegState::new(),
            reg_info: btreemap![0 => RegInfo::new()], // temp register at "0"
            entry_cache: HashMap::new(),
            result_cache: HashMap::new(),
            has_leave: HashSet::new(),

            block_initial_state: None,
            block_opcodes: vec![],
            blocks: vec![],
        }
    }

    // Data Stack

    fn new_reg(&mut self) -> RegIndex {
        let pos = self.reg_state.index;
        self.reg_state.index += 1;

        self.reg_info.insert(pos, RegInfo::new());

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

    fn data_consume(&mut self) {
        let reg = self.reg_state.data.pop().unwrap_or_else(|| self.new_reg());

        self.reg_info.get_mut(&reg).unwrap().consumed = true;
    }

    fn data_drop(&mut self) {
        let reg = self.reg_state.data.pop().unwrap_or_else(|| self.new_reg());

        self.reg_info.get_mut(&reg).unwrap().dropped = true;
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

        // Populate phi.
        for (source_reg, apply_reg) in itertools::zip(&source.data, &apply.data) {
            self.reg_info
                .get_mut(source_reg)
                .unwrap()
                .phi
                .insert(*apply_reg);
        }
        for (source_reg, apply_reg) in itertools::zip(&source.ret, &apply.ret) {
            self.reg_info
                .get_mut(source_reg)
                .unwrap()
                .phi
                .insert(*apply_reg);
        }
        self.reg_info
            .get_mut(&self.reg_state.temp)
            .unwrap()
            .phi
            .insert(apply.temp);
    }
}

type WithRegState<T> = (T, RegState);

#[derive(Debug, Clone)]
pub struct RegStateBlock {
    initial_state: RegState,
    opcodes: Vec<WithRegState<Located<Pax>>>,
    terminator: WithRegState<Located<PaxTerm>>,
}

/**
 * Implements `opcode()` and `terminator()` for PaxAnalyzerWalker.
 */
impl PaxWalker for PaxAnalyzerWalker {
    fn opcode(&mut self, op: &Located<Pax>, _stack: &[WalkerLevel]) {
        if self.block_initial_state.is_none() {
            self.block_initial_state = Some(self.reg_state.clone());
        }

        match &op.0 {
            Pax::PushLiteral(lit) => {
                self.data_push_literal(*lit);
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

            Pax::Add | Pax::Nand => {
                self.data_consume();
                self.data_consume();
                self.data_push();
            }
            Pax::Drop => {
                self.data_drop();
            }
            Pax::Load | Pax::Load8 => {
                self.data_consume();
                self.data_push();
            }
            Pax::Store | Pax::Store8 => {
                self.data_consume();
                self.data_consume();
            }
            Pax::Print | Pax::Emit => {
                self.data_consume();
            }
            Pax::Abort | Pax::Debugger => {
                // ignore
            }
        }

        // eprintln!("------- {:?} ({:?})", op.0, self.reg_state.size());
        // Record this entry.
        self.block_opcodes
            .push((op.clone(), self.reg_state.clone()));
    }

    fn terminator(
        &mut self,
        terminator: &Located<PaxTerm>,
        current: &WalkerLevel,
        stack: &[WalkerLevel],
    ) {
        if self.block_initial_state.is_none() {
            self.block_initial_state = Some(self.reg_state.clone());
        }

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
                info!(
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
                info!(
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
                info!(
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
                info!(
                    "Applying loop exit as phi... ({:?}, {})",
                    terminator.0, terminator.1
                );
                for apply in &self.result_cache[current].clone() {
                    self.apply_phi_to_info(source, apply);
                }
            }
        }

        // eprintln!("------> {:?} ({:?})", terminator.0, self.reg_state.size());
        // Record this block.
        let initial_state = self.block_initial_state.take().unwrap();
        let opcodes = self.block_opcodes.drain(0..).collect::<Vec<_>>();
        self.blocks.push(RegStateBlock {
            initial_state,
            opcodes,
            terminator: (terminator.clone(), self.reg_state.clone()),
        });
    }
}

pub fn dump_reg_state_blocks(blocks: &[RegStateBlock]) {
    info!("[reg_state blocks]");
    for (i, block) in blocks.iter().enumerate() {
        info!("Block({})", i);
        info!("     ↳ {:?}", block.initial_state);
        for command in &block.opcodes {
            info!("    {:<30}", format!("{:?}", command.0 .0),);
            info!("     ↳ {:<30}", format!("{:?}", command.1));
        }
        {
            let terminator = &block.terminator;
            info!("  * {:<30}", format!("{:?}", terminator.0 .0),);
            info!("     ↳ {:<30}", format!("{:?}", terminator.1));
        }
    }
    info!("");
}

/**
 * SECRET ACTUAL OPTIMIZER FUNCTION
 */
pub fn propagate_registers(program: &PaxProgram, name: &str) -> Vec<Block> {
    let blocks = program.get(name).unwrap();

    let mut walker = PaxAnalyzerWalker::new();
    structured_walk(&mut walker, blocks);

    dump_reg_state_blocks(&walker.blocks);

    info!("[register info]");
    for (key, reg) in &walker.reg_info {
        info!("  {:>4} = {:?}", key, reg);
    }

    // eprintln!("reg_info: {:?}", walker.reg_info);

    blocks.to_owned()
}
