pub use self::graph::*;
pub use self::inline::*;
pub use self::strip::*;

pub mod analyze;
pub mod constants;
pub mod dead_code;
pub mod graph;
pub mod inline;
pub mod optimize;
pub mod strip;
pub mod walker;
