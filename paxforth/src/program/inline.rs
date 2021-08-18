use crate::*;
use std::collections::HashSet;

pub fn inline_into_function(program: &mut PaxProgram, method: &str, skip_method: &HashSet<String>) {
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
            let target = match block.terminator() {
                (PaxTerm::Call(target), ..) => target,
                _ => continue,
            };

            if skip_method.contains(target) {
                continue;
            }

            // Flag that this pass succeeded.
            continue_pass = true;

            // We want to inline this function. First grab our offsets.
            let mut inlined_blocks = program.get(target).unwrap().clone();
            assert!(!inlined_blocks.is_empty());

            // Rewrite the sequence we're inlining.
            for (_i, inline_block) in inlined_blocks.iter_mut().enumerate() {
                match inline_block.terminator_mut() {
                    (PaxTerm::LoopIf0(ref mut target), ..)
                    | (PaxTerm::LoopTarget(ref mut target), ..)
                    | (PaxTerm::LoopLeave(ref mut target), ..)
                    | (PaxTerm::JumpIf0(ref mut target), ..)
                    | (PaxTerm::JumpElse(ref mut target), ..)
                    | (PaxTerm::JumpTarget(ref mut target), ..) => {
                        *target += j;
                    }
                    _ => {}
                }
            }

            // Refetch a mutable version of this method.
            let main_mut = program.get_mut(method).unwrap();
            // Now rewrite all targets that are after the inlined block.
            for (_i, main_block) in main_mut.iter_mut().enumerate() {
                match main_block.terminator_mut() {
                    (PaxTerm::LoopIf0(ref mut target), ..)
                    | (PaxTerm::LoopTarget(ref mut target), ..)
                    | (PaxTerm::LoopLeave(ref mut target), ..)
                    | (PaxTerm::JumpIf0(ref mut target), ..)
                    | (PaxTerm::JumpElse(ref mut target), ..)
                    | (PaxTerm::JumpTarget(ref mut target), ..) => {
                        if *target >= j {
                            *target += inlined_blocks.len();
                        }
                    }
                    _ => {}
                }
            }

            // Generate enter block.
            let call_label = if let (PaxTerm::Call(label), _) = main_mut[j - 1].terminator() {
                label.clone()
            } else {
                unreachable!();
            };
            if let (ref mut term @ PaxTerm::Call(_), _) = main_mut[j - 1].terminator_mut() {
                *term = PaxTerm::InlineCall(call_label);
            } else {
                unreachable!();
            }
            // Generate exit block.
            if let (ref mut term @ PaxTerm::Exit, _) =
                inlined_blocks.last_mut().unwrap().terminator_mut()
            {
                *term = PaxTerm::InlineExit;
            } else {
                unreachable!();
            }

            // Splice in new chunk.
            main_mut.splice(j..j, inlined_blocks.clone());

            // Restart inlining into this function.
            continue 'pass_loop;
        }
    }
}
