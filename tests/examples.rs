use glob::glob;
use paxconsola::*;
use regex::Regex;

#[test]
fn test_all_forth_xamples() {
  let re_check = Regex::new(r"^\(\s*check\s+([^)]+?)\s*\)").unwrap();

  let mut failed = 0;
  for entry in glob("examples/*.fs").expect("no examples!") {
    let path = entry.unwrap();
    eprintln!("[forth] evaluating '{}'", path.display());

    let contents = std::fs::read_to_string(&path).unwrap();
    if !re_check.is_match(&contents) {
      eprintln!("[forth] no check directive found");
      continue;
    }
    let captures = re_check.captures(&contents).unwrap();
    let expected = captures[1].split_whitespace().collect::<Vec<_>>();

    let buffer = {
      // Main must be inlined before evaluating in WebAssembly.
      let mut program = parse_to_superpax(
        contents.as_bytes().to_owned(),
        Some(&path.display().to_string()),
      );
      inline_into_function(&mut program, "main");
      // optimize_function(&mut program, "main");
      let wasm = cross_compile_forth_wasm(&program);
      run_wasm(&wasm, true).expect("failed execution")
    };

    let buffer_string = String::from_utf8_lossy(&buffer).to_string();
    let found = buffer_string.split_whitespace().collect::<Vec<_>>();
    eprintln!("[forth] expected: {:?}", expected);
    eprintln!("[forth]   output: {:?}", found);
    if expected != found {
      eprintln!("[forth] FAILED");
      failed += 1;
    }
  }

  if failed != 0 {
    eprintln!("[forth] failed {} tests.", failed);
  }
  assert_eq!(failed, 0, "failed more than 0 tests");
}
