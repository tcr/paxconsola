use crate::*;

#[derive(Clone, Debug, Hash, PartialEq, Eq)]
pub enum WalkerLevel {
    Root,
    Loop(usize),
    Block(usize),
}

impl WalkerLevel {
    pub fn to_root(&self) -> () {
        if let WalkerLevel::Root = self {
            ()
        } else {
            panic!("WalkerLevel::to_root() called on non-root")
        }
    }

    pub fn to_loop(&self) -> usize {
        if let WalkerLevel::Loop(x) = self {
            *x
        } else {
            panic!("WalkerLevel::to_loop() called on non-loop")
        }
    }

    pub fn to_block(&self) -> usize {
        if let WalkerLevel::Block(x) = self {
            *x
        } else {
            panic!("WalkerLevel::to_block() called on non-block")
        }
    }
}

pub fn structured_walk<W: PaxWalker>(walker: &mut W, blocks: &[Block]) {
    // Iterate over blocks in function.
    let mut block_stack = vec![WalkerLevel::Root];
    let mut block_index = 0;

    // Iteate over blocks.
    for block in blocks.iter() {
        // Iterate over opcodes.
        for op in block.opcodes() {
            walker.opcode(op)
        }

        // Iterate the terminator opcode.
        let terminator = block.terminator();
        match &terminator.0 {
            PaxTerm::Exit => {
                let block = block_stack.last().unwrap();

                // Assert root.
                block.to_root();
                walker.terminator(&terminator, block);
            }
            PaxTerm::Call(_) => {
                let block = block_stack.last().unwrap();

                // Don't assert any block level.
                walker.terminator(&terminator, block);
            }

            /* branches */
            PaxTerm::JumpIf0(_target_index) => {
                // Insert new block.
                block_index += 1;
                block_stack.push(WalkerLevel::Block(block_index));
                let block = block_stack.last().unwrap();

                // Assert block.
                block.to_block();
                walker.terminator(&terminator, block);
            }
            PaxTerm::JumpElse(_) => {
                let block = block_stack.last().unwrap();

                // Assert block.
                block.to_block();
                walker.terminator(&terminator, block);
            }
            PaxTerm::JumpTarget(_) => {
                let block = block_stack.pop().unwrap();

                // Assert block.
                block.to_block();
                walker.terminator(&terminator, &block);
            }

            /* loops */
            PaxTerm::LoopTarget(_) => {
                // Insert new loop.
                block_index += 1;
                block_stack.push(WalkerLevel::Loop(block_index));
                let block = block_stack.last().unwrap();

                // Assert loop.
                block.to_loop();
                walker.terminator(&terminator, block);
            }
            PaxTerm::LoopLeave(_) => {
                // Find the highest level index.
                let block = block_stack
                    .iter()
                    .rev()
                    .find(|x| {
                        if let WalkerLevel::Loop(_) = x {
                            true
                        } else {
                            false
                        }
                    })
                    .unwrap();

                // Assert loop.
                block.to_loop();
                walker.terminator(&terminator, block);
            }
            PaxTerm::LoopIf0(_) => {
                let block = block_stack.pop().unwrap();

                // Assert loop.
                block.to_loop();
                walker.terminator(&terminator, &block);
            }
        }
    }

    assert_eq!(block_stack.len(), 1, "Expected root to remain");
}

pub trait PaxWalker {
    fn opcode(&mut self, opcode: &Located<Pax>);

    fn terminator(&mut self, terminator: &Located<PaxTerm>, current: &WalkerLevel);
}
