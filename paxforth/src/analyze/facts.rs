use crate::*;
use indexmap::IndexMap;

/**
 * Describes an entry on the stack, whether it originated (locally) as
 * a value on the data stack, alt stack, a computed value, or an integer.
 */
#[derive(Debug, Clone)]
pub enum StackValue {
    DataParam(usize),
    AltParam(usize),
    Literal(PaxLiteral),
    Var,
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
        self.temp.clone().expect("No temp value in block to load")
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

    pub fn arity(&self) -> Arity {
        (self.data_pos, self.alt_pos, self.data.len(), self.alt.len())
    }

    fn apply(&mut self, arity: &Arity) {
        for _ in 0..arity.0 {
            self.pop_data();
        }
        for _ in 0..arity.1 {
            self.pop_return();
        }
        for _ in 0..arity.2 {
            self.push_data(StackValue::Var);
        }
        for _ in 0..arity.3 {
            self.push_return(StackValue::Var);
        }
    }
}

/**
 * Copy of the Block struct that contains stack analysis.
 */
#[derive(Debug, Clone)]
pub struct AnalyzedBlock {
    opcodes: Vec<Analyzed<Located<Pax>>>,
    terminator: Analyzed<Located<PaxTerm>>,
}

/**
 * ProgramFacts describes the analysis of the program.
 */
pub struct ProgramFacts {
    program: PaxProgram,
    function_analysis: IndexMap<String, (BlockGraph, Arity)>,
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
    fn block_analyze(&mut self, block: &Block, prev_state: Option<StackState>) -> StackState {
        // If a previous state was provided, apply the new arity to that
        // instead of returning a new one.
        let mut state = prev_state.unwrap_or(StackState::new());

        let (commands, terminator) = block.opcodes_and_terminator();

        let mut opcodes_analyzed = vec![];

        // Iterate opcodes
        for opcode in commands {
            match opcode.0 {
                //Metadata(_) => {}
                Pax::PushLiteral(value) => {
                    state.push_data(StackValue::Literal(value));
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
                    state.push_data(StackValue::Var);
                }
                Pax::Add | Pax::Nand => {
                    state.pop_data();
                    state.pop_data();
                    state.push_data(StackValue::Var);
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
            eprintln!("[facts] {:?}", opcode.0);
            eprintln!("        data: {:?}", state.data);
            eprintln!("         alt: {:?}", state.alt);
            eprintln!("        temp: {:?}", state.temp);
            opcodes_analyzed.push((opcode.clone(), state.clone()));
        }

        // Terminating opcode
        let (opcode, _pos) = terminator;
        match opcode {
            PaxTerm::JumpAlways(_) => {}
            PaxTerm::JumpIf0(_) => {
                state.pop_data();
            }
            PaxTerm::BranchTarget(_) => {}
            PaxTerm::Exit => {}

            // Reference another function's arity to complete this analysis.
            PaxTerm::Call(name) => {
                let arity = self.function_analyze(name).1;
                state.apply(&arity);
            }
        }

        let terminator_analyzed = (terminator.clone(), state.clone());
        eprintln!("[terminator] {:?}", terminator.0);
        eprintln!("             data: {:?}", state.data);
        eprintln!("             alt: {:?}", state.alt);
        eprintln!("             temp: {:?}", state.temp);
        let analyzed_block = AnalyzedBlock {
            opcodes: opcodes_analyzed,
            terminator: terminator_analyzed,
        };

        analyzed_block.terminator.1.clone()
    }

    /**
     * Analyze a function in this program and cache the BlockGraph and Arity
     * computed about it.
     */
    pub fn function_analyze(&mut self, name: &str) -> (BlockGraph, Arity) {
        if let Some(result) = self.function_analysis.get(name) {
            return result.clone();
        }

        // Createa BlockGraph from this function's blocks.
        let blocks = self
            .program
            .get(name)
            .expect(&format!("Expect a function by the name of {}", name))
            .clone();
        let graph = BlockGraph::from_blocks(&blocks);
        // TODO cache FunctionGraph separately

        // TODO  ensure that this isn't a circular reference of this graph, affecting arity

        eprintln!("[compile.rs] graph {:?}", graph);
        eprintln!("[compile.rs] graph {:?}", graph.bfs_sequence());
        eprintln!("[compile.rs] graph {:?}", graph.target_sequence());
        eprintln!();
        eprintln!("[compile.rs] block analyze");
        dump_blocks(&blocks);

        let mut last_states = IndexMap::<usize, StackState>::new();
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
            let pos_string = block.terminator().1.to_string();
            let state = match target.clone() {
                TargetType::Start => {
                    // There are no parents.
                    self.block_analyze(&block, None)
                }
                TargetType::Block(target) | TargetType::AfterLoop(target) => {
                    // There is only one parent.
                    self.block_analyze(&block, last_states.get(&target).map(|x| x.clone()))
                }
                TargetType::Begin(targets) => {
                    // There are two parents.
                    let base_states = last_states
                        .iter()
                        .filter(|(key, _value)| targets.contains(key))
                        .collect::<Vec<_>>();
                    // TODO compare base_States?
                    assert_eq!(
                        base_states.len(),
                        1,
                        "expected only one iterated branch {:?}",
                        target
                    );

                    for target in &targets {
                        if target != base_states[0].0 {
                            conditions.push((*target, base_states[0].1.clone()));
                        }
                    }

                    // Inherit only from the first branch.
                    self.block_analyze(
                        &block,
                        last_states.get(&*base_states[0].0).map(|x| x.clone()),
                    )
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

                    // As an optimization we only nherit from the first branch.
                    self.block_analyze(
                        &block,
                        last_states.get(&*base_states[0].0).map(|x| x.clone()),
                    )
                }
            };

            // eprintln!("[arity] {:?} for {}", state.arity(), pos_string);
            // eprintln!("    data: {:?}", state.data());
            // eprintln!("     alt: {:?}", state.alt());
            last_states.insert(block_index, state.clone());
        }

        // Read the function arity.
        let arity = last_states.last().unwrap().1.arity();
        eprintln!("----> final arity: {:?}", arity);
        eprintln!();

        // Cache this graph analysis in the ProgramFacts struct so
        // we never have to re-compute it.
        self.function_analysis
            .insert(name.to_string(), (graph.clone(), arity.clone()));

        (graph, arity)
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
