use crate::program::analyze::*;
use crate::program::{constants, dead_code};
use crate::*;
use log::*;

pub struct OptimizeProgram {
    program: PaxProgram,
    initial_insr_count: usize,
}

impl OptimizeProgram {
    pub fn new(program: PaxProgram) -> OptimizeProgram {
        // Log initial instruction count.
        let blocks = program.get("main").unwrap();
        let initial_insr_count = instruction_count(blocks);

        OptimizeProgram {
            program,
            initial_insr_count,
        }
    }

    pub fn result(self) -> PaxProgram {
        // Log final instruction count.
        let blocks = self.program.get("main").unwrap().clone();
        let insr_count_after = instruction_count(&blocks);
        // TODO write this to a file!!
        warn!(
            "Instruction count before: {} after: {}",
            self.initial_insr_count, insr_count_after
        );

        self.program
    }
}

/**
 * Analysis function.
 */
pub fn propagate_registers(mut program: PaxProgram, name: &str) -> PaxProgram {
    // Analyze the function.
    let blocks = program.get(name).unwrap().clone();
    let insr_count_before = instruction_count(&blocks);

    let blocks = {
        let walker = function_analyze(&blocks);

        // Dump results.
        dump_reg_state_blocks(&walker.blocks);
        dump_reg_info(&walker.reg_info_map);

        constants::propagate(&walker)
    };

    let blocks = {
        let walker = function_analyze(&blocks);

        dead_code::eliminate(&walker)
    };

    let insr_count_after = instruction_count(&blocks);
    // TODO write this to a file!!
    warn!(
        "Instruction count before: {} after: {}",
        insr_count_before, insr_count_after
    );

    // Dump results.
    // dump_reg_state_blocks(&walker.blocks);
    // dump_reg_info(&walker.reg_info_map);

    program.remove(name);
    program.insert(name.to_owned(), blocks);
    program
}
