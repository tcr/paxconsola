use crate::*;
use indexmap::IndexMap;
use petgraph::graph::Graph;
use petgraph::prelude::*;
use petgraph::visit::DfsPostOrder;

#[derive(Debug, Clone)]
pub enum Reg {
    DataParam(usize),
    AltParam(usize),
    Literal(PaxLiteral),
    Var,
}

pub type FunctionArity = (usize, usize, usize, usize);

#[derive(Debug, Clone)]
pub struct RegState {
    data: Vec<Reg>,
    data_pos: usize,
    alt: Vec<Reg>,
    alt_pos: usize,
    temp: Option<Reg>,
}

impl RegState {
    pub fn new() -> RegState {
        RegState {
            data: vec![],
            data_pos: 0,
            alt: vec![],
            alt_pos: 0,
            temp: None,
        }
    }

    fn apply(&mut self, arity: &FunctionArity) {
        for _ in 0..arity.0 {
            self.pop_data();
        }
        for _ in 0..arity.1 {
            self.pop_return();
        }
        for _ in 0..arity.2 {
            self.push_data(Reg::Var);
        }
        for _ in 0..arity.3 {
            self.push_return(Reg::Var);
        }
    }

    fn data_param(&mut self) -> Reg {
        self.data_pos += 1;
        Reg::DataParam(self.data_pos)
    }

    fn alt_param(&mut self) -> Reg {
        self.alt_pos += 1;
        Reg::AltParam(self.alt_pos)
    }

    pub fn pop_data(&mut self) -> Reg {
        self.data.pop().unwrap_or_else(|| self.data_param())
    }

    pub fn push_data(&mut self, reg: Reg) {
        self.data.push(reg);
    }

    pub fn pop_return(&mut self) -> Reg {
        self.alt.pop().unwrap_or_else(|| self.alt_param())
    }

    pub fn push_return(&mut self, reg: Reg) {
        self.alt.push(reg);
    }

    pub fn pop_temp(&mut self) -> Reg {
        self.temp.clone().expect("No temp value in block to load")
    }

    pub fn push_temp(&mut self, reg: Reg) {
        self.temp = Some(reg);
    }

    pub fn arity(&self) -> FunctionArity {
        (self.data_pos, self.alt_pos, self.data.len(), self.alt.len())
    }

    pub fn data(&self) -> &[Reg] {
        &self.data
    }

    pub fn alt(&self) -> &[Reg] {
        &self.alt
    }
}

fn block_analyze(
    block: &Block,
    prev_state: Option<RegState>,
    functions_arity_input: Option<&IndexMap<String, FunctionArity>>,
) -> RegState {
    use Pax::*;

    let mut state = prev_state.unwrap_or_else(|| RegState::new());

    let (commands, terminator) = block.opcodes_and_terminator();

    let functions_arity_default = IndexMap::new();
    let functions_arity = functions_arity_input.unwrap_or_else(|| &functions_arity_default);

    // Iterate opcodes
    for (opcode, _pos) in commands {
        match opcode {
            //Metadata(_) => {}
            PushLiteral(value) => {
                state.push_data(Reg::Literal(*value));
            }
            AltPush => {
                let reg = state.pop_data();
                state.push_return(reg);
            }
            AltPop => {
                let reg = state.pop_return();
                state.push_data(reg);
            }
            Drop | Print => {
                state.pop_data();
            }
            Load | Load8 => {
                state.pop_data();
                state.push_data(Reg::Var);
            }
            Add | Nand => {
                state.pop_data();
                state.pop_data();
                state.push_data(Reg::Var);
            }
            Store | Store8 => {
                state.pop_data();
                state.pop_data();
            }
            LoadTemp => {
                let reg = state.pop_temp();
                state.push_data(reg);
            }
            StoreTemp => {
                let reg = state.pop_data();
                state.push_temp(reg);
            }
            Abort => {
                eprintln!("Encountered abort in block_analyze, not sure what to do");
            }

            op => {
                unreachable!("expected non-terminating opcode, got {:?}", op);
            }
        }
    }

    // Terminating opcode
    let (opcode, _pos) = terminator;
    match opcode {
        JumpAlways(_) => {}
        JumpIf0(_) => {
            state.pop_data();
        }
        BranchTarget(_) => {}
        Exit => {}

        Call(name) => {
            if let Some(arity) = functions_arity.get(name) {
                state.apply(arity);
            } else {
                panic!(
                    "[util.rs] FIXME: `functions_arity.get('{}')` is null, and call is not inlined",
                    name
                );
            }
        }
        _ => {
            unreachable!("expected terminating opcode");
        }
    }

    state
}

fn function_analyze(
    blocks: &[Block],
    arities: Option<&IndexMap<String, FunctionArity>>,
) -> (FunctionGraph, FunctionArity) {
    let graph = FunctionGraph::from_blocks(&blocks);
    eprintln!("[compile.rs] graph {:?}", graph);
    eprintln!("[compile.rs] graph {:?}", graph.bfs_sequence());
    eprintln!("[compile.rs] graph {:?}", graph.target_sequence());
    eprintln!();

    eprintln!("[compile.rs] block analyze");
    dump_blocks(blocks);
    let mut last_states = IndexMap::<usize, RegState>::new();
    let mut conditions: Vec<(usize, RegState)> = vec![];

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

        let pos_string = block.terminator().1.to_string();
        let state = match target.clone() {
            TargetType::Start => {
                // There are no parents.
                block_analyze(&block, None, arities)
            }
            TargetType::Block(target) | TargetType::AfterLoop(target) => {
                // There is only one parent.
                block_analyze(&block, last_states.get(&target).map(|x| x.clone()), arities)
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
                block_analyze(
                    &block,
                    last_states.get(&*base_states[0].0).map(|x| x.clone()),
                    arities,
                )
            }
            TargetType::Then(targets) => {
                // There are two parents.
                let base_states = last_states
                    .iter()
                    .filter(|(key, _value)| targets.contains(key))
                    .collect::<Vec<_>>();
                assert_eq!(
                    base_states.len(),
                    2,
                    "expected tp have two iterated branch {:?}",
                    target
                );

                // TODO compare base_States?
                // Generate a result?

                // Inherit only from the first branch.
                block_analyze(
                    &block,
                    last_states.get(&*base_states[0].0).map(|x| x.clone()),
                    arities,
                )
            }
        };

        eprintln!("[arity] {:?} for {}", state.arity(), pos_string);
        eprintln!("    data: {:?}", state.data());
        eprintln!("     alt: {:?}", state.alt());
        last_states.insert(block_index, state.clone());
    }

    let arity = last_states.last().unwrap().1.arity();
    eprintln!("----> final arity: {:?}", arity);

    eprintln!();

    (graph, arity)
}

/**
 * Walk the call graph of the program.
 */
pub fn program_analyze(program: &PaxProgram) -> (Graph<&str, ()>, IndexMap<String, NodeIndex>) {
    let mut deps = Graph::<&str, ()>::new();

    let mut idx = IndexMap::new();
    for (name, _block) in program {
        idx.insert(name.clone(), deps.add_node(name));
    }

    // Create call tree for all methods.
    for (name, blocks) in program {
        let from = idx.get(name).unwrap();
        for block in blocks {
            match block.terminator() {
                (Pax::Call(target_name), _) => {
                    let to = idx.get(target_name).unwrap();
                    deps.update_edge(from.clone(), to.clone(), ());
                }
                _ => {}
            }
        }
    }

    (deps, idx)
}

/**
 * Get arities for all functions in a program.
 */
pub fn program_arities(program: &PaxProgram) -> IndexMap<String, FunctionArity> {
    let (deps, idx) = program_analyze(program);

    // Trim all functions unaccessible from "main".
    let main = idx.get("main").unwrap().clone();

    // Depth-first search into the call graph of "main".
    let mut dfs = DfsPostOrder::new(&deps, main);
    let mut seq = vec![];
    while let Some(block_index) = dfs.next(&deps) {
        seq.push(deps.node_weight(block_index).unwrap().clone());
    }

    let mut function_arities = IndexMap::new();

    for name in &seq {
        if let Some(blocks) = program.get(&name.to_string()) {
            let (_graph, arity) = function_analyze(&blocks, Some(&function_arities));
            function_arities.insert(name.to_string(), arity);
        }
    }

    function_arities
}
