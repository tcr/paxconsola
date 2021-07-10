use glob::glob;
use paxforth::check::*;
use paxforth::*;
use std::path::PathBuf;

#[derive(Clone)]
struct CheckTest {
    path: PathBuf,
    contents: String,
}

/// Load tests from "check" directory.
fn get_check_tests() -> Vec<CheckTest> {
    // Load the tests from the "check" directory.
    let check_tests = glob("tests/check/*.fth")
        .expect("no examples!")
        .into_iter()
        .collect::<Vec<_>>();

    check_tests
        .into_iter()
        .map(|entry| {
            let path = entry.unwrap();
            let contents = std::fs::read_to_string(&path).unwrap();

            CheckTest { path, contents }
        })
        .collect::<Vec<_>>()
}

fn run_check_tests(check_mode: CheckMode, inline: bool) {
    let check_tests = get_check_tests();
    if check_tests.is_empty() {
        panic!("error: found 0 tests!");
    }

    // Iterate through each test.
    let mut failed = 0;
    for test in check_tests {
        eprintln!(
            "[forth] evaluating '{}' (inline: {})",
            test.path.display(),
            inline
        );

        // Parse the program.
        let mut program = parse_to_pax(&test.contents, Some(&test.path.display().to_string()));

        if inline {
            inline_into_function(&mut program, "main");
        }

        // TODO
        // if optimize {
        //     optimize_function(&mut program, "main");
        // }

        // Run the binary in WASM.
        if !check_program(&test.contents, &program, check_mode.clone()) {
            // Negative test in "fail.fth"
            if test.path.file_name().unwrap() == "fail.fth" {
                eprintln!("[forth] Skipping negative test 'fail.fth'");
            } else {
                failed += 1;
            }
        }
    }

    if failed != 0 {
        eprintln!("[forth] failed {} tests.", failed);
    }
    assert_eq!(failed, 0, "failed more than 0 tests");
}

#[test]
fn test_all_in_check_directory_wasm() {
    run_check_tests(CheckMode::Wasm, false);
}

#[test]
fn test_all_in_check_directory_wasm_inlined() {
    run_check_tests(CheckMode::Wasm, true);
}

#[test]
fn test_all_in_check_directory_interpreter() {
    run_check_tests(CheckMode::Interpreter, false);
}

#[test]
fn test_all_in_check_directory_interpreter_inlined() {
    run_check_tests(CheckMode::Interpreter, true);
}
