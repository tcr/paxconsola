#![allow(dead_code)]

pub use self::graph::*;
pub use self::inline::*;
pub use self::reduce_branches::*;
pub use self::util::*;
use crate::*;
use indexmap::IndexMap;
use petgraph::Direction;

pub mod graph;
pub mod inline;
pub mod reduce_branches;
pub mod util;
