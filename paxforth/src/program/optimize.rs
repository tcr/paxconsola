use crate::program::analyze::*;
use crate::*;
use log::*;

/**
 * Simple rewriter function.
 */

fn remove_dropped_regs(walker: &PaxAnalyzerWalker) -> Vec<Block> {
    let mut out_blocks = vec![];
    for (i, block) in walker.blocks.iter().enumerate() {
        let mut state = block.initial_state.clone();
        let mut out_opcodes = vec![];
        for opcode in &block.opcodes {
            // info!("    {:<30}", format!("{:?}", command.0 .0),);
            // info!("     ↳ {:<30}", format!("{:?}", command.1));

            let mut skip_entry = false;
            match &opcode.0 .0 {
                Pax::PushLiteral(_) | Pax::AltPop | Pax::LoadTemp => {
                    let reg: RegIndex = *opcode.1.data.iter().last().unwrap();
                    if walker.reg_info[&reg].phi.is_empty()
                        && walker.reg_info[&reg].fate == RegFate::Dropped
                    {
                        info!("   [push-literal|alt-pop|load-temp] Skipping {:?}", reg);
                        skip_entry = true;
                    }
                }
                Pax::AltPush => {
                    let reg: RegIndex = *state.data.iter().last().unwrap();
                    if walker.reg_info[&reg].phi.is_empty()
                        && walker.reg_info[&reg].fate == RegFate::Dropped
                    {
                        info!("   [alt-push] Skipping {:?}", reg);
                        skip_entry = true;
                    }
                }
                // TODO replace with drop?
                Pax::StoreTemp => {
                    let reg: RegIndex = *state.data.iter().last().unwrap();
                    if walker.reg_info[&reg].phi.is_empty()
                        && walker.reg_info[&reg].fate == RegFate::Dropped
                    {
                        info!("     [store-temp] Skipping {:?}", reg);
                        skip_entry = true;
                        // out_opcodes.push((Pax::Drop, opcode.0 .1.clone()));
                    }
                }
                Pax::Add | Pax::Nand => {
                    let reg: RegIndex = *opcode.1.data.iter().last().unwrap();
                    // eprintln!("dropping {:?}", reg);
                    if walker.reg_info[&reg].phi.is_empty()
                        && walker.reg_info[&reg].fate == RegFate::Dropped
                    {
                        info!("   [add|nand] Skipping {:?}", reg);
                        skip_entry = true;
                    }
                }
                // Drop command can ignore their values entirely.
                Pax::Drop => {
                    let reg: RegIndex = *state.data.iter().last().unwrap();
                    // eprintln!("dropping {:?}", reg);
                    if walker.reg_info[&reg].phi.is_empty()
                        && walker.reg_info[&reg].fate == RegFate::Dropped
                    {
                        info!("   [drop] Skipping {:?}", reg);
                        skip_entry = true;
                    }
                }
                _ => {}
            }

            state = opcode.1.clone();
            if !skip_entry {
                out_opcodes.push(opcode.0.clone());
            }
        }
        let out_terminator = {
            // let terminator = &block.terminator;
            // info!("  * {:<30}", format!("{:?}", terminator.0 .0),);
            // info!("     ↳ {:<30}", format!("{:?}", terminator.1));

            state = block.terminator.1.clone();
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
    let mut walker = function_analyze(program, name);

    // Walk reg_info, identify all entries that can be folded in via phi.
    let optimize_single_phi_groups = true;
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
                    walker.reg_info.remove(&reg_from);
                    // Remove from all phi entries.
                    for (target_reg, reg_info) in &mut walker.reg_info {
                        if reg_info.phi.contains(&reg_from) {
                            reg_info.phi.remove(&reg_from);
                            if *target_reg != reg_to {
                                reg_info.phi.insert(reg_to);
                            }
                        }
                    }
                    // walker.reg_info.get_mut(key).unwrap().phi.remove(&reg_to);

                    // Restart loop.
                    continue 'outer_loop;
                }
            }
            break;
        }
    }

    // Dump results.
    dump_reg_state_blocks(&walker.blocks);
    dump_reg_info(&walker.reg_info);

    // Drop them all.
    remove_dropped_regs(&walker)

    // // Return original blocks.
    // blocks.to_owned()
}
