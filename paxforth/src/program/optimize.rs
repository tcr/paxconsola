use crate::program::analyze::*;
use crate::*;
use log::*;
use std::collections::HashMap;

fn get_reg_discard_map(walker: &PaxAnalyzerWalker) -> HashMap<RegIndex, bool> {
    walker
        .reg_info_map
        .iter()
        .map(|(k, v)| {
            (
                *k,
                // TODO remove these restrictions
                !matches!(v.origin, RegOrigin::Phi(..))
                    && !matches!(v.origin, RegOrigin::Fork(..))
                    && v.discard,
            )
        })
        .collect()
}

/**
 * Simple rewriter function.
 */
fn remove_dropped_regs(walker: &PaxAnalyzerWalker) -> Vec<Block> {
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
                Pax::AltPush | Pax::Drop | Pax::StoreTemp => {
                    let reg: RegIndex = *before_state.data.iter().last().unwrap();
                    if reg_is_droppable[&reg] {
                        // info!("   [{:?}] Skipping {:?}", opcode.0, reg);
                        skip_entry = true;
                    }
                }
                Pax::PushLiteral(_) | Pax::AltPop | Pax::LoadTemp | Pax::Add | Pax::Nand => {
                    let reg: RegIndex = *after_state.data.iter().last().unwrap();
                    if reg_is_droppable[&reg] {
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

fn reg_base_literal(walker: &PaxAnalyzerWalker, mut reg: RegIndex) -> Option<PaxLiteral> {
    loop {
        match walker.get_reg_info(&reg).origin {
            RegOrigin::PushLiteral(lit) => return Some(lit),
            RegOrigin::Copy(reg_parent) => {
                // Loop and continue
                reg = reg_parent;
            }
            _ => {
                return None;
            }
        }
    }
}

fn get_reg_literal_map(walker: &PaxAnalyzerWalker) -> HashMap<RegIndex, PaxLiteral> {
    walker
        .reg_info_map
        .iter()
        .filter_map(|(k, v)| {
            if let Some(lit) = reg_base_literal(walker, *k) {
                Some((*k, lit))
            } else {
                None
            }
        })
        .collect()
}

fn propagate_literals_forward(walker: &PaxAnalyzerWalker) -> Vec<Block> {
    // List all droppable vectors.
    let reg_literal = get_reg_literal_map(walker);

    let mut out_blocks = vec![];
    for (_i, block) in walker.blocks.iter().enumerate() {
        // let mut before_state = block.initial_state.clone();
        let mut out_opcodes = vec![];
        for analyzed_opcode in &block.opcodes {
            // info!("    {:<30}", format!("{:?}", command.0 .0),);
            // info!("     ↳ {:<30}", format!("{:?}", command.1));

            let mut skip_entry = false;
            let opcode = &analyzed_opcode.0;
            let after_state = &analyzed_opcode.1;
            match &opcode.0 {
                Pax::LoadTemp => {
                    let reg: RegIndex = *after_state.data.iter().last().unwrap();
                    if let Some(literal) = reg_literal.get(&reg) {
                        info!("   [{:?}] PushLiteral {:?}", opcode.0, reg);
                        out_opcodes.push((Pax::PushLiteral(*literal), opcode.1.clone()));
                        // reg_is_droppable.insert(reg);
                        skip_entry = true;
                    }
                }
                Pax::AltPop => {
                    let reg: RegIndex = *after_state.data.iter().last().unwrap();
                    if let Some(literal) = reg_literal.get(&reg) {
                        info!("   [{:?}] PushLiteral {:?}", opcode.0, reg);
                        out_opcodes.push((Pax::AltPop, opcode.1.clone()));
                        out_opcodes.push((Pax::Drop, opcode.1.clone()));
                        out_opcodes.push((Pax::PushLiteral(*literal), opcode.1.clone()));
                        // reg_is_droppable.insert(reg);
                        skip_entry = true;
                    }
                }
                _ => {}
            }

            if !skip_entry {
                out_opcodes.push(opcode.clone());
            }

            // Update before_state.
            // before_state = after_state.clone();
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

/**
 * Analysis function.
 */
pub fn propagate_registers(program: &PaxProgram, name: &str) -> Vec<Block> {
    // Analyze the function.
    let blocks = program.get(name).unwrap().clone();
    let insr_count_before = instruction_count(&blocks);

    let blocks = {
        let walker = function_analyze(&blocks);

        // Dump results.
        dump_reg_state_blocks(&walker.blocks);
        dump_reg_info(&walker.reg_info_map);

        propagate_literals_forward(&walker)
    };

    let blocks = {
        let walker = function_analyze(&blocks);

        remove_dropped_regs(&walker)
    };

    let insr_count_after = instruction_count(&blocks);
    warn!(
        "Instruction count before: {} after: {}",
        insr_count_before, insr_count_after
    );

    // Dump results.
    // dump_reg_state_blocks(&walker.blocks);
    // dump_reg_info(&walker.reg_info_map);

    blocks
}
