#![recursion_limit = "1024"]

pub mod analyze;
pub mod compile_c64;
pub mod compile_gb;
pub mod compile_wasm;
pub mod location;
pub mod optimize;
pub mod prelude;
pub mod superpax;
pub mod tokenizer;
pub mod wasm;

pub use analyze::*;
pub use compile_c64::*;
pub use compile_gb::*;
pub use compile_wasm::*;
pub use location::*;
pub use optimize::*;
pub use superpax::*;
pub use tokenizer::*;
