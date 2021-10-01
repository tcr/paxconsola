#![recursion_limit = "4096"]

pub mod ui;
pub mod workers;

use js_sys::Uint8Array;
use paxforth::*;
use serde::*;

#[derive(Serialize, Deserialize, Debug)]
pub enum Request {
    Question(Vec<u8>, ExecutionTarget),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum Response {
    Answer(PaxProgram, ExecutionTarget),
    CompilationError(String),
}

#[derive(Serialize, Deserialize, Debug)]
pub enum ExecutionTarget {
    Debug,
    Gameboy,
    Wasm,
}

pub enum Msg {
    Click,
    ChangeInput(String),
    Reset(String),
    // Inline(String),
    // InlineAndOptimize(String),
    ShowMethod(String),
    RunInput,
    CompileResult(PaxProgram, ExecutionTarget),
    CompilationError(String),
    NextTick(Uint8Array),
    GameStop,
    OnFocus,
    OnBlur,
    InputChange(usize),
    CompileGameboy,
    OnGameboyFocus,
    OnGameboyBlur,
}
