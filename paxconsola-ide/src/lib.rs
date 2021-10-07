#![recursion_limit = "4096"]

pub mod ui;
pub mod workers;

use js_sys::Uint8Array;
use paxforth::*;
use serde::*;
use std::collections::HashMap;

#[derive(Serialize, Deserialize, Debug)]
pub enum Request {
    PaxForthCompile(String, CurrentTarget),

    RgbasmCompile(HashMap<String, Vec<u8>>),
    RgblinkCompile(HashMap<String, Vec<u8>>),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Response {
    Answer(PaxProgram, ExecutionTarget),
    CompilationError(String),
    GameboyBinary(Vec<u8>),

    PaxForthCompilerResult(Result<String, String>, CurrentTarget),

    RgbasmCompilerResult(Result<HashMap<String, Vec<u8>>, usize>),
    RgblinkCompilerResult(Result<HashMap<String, Vec<u8>>, usize>),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum ExecutionTarget {
    Debug,
    Gameboy,
    Wasm,
}

#[derive(Serialize, Deserialize, Debug, Copy, Clone)]
pub enum CurrentTarget {
    None,
    Gameboy,
    Dos,
    Commodore64,
}
