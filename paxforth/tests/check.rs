use glob::glob;
use paxforth::targets::wasm::*;
use paxforth::*;
use regex::Regex;
use std::path::PathBuf;

struct CheckTest {
    path: PathBuf,
    contents: String,
    expected: Vec<String>,
}

/// Load tests from "check" directory.
fn get_check_tests() -> Vec<CheckTest> {
    // Regex for (checks X) header.
    let re_check = Regex::new(r"\(\s*@check\s+([^)]+?)\s*\)").unwrap();

    // Load the tests from the "check" directory.
    let check_tests = glob("tests/check/*.fs")
        .expect("no examples!")
        .into_iter()
        .collect::<Vec<_>>();

    check_tests
        .into_iter()
        .map(|entry| {
            let path = entry.unwrap();
            let contents = std::fs::read_to_string(&path).unwrap();

            if !re_check.is_match(&contents) {
                panic!(
                    "[forth] no check directive found for file {}",
                    path.display()
                );
            }
            let captures = re_check.captures(&contents).unwrap();
            let expected = captures[1]
                .split_whitespace()
                .map(|x| x.to_string())
                .collect::<Vec<_>>();

            CheckTest {
                path,
                contents,
                expected,
            }
        })
        .collect::<Vec<_>>()
}

#[test]
fn test_all_in_check_directory() {
    let check_tests = get_check_tests();
    if check_tests.is_empty() {
        panic!("error: found 0 tests!");
    }

    // Iterate through each test.
    let mut failed = 0;
    for test in check_tests {
        eprintln!("[forth] evaluating '{}'", test.path.display());

        // Parse the program.
        let mut program = parse_to_pax(&test.contents, Some(&test.path.display().to_string()));

        // Main must be inlined before evaluating in WebAssembly.
        // inline_into_function(&mut program, "main");

        // TODO
        // optimize_function(&mut program, "main");

        // Run the binary in WASM.
        let wasm = WasmForthCompiler::compile_binary(&program);
        let buffer = run_wasm(&wasm, true).expect("failed execution");

        // Parse output from "print" statements.
        let buffer_string = String::from_utf8_lossy(&buffer).to_string();
        let found = buffer_string.split_whitespace().collect::<Vec<_>>();

        // Compare output to expected values.
        eprintln!("[forth] expected: {:?}", test.expected);
        eprintln!("[forth]   output: {:?}", found);

        if test.expected != found {
            eprintln!("[forth] FAILED.");
            failed += 1;
        } else {
            eprintln!("[forth] SUCCESS!");
        }
    }

    if failed != 0 {
        eprintln!("[forth] failed {} tests.", failed);
    }
    assert_eq!(failed, 0, "failed more than 0 tests");
}
