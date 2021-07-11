use crate::*;
use indexmap::IndexMap;

/**
 * Describes an entry on the stack, whether it originated (locally) as
 * a value on the data stack, alt stack, a computed value, or an integer.
 */
#[derive(Debug, Clone, PartialEq, Hash, Eq)]
pub enum StackValue {
    DataParam(usize),
    AltParam(usize),
    IntValue(usize, PaxLiteral),
    Value(usize),
}

pub type Arity = (usize, usize, usize, usize);

/**
 * Describes the state of the stacks and temp value at the end of a block
 * or opcode.
 */
#[derive(Debug, Clone)]
pub struct StackState {
    data: Vec<StackValue>,
    data_pos: usize,
    alt: Vec<StackValue>,
    alt_pos: usize,
    temp: Option<StackValue>,
    value_pos: usize,
}

type Analyzed<T> = (T, StackState);

impl StackState {
    pub fn new() -> StackState {
        StackState {
            data: vec![],
            data_pos: 0,
            alt: vec![],
            alt_pos: 0,
            temp: None,
            value_pos: 0,
        }
    }

    fn data_param(&mut self) -> StackValue {
        self.data_pos += 1;
        StackValue::DataParam(self.data_pos)
    }

    fn alt_param(&mut self) -> StackValue {
        self.alt_pos += 1;
        StackValue::AltParam(self.alt_pos)
    }

    pub fn pop_data(&mut self) -> StackValue {
        self.data.pop().unwrap_or_else(|| self.data_param())
    }

    pub fn push_data(&mut self, reg: StackValue) {
        self.data.push(reg);
    }

    pub fn pop_return(&mut self) -> StackValue {
        self.alt.pop().unwrap_or_else(|| self.alt_param())
    }

    pub fn push_return(&mut self, reg: StackValue) {
        self.alt.push(reg);
    }

    pub fn pop_temp(&mut self) -> StackValue {
        let value = self.temp.clone().expect("No temp value in block to load");
        // Replace the temp value with a new register.
        match self.temp {
            Some(StackValue::IntValue(_, literal)) => {
                self.temp = Some(self.new_int_value(literal));
            }
            _ => {
                self.temp = Some(self.new_value());
            }
        }
        value
    }

    pub fn push_temp(&mut self, reg: StackValue) {
        self.temp = Some(reg);
    }

    pub fn data(&self) -> &[StackValue] {
        &self.data
    }

    pub fn alt(&self) -> &[StackValue] {
        &self.alt
    }

    pub fn temp(&self) -> &Option<StackValue> {
        &self.temp
    }

    pub fn arity(&self) -> Arity {
        (self.data_pos, self.alt_pos, self.data.len(), self.alt.len())
    }

    pub fn new_value(&mut self) -> StackValue {
        self.value_pos += 1;
        StackValue::Value(self.value_pos)
    }

    pub fn new_int_value(&mut self, literal: PaxLiteral) -> StackValue {
        self.value_pos += 1;
        StackValue::IntValue(self.value_pos, literal)
    }

    fn apply(&mut self, arity: &Arity) {
        for _ in 0..arity.0 {
            self.pop_data();
        }
        for _ in 0..arity.1 {
            self.pop_return();
        }
        for _ in 0..arity.2 {
            let value = self.new_value();
            self.push_data(value);
        }
        for _ in 0..arity.3 {
            let value = self.new_value();
            self.push_return(value);
        }
    }
}

/**
 * Copy of the Block struct that contains stack analysis.
 */
#[derive(Debug, Clone)]
pub struct AnalyzedBlock {
    pub opcodes: Vec<Analyzed<Located<Pax>>>,
    pub terminator: Analyzed<Located<PaxTerm>>,
    pub final_state: StackState,
}

/**
 * ProgramFacts describes the analysis of the program.
 */
pub struct ProgramFacts {
    program: PaxProgram,
    function_analysis: IndexMap<String, (BlockGraph<()>, IndexMap<usize, AnalyzedBlock>)>,
}

impl ProgramFacts {
    pub fn new(program: &PaxProgram) -> ProgramFacts {
        ProgramFacts {
            program: program.clone(),
            function_analysis: IndexMap::new(),
        }
    }

    /**
     * Internal function to compute the StackState for a single block,
     * optionally building off of a previous StackState.
     */
    fn block_analyze(
        &mut self,
        block: &Block,
        prev_state: Option<&AnalyzedBlock>,
    ) -> AnalyzedBlock {
        // If a previous state was provided, apply the new arity to that
        // instead of returning a new one.
        let mut state = prev_state
            .map(|x| x.terminator.1.clone())
            .unwrap_or(StackState::new());

        let mut opcodes_analyzed = vec![];

        // Iterate opcodes
        for opcode in block.opcodes() {
            eprintln!("        data: {:?}", state.data);
            eprintln!("         alt: {:?}", state.alt);
            eprintln!("        temp: {:?}", state.temp);
            eprintln!("[facts] {:?}", opcode.0);
            opcodes_analyzed.push((opcode.clone(), state.clone()));

            match opcode.0 {
                Pax::PushLiteral(value) => {
                    let reg = state.new_int_value(value);
                    state.push_data(reg);
                }
                Pax::AltPush => {
                    let reg = state.pop_data();
                    state.push_return(reg);
                }
                Pax::AltPop => {
                    let reg = state.pop_return();
                    state.push_data(reg);
                }
                Pax::Drop | Pax::Print | Pax::Emit => {
                    state.pop_data();
                }
                Pax::Load | Pax::Load8 => {
                    state.pop_data();
                    let reg = state.new_value();
                    state.push_data(reg);
                }
                Pax::Add | Pax::Nand => {
                    state.pop_data();
                    state.pop_data();
                    let reg = state.new_value();
                    state.push_data(reg);
                }
                Pax::Store | Pax::Store8 => {
                    state.pop_data();
                    state.pop_data();
                }
                Pax::LoadTemp => {
                    let reg = state.pop_temp();
                    state.push_data(reg);
                }
                Pax::StoreTemp => {
                    let reg = state.pop_data();
                    state.push_temp(reg);
                }
                Pax::Debugger => {}
                Pax::Abort => {
                    eprintln!("Encountered abort in block_analyze, not sure what to do");
                }
            }
        }

        let terminator = block.terminator();
        let terminator_analyzed = (terminator.clone(), state.clone());
        eprintln!("        data: {:?}", state.data);
        eprintln!("         alt: {:?}", state.alt);
        eprintln!("        temp: {:?}", state.temp);
        eprintln!("[terminator] {:?}", terminator.0);

        // Terminating opcode
        let (opcode, _pos) = terminator;
        match opcode {
            PaxTerm::JumpElse(_) => {}
            PaxTerm::LoopLeave(_) | PaxTerm::LoopIf0(_) | PaxTerm::JumpIf0(_) => {
                state.pop_data();
            }
            PaxTerm::LoopTarget(_) | PaxTerm::JumpTarget(_) => {}
            PaxTerm::Exit => {}

            // Reference another function's arity to complete this analysis.
            PaxTerm::Call(name) => {
                let arity = self
                    .function_analyze(name)
                    .1
                    .last()
                    .unwrap()
                    .1
                    .terminator
                    .1
                    .arity();
                state.apply(&arity);
            }
        }

        eprintln!("             data: {:?}", state.data);
        eprintln!("             alt: {:?}", state.alt);
        eprintln!("             temp: {:?}", state.temp);
        eprintln!();

        AnalyzedBlock {
            opcodes: opcodes_analyzed,
            terminator: terminator_analyzed,
            final_state: state.clone(),
        }
    }

    /**
     * Analyze a function in this program and cache the BlockGraph and Arity
     * computed about it.
     */
    pub fn function_analyze(
        &'_ mut self,
        name: &str,
    ) -> &'_ (BlockGraph<()>, IndexMap<usize, AnalyzedBlock>) {
        if let None = self.function_analysis.get(name) {
            // Create a BlockGraph from this function's blocks.
            let blocks = self
                .program
                .get(name)
                .expect(&format!("Expect a function by the name of {}", name))
                .clone();
            let graph = BlockGraph::<()>::from_blocks(&blocks);

            // TODO  ensure that this isn't a circular reference of this graph, affecting arity
            eprintln!("[compile.rs] graph {:?}", graph);
            eprintln!("[compile.rs] graph {:?}", graph.bfs_sequence());
            eprintln!("[compile.rs] graph {:?}", graph.target_sequence());
            eprintln!();
            eprintln!("[compile.rs] block analyze");
            dump_blocks(&blocks);

            let mut last_states = IndexMap::<usize, AnalyzedBlock>::new();
            let mut conditions: Vec<(usize, StackState)> = vec![];
            for (block_index, target) in graph.target_sequence() {
                let block = &blocks[block_index];

                // Evaluate conditions
                conditions = conditions
                    .into_iter()
                    .filter(|(index, condition)| {
                        if *index == block_index {
                            // TODO
                            eprintln!();
                            eprintln!("[compile.rs] TESTING CONDITION: {:?}", condition);
                            eprintln!();
                            false
                        } else {
                            true
                        }
                    })
                    .collect();

                // Match the block terminator.
                let analyzed_block = match target.clone() {
                    TargetType::Start => {
                        // There are no parents.
                        self.block_analyze(&block, None)
                    }
                    TargetType::Block(target) | TargetType::AfterLoop(target) => {
                        // There is only one parent.
                        self.block_analyze(&block, last_states.get(&target))
                    }
                    TargetType::Begin(targets) => {
                        // There are two parents.
                        let base_states = last_states
                            .iter()
                            .filter(|(key, _value)| targets.contains(key))
                            .collect::<Vec<_>>();
                        // TODO compare base_states?
                        assert_eq!(
                            base_states.len(),
                            1,
                            "expected only one iterated branch {:?}",
                            target
                        );

                        // Add conditions that the forward reference should obey.
                        for target in &targets {
                            if target != base_states[0].0 {
                                conditions.push((*target, base_states[0].1.terminator.1.clone()));
                            }
                        }

                        // Make a combined branch.
                        eprintln!("###TIM### first: {:?}", base_states[0].1.final_state);

                        eprintln!("###TIM###   two: {:?}", targets[1]);

                        // Compute the analysis for this current block. Inherit only from the first branch.
                        let next_block =
                            self.block_analyze(&block, last_states.get(&*base_states[0].0));

                        next_block
                    }
                    TargetType::Then(targets) => {
                        // There are two parents.
                        let base_states = last_states
                            .iter()
                            .filter(|(key, _value)| targets.contains(key))
                            .collect::<Vec<_>>();

                        // TODO compare base_States?
                        // Generate a result?
                        assert_eq!(
                            base_states.len(),
                            2,
                            "expected tp have two iterated branch {:?}",
                            target
                        );

                        // As an optimization, we only inherit from the first branch.
                        let first_block_index = *base_states[0].0;
                        self.block_analyze(&block, last_states.get(&first_block_index))
                    }
                };

                // eprintln!("[arity] {:?} for {}", state.arity(), pos_string);
                // eprintln!("    data: {:?}", state.data());
                // eprintln!("     alt: {:?}", state.alt());
                last_states.insert(block_index, analyzed_block.clone());
            }

            // Read the function arity.
            let arity = last_states.last().unwrap().1.terminator.1.arity();
            eprintln!("----> final arity: {:?}", arity);
            eprintln!();

            // Cache this graph analysis in the ProgramFacts struct so
            // we never have to re-compute it.
            self.function_analysis
                .insert(name.to_string(), (graph.clone(), last_states.clone()));
        }

        self.function_analysis.get(name).unwrap()
    }
}

// /**
//  * Get arities for all functions in a program.
//  */
// pub fn program_arities(program: &PaxProgram) -> IndexMap<String, Arity> {
//     let (deps, idx) = program_graph(program);

//     // Trim all functions unaccessible from "main".
//     let main = idx.get("main").unwrap().clone();

//     // Depth-first search into the call graph of "main".
//     let mut dfs = DfsPostOrder::new(&deps, main);
//     let mut seq = vec![];
//     while let Some(block_index) = dfs.next(&deps) {
//         seq.push(deps.node_weight(block_index).unwrap().clone());
//     }

//     let mut function_arities = IndexMap::new();

//     for name in &seq {
//         if let Some(blocks) = program.get(&name.to_string()) {
//             let (_graph, arity) = function_analyze(&blocks, Some(&function_arities));
//             function_arities.insert(name.to_string(), arity);
//         }
//     }

//     function_arities
// }
