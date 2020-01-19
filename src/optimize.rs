#![allow(dead_code)]

use crate::*;
use indexmap::{IndexMap, IndexSet};
use std::iter::FromIterator;

// FIXME TODO make all labels one of Parameter(i), Temporary(i), or Return(i) instead of S0, A1, etc

// TODO use these to model stacks and merging logic, converge on ExitStack after minimizing loops
// once there's full coverage of all/most functions, can refactor GbIr generation to do explicit
// loads (for example).
// can also do function inlining. Splice in Pax Ir, readjust JumpIf0 targets
// and rename temporaries / converge arguments / convert return values. If inlining works do auto
// inline for up to N opcodes (determined from stack vector) and see if there is speed improvement
// or,
// recursively solve call ependencies to correct local stacks

/// (opcode, data registers, return registers, temp register)
pub type Analyzed<T> = (T, Vec<String>, Vec<String>, Option<String>);

pub type BlockSpan = Vec<Analyzed<Located<SuperPax>>>;

pub type DataRegs = Vec<String>;

#[derive(Debug, Clone)]
pub enum Block {
  // (Vec of dataflow analyzed/position-based commands, data stack registers, global registers analysis.)
  ExitBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
  JumpIf0Block(BlockSpan, DataRegs, IndexMap<String, StackItem>),
  BranchTargetBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
  CallBlock(BlockSpan, DataRegs, IndexMap<String, StackItem>),
}

impl Block {
  fn commands(&'_ self) -> &'_ BlockSpan {
    match self {
      Block::ExitBlock(ref commands, ..) => commands,
      Block::JumpIf0Block(ref commands, ..) => commands,
      Block::BranchTargetBlock(ref commands, ..) => commands,
      Block::CallBlock(ref commands, ..) => commands,
    }
  }

  fn registers(&'_ self) -> &'_ IndexMap<String, StackItem> {
    match self {
      Block::ExitBlock(.., ref regs) => regs,
      Block::JumpIf0Block(.., ref regs) => regs,
      Block::BranchTargetBlock(.., ref regs) => regs,
      Block::CallBlock(.., ref regs) => regs,
    }
  }

  fn enter_stack(&self) -> DataRegs {
    match self {
      Block::ExitBlock(_, ref start_stack, _) => start_stack.clone(),
      Block::JumpIf0Block(_, ref start_stack, _) => start_stack.clone(),
      Block::BranchTargetBlock(_, ref start_stack, _) => start_stack.clone(),
      Block::CallBlock(_, ref start_stack, _) => start_stack.clone(),
    }
  }

  fn exit_stack(&self) -> Option<Vec<String>> {
    self.commands().last().map(|a| a.1.clone())
  }
}

#[derive(Debug, Clone)]
struct StackGroup {
  index: usize,
  data_stack: Vec<String>,
  return_stack: Vec<String>,
  temp: Option<String>,
  values: IndexMap<String, StackItem>,
  current_block: BlockSpan,
  blocks: Vec<Block>,
  start_stack: Vec<String>,
}

#[derive(Debug, Clone)]
pub struct StackItem {
  id: String,
  ancestors: IndexSet<String>,
  literal: Option<isize>,
}

impl StackGroup {
  fn new() -> StackGroup {
    StackGroup {
      index: 0,
      data_stack: vec![],
      return_stack: vec![],
      temp: None,
      values: IndexMap::new(),
      current_block: vec![],
      blocks: vec![],
      start_stack: vec![],
    }
  }

  fn record_op(&mut self, op: &Located<SuperPax>) {
    self.current_block.push((
      op.to_owned(),
      self.data_stack.clone(),
      self.return_stack.clone(),
      self.temp.clone(),
    ));
  }

  fn drop_last_op(&mut self) {
    self.current_block.pop();
  }

  fn exit_block(&mut self) {
    self.blocks.push(Block::ExitBlock(
      self.current_block.clone(),
      self.start_stack.clone(),
      self.values.clone(),
    ));
    self.reset();
  }

  fn jump_if_0_block(&mut self) {
    self.blocks.push(Block::JumpIf0Block(
      self.current_block.clone(),
      self.start_stack.clone(),
      self.values.clone(),
    ));
    self.reset();
  }

  fn branch_target_block(&mut self) {
    self.blocks.push(Block::BranchTargetBlock(
      self.current_block.clone(),
      self.start_stack.clone(),
      self.values.clone(),
    ));
    self.reset();
  }

  fn call_block(&mut self) {
    self.blocks.push(Block::CallBlock(
      self.current_block.clone(),
      self.start_stack.clone(),
      self.values.clone(),
    ));
    self.reset();
  }

  fn reset(&mut self) {
    // self.index = 0;
    self.data_stack = vec![];
    self.return_stack = vec![];
    self.values = IndexMap::new();
    self.current_block = vec![];
    self.start_stack = vec![];
  }

  fn push_literal(&mut self, value: isize) -> String {
    let target = format!("L{}", self.index);
    self.index += 1;

    self.data_stack.push(target.clone());
    self.values.insert(
      target.clone(),
      StackItem {
        id: target.clone(),
        ancestors: IndexSet::new(),
        literal: Some(value),
      },
    );
    target
  }

  fn push_data(&mut self, ancestors: &[String]) {
    let value = format!("T{}", self.index);
    self.index += 1;

    self.data_stack.push(value.clone());
    self.values.insert(
      value.clone(),
      StackItem {
        id: value.clone(),
        ancestors: IndexSet::from_iter(ancestors.to_owned().into_iter()),
        literal: None,
      },
    );
  }

  fn push_return_stack(&mut self) -> String {
    let reg = self.pop_data(false);
    self.return_stack.push(reg.clone());
    reg
  }

  fn pop_return_stack(&mut self) -> String {
    let ret = if let Some(ret) = self.return_stack.pop() {
      ret
    } else {
      let value = format!("R{}", self.index);
      self.index += 1;

      // TODO insertion
      for command in &mut self.current_block {
        command.2.insert(0, value.clone());
      }

      self.values.insert(
        value.clone(),
        StackItem {
          id: value.clone(),
          ancestors: IndexSet::new(),
          literal: None,
        },
      );
      value
    };
    self.data_stack.push(ret.clone());
    ret
  }

  fn pop_data(&mut self, stored: bool) -> String {
    // If there is a register on the data stack, pop it.
    if let Some(value) = self.data_stack.pop() {
      let mut iter = vec![value.clone()];

      if stored {
        while let Some(iter_value) = iter.pop() {
          let value_item = self.values.get_mut(&iter_value).unwrap();
          iter.extend(value_item.ancestors.clone());
        }
      }

      value
    } else {
      // Otherwise, create a new argument and inject it.
      let value = format!("D{}", self.index);
      self.index += 1;

      // TODO insertion
      self.start_stack.insert(0, value.clone());
      for command in &mut self.current_block {
        command.1.insert(0, value.clone());
      }

      self.values.insert(
        value.clone(),
        StackItem {
          id: value.clone(),
          ancestors: IndexSet::new(),
          literal: None,
        },
      );
      value
    }
  }

  fn load_temp(&mut self) -> (String, String) {
    let target = self.temp.clone().unwrap();
    self.data_stack.push(target.clone());

    // Bump temporary counter
    let next_target = format!("{}{}", &self.temp.as_ref().unwrap()[0..1], self.index);
    self.temp = Some(next_target.clone());
    self.index += 1;
    let mut stack_item = self.values.get(&target).unwrap().clone();
    stack_item.id = next_target.clone();
    self.values.insert(next_target.clone(), stack_item);
    (target, next_target)
  }

  fn store_temp(&mut self) -> String {
    let ret = self.pop_data(false);
    self.temp = Some(ret.clone());
    ret
  }
}

// Extends the regular Pax IR with some simple opcodes that
// are more practical for refactoring—might be worth formalizing
// since they're just supersets of lower protocol, or not
#[derive(Debug, PartialEq, Clone)]
pub enum SuperPax {
  Pax(Pax),
  Drop,

  BranchTarget(usize),

  // PushLiteral(temp reg pushed to stack, value)
  PushLiteral(String, isize),

  // AltPop(register that was popped)
  AltPop(String),
  // AltPush(register that was pushed)
  AltPush(String),
  // LoadTemp(temp reg pushed to data stack, upserted temp reg)
  LoadTemp(String, String),
  // StoreTemp(data reg stored in temp, upserted temp reg)
  StoreTemp(String),
}

// first: literal -> see if used,
//     if added to (become temporary), check if temporary is dropped (default true?)
//     else if stored to temp...

// or, walk backward from last stack position and use, and only recover it when needed

pub type SuperSpan = Vec<Located<SuperPax>>;

fn propagate_constants(program: Program) {
  // First we want to analyze the whole program and identify basic blocks.
  let mut program_stacks = IndexMap::new();
  for (name, code) in program {
    let mut stack = StackGroup::new();

    // Create dataflow analysis
    let mut code_iter = code.iter().enumerate().peekable();
    while let Some((i, op)) = code_iter.next() {
      match op.0 {
        Pax::PushLiteral(value) => {
          // Temp values
          if value == 49216 {
            // SuperPax::LoadTemp
            if let Some((_, &(Pax::Load, _))) = code_iter.peek() {
              let (target, next_target) = stack.load_temp();
              stack.record_op(&(SuperPax::LoadTemp(target, next_target), op.1.clone()));

              code_iter.next();
              continue;
            }
            // SuperPax::StoreTemp
            if let Some((_, &(Pax::Store, _))) = code_iter.peek() {
              let reg = stack.store_temp();
              stack.record_op(&(SuperPax::StoreTemp(reg), op.1.clone()));

              code_iter.next();
              continue;
            }
          }
        }
        Pax::JumpIf0(target) => {
          // SuperPax::Drop
          if let Some((_, &(Pax::BranchTarget, _))) = code_iter.peek() {
            if target == i + 1 {
              stack.pop_data(false);
              stack.record_op(&(SuperPax::Drop, op.1.clone()));

              code_iter.next();
              continue;
            }
          }
        }
        _ => {}
      }

      // eprintln!("{:?}", op.0);
      match op.0 {
        Pax::PushLiteral(value) => {
          let target = stack.push_literal(value);
          stack.record_op(&(SuperPax::PushLiteral(target, value), op.1.clone()));
          continue;
        }
        Pax::BranchTarget => {
          // FIXME this should inline the block number, not the opcode number
          stack.record_op(&(SuperPax::BranchTarget(i), op.1.clone()));
          stack.branch_target_block();
          continue;
        }

        Pax::Metadata(_) | Pax::Debugger => {
          // noop
        }
        Pax::Sleep | Pax::Print => {
          stack.pop_data(true);
        }
        Pax::AltPush => {
          let reg = stack.push_return_stack();
          stack.record_op(&(SuperPax::AltPush(reg), op.1.clone()));
          continue;
        }
        Pax::AltPop => {
          let reg = stack.pop_return_stack();
          stack.record_op(&(SuperPax::AltPop(reg), op.1.clone()));
          continue;
        }
        Pax::Load | Pax::Load8 => {
          let s0 = stack.pop_data(true);
          stack.push_data(&[s0]);
        }
        Pax::Add | Pax::Nand => {
          let s0 = stack.pop_data(false);
          let s1 = stack.pop_data(false);
          stack.push_data(&[s0, s1]);
        }
        Pax::Store | Pax::Store8 => {
          stack.pop_data(false);
          stack.pop_data(true);
        }

        Pax::Exit => {}
        Pax::Call(_) => {}
        Pax::JumpIf0(_target) => {
          stack.pop_data(false);
        }
      }

      // inject
      stack.record_op(&(SuperPax::Pax(op.0.clone()), op.1));

      // close blocks
      match op.0 {
        Pax::Exit => stack.exit_block(),
        Pax::Call(_) => stack.call_block(),
        Pax::JumpIf0(_target) => stack.jump_if_0_block(),
        _ => {}
      }

      // eprintln!(" ... [stack: {:?}]", stack.stack);
    }

    let mut jump_targets = IndexMap::new();
    let mut branch_targets = IndexMap::new();
    for block in &stack.blocks {
      for op in block.commands() {
        match op.0 {
          (SuperPax::BranchTarget(target), _pos) => {
            branch_targets.insert(target, op.1.clone());
          }
          (SuperPax::Pax(Pax::JumpIf0(target)), _pos) => {
            jump_targets.insert(target, op.1.clone());
          }
          _ => {}
        }
      }
    }
    // Uncomment if can merge keys set to IndexSet
    // assert!(jump_targets.is_subset(&branch_targets), "jump to non-branch targets");

    eprintln!("----> jump:   {:?}", jump_targets);
    eprintln!("      branch: {:?}", branch_targets);

    // stack.reset();
    program_stacks.insert(name, stack.blocks);

    // program_stacks.get_mut(&name).unwrap().push(stack);
    // eprintln!("{:?}", program_stacks.get(&name));
  }

  // NOTE debug values
  for (name, stack_blocks) in &program_stacks {
    if name != "main" {
      continue;
    }

    for block in &stack_blocks[0..3] {
      let mut reg_blacklist = IndexSet::new();

      let mut command_count = 0;
      let new_commands = block
        .commands()
        .iter()
        .rev()
        .map(|command| {
          // eprintln!("{:?}\n----> {:?}", command.0, reg_blacklist);
          let mut result = (command.0).0.clone();

          match &result {
            SuperPax::LoadTemp(reg, _next_reg) if reg_blacklist.contains(reg) => {
              return None;
            }
            SuperPax::AltPush(reg) if reg_blacklist.contains(reg) => {
              return None;
            }
            SuperPax::AltPop(reg) if reg_blacklist.contains(reg) => {
              return None;
            }
            SuperPax::PushLiteral(reg, _) if reg_blacklist.contains(reg) => {
              return None;
            }
            SuperPax::StoreTemp(reg) if reg_blacklist.contains(reg) => {
              return None;
            }
            _ => {}
          }

          if command
            .1
            .last()
            .map(|reg| reg.starts_with("L"))
            .unwrap_or(false)
          {
            let reg = command.1.last().unwrap().clone();
            if let Some(StackItem {
              literal: Some(lit), ..
            }) = block.registers().get(&reg)
            {
              // eprintln!("      ^-> {:?} <= {:?}", reg.clone(), lit);
              match &result {
                SuperPax::AltPop(target_reg) if reg == *target_reg => {
                  reg_blacklist.insert(target_reg.clone());
                  result = SuperPax::PushLiteral(target_reg.clone(), *lit);
                }
                SuperPax::LoadTemp(target_reg, _next_reg) if reg == *target_reg => {
                  reg_blacklist.insert(target_reg.clone());
                  result = SuperPax::PushLiteral(target_reg.clone(), *lit);
                }
                _ => {}
              }
            }
          }

          Some(result)
        })
        .collect::<Vec<_>>()
        .into_iter()
        .rev()
        .collect::<Vec<_>>();

      for command in new_commands {
        eprintln!("    {:?}", command,);
        command_count += 1;
      }

      eprintln!(
        "\n  {} entries out of {}.\n  ---",
        command_count,
        block.commands().len(),
      );
    }

    eprintln!("{}:", name);
    for (i, block) in stack_blocks[0..11].iter().enumerate() {
      eprintln!("block[{}]", i);
      for command in block.commands() {
        eprintln!("    {:?}:", (command.0).0,);
        eprintln!("                        data: {:?}", command.1,);
        eprintln!("                        retn: {:?}", command.2,);
        eprintln!(
          "                        temp: {}",
          command.3.clone().unwrap_or("".to_string()),
        );
        eprintln!();
      }
      eprintln!("\n  {} entries.\n  ---", block.commands().len(),);
    }
  }
  eprintln!();
  eprintln!();
  eprintln!();
  eprintln!();
  eprintln!();
  eprintln!();

  // TODO could rewrite argument detection structure to be its own pass
  // instead of computing in flow analysis below; arg count is static for whole fn

  // TODO this implements a dataflow iterator that walks over blocks in the graph and
  // queues branching statements (nonzero path) for later.
  for (name, stack_blocks) in &program_stacks {
    if name != "main" {
      continue;
    }

    {
      // List of blocks we've already seen, so
      let mut visited = IndexSet::new();

      // Starting conditions. Each block flow starts (originally from 0) at a block
      // and continues until we hit a "visited" block, or a terminating "exit" block.
      let mut conditions = std::collections::VecDeque::<usize>::new();
      conditions.push_front(0);

      // Rewrite map.
      // let mut rewrite_regs = IndexMap::new();

      while let Some(cond) = conditions.pop_back() {
        // Cache the stack of the previous block execution.
        let mut previous_block: Option<DataRegs> = None;

        // We iterate through blocks using an index.
        let mut i = cond;
        'block: while i < stack_blocks.len() {
          let block: &Block = &stack_blocks[i];

          if visited.contains(&i) {
            println!("unified[{}], ending block search.", i);
            break;
          }

          println!("block[{}]", i);

          // Check if we can merge stack with previous block.
          let truncated = if let Some(ref previous_exit_stack) = previous_block {
            // println!("merge? with previous block: {:?}", last);
            // println!("                   current: {:?}", block.enter_stack());

            // Get the exit stack from the previous block and truncate it with the enter stack of this one.
            let next_enter_stack = block.enter_stack();
            let truncated = previous_exit_stack
              .clone()
              .into_iter()
              .rev()
              .skip(next_enter_stack.len())
              .rev()
              .collect::<DataRegs>();

            // Add overlapping registers to rewrite map.
            // if next_enter_stack.len() <= previous_exit_stack.len() {
            //     for (next_reg, prev_reg) in next_enter_stack
            //         .iter()
            //         .zip(previous_exit_stack.iter().skip(truncated.len()))
            //     {
            //         rewrite_regs.insert(next_reg.to_owned(), prev_reg.to_owned());
            //     }
            // }

            // let mut trunc2 = truncated.clone();
            // trunc2.extend(next_enter_stack);
            // println!("                    merged: {:?}", trunc2);

            // FIXME propagate registers literal values from previous block into this one
            // create a rewrite map for all registers here on out.
            // replace all registers when printing with it.
            // more importantly use that register literal information for optimization targets.
            // make compatible with literal propagation over branches though.
            // then can be used to optimize whole functions.

            truncated
          } else {
            vec![]
          };

          // `truncated` is now our base stack and we can append all regsets to it.
          let rewrite_stack = |append_stack: &[String]| {
            let mut trunc2 = truncated.clone();
            trunc2.extend(append_stack.to_owned());
            trunc2
            // let trunc3 = trunc2
            //     .into_iter()
            //     .map(|x| rewrite_regs.get(&x).unwrap_or(&x).to_owned())
            //     .collect::<DataRegs>();
            // trunc3
          };

          // Print out all stacks and interleaving commands.
          println!("    {:?}", rewrite_stack(&block.enter_stack()));
          for command in block.commands() {
            println!("  {:?}\n    {:?}", (command.0).0, rewrite_stack(&command.1));
          }
          visited.insert(i);

          // Determine what the next block target is going to be.
          match block.commands().last() {
            Some(((SuperPax::BranchTarget(_target), ..), ..)) => {
              // Only stop if flag is passed in saying to stop.
            }
            Some(((SuperPax::Pax(Pax::JumpIf0(target)), ..), ..)) => {
              // noop
              // let commands = blocks[i].commands();
              let mut is_absolute = false;
              if block.commands().len() > 1 {
                if let Some(((SuperPax::PushLiteral(.., 0), ..), ..)) =
                  block.commands().get(block.commands().len() - 2)
                {
                  is_absolute = true;
                }
              }

              // Jump immediate
              for (b_index, b) in stack_blocks.iter().enumerate() {
                if let Some(((SuperPax::BranchTarget(bt), ..), ..)) = b.commands().last() {
                  if bt == target {
                    // Invoke branch as though we jumped (nonzero).
                    // b_index + 1 is the block following the BranchTarget we're jumping to.
                    if is_absolute {
                      i = b_index + 1;
                      println!("  absolute jump: {:?}", i);
                      continue 'block;
                    } else {
                      // only iterate future branches, not reverse ones (which are loops)
                      if b_index + 1 > i {
                        conditions.push_front(b_index + 1);
                      }
                    }
                  }
                }
              }
            }
            _ => {}
          }

          // Cache stack of previous block.
          let previous_block_stack = block.exit_stack().unwrap_or(vec![]);
          previous_block = Some(rewrite_stack(&previous_block_stack));

          i += 1;
          println!();
        }
        println!("next cond.\n");
      }
    }

    // eprintln!("{}:", name);
    // for block in stack_blocks {
    //     for command in block.commands() {
    //         eprintln!(
    //             "    {:?}:",
    //             (command.0).0,
    //         );
    //         eprintln!(
    //             "                        data: {:?}",
    //             command.1,
    //         );
    //         eprintln!(
    //             "                        retn: {:?}",
    //             command.2,
    //         );
    //         eprintln!(
    //             "                        temp: {}",
    //             command.3.clone().unwrap_or("".to_string()),
    //         );
    //         eprintln!();
    //     }
    //     eprintln!(
    //         "\n  {} entries.\n  ---",
    //         block.commands().len(),
    //     );
    // }
  }
}

pub fn optimize_forth(program: Program) {
  propagate_constants(program);
}
