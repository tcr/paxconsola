use crate::program::walker::*;
use crate::*;
use log::*;
use maplit::{btreemap, hashset};
use std::collections::{BTreeMap, HashMap, HashSet};

/**
 * The state of all registers before or after an opcode.
 */

// Register index.
pub type RegIndex = usize;

#[derive(Debug, Clone)]
pub struct RegState {
    pub data: Vec<RegIndex>,
    pub ret: Vec<RegIndex>,
    pub temp: RegIndex,
}

impl RegState {
    fn new() -> RegState {
        RegState {
            data: vec![],
            ret: vec![],
            temp: 0,
        }
    }

    pub fn replace_reg(&mut self, reg_from: RegIndex, reg_to: RegIndex) {
        self.data.iter_mut().for_each(|x| {
            if *x == reg_from {
                *x = reg_to;
            }
        });
        self.ret.iter_mut().for_each(|x| {
            if *x == reg_from {
                *x = reg_to;
            }
        });
        if self.temp == reg_from {
            self.temp = reg_to;
        }
    }
}

impl RegState {
    fn size(&self) -> (usize, usize) {
        (self.data.len(), self.ret.len())
    }
}

/**
 * Information about an individual register.
 */

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum RegOrigin {
    Unknown,
    DataParam,
    RetParam,
    Consumes(HashSet<RegIndex>),
    Copy(RegIndex),
    Fork(RegIndex),
    Phi(HashSet<RegIndex>),
    PushLiteral(PaxLiteral),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum RegFate {
    Unknown,
    Dropped,
    Consumed,
    Copied(HashSet<RegIndex>),
    Forked(HashSet<RegIndex>),
    JoinedPhi,
}

#[derive(Debug, Clone)]
pub struct RegInfo {
    pub origin: RegOrigin,
    pub fate: RegFate,
}

pub type RegInfoMap = BTreeMap<RegIndex, RegInfo>;

impl RegInfo {
    fn new() -> RegInfo {
        RegInfo {
            origin: RegOrigin::Unknown,
            fate: RegFate::Unknown,
        }
    }

    fn new_dropped() -> RegInfo {
        RegInfo {
            origin: RegOrigin::Unknown,
            fate: RegFate::Dropped,
        }
    }

    fn with_origin(origin: RegOrigin) -> RegInfo {
        RegInfo {
            origin,
            fate: RegFate::Unknown,
        }
    }
}

pub struct PaxAnalyzerWalker {
    reg_state: RegState,
    pub reg_info_map: RegInfoMap,

    entry_cache: HashMap<WalkerLevel, RegState>,
    result_cache: HashMap<WalkerLevel, Vec<RegState>>,
    has_leave: HashSet<WalkerLevel>,

    block_initial_state: Option<RegState>,
    block_opcodes: Vec<WithRegState<Located<Pax>>>,
    pub blocks: Vec<RegStateBlock>,
}

impl PaxAnalyzerWalker {
    fn new() -> PaxAnalyzerWalker {
        PaxAnalyzerWalker {
            reg_state: RegState::new(),
            reg_info_map: btreemap![0 => {
                let mut reg_info = RegInfo::new_dropped();
                reg_info.origin = RegOrigin::PushLiteral(0);
                reg_info
            }], // temp register at "0"
            entry_cache: HashMap::new(),
            result_cache: HashMap::new(),
            has_leave: HashSet::new(),

            block_initial_state: None,
            block_opcodes: vec![],
            blocks: vec![],
        }
    }

    // Reg info map

    pub fn get_reg_info(&self, key: &RegIndex) -> &RegInfo {
        self.reg_info_map.get(key).unwrap()
    }

    pub fn get_reg_info_mut(&mut self, key: &RegIndex) -> &mut RegInfo {
        self.reg_info_map.get_mut(key).unwrap()
    }

    // Data Stack

    fn new_reg(&mut self) -> RegIndex {
        let mut pos = *self.reg_info_map.keys().next_back().unwrap() as RegIndex;
        pos += 1;
        self.reg_info_map.insert(pos, RegInfo::new());

        pos
    }

    fn new_reg_with_origin(&mut self, origin: RegOrigin) -> RegIndex {
        let mut pos = *self.reg_info_map.keys().next_back().unwrap() as RegIndex;
        pos += 1;
        self.reg_info_map.insert(pos, RegInfo::with_origin(origin));

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

        self.get_reg_info_mut(&reg).origin = RegOrigin::PushLiteral(literal);
    }

    fn data_pop(&mut self) -> RegIndex {
        self.reg_state.data.pop().unwrap_or_else(|| self.new_reg())
    }

    fn data_consume(&mut self) -> RegIndex {
        let reg = self.reg_state.data.pop().unwrap_or_else(|| self.new_reg());

        // TODO
        // assert_eq!(self.reg_info.get_mut(&reg).unwrap().fate, RegFate::Unknown);
        self.get_reg_info_mut(&reg).fate = RegFate::Consumed;
        reg
    }

    fn data_drop(&mut self) {
        let reg = self.reg_state.data.pop().unwrap_or_else(|| self.new_reg());
        self.get_reg_info_mut(&reg).fate = RegFate::Dropped;
    }

    fn ret_push(&mut self, reg: RegIndex) -> RegIndex {
        self.reg_state.ret.push(reg);
        reg
    }

    fn ret_pop(&mut self) -> RegIndex {
        self.reg_state.ret.pop().unwrap()
    }

    fn load_temp(&mut self) {
        // Copy the temp register and push it onto data stack.
        let new_temp = self.new_reg();
        let temp_reg = self.reg_state.temp;
        self.get_reg_info_mut(&new_temp).origin = RegOrigin::Copy(self.reg_state.temp);
        if let RegFate::Copied(copied) = &mut self.get_reg_info_mut(&temp_reg).fate {
            copied.insert(new_temp);
        } else {
            unreachable!();
        }

        // Push temp copy to the data stack.
        self.reg_state.data.push(new_temp);
    }

    fn store_temp(&mut self) {
        let reg = self.data_pop();
        self.reg_state.temp = reg;

        // Assume dropped until it's loaded.
        let temp_reg = self.reg_state.temp;
        self.get_reg_info_mut(&temp_reg).fate = RegFate::Copied(hashset! {});
    }

    /**
     * Clone the existing reg state with all new registers. Ignore temp.
     */
    fn split_fork(&mut self) {
        let data: Vec<RegIndex> = self.reg_state.data.drain(0..).collect();
        self.reg_state.data = data
            .into_iter()
            .map(|x| {
                let new_reg = self.new_reg_with_origin(RegOrigin::Fork(x));
                if let RegFate::Forked(forked) = &mut self.get_reg_info_mut(&x).fate {
                    forked.insert(new_reg);
                } else {
                    self.get_reg_info_mut(&x).fate = RegFate::Forked(hashset! { new_reg });
                }
                new_reg
            })
            .collect();

        let ret: Vec<RegIndex> = self.reg_state.ret.drain(0..).collect();
        self.reg_state.ret = ret
            .into_iter()
            .map(|x| {
                let new_reg = self.new_reg_with_origin(RegOrigin::Fork(x));
                if let RegFate::Forked(forked) = &mut self.get_reg_info_mut(&x).fate {
                    forked.insert(new_reg);
                } else {
                    self.get_reg_info_mut(&x).fate = RegFate::Forked(hashset! { new_reg });
                }
                new_reg
            })
            .collect();
    }

    /**
     * Clone the existing reg state with all new registers. Ignore temp.
     */
    fn split_phi(&mut self) {
        let data: Vec<RegIndex> = self.reg_state.data.drain(0..).collect();
        self.reg_state.data = data
            .into_iter()
            .map(|x| {
                self.get_reg_info_mut(&x).fate = RegFate::JoinedPhi;
                self.new_reg_with_origin(RegOrigin::Phi(hashset! {}))
            })
            .collect();

        let ret: Vec<RegIndex> = self.reg_state.ret.drain(0..).collect();
        self.reg_state.ret = ret
            .into_iter()
            .map(|x| {
                self.get_reg_info_mut(&x).fate = RegFate::JoinedPhi;
                self.new_reg_with_origin(RegOrigin::Phi(hashset! {}))
            })
            .collect();
    }

    fn apply_phi_to_info(&mut self, source: &RegState, apply: &RegState, loc: &Pos) {
        if source.size() != apply.size() {
            error!(
                "Phi applied to mismatched source: {:?} apply: {:?}",
                source.size(),
                apply.size()
            );
            error!("   ^-> location: {}", loc);
        }

        // Populate phi.
        for (source_reg, apply_reg) in itertools::concat(vec![
            itertools::zip(&source.data, &apply.data).collect::<Vec<_>>(),
            itertools::zip(&source.ret, &apply.ret).collect::<Vec<_>>(),
        ]) {
            self.get_reg_info_mut(&apply_reg).fate = RegFate::JoinedPhi;
            if source_reg != apply_reg {
                if let RegOrigin::Phi(ref mut phi) = self.get_reg_info_mut(source_reg).origin {
                    phi.insert(*apply_reg);
                } else {
                    unreachable!();
                }
            }
        }
    }
}

pub type WithRegState<T> = (T, RegState);

#[derive(Debug, Clone)]
pub struct RegStateBlock {
    pub initial_state: RegState,
    pub opcodes: Vec<WithRegState<Located<Pax>>>,
    pub terminator: WithRegState<Located<PaxTerm>>,
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
            Pax::TempStore => {
                self.store_temp();
            }
            Pax::TempLoad => {
                self.load_temp();
            }

            Pax::Add | Pax::Nand => {
                let a = self.data_consume();
                let b = self.data_consume();
                let new_reg = self.data_push();
                self.get_reg_info_mut(&new_reg).origin = RegOrigin::Consumes(hashset! {a, b});
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

            /* branches */
            PaxTerm::JumpIf0(_) => {
                // Enter if branch.
                let reg = self.data_pop();

                // Mark register as consumed.
                self.get_reg_info_mut(&reg).fate = RegFate::Consumed;

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
                self.split_fork();
            }
            PaxTerm::JumpElse(_) => {
                // Enter else branch.

                // Remove entry state since we have an else block.
                self.result_cache.get_mut(&current).unwrap().remove(0);

                if self.has_leave.contains(&current) {
                    // skip "if" result if it contained "leave".
                    self.result_cache.get_mut(&current).unwrap().pop();

                    // but remove this entry from "has_leave" so we can detect the "else" clause too
                    self.has_leave.remove(&current);
                } else {
                    // Save "if" block result state.
                    self.result_cache
                        .get_mut(&current)
                        .unwrap()
                        .push(self.reg_state.clone());
                }

                // Load entry state.
                self.reg_state = self.entry_cache[current].clone();
                self.split_fork();
            }
            PaxTerm::JumpTarget(_) => {
                // End of an "if" or "else" block

                if self.has_leave.contains(&current) {
                    // Remove last branch from result_cache.
                    self.result_cache.get_mut(&current).unwrap().pop();
                } else {
                    // Save "if" or "else" block result state.
                    let results_reg = self.result_cache.get_mut(&current).unwrap();
                    results_reg.push(self.reg_state.clone());
                }

                // Calculate next RegState.
                let results_reg = self.result_cache[current].clone();
                if results_reg.is_empty() {
                    // "if" with "leave" creates no divergence, so we can re-use the entry state.
                    self.reg_state = self.entry_cache[current].clone();
                } else {
                    // Add a phi node to handle results of if...else...then.
                    self.split_phi();

                    // Apply branches as phi..
                    let exit_state = self.reg_state.clone();
                    info!(
                        "Applying jump result as phi... ({:?}, {})",
                        terminator.0, terminator.1
                    );
                    info!(" ↳ {:?}", exit_state);
                    for apply in &results_reg {
                        info!("   ↳ {:?}", apply);
                        self.apply_phi_to_info(&exit_state, apply, &terminator.1);
                    }
                }
            }

            /* loops */
            PaxTerm::LoopTarget(_) => {
                // Enter loop.

                // Save entry state.
                let previous_state = self.reg_state.clone();

                // Start loop with a clean state.
                self.split_phi();
                self.entry_cache
                    .insert(current.to_owned(), self.reg_state.clone());

                // Apply state entering loop as a phi state.
                info!(
                    "Applying loop pre-entry as phi... ({:?}, {})",
                    terminator.0, terminator.1
                );
                self.apply_phi_to_info(&self.reg_state.clone(), &previous_state, &terminator.1);
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
                let reg = self.data_pop();

                // Mark register as consumed.
                self.get_reg_info_mut(&reg).fate = RegFate::Consumed;

                // Save result state.
                let result_state = self.reg_state.clone();
                self.result_cache
                    .entry(current.to_owned())
                    .or_insert(vec![])
                    .push(result_state.clone());

                // When we loop around, we must add the current state to the entry phi node.
                let entry_state = self.entry_cache[current].clone();
                info!(
                    "Applying loop entry as phi... ({:?}, {})",
                    terminator.0, terminator.1
                );
                self.apply_phi_to_info(&entry_state, &result_state, &terminator.1);

                // If loop has any "leave" statement, we also inject a phi node after the loop.
                if self.result_cache[current].len() > 1 {
                    self.split_phi();

                    // Apply states exiting loop as a phi state.
                    let source = &self.reg_state.clone();
                    info!(
                        "Applying loop exit as phi... ({:?}, {})",
                        terminator.0, terminator.1
                    );
                    for apply in &self.result_cache[current].clone() {
                        self.apply_phi_to_info(source, apply, &terminator.1);
                    }
                }
            }

            // Function calls
            PaxTerm::Call(ref s) => {
                if s == "*" || s == "-" {
                    let a = self.data_consume();
                    let b = self.data_consume();
                    let new_reg = self.data_push();
                    self.get_reg_info_mut(&new_reg).origin = RegOrigin::Consumes(hashset! {a, b});
                } else {
                    // TODO reform this call method
                    panic!("cannot handle PaxTerm::Call yet without fn arity {:?}", s);
                }
            }
            PaxTerm::ExternCall(ref _s) => {
                unimplemented!();
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

/**
 * Dump the vector of RegStateBlock for an analyzed function.
 */

pub fn dump_reg_state_blocks(blocks: &[RegStateBlock]) {
    info!("[reg_state blocks]");
    for (i, block) in blocks.iter().enumerate() {
        info!("Block({})", i);
        info!("     ↳ {:?}", block.initial_state);
        for command in &block.opcodes {
            info!("    {:<30}", format!("{:?}", command.0 .0),);
            info!("     ↳ {:<30}", format!("{:?}", command.1));
            info!("       {}", command.0 .1);
        }
        {
            let terminator = &block.terminator;
            info!("  * {:<30}", format!("{:?}", terminator.0 .0),);
            info!("     ↳ {:<30}", format!("{:?}", terminator.1));
            info!("       {}", terminator.0 .1);
        }
    }
    info!("");
}

pub fn dump_reg_info(reg_info: &BTreeMap<RegIndex, RegInfo>) {
    info!("[register info]");
    for (key, reg) in reg_info {
        info!(
            "   {:<6} origin: {:<26} fate: {:?}",
            format!("[{}]", key),
            format!("{:?}", reg.origin),
            reg.fate
        );
    }
    info!("");
}

pub fn function_analyze(blocks: &[Block]) -> PaxAnalyzerWalker {
    // Perform walk of the function, then drop last "temp" value.
    let mut walker = PaxAnalyzerWalker::new();
    structured_walk(&mut walker, blocks);
    walker
}

/*
pub fn simplify_phi(walker: &mut PaxAnalyzerWalker) -> {
    // Walk reg_info, identify all entries that can be folded in via phi.
    let optimize_single_phi_groups = false;
    if optimize_single_phi_groups {
        info!("[simplify reg info]");
        'outer_loop: loop {
            let cached_reg_info = walker.reg_info.clone();
            for (key, reg) in &cached_reg_info {
                if reg.phi.len() == 1 {
                    info!(
                        "Simplify phi {:?} folding into {:?}",
                        key,
                        reg.phi.iter().next().unwrap(),
                    );

                    // Rewrite original register in all blocks as the destination block.
                    let reg_from = *key;
                    let reg_to = *reg.phi.iter().next().unwrap();
                    // eprintln!("purging {:?} replacing with {:?}", reg_from, reg_to);
                    for block in &mut walker.blocks {
                        block.initial_state.replace_reg(reg_from, reg_to);
                        for (_, opcode) in &mut block.opcodes {
                            opcode.replace_reg(reg_from, reg_to);
                        }
                        block.terminator.1.replace_reg(reg_from, reg_to);
                    }

                    // Remove entry from reg_info.
                    let last_reg_info = walker.reg_info.remove(&reg_from).unwrap();

                    // TODO is correct or should this happen inline
                    // so there's no need for a dedicated group?
                    // walker.reg_info.get_mut(&reg_to).unwrap().fate = last_reg_info.fate;

                    // Remove from all phi entries.
                    for (target_reg, reg_info) in &mut walker.reg_info {
                        if reg_info.phi.contains(&reg_from) {
                            reg_info.phi.remove(&reg_from);
                            if *target_reg != reg_to {
                                reg_info.phi.insert(reg_to);
                            }
                        }
                    }

                    // Restart loop.
                    continue 'outer_loop;
                }
            }
            break;
        }
    }
}
*/
