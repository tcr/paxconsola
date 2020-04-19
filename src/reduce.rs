#![allow(dead_code)]

use crate::*;
use indexmap::IndexSet;

/// Reduces branching in a function by removing unused BranchTargets.
/// This function will also rewrite target offsets.
pub fn reduce_branches(program: &mut SuperPaxProgram, method: &str) {
    eprintln!("[reducing_branches] removing unused BranchTargets...");
    if let Some(blocks) = program.get_mut(method) {
        let readonly_blocks = blocks.clone();

        // Identify which BranchTargets are used.
        let mut used_blocks = IndexSet::new();
        let mut all_blocks = IndexSet::new();
        for block in readonly_blocks {
            match block.commands().last() {
                Some((SuperPax::JumpAlways(target), ..))
                | Some((SuperPax::JumpIf0(target), ..)) => {
                    used_blocks.insert(*target);
                }
                Some((SuperPax::BranchTarget(target), ..)) => {
                    all_blocks.insert(*target);
                }
                _ => {}
            }
        }
        let dead_blocks = all_blocks
            .difference(&used_blocks)
            .cloned()
            .collect::<IndexSet<usize>>();

        // Rewrite jumps.
        for (i, block) in blocks.iter_mut().enumerate() {
            match block.commands_mut().last_mut() {
                Some((SuperPax::JumpAlways(ref mut target), ..))
                | Some((SuperPax::JumpIf0(ref mut target), ..)) => {
                    if *target > i {
                        // Jumping forward.
                        let delta = dead_blocks.iter().filter(|x: &&usize| *x < target).count();
                        *target -= delta;
                    } else {
                        // Jumping backward.
                        let delta = dead_blocks.iter().filter(|x: &&usize| *x < target).count();
                        *target -= delta;
                    }
                }
                _ => {}
            }
        }

        // Remove unused BranchTarget blocks.
        let mut i = 0;
        while i < blocks.len() {
            match blocks[i].commands().last() {
                Some((SuperPax::BranchTarget(target), ..)) => {
                    if dead_blocks.contains(target) {
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
