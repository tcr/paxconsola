use crate::program::analyze::*;
use crate::*;
use maplit::hashset;
use std::collections::{HashSet, VecDeque};

fn reg_base(walker: &PaxAnalyzerWalker, mut reg: RegIndex) -> Option<RegIndex> {
    loop {
        match walker.get_reg_info(&reg).origin {
            RegOrigin::PushLiteral(..) => return Some(reg),
            RegOrigin::Copy(reg_parent) => {
                // Loop and continue
                reg = reg_parent;
            }
            RegOrigin::Fork(reg_parent) => {
                // Loop and continue
                reg = reg_parent;
            }
            _ => {
                return None;
            }
        }
    }
}

fn get_reg_discard_map(walker: &PaxAnalyzerWalker) -> HashSet<RegIndex> {
    let mut discard_set: HashSet<RegIndex> = hashset! {};
    let mut discardable_set: HashSet<RegIndex> = hashset! {};

    let mut forked_set: HashSet<RegIndex> = hashset! {};
    let mut copy_set: HashSet<RegIndex> = hashset! {};

    let mut queue: VecDeque<RegIndex> = VecDeque::new();
    queue.extend(
        walker
            .reg_info_map
            .iter()
            .filter(|(_, v)| v.fate == RegFate::Dropped || v.fate == RegFate::Copied(hashset! {}))
            .map(|(k, _)| k),
    );

    while !queue.is_empty() {
        while let Some(reg) = queue.pop_front() {
            // Don't need to repeat a discarded register.
            if discard_set.contains(&reg) {
                continue;
            }

            // Recurse through parent registers to drop them also.
            let mut regs_to_drop = vec![reg];
            while let Some(reg) = regs_to_drop.pop() {
                // Some conditions to not propagate drop.
                if let &RegOrigin::Phi(ref phi_regs) = &walker.get_reg_info(&reg).origin {
                    if phi_regs.iter().all(|reg| reg_base(walker, *reg).is_some()) {
                        // error!("PHI regs {:?}", phi_regs);
                        regs_to_drop.extend(phi_regs);
                    } else {
                        continue;
                    }
                }
                if let &RegOrigin::Fork(forked_from) = &walker.get_reg_info(&reg).origin {
                    discardable_set.insert(reg);
                    forked_set.insert(forked_from);
                    continue;
                }
                if let &RegOrigin::Copy(copied_from) = &walker.get_reg_info(&reg).origin {
                    copy_set.insert(copied_from);
                    // We can discard this copy register immediately.
                }

                discard_set.insert(reg);

                if let &RegOrigin::Consumes(ref parents) = &walker.get_reg_info(&reg).origin {
                    regs_to_drop.extend(parents.clone());
                }
            }
        }

        // Iterate possible forks.
        for forked_reg in forked_set.drain() {
            if let &RegFate::Forked(ref children) = &walker.get_reg_info(&forked_reg).fate {
                if discardable_set.is_superset(children) {
                    discard_set.extend(children);
                    queue.push_back(forked_reg);
                }
            } else {
                unreachable!();
            }
        }

        // Iterate copies.
        for copy_reg in copy_set.drain() {
            if let &RegFate::Copied(ref children) = &walker.get_reg_info(&copy_reg).fate {
                if discard_set.is_superset(children) {
                    // discard_map.extend(children);
                    queue.push_back(copy_reg);
                }
            } else {
                unreachable!();
            }
        }
    }

    discard_set
}

/**
 * Eliminate dead register access.
 */
pub fn eliminate(walker: &PaxAnalyzerWalker) -> Vec<Block> {
    // List all droppable vectors.
    let reg_is_droppable = get_reg_discard_map(walker);

    let mut out_blocks = vec![];
    for (_i, block) in walker.blocks.iter().enumerate() {
        let mut before_state = block.initial_state.clone();
        let mut out_opcodes = vec![];
        for analyzed_opcode in &block.opcodes {
            // info!("    {:<30}", format!("{:?}", command.0 .0),);
            // info!("     ↳ {:<30}", format!("{:?}", command.1));

            let mut skip_entry = false;
            let opcode = &analyzed_opcode.0;
            let after_state = &analyzed_opcode.1;
            match &opcode.0 {
                Pax::AltPush | Pax::Drop | Pax::TempStore => {
                    let reg: RegIndex = *before_state.data.iter().last().unwrap();
                    if reg_is_droppable.contains(&reg) {
                        // info!("   [{:?}] Skipping {:?}", opcode.0, reg);
                        skip_entry = true;
                    }
                }
                Pax::PushLiteral(_) | Pax::AltPop | Pax::TempLoad | Pax::Add | Pax::Nand => {
                    let reg: RegIndex = *after_state.data.iter().last().unwrap();
                    if reg_is_droppable.contains(&reg) {
                        // info!("   [{:?}] Skipping {:?}", opcode.0, reg);
                        skip_entry = true;
                    }
                }
                _ => {}
            }

            if !skip_entry {
                out_opcodes.push(opcode.clone());
            }

            // Update before_state.
            before_state = after_state.clone();
        }
        let out_terminator = {
            // let terminator = &block.terminator;
            // info!("  * {:<30}", format!("{:?}", terminator.0 .0),);
            // info!("     ↳ {:<30}", format!("{:?}", terminator.1));

            // Update before_state.
            // before_state = block.terminator.1.clone();

            block.terminator.0.clone()
        };
        out_blocks.push(Block::new(out_opcodes, out_terminator));
    }
    out_blocks
}
