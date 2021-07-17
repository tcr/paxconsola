use crate::analyze::walker::*;
use crate::analyze::*;
use crate::*;
use indexmap::IndexSet;
use log::*;

fn name_slug(name: &str) -> String {
    const NON_ALPHA: AsciiSet = NON_ALPHANUMERIC.remove(b'_');
    utf8_percent_encode(name, &NON_ALPHA)
        .to_string()
        .replace("$", "$$")
        .replace("%", "$")
        .to_string()
}

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

// Register index.
type RegIndex = usize;

#[derive(Debug, Clone)]
struct RegState {
    index: RegIndex,
    data: Vec<RegIndex>,
    ret: Vec<RegIndex>,
    temp: Option<RegIndex>,
}

impl RegState {
    fn new() -> RegState {
        RegState {
            index: 0,
            data: vec![],
            ret: vec![],
            temp: None,
        }
    }
}

pub struct PaxAnalyzerWalker {
    buffer: String,
    reg_state: RegState,
}

impl PaxAnalyzerWalker {
    fn new() -> PaxAnalyzerWalker {
        PaxAnalyzerWalker {
            buffer: String::new(),
            reg_state: RegState::new(),
        }
    }

    fn push(&mut self, string: &str) {
        self.buffer.push_str(string);
        self.buffer.push_str("\n");
    }

    // Data Stack

    fn new_reg(&mut self) -> RegIndex {
        let pos = self.reg_state.index;
        self.reg_state.index += 1;
        pos
    }

    fn data_push(&mut self) -> RegIndex {
        let pos = self.new_reg();
        self.reg_state.data.push(pos);
        pos
    }

    fn data_push_literal(&mut self, literal: isize) {
        self.data_push();
        // TODO use literal
    }

    fn data_pop(&mut self) -> RegIndex {
        self.reg_state.data.pop().unwrap_or_else(|| self.new_reg())
    }

    fn ret_push(&mut self) -> RegIndex {
        let pos = self.new_reg();
        self.reg_state.ret.push(pos);
        pos
    }

    fn ret_pop(&mut self) {
        self.reg_state.ret.pop();
    }

    fn data_push_temp(&mut self, reg: RegIndex) {
        self.reg_state.temp = Some(reg)
    }

    fn data_pop_temp(&mut self) {
        let reg = self.data_pop();
        self.reg_state.temp = Some(reg);
    }
}

/**
 * Implements `opcode()` and `terminator()` for PaxAnalyzerWalker.
 */
impl PaxWalker for PaxAnalyzerWalker {
    fn opcode(&mut self, op: &Located<Pax>) {
        self.push(&format!(";; {:?}", &op.0));
        match &op.0 {
            Pax::PushLiteral(lit) => {
                self.data_push_literal(*lit);
            }
            Pax::Add | Pax::Nand => {
                self.data_pop();
                self.data_pop();
                self.data_push();
            }
            Pax::Drop => {
                self.data_pop();
            }
            Pax::AltPop => {
                self.ret_pop();
            }
            Pax::AltPush => {
                self.ret_push();
            }
            Pax::LoadTemp => {
                let reg = self.data_pop();
                self.data_push_temp(reg);
            }
            Pax::StoreTemp => {
                self.data_pop_temp();
            }
            Pax::Load | Pax::Load8 => {
                self.data_push();
            }
            Pax::Store | Pax::Store8 => {
                self.data_pop();
            }
            Pax::Print | Pax::Emit => {
                self.data_pop();
            }
            Pax::Abort | Pax::Debugger => {
                // ignore
            }
        }
        self.push(&format!(""));
    }

    fn terminator(&mut self, terminator: &Located<PaxTerm>, current: &WalkerLevel) {
        self.push(&format!(";; {:?}", &terminator.0));
        match &terminator.0 {
            PaxTerm::Exit => {}
            PaxTerm::Call(ref s) => {
                self.push(&format!("    i32.const {}", 0)); // dummy value
                self.push(&format!("    call $return_push"));
                self.push(&format!("    call $fn_{}", name_slug(s)));
                self.push(&format!("    call $return_pop"));
                self.push(&format!("    call $drop"));
            }

            /* branches */
            PaxTerm::JumpIf0(_target_index) => {
                let index = current.to_block();
                // Start of an "if" block
                let parent_id = format!("$B{}_outer", index);
                let if_id = format!("$B{}_if", index);

                self.push(&format!("    block {}", parent_id));
                self.push(&format!("    block {}", if_id));
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    i32.eqz"));
                self.push(&format!("    br_if {}", if_id));
            }
            PaxTerm::JumpElse(_) => {
                let index = current.to_block();

                // Start of an "else" block
                let parent_block = format!("$B{}_outer", index);
                let next_block = format!("$B{}", index);

                self.push(&format!("    br {}", parent_block));
                self.push(&format!("    end"));
                self.push(&format!("    block {}", next_block));
            }
            PaxTerm::JumpTarget(_) => {
                // End of an "if" or "else" block
                self.push(&format!("    end"));
                self.push(&format!("    end"));
            }

            /* loops */
            PaxTerm::LoopTarget(_) => {
                let index = current.to_loop();

                // Loop start.
                let parent_id = format!("$L{}_outer", index);
                let loop_id = format!("$L{}", index);

                self.push(&format!("    block {}", parent_id));
                self.push(&format!("    loop {}", loop_id));
            }
            PaxTerm::LoopIf0(_) => {
                let index = current.to_loop();

                let loop_id = format!("$L{}", index);

                // eprintln!("[LOOP STACK bye] {:?}", wat_loop_stack);
                self.push(&format!("    call $data_pop"));
                self.push(&format!("    i32.eqz"));
                self.push(&format!("    br_if {}", loop_id));
                self.push(&format!("    end"));
                self.push(&format!("    end"));
            }
            PaxTerm::LoopLeave(_) => {
                let index = current.to_loop();

                let parent_id = format!("$L{}_outer", index);

                self.push(&format!(";;   (leave)"));
                self.push(&format!("    br {}", parent_id));
            }
        }
        self.push(&format!(""));
    }
}

/**
 * SECRET ACTUAL OPTIMIZER FUNCTION
 */
pub fn propagate_registers(program: &PaxProgram, name: &str) -> Vec<Block> {
    let blocks = program.get(name).unwrap();

    let mut walker = PaxAnalyzerWalker::new();
    structured_walk(&mut walker, blocks);

    blocks.to_owned()
}

/// Analyse stack values and produce a register mapping for values as they
/// move through the function. Then propagate registers.
pub fn propagate_registers_2(program: &PaxProgram, name: &str) -> Vec<Block> {
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
