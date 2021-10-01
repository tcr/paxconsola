#![recursion_limit = "4096"]

pub mod ui;
pub mod workers;

use workers::*;
use ui::*;

use include_dir::*;
use indexmap::IndexMap;
use paxforth::*;
use paxforth::runner::wasm::*;
use paxforth::targets::wasm::*;
use serde::*;
use std::path::{PathBuf, Path};
use yew::services::interval::*;
use yew::worker::*;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use js_sys::{Uint8Array, Uint16Array};
use yew::{html, MouseEvent, Component, ComponentLink, Html, InputData, ShouldRender};

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
