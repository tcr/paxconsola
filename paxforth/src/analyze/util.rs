use crate::*;
use indexmap::IndexMap;
use petgraph::graph::Graph;
use petgraph::visit::DfsPostOrder;

#[derive(Debug, Clone)]
pub enum Reg {
    DataParam(usize),
    AltParam(usize),
    Literal(PaxLiteral),
    Var,
}

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

    pub fn signature(&self) -> (usize, usize, usize, usize) {
        (self.data_pos, self.alt_pos, self.data.len(), self.alt.len())
    }

    pub fn data(&self) -> &[Reg] {
        &self.data
    }

    pub fn alt(&self) -> &[Reg] {
        &self.alt
    }
}

fn block_analyze(block: &Block, prev_state: Option<RegState>) -> RegState {
    use Pax::*;

    let mut state = prev_state.unwrap_or_else(|| RegState::new());

    let (commands, terminator) = block.commands_and_terminator();

    // Iterate opcodes
    for (opcode, _pos) in commands {
        match opcode {
            Metadata(_) => {}
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

            _ => {
                unreachable!("expected non-terminating opcode");
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

        Abort => {
            panic!("Throw not supported in analyze");
        }
        Call(_) => {
            // unreachable!("Cannot optimize non-inlined method");
        }
        _ => {
            unreachable!("expected terminating opcode");
        }
    }

    state
}

fn function_analyze(blocks: &[Block]) -> FunctionGraph {
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

        let pos_string = block.commands().iter().last().unwrap().1.to_string();
        let state = match target.clone() {
            TargetType::Start => block_analyze(&block, None),
            TargetType::Begin(targets) => {
                let base_states = last_states
                    .iter()
                    .filter(|(key, value)| targets.contains(key))
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
                )
            }
            TargetType::Then(targets) => {
                let base_states = last_states
                    .iter()
                    .filter(|(key, value)| targets.contains(key))
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
                )
            }
            TargetType::Block(target) | TargetType::AfterLoop(target) => {
                block_analyze(&block, last_states.get(&target).map(|x| x.clone()))
            }
        };

        eprintln!("{:?} for {}", state.signature(), pos_string,);
        eprintln!("    data: {:?}", state.data());
        eprintln!("     alt: {:?}", state.alt());
        last_states.insert(block_index, state.clone());
    }
    eprintln!();
    graph
}

pub fn program_graph(program: &PaxProgram) {
    let mut deps = Graph::<&str, ()>::new();

    let mut idx = IndexMap::new();
    for (name, _block) in program {
        idx.insert(name.clone(), deps.add_node(name));
    }

    // Create call tree for all methods.
    for (name, blocks) in program {
        let from = idx.get(name).unwrap();
        for block in blocks {
            for command in block.commands() {
                match command {
                    (Pax::Call(target_name), _) => {
                        let to = idx.get(target_name).unwrap();
                        deps.update_edge(from.clone(), to.clone(), ());
                    }
                    _ => {}
                }
            }
        }
    }

    // Get the minimum spanning tree of the graph as a new graph, and check that
    // one edge was trimmed.
    // let mst = UnGraph::<_, _>::from_elements(min_spanning_tree(&deps));
    // assert_eq!(g.raw_edges().len() - 1, mst.raw_edges().len());

    // Trim down to main.
    let main = idx.get("main").unwrap().clone();
    for (name, value) in idx {
        if !petgraph::algo::has_path_connecting(&deps, main, value, None) {
            deps.remove_node(value);
        }
    }

    // Depth-first search into the dependencies of "main".
    let mut dfs = DfsPostOrder::new(&deps, main);
    let mut seq = vec![];
    while let Some(block_index) = dfs.next(&deps) {
        seq.push(deps.node_weight(block_index).clone());
    }
    eprintln!("[graph] whole deps: {:?}", deps);
    eprintln!();
    eprintln!("[graph] dfs: {:?}", seq);
    eprintln!();

    for (name, blocks) in program {
        // Do some analysis lol
        let graph = function_analyze(&blocks);
    }
}
