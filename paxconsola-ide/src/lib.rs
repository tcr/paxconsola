#![recursion_limit = "4096"]

pub mod ui;
pub mod workers;

use paxforth::*;
use serde::*;
use std::collections::HashMap;

// Engine newtype wrapper (until this is formalized)
#[derive(Serialize, Deserialize, Debug, Clone)]
pub struct Engine(String);

#[derive(Serialize, Deserialize, Debug)]
pub enum Request {
    PaxForthCompile(String, CurrentTarget),

    RgbasmCompile(HashMap<String, Vec<u8>>, Engine),
    RgblinkCompile(HashMap<String, Vec<u8>>, Engine),
    NasmCompile(HashMap<String, Vec<u8>>, Engine),
    Ca65Compile(HashMap<String, Vec<u8>>, Engine),
    Ld65Compile(HashMap<String, Vec<u8>>, Engine),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Response {
    PaxForthCompilerResult(Result<String, String>, CurrentTarget, Engine),

    RgbasmCompilerResult(Result<HashMap<String, Vec<u8>>, usize>, Engine),
    RgblinkCompilerResult(Result<HashMap<String, Vec<u8>>, usize>, Engine),
    NasmCompilerResult(Result<HashMap<String, Vec<u8>>, usize>, Engine),
    Ca65CompilerResult(Result<HashMap<String, Vec<u8>>, usize>, Engine),
    Ld65CompilerResult(Result<HashMap<String, Vec<u8>>, usize>, Engine),
}

#[derive(Serialize, Deserialize, Debug, Copy, Clone)]
pub enum CurrentTarget {
    None,
    Gameboy,
    Dos,
    Commodore64,
}
