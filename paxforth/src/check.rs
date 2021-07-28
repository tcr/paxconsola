use crate::debug::*;
use crate::runner::wasm::*;
use crate::targets::wasm::*;
use crate::*;
use lazy_static::*;
use regex::Regex;

#[derive(Copy, Clone)]
pub enum CheckMode {
    Wasm,
    Interpreter,
}

pub fn check_program(
    path: &str,
    code: &str,
    source_program: &PaxProgram,
    check_mode: CheckMode,
) -> bool {
    lazy_static! {
        static ref RE_CHECK: Regex = Regex::new(r"\(\s*@check\s+([^)]+?)\s*\)").unwrap();
    }

    let buffer = match check_mode {
        CheckMode::Wasm => {
            let wat = WasmForthCompiler::compile(&source_program);

            // Run as WASM.
            let wasm = wat::parse_str(&wat).unwrap();
            run_wasm(&wasm, true).expect(&format!("failed execution in {}", path))
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
        eprintln!("[forth] no ( @check _ ) comment to check against.");
        false
    }
}
