#[cfg(feature = "web")]
pub mod stdweb;
#[cfg(feature = "web")]
pub use self::stdweb::*;

#[cfg(not(feature = "web"))]
pub mod wasmtime;
#[cfg(not(feature = "web"))]
pub use self::wasmtime::*;
