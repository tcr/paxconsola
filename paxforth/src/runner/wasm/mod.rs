#[cfg(feature = "stdweb")]
pub mod stdweb;
#[cfg(feature = "stdweb")]
pub use self::stdweb::*;

#[cfg(not(feature = "stdweb"))]
pub mod wasmtime;
#[cfg(not(feature = "stdweb"))]
pub use self::wasmtime::*;
