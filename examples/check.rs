use glob::glob;
use regex::Regex;
use std::process::Command;

fn main() {
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
        
        let cmd = Command::new("cargo")
            .arg("run")
            .arg("--")
            .arg(path)
            .output()
            .expect("failed to execute process");
        
        let output = String::from_utf8_lossy(&cmd.stdout).trim().to_string();
        let found = output.split_whitespace().collect::<Vec<_>>();
        eprintln!("[forth] expected: {:?}", expected);
        eprintln!("[forth]   output: {:?}", found);
        if expected != found {
            eprintln!("[forth] FAILED");
            failed += 1;
        }
    }

    if failed != 0 {
        eprintln!("[forth] failed {} tests.", failed);
        std::process::exit(1);
    }
}
