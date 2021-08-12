use crate::program::analyze::*;
use crate::program::inline::*;
use crate::program::{constants, dead_code};
use crate::*;
use log::*;

pub struct OptimizeProgram {
    program: PaxProgram,
}

impl OptimizeProgram {
    pub fn new(program: PaxProgram) -> OptimizeProgram {
        OptimizeProgram { program }
    }

    /**
     * Consume this OptimizeProgram struct and return the PaxProgram it modified.
     */
    pub fn result(self) -> PaxProgram {
        self.program
    }

    pub fn function_instruction_count(&mut self, name: &str) -> usize {
        let blocks = self.program.get("main").unwrap().clone();
        instruction_count(&blocks)
    }

    pub fn function_inline_into(&mut self, name: &str) {
        inline_into_function(&mut self.program, name);
    }

    pub fn function_dump_regs(&mut self, name: &str) {
        let blocks = self.program.get(name).unwrap();
        let walker = function_analyze(blocks);

        // Dump results.
        dump_reg_state_blocks(&walker.blocks);
        dump_reg_info(&walker.reg_info_map);
    }

    pub fn function_constant_propagate(&mut self, name: &str) {
        let blocks = self.program.get(name).unwrap();
        let walker = function_analyze(blocks);

        self.program[name] = constants::propagate(&walker);
    }

    pub fn function_dead_code_eliminate(&mut self, name: &str) {
        let blocks = self.program.get(name).unwrap();
        let walker = function_analyze(blocks);

        self.program[name] = dead_code::eliminate(&walker);
    }
}

/**
 * General optimization function.
 * New callsties, prefer to use OptimizeProgram directly.
 */
pub fn optimize_main(program: PaxProgram, inline: bool, optimize: bool) -> PaxProgram {
    let mut optimizer = OptimizeProgram::new(program.clone());
    let name = "main";

    if inline {
        optimizer.function_inline_into(name);
    }

    if optimize {
        // Dump additional information.
        optimizer.function_dump_regs(name);
        let instruction_count_start = optimizer.function_instruction_count(name);

        // Perform basic optimization.
        optimizer.function_constant_propagate(name);
        optimizer.function_dead_code_eliminate(name);

        // Log the instruction count change.
        let instruction_count_after = optimizer.function_instruction_count(name);
        // TODO write this to a file!!
        warn!(
            "Instruction count before: {} after: {}",
            instruction_count_start, instruction_count_after
        );
    }

    optimizer.result()
}
