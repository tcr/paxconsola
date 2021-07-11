use crate::*;

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
            let target = match block.terminator() {
                (PaxTerm::Call(target), ..) => target,
                _ => continue,
            };

            // Flag that this pass succeeded.
            continue_pass = true;

            // We want to inline this function. First grab our offsets.
            let mut inlined_blocks = program.get(target).unwrap().clone();
            assert!(!inlined_blocks.is_empty());
            // dump_blocks(&inlined_blocks);

            // Inline code length (trim off start and end block).
            let inlined_blocks_len = if inlined_blocks.len() >= 2 {
                inlined_blocks.len() - 2
            } else {
                0
            };

            // Rewrite the sequence we're inlining.
            for (_i, inline_block) in inlined_blocks.iter_mut().enumerate() {
                match inline_block.terminator_mut() {
                    (PaxTerm::BranchTarget(ref mut target), ..)
                    | (PaxTerm::LoopIf0(ref mut target), ..)
                    | (PaxTerm::LoopTarget(ref mut target), ..)
                    | (PaxTerm::LoopLeave(ref mut target), ..)
                    | (PaxTerm::JumpIf0(ref mut target), ..)
                    | (PaxTerm::JumpElse(ref mut target), ..)
                    | (PaxTerm::JumpTarget(ref mut target), ..) => {
                        *target += j - 1;
                    }
                    _ => {}
                }
            }

            // Refetch a mutable version of this method.
            let main_mut = program.get_mut(method).unwrap();
            // Now rewrite all targets inside this block.
            for (_i, main_block) in main_mut.iter_mut().enumerate() {
                match main_block.terminator_mut() {
                    (PaxTerm::BranchTarget(ref mut target), ..)
                    | (PaxTerm::LoopIf0(ref mut target), ..)
                    | (PaxTerm::LoopTarget(ref mut target), ..)
                    | (PaxTerm::LoopLeave(ref mut target), ..)
                    | (PaxTerm::JumpIf0(ref mut target), ..)
                    | (PaxTerm::JumpElse(ref mut target), ..)
                    | (PaxTerm::JumpTarget(ref mut target), ..) => {
                        if *target >= j {
                            *target += inlined_blocks_len;
                        }
                    }
                    _ => {}
                }
            }

            let inline_pos = Pos {
                filename: "<inline>".to_string(),
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
                    .opcodes()
                    .to_owned()
                    .into_iter()
                    // .skip(1)
                    .chain(return_stack_exit.into_iter());
                // Generate enter block.
                let enter_commands = block
                    .opcodes()
                    .to_owned()
                    .into_iter()
                    .chain(return_stack_enter.into_iter())
                    .chain(function_commands);

                // eprintln!("-----> {:?}", enter_commands.clone().collect::<Vec<_>>());

                // Combine current block, fn block, and next block.
                let mut next_block = main_mut.remove(j);
                next_block.opcodes_mut().splice(0..0, enter_commands);

                // Combine current block.
                main_mut[j - 1] = next_block;

                // Rewrite all targets after this.
                for (_i, main_block) in main_mut.iter_mut().enumerate().skip(j) {
                    match main_block.terminator_mut() {
                        (PaxTerm::BranchTarget(ref mut target), ..)
                        | (PaxTerm::LoopIf0(ref mut target), ..)
                        | (PaxTerm::LoopTarget(ref mut target), ..)
                        | (PaxTerm::LoopLeave(ref mut target), ..)
                        | (PaxTerm::JumpIf0(ref mut target), ..)
                        | (PaxTerm::JumpElse(ref mut target), ..)
                        | (PaxTerm::JumpTarget(ref mut target), ..) => {
                            if *target >= j {
                                *target -= 1;
                            }
                        }
                        _ => {}
                    }
                }

                // Now rewrite all targets before this.
                for (_i, main_block) in main_mut.iter_mut().enumerate().take(j) {
                    match main_block.terminator_mut() {
                        (PaxTerm::BranchTarget(ref mut target), ..)
                        | (PaxTerm::LoopIf0(ref mut target), ..)
                        | (PaxTerm::LoopTarget(ref mut target), ..)
                        | (PaxTerm::LoopLeave(ref mut target), ..)
                        | (PaxTerm::JumpIf0(ref mut target), ..)
                        | (PaxTerm::JumpElse(ref mut target), ..)
                        | (PaxTerm::JumpTarget(ref mut target), ..) => {
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
                    .opcodes()
                    .to_owned()
                    .into_iter()
                    .chain(return_stack_enter.into_iter());
                enter_block.opcodes_mut().splice(0..0, enter_commands);
                // Generate exit block.
                let exit_commands = inlined_blocks[inlined_blocks.len() - 1]
                    .opcodes()
                    .to_owned()
                    .into_iter()
                    .chain(return_stack_exit.into_iter());
                let mut exit_block = main_mut[j].clone();
                exit_block.opcodes_mut().splice(0..0, exit_commands);
                // Remove first + last blocks from our inline sequence.
                let inline_seq = inlined_blocks[1..inlined_blocks.len() - 1].to_owned();

                // Combine current block.
                main_mut[j - 1] = enter_block;
                // Combine next block.
                main_mut[j] = exit_block;
                // Splice in new chunk.
                main_mut.splice(j..j, inline_seq.clone());
            }

            // Restart inlining into this function.
            continue 'pass_loop;
        }
    }
}
