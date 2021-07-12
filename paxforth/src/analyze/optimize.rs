use crate::analyze::*;
use crate::*;
use indexmap::IndexSet;
use log::*;

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

/// Analyse stack values and produce a register mapping for values as they
/// move through the function. Then propagate registers.
pub fn propagate_registers(program: &PaxProgram, name: &str) -> Vec<Block> {
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
