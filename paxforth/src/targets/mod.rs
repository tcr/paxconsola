pub mod c64;
pub mod gb;
pub mod tom1;
pub mod wasm;

use derive_more::*;

#[derive(Debug, Clone, enum_utils::FromStr, Display)]
pub enum Target {
    #[enumeration(rename = "wasm")]
    #[display(fmt = "wasm")]
    WebAssembly,
    #[enumeration(rename = "gb")]
    #[display(fmt = "gb")]
    Gameboy,
    #[enumeration(rename = "c64")]
    #[display(fmt = "c64")]
    Commodore64,
    #[enumeration(rename = "tom")]
    #[display(fmt = "tom")]
    TOM,
}

pub fn parse_target(value: &str) -> Result<Target, String> {
    std::str::FromStr::from_str(value).map_err(|_| format!("{:?} is not a valid target", value))
}
