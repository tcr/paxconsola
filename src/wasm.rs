#[cfg(feature = "wasm3")]
pub mod wasm3;
#[cfg(feature = "wasm3")]
pub use self::wasm3::*;

#[cfg(feature = "wasmi")]
pub mod wasmi;
#[cfg(feature = "wasmi")]
pub use self::wasmi::*;

#[cfg(feature = "stdweb")]
pub mod stdweb;
#[cfg(feature = "stdweb")]
pub use self::stdweb::*;

#[cfg(feature = "wasmtime")]
pub mod wasmtime;
#[cfg(feature = "wasmtime")]
pub use self::wasmtime::*;
