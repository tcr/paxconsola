use crate::analyze::*;
use indexmap::IndexSet;

/// Reduces branching in a function by removing unused BranchTargets.
/// This function will also rewrite target offsets.
pub fn reduce_branches(program: &mut PaxProgram, method: &str) {
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
