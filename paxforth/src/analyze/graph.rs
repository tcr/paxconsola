use crate::*;
use indexmap::{IndexMap, IndexSet};
use petgraph::graph::{Graph, NodeIndex};
use petgraph::Direction;

#[derive(Debug)]
pub struct FunctionGraph {
    pub graph: Graph<(), i32>,
}

#[derive(Debug, Clone)]
pub enum TargetType {
    Start,
    Block(usize),
    Then(Vec<usize>),
    Begin(Vec<usize>),
    AfterLoop(usize),
}

impl FunctionGraph {
    /// Composes blocks together into a graph.
    pub fn from_blocks(stack_blocks: &[Block]) -> FunctionGraph {
        // List of blocks we've already seen.
        let mut visited = IndexSet::new();

        // Starting conditions. Each block flow starts (originally from 0) at a block
        // and continues until we hit a "visited" block, or a terminating "exit" block.
        let mut conditions = std::collections::VecDeque::<usize>::new();
        conditions.push_front(0);

        // Collect edges which will compose the graph.
        let mut edges: Vec<(u32, u32)> = vec![];
        while let Some(start) = conditions.pop_back() {
            // We iterate through blocks using an index.
            let mut i = start;
            while i < stack_blocks.len() {
                let block: &Block = &stack_blocks[i];

                // If we've visited this block already, we can stop here.
                if visited.contains(&i) {
                    break;
                }
                visited.insert(i);

                // Determine what the next block target is going to be.
                match block.terminator() {
                    (Pax::JumpIf0(target), ..) => {
                        // Inject next edge (for both absolute jump OR branch)
                        let alt_target = target + 1;
                        edges.push((i as u32, alt_target as u32));

                        // Invoke branch as though we jumped (nonzero).
                        // only iterate future branches, not reverse ones (which are loops)
                        if alt_target > i {
                            conditions.push_front(alt_target);
                        }
                    }
                    (Pax::JumpAlways(target), ..) => {
                        // Inject next edge (for both absolute jump OR branch)
                        let alt_target = target + 1;
                        edges.push((i as u32, alt_target as u32));

                        // Invoke branch as though we jumped (nonzero).
                        i = *target as usize;
                    }
                    _ => {}
                }

                // Add new edge to the forthcoming block.
                if i < stack_blocks.len() - 1 {
                    edges.push((i as u32, (i + 1) as u32));
                }

                i += 1;
            }
        }

        FunctionGraph {
            graph: Graph::<(), i32>::from_edges(&edges),
        }
    }

    /**
     * Get directed edges from a node in the graph.
     */
    pub fn directed_edges_from_node(&self, block_index: usize, dir: Direction) -> Vec<usize> {
        let mut incoming: Vec<usize> = self
            .graph
            .neighbors_directed(NodeIndex::new(block_index), dir)
            .map(|idx| idx.index() as usize)
            .collect::<Vec<_>>();
        incoming.dedup();
        incoming.sort();
        incoming
    }

    /**
     * Get the breadth-first sequence of blocks as you navigate from the first block
     * through the function.
     */
    pub fn bfs_sequence(&self) -> Vec<usize> {
        // First we want to analyze the whole program and identify basic blocks.
        // let mut exit_stacks = IndexMap::<_, DataRegs>::new();
        if self.graph.node_count() > 1 {
            let mut bfs = petgraph::visit::Bfs::new(&self.graph, 0.into());
            let mut seq = vec![];
            while let Some(block_index) = bfs.next(&self.graph) {
                seq.push(block_index.index() as usize);
            }
            seq
        } else {
            vec![0]
        }
    }

    /**
     *
     */
    pub fn target_sequence(&self) -> IndexMap<usize, TargetType> {
        // First we want to analyze the whole program and identify basic blocks.
        // let mut exit_stacks = IndexMap::<_, DataRegs>::new();
        let seq = self.bfs_sequence();

        let mut seen = IndexMap::new();

        for block_index in seq {
            // Get the set of incoming edges to this block and iterate in ascending order.
            let incoming = self.directed_edges_from_node(block_index, Direction::Incoming);

            let target_type = if incoming.len() == 0 {
                // If there are no incoming blocks, we are not a branch target.
                TargetType::Start
            } else if incoming.iter().find(|x| seen.get(*x).is_none()).is_some() {
                // If an incoming block is not populated yet, we assume we are starting
                // a loop ("begin").
                TargetType::Begin(incoming.clone())
            } else if incoming.len() == 1 && incoming[0] == block_index - 1 && {
                let outgoing = self.directed_edges_from_node(incoming[0], Direction::Outgoing);
                outgoing.len() > 1 && outgoing.iter().any(|x| *x < incoming[0])
            } {
                TargetType::AfterLoop(incoming[0])
            } else if incoming.len() >= 2 {
                // If there are two or more incoming edges, we assume we are joining a branch ("then").
                TargetType::Then(incoming.clone())
            } else {
                // A sole incoming edge is probably an "else" block.
                TargetType::Block(incoming[0])
            };

            // Generate the next block analysis.
            eprintln!(
                "[graph.rs] [block#{}] target {:?}",
                block_index, target_type
            );

            seen.insert(block_index, target_type);
        }

        eprintln!();

        seen
    }
}
