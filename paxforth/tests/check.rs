use glob::glob;
use paxforth::check::*;
use paxforth::*;
use std::path::PathBuf;

#[ctor::ctor]
#[cfg(test)]
fn init() {
    env_logger::init();
}

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

fn run_check_tests(ignore_list: &[&str], check_mode: CheckMode, inline: bool, optimize: bool) {
    let check_tests = get_check_tests();
    if check_tests.is_empty() {
        panic!("error: found 0 tests!");
    }

    // Iterate through each test.
    let mut failed = 0;
    for test in check_tests {
        let test_filename = test.path.file_name().unwrap().to_string_lossy().to_string();
        if ignore_list.contains(&test_filename.as_str()) {
            eprintln!("[forth] IGNORING '{}'", test.path.display());
            continue;
        }

        // if test_filename != "type-simple.fth" {
        //     continue;
        // }

        eprintln!(
            "[forth] evaluating '{}' (inline: {}, optimize: {})",
            test.path.display(),
            inline,
            optimize,
        );

        // Parse the program.
        let mut program = parse_to_pax(&test.contents, Some(&test.path.display().to_string()));

        if inline {
            inline_into_function(&mut program, "main");
        }
        if optimize {
            let main_opt = propagate_registers(&program, "main");
            program.remove("main");
            program.insert("main".to_string(), main_opt);
            // strip_branches(&mut source_program, "main");
        }

        eprintln!("[forth] running '{}'", test.path.display());

        // Run the binary in WASM.
        if !check_program(
            &test.path.display().to_string(),
            &test.contents,
            &program,
            check_mode.clone(),
        ) {
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

static EMPTY_IGNORE_LIST: &[&str] = &[];

static OPT_IGNORE_LIST: &[&str] = &[
    // roll cannot be optimized unless inlined yet
    "roll.fth",
    // crashing tests
    "json-parse.fth",
    "modulus.fth",
    // // failing tests
    // "invert.fth",
    // "loop.fth",
    // "type-simple.fth",
    // "type.fth",
    // "multiply.fth",
    // "loopimpl2.fth",
    // "loopimpl.fth",
    // "loop-do.fth",
];

#[test]
fn test_all_in_check_directory_wasm() {
    run_check_tests(EMPTY_IGNORE_LIST, CheckMode::Wasm, false, false);
}

#[test]
fn test_all_in_check_directory_wasm_inlined() {
    run_check_tests(EMPTY_IGNORE_LIST, CheckMode::Wasm, true, false);
}

#[test]
fn test_all_in_check_directory_interpreter() {
    run_check_tests(EMPTY_IGNORE_LIST, CheckMode::Interpreter, false, false);
}

#[test]
fn test_all_in_check_directory_interpreter_inlined() {
    run_check_tests(EMPTY_IGNORE_LIST, CheckMode::Interpreter, true, false);
}

#[ignore]
#[test]
fn test_all_in_check_directory_optimize() {
    run_check_tests(OPT_IGNORE_LIST, CheckMode::Wasm, true, true);
    run_check_tests(OPT_IGNORE_LIST, CheckMode::Interpreter, true, true);
}
