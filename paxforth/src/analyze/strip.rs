use crate::*;
use indexmap::IndexSet;

/// Reduces branching in a function by removing unused BranchTargets.
/// This function will also rewrite target offsets.
pub fn strip_branches(program: &mut PaxProgram, method: &str) {
    eprintln!("[strip.rs] removing unused BranchTargets...");
    if let Some(blocks) = program.get_mut(method) {
        let readonly_blocks = blocks.clone();

        let mut used_blocks = IndexSet::new();
        for block in readonly_blocks {
            match block.terminator() {
                (Pax::JumpAlways(target), ..) | (Pax::JumpIf0(target), ..) => {
                    used_blocks.insert(*target);
                }
                _ => {}
            }
        }

        let mut i = 0;
        while i < blocks.len() {
            match blocks[i].terminator() {
                (Pax::BranchTarget(target), ..) => {
                    if !used_blocks.contains(target) {
                        let block = blocks.remove(i);
                        let commands = block.opcodes().to_owned().into_iter();

                        blocks
                            .get_mut(i)
                            .unwrap()
                            .opcodes_mut()
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

/// Removes unused functions.
pub fn strip_functions(program: &mut PaxProgram) {
    let program_readonly = program.clone();
    let (deps, idx) = program_analyze(&program_readonly);

    // Trim all functions unaccessible from "main".
    let main = idx.get("main").unwrap().clone();
    for (name, value) in idx {
        if !petgraph::algo::has_path_connecting(&deps, main, value, None) {
            program.shift_remove(&name);
        }
    }
}

// Strip all unused data from a program.
pub fn strip(program: &mut PaxProgram) {
    strip_functions(program);
    // TODO strip_branches also
}
