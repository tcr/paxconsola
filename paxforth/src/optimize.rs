#![allow(dead_code)]

use crate::analyze::*;
use crate::*;
use indexmap::IndexSet;
use petgraph::graph::Graph;

/// Given a block and analysis, propagate the literal values loaded in this function
/// if detected and then blacklist their containing registers. Iterates backward.
fn propagate_literals_in_block(
    block: &Block,
    analysis: &BlockAnalysis,
    registers: RegFile,
    reg_blacklist: &mut IndexSet<Reg>,
) -> PaxSpan {
    let mut new_commands = block
        .commands()
        .iter()
        .enumerate()
        .rev()
        .map(|(i, input_command)| -> PaxSpan {
            let command = (input_command.0).clone();
            // eprintln!("{:?}\n-- {:?}", command, reg_blacklist);
            let stack: StackState = analysis.result()[i].clone();

            // The stack ahead of us, e.g. what the current command computed.
            let next_stack: Option<StackState> = analysis.result().get(i + 1).map(|x| x.clone());

            match &command {
                // If the register is in a blacklist, drop this command.
                Pax::AltPop | Pax::PushLiteral(_) => {
                    let reg = next_stack.as_ref().unwrap().data.last().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        // REVIEW need a better detection mechanism
                        // if reg.starts_with("D") || reg.starts_with("R") {
                        //     return vec![(Pax::Drop, input_command.1.clone())];
                        // }
                        return vec![];
                    }
                }
                Pax::AltPush => {
                    let reg = next_stack.as_ref().unwrap().ret.last().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        // REVIEW need a better detection mechanism
                        // if reg.starts_with("D") || reg.starts_with("R") {
                        //     // return vec![(Pax::Drop, input_command.1.clone())];
                        //     todo!();
                        // }
                        return vec![];
                    }
                }
                Pax::Exit => {
                    // Blacklist previous temp value.
                    if let Some(ref temp_reg) = stack.temp {
                        reg_blacklist.insert(temp_reg.clone());
                    }
                }
                Pax::StoreTemp => {
                    // Blacklist previous temp value.
                    if let Some(ref temp_reg) = stack.temp {
                        reg_blacklist.insert(temp_reg.clone());
                    }

                    let reg = next_stack.as_ref().unwrap().temp.as_ref().unwrap();
                    if reg_blacklist.contains(&*reg) {
                        // if stack.data.last().unwrap().starts_with("D") {
                        //     // eprintln!(
                        //     //     "\n\nwow okay that's slow: {:?}\n\n",
                        //     //     stack.data.last().unwrap()
                        //     // );
                        //     return vec![(Pax::Drop, input_command.1.clone())];
                        // }
                        return vec![];
                    }
                }

                Pax::LoadTemp => {
                    let next_reg = next_stack.as_ref().unwrap().temp.as_ref().unwrap();
                    let reg = next_stack.as_ref().unwrap().data.last().unwrap();

                    // If we are used to load a temp value, de-blacklist this register.
                    if !reg_blacklist.contains(&*next_reg) {
                        reg_blacklist.remove(reg);
                    }
                    // Else if this register is in a blacklist, drop this command.
                    if reg_blacklist.contains(&*reg) {
                        return vec![];
                    }
                }

                // Blacklist is viral.
                Pax::Add | Pax::Nand => {
                    let reg = next_stack.as_ref().unwrap().data.last().unwrap();

                    // If the computed register is discarded, discard both inputs.
                    if reg_blacklist.contains(&*reg) {
                        // TODO want an easy way to specify last_two
                        let input_regs = stack.data.iter().rev().take(2).rev().collect::<Vec<_>>();
                        let mut ret = vec![];
                        for reg in input_regs {
                            reg_blacklist.insert(reg.to_owned());
                            // REVIEW need a better detection mechanism
                            if reg.starts_with("D") {
                                ret.push((Pax::Drop, input_command.1.clone()));
                            }
                        }
                        return ret;
                    }
                }

                // Drop command can ignore their values entirely.
                Pax::Drop => {
                    let reg = stack.data.last().unwrap();
                    if !reg.starts_with("D") && !reg.starts_with("R") {
                        // FIXME is this the wrong thing
                        reg_blacklist.insert(reg.clone());
                        return vec![];
                    }
                }
                _ => {}
            }

            // When a TOS register load is a literal, replace with
            // a direct literal load and blacklist the register.
            let target_reg = match &command {
                Pax::AltPop => next_stack.as_ref().and_then(|s| s.data.last()),
                Pax::LoadTemp => stack.temp.as_ref(),
                _ => None,
            };
            if let Some(target_reg) = target_reg {
                if let Some(RegMeta {
                    literal: Some(lit), ..
                }) = registers.registers.get(target_reg)
                {
                    // eprintln!("      ^-> {:?} <= {:?}", target_reg, lit);
                    reg_blacklist.insert(target_reg.clone());
                    return vec![(Pax::PushLiteral(*lit), input_command.1.clone())];
                }
            }

            vec![(command, input_command.1.clone())]
        })
        .flatten()
        .collect::<Vec<_>>();

    new_commands.reverse();

    // Expand aliases.
    // TODO can this happen instantaneously?
    for alias in &registers.aliases {
        if reg_blacklist.contains(&alias.0) {
            reg_blacklist.insert(alias.1.clone());
        }
        if reg_blacklist.contains(&alias.1) {
            reg_blacklist.insert(alias.0.clone());
        }
    }

    // Peephole optimizations.
    // let mut splices = vec![];
    // new_commands
    //     .windows(2)
    //     .enumerate()
    //     .for_each(|(i, window)| match window {
    //         [(Pax::AltPush, _), (Pax::AltPop, _)] => {
    //             splices.push(i);
    //         }
    //         _ => {}
    //     });
    // let mut splice_delta = 0;
    // for mut splice in splices {
    //     splice -= splice_delta;
    //     new_commands.splice(splice..splice + 2, vec![]);
    //     splice_delta += 2;
    // }

    new_commands
}

/// Analyse stack values and produce a register mapping for values as they
/// move through the function. Then propagate registers.
fn propagate_registers(blocks: &[Block], graph: &Graph<(), i32>) -> Vec<Block> {
    let analysis = analyze_blocks(blocks, graph);

    eprintln!(
        "[analyze_graph] program: {} commands (original)",
        blocks.iter().map(|x| x.commands().len()).sum::<usize>()
    );
    for (block_index, _block) in blocks.iter().enumerate() {
        eprintln!("  block[{}]", block_index);

        for command in blocks[block_index].commands() {
            eprintln!("    {:?}", command.0);
        }
    }
    eprintln!();

    // Propagate dependencies backward in reverse topological order.
    let mut blocks = blocks.to_owned();
    let mut reg_blacklist = IndexSet::new();
    eprintln!("[analyze_graph] propagate dependencies backward.");
    for i in analysis.blocks.keys().into_iter().rev() {
        let block = &mut blocks[*i];
        if let Some(block_analysis) = analysis.blocks.get(i) {
            // Perform dead register elimination and update block.
            let new_commands = propagate_literals_in_block(
                &block,
                block_analysis,
                analysis.registers.clone(),
                &mut reg_blacklist,
            );
            *block.commands_mut() = new_commands;

            eprintln!("  block[{}]:", i);
            eprintln!("    blacklist: {:?}", reg_blacklist);
        } else {
            // TODO ?
        }
    }
    eprintln!();

    eprintln!(
        "[analyze_graph] {} commands (after optimization)",
        blocks.iter().map(|x| x.commands().len()).sum::<usize>()
    );
    for (block_index, _block) in blocks.iter().enumerate() {
        eprintln!("  block[{}]", block_index);

        for command in blocks[block_index].commands() {
            eprintln!("    {:?}", command.0);
        }
    }
    eprintln!();

    blocks
}

/// Reduces branching in a function by removing unused BranchTargets.
/// This function will also rewrite target offsets.
pub fn reduce_branches(program: &mut PaxProgram, method: &str) {
    return;
    eprintln!("[reducing_branches] removing unused BranchTargets...");
    if let Some(blocks) = program.get_mut(method) {
        let readonly_blocks = blocks.clone();

        let mut used_blocks = IndexSet::new();
        for block in readonly_blocks {
            match block.commands().last() {
                Some((Pax::JumpAlways(target), ..)) | Some((Pax::JumpIf0(target), ..)) => {
                    used_blocks.insert(*target);
                }
                _ => {}
            }
        }

        let mut i = 0;
        while i < blocks.len() {
            match blocks[i].commands().last() {
                Some((Pax::BranchTarget(target), ..)) => {
                    if !used_blocks.contains(target) {
                        let block = blocks.remove(i);
                        let commands = block.commands().clone().into_iter().rev().skip(1).rev();

                        blocks
                            .get_mut(i)
                            .unwrap()
                            .commands_mut()
                            .splice(0..0, commands);
                        i = 0;
                        continue;
                    }
                }
                _ => {}
            }

            i += 1;
        }
    }
}

/// Helper method to otpimize a single function by propagating registers.
pub fn optimize_function(program: &mut PaxProgram, method: &str) {
    let start_arity = function_arity(program, method);
    eprintln!("[optimize_function] arity: {:?}", start_arity,);
    if let Some(blocks) = program.get_mut(method) {
        let graph = dataflow_graph(&blocks);

        // NOTE this also performs rewriting for some reason
        *blocks = propagate_registers(&blocks, &graph);
    }
    reduce_branches(program, method);

    if let Some(blocks) = program.get_mut(method) {
        dump_blocks(blocks);
    }
    let end_arity = function_arity(program, method);
    eprintln!("[optimize_function] arity: {:?}", end_arity,);
    assert_eq!(start_arity, end_arity, "arity changed during optimization");
}

pub fn inline_into_function(program: &mut PaxProgram, method: &str) {
    let mut continue_pass = true;
    'pass_loop: while continue_pass {
        continue_pass = false;

        let main = program.get(method).unwrap().clone();
        // dump_blocks(&main);

        let mut i = 0;
        let mut j = 0;
        while let Some(block) = main.get(i) {
            i += 1;
            j += 1;

            // Determine what the next block target is going to be.
            match block.commands().last() {
                Some((Pax::Call(target), ..)) => {
                    // eprintln!("call to {:?}", target);
                    // eprintln!();

                    // Flag that this pass succeeded.
                    continue_pass = true;

                    // We want to inline this function. First grab our offsets.
                    let mut inlined_blocks = program.get(target).unwrap().clone();
                    assert!(!inlined_blocks.is_empty());
                    // dump_blocks(&inlined_blocks);

                    // Inline code length (trim off start and end block).
                    let inlined_blocks_len = if inlined_blocks.len() > 1 {
                        inlined_blocks.len() - 2
                    } else {
                        0
                    };

                    // Rewrite the sequence we're inlining.
                    for (_i, inline_block) in inlined_blocks.iter_mut().enumerate() {
                        match inline_block.commands_mut().last_mut() {
                            Some((Pax::BranchTarget(ref mut target), ..))
                            | Some((Pax::JumpIf0(ref mut target), ..))
                            | Some((Pax::JumpAlways(ref mut target), ..)) => {
                                *target += j - 1;
                            }
                            _ => {}
                        }
                    }

                    // Refetch a mutable version of this method.
                    let main_mut = program.get_mut(method).unwrap();
                    // Now rewrite all targets inside this block.
                    for (_i, main_block) in main_mut.iter_mut().enumerate() {
                        match main_block.commands_mut().last_mut() {
                            Some((Pax::BranchTarget(ref mut target), ..))
                            | Some((Pax::JumpIf0(ref mut target), ..))
                            | Some((Pax::JumpAlways(ref mut target), ..)) => {
                                if *target >= j {
                                    *target += inlined_blocks_len;
                                }
                            }
                            _ => {}
                        }
                    }

                    let first_pos = inlined_blocks[0].commands()[0].1.clone();
                    let last_pos = inlined_blocks
                        .iter()
                        .last()
                        .unwrap()
                        .commands()
                        .iter()
                        .last()
                        .unwrap()
                        .1
                        .clone();
                    let inline_pos = Pos {
                        filename: format!("<inline>"),
                        function: method.to_string(),
                        col: 0,
                        line: 0,
                    };

                    let return_stack_enter = vec![
                        (Pax::PushLiteral(0xFFFF), inline_pos.clone()),
                        (Pax::AltPush, inline_pos.clone()),
                    ];
                    let return_stack_exit = vec![
                        (Pax::AltPop, inline_pos.clone()),
                        (Pax::Drop, inline_pos.clone()),
                    ];

                    if inlined_blocks.len() == 1 {
                        // Rest of next block
                        let function_commands = inlined_blocks[0]
                            .commands()
                            .to_owned()
                            .into_iter()
                            .skip(1)
                            .rev()
                            .skip(1)
                            .rev()
                            .chain(return_stack_exit.into_iter());
                        // Generate enter block.
                        let enter_commands = block
                            .commands()
                            .to_owned()
                            .into_iter()
                            .rev()
                            .skip(1)
                            .rev()
                            .chain(return_stack_enter.into_iter())
                            .chain(function_commands);

                        eprintln!("-----> {:?}", enter_commands.clone().collect::<Vec<_>>());

                        // Combine current block, fn block, and next block.
                        let mut next_block = main_mut.remove(j);
                        next_block.commands_mut().splice(0..0, enter_commands);

                        // Combine current block.
                        main_mut[j - 1] = next_block;

                        // Rewrite all targets after this.
                        for (_i, main_block) in main_mut.iter_mut().enumerate().skip(j) {
                            match main_block.commands_mut().last_mut() {
                                Some((Pax::BranchTarget(ref mut target), ..))
                                | Some((Pax::JumpIf0(ref mut target), ..))
                                | Some((Pax::JumpAlways(ref mut target), ..)) => {
                                    if *target >= j {
                                        *target -= 1;
                                    }
                                }
                                _ => {}
                            }
                        }

                        // Now rewrite all targets before this.
                        for (_i, main_block) in main_mut.iter_mut().enumerate().take(j) {
                            match main_block.commands_mut().last_mut() {
                                Some((Pax::BranchTarget(ref mut target), ..))
                                | Some((Pax::JumpIf0(ref mut target), ..))
                                | Some((Pax::JumpAlways(ref mut target), ..)) => {
                                    if *target >= j {
                                        *target -= 1;
                                    }
                                }
                                _ => {}
                            }
                        }
                    } else {
                        // Generate enter block.
                        let mut enter_block = inlined_blocks[0].clone();
                        let enter_commands = block
                            .commands()
                            .to_owned()
                            .into_iter()
                            .rev()
                            .skip(1)
                            .rev()
                            .chain(return_stack_enter.into_iter());
                        enter_block.commands_mut().splice(0..1, enter_commands);
                        // Generate exit block.
                        let exit_commands = inlined_blocks[inlined_blocks.len() - 1]
                            .commands()
                            .to_owned()
                            .into_iter()
                            .rev()
                            .skip(1)
                            .rev()
                            .chain(return_stack_exit.into_iter());
                        let mut exit_block = main_mut[j].clone();
                        exit_block.commands_mut().splice(0..0, exit_commands);
                        // Remove first + last blocks from our inline sequence.
                        let inline_seq = inlined_blocks[1..inlined_blocks.len() - 1].to_owned();

                        // Combine current block.
                        main_mut[j - 1] = enter_block;
                        // Combine next block.
                        main_mut[j] = exit_block;
                        // Splice in new chunk.
                        main_mut.splice(j..j, inline_seq.clone());

                        // Now rewrite all targets before this.
                        // for (_i, main_block) in main_mut.iter_mut().enumerate().take(j) {
                        //     match main_block.commands_mut().last_mut() {
                        //         Some((Pax::BranchTarget(ref mut target), ..))
                        //         | Some((Pax::JumpIf0(ref mut target), ..))
                        //         | Some((Pax::JumpAlways(ref mut target), ..)) => {
                        //             if *target >= j {
                        //                 *target += inline_seq.len();
                        //             }
                        //         }
                        //         _ => {}
                        //     }
                        // }
                    }

                    // Arbitrarily stop after this, though we could keep going,
                    // instead just perform another pass
                    // let j = inlined_blocks_len + 1;
                    continue 'pass_loop;
                }
                _ => {}
            }
        }
    }

    dump_blocks(program.get(method).unwrap());
}

pub fn dump_blocks(blocks: &[Block]) {
    eprintln!("program:");
    for (i, block) in blocks.iter().enumerate() {
        eprintln!("  block[{}] with {} entries:", i, block.commands().len());
        for command in block.commands() {
            eprintln!("    {:30} {}", format!("{:?}", command.0), command.1);
        }
    }
    eprintln!();
    eprintln!();
}

pub fn optimize_forth(mut program: PaxProgram) {
    inline_into_function(&mut program, "2dup");

    if let Some(blocks) = program.get_mut("2dup") {
        dump_blocks(&blocks);

        // println!("{:?}", graph);
        // println!();
        // for reg in &*registers {
        //   println!("reg {:?}: {:?}", reg.0, reg.1.literal);
        // }
        // println!();
        // println!();
        // println!();

        let graph = dataflow_graph(&blocks);
        propagate_registers(&blocks, &graph);
    }

    // Inlining.
}
