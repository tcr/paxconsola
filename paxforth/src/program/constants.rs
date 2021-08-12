use crate::program::analyze::*;
use crate::*;
use log::*;
use std::collections::HashMap;

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
        .keys()
        .filter_map(|k| {
            if let Some(lit) = reg_base_literal(walker, *k) {
                Some((*k, lit))
            } else {
                None
            }
        })
        .collect()
}

pub fn propagate(walker: &PaxAnalyzerWalker) -> Vec<Block> {
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
                Pax::TempLoad => {
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
