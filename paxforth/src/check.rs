use crate::debug::*;
use crate::targets::wasm::*;
use crate::*;
use lazy_static::*;
use regex::Regex;

#[derive(Copy, Clone)]
pub enum CheckMode {
    Wasm,
    Interpreter,
}

pub fn check_program(code: &str, source_program: &PaxProgram, check_mode: CheckMode) -> bool {
    lazy_static! {
        static ref RE_CHECK: Regex = Regex::new(r"\(\s*@check\s+([^)]+?)\s*\)").unwrap();
    }

    let buffer = match check_mode {
        CheckMode::Wasm => {
            let wasm = WasmForthCompiler::compile_binary(&source_program);
            run_wasm(&wasm, true).expect("failed execution")
        }
        CheckMode::Interpreter => debug_program_test(code, source_program),
    };

    // Parse output from "print" statements.
    let buffer_string = String::from_utf8_lossy(&buffer).to_string();
    let found = buffer_string.split_whitespace().collect::<Vec<_>>();

    if RE_CHECK.is_match(&code) {
        let captures = RE_CHECK.captures(&code).unwrap();
        let expected = captures[1].split_whitespace().collect::<Vec<_>>();

        // Compare output to expected values.
        eprintln!("[forth] expected: {:?}", expected);
        eprintln!("[forth]   output: {:?}", found);
        if expected != found {
            eprintln!("[forth] FAILED.");
            false
        } else {
            eprintln!("[forth] SUCCESS!");
            true
        }
    } else {
        eprintln!("[forth] no ( @checks _ ) comment to check against.");
        false
    }
}
