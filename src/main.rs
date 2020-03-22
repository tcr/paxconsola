#![allow(deprecated)]

use paxconsola::*;
use std::fs::File;
use std::io::prelude::*;
use std::path::PathBuf;
use structopt::StructOpt;

#[derive(StructOpt, Debug)]
#[structopt(name = "paxconsola")]
struct Args {
    #[structopt(subcommand)] // Note that we mark a field as a subcommand
    cmd: Command,
}

#[derive(StructOpt, Debug)]
enum Command {
    Inlineup {
        #[structopt(flatten)]
        file: FileOpts,
    },

    Compile {
        #[structopt(flatten)]
        file: FileOpts,
    },

    CompileC64 {
        #[structopt(flatten)]
        file: FileOpts,
    },

    Optimize {
        #[structopt(flatten)]
        file: FileOpts,
    },

    Run {
        #[structopt(flatten)]
        file: FileOpts,
    },

    Dump {
        #[structopt(flatten)]
        file: FileOpts,
    },
}

#[derive(StructOpt, Debug)]
struct FileOpts {
    #[structopt(name = "FILE", parse(from_os_str))]
    file: PathBuf,
}

#[paw::main]
fn main(args: Args) -> Result<(), std::io::Error> {
    // Extract file
    let arg_file = match &args.cmd {
        Command::CompileC64 { file, .. } => file.file.to_owned(),
        Command::Compile { file, .. } => file.file.to_owned(),
        Command::Optimize { file, .. } => file.file.to_owned(),
        Command::Dump { file, .. } => file.file.to_owned(),
        Command::Run { file, .. } => file.file.to_owned(),
        Command::Inlineup { file, .. } => file.file.to_owned(),
    };

    let mut file = File::open(&arg_file).unwrap_or_else(|err| panic!("{}", err));
    let mut code = Vec::with_capacity(file.metadata().map(|m| m.len()).unwrap_or(0) as usize);
    file.read_to_end(&mut code)
        .unwrap_or_else(|err| panic!("{}", err));

    let script = parse_forth(code, Some(arg_file.to_string_lossy().to_string().as_str()));
    // TODO parse_to_superpax

    match args.cmd {
        Command::Inlineup { .. } => {
            let source_program = convert_to_superpax(script);

            for name in source_program.keys() {
                // for name in vec!["myloopimpl"] {
                if name == "main" {
                    continue;
                }

                let mut program = source_program.clone();

                // let name = "drop";
                println!("[inlining] fn {:?}", name);

                inline_into_function(&mut program, name);
                optimize_function(&mut program, name);

                eprintln!("----------> WHAT");
                dump_blocks(program.get("main").unwrap());

                inline_into_function(&mut program, "main");
                // optimize_function(&mut program, "main");
                let wasm = eval_forth(&program);
                paxconsola::eval::run_wasm(&wasm);
                // break;
                println!();
            }

            println!("\ndone.");
        }

        Command::Compile { .. } => {
            let program = convert_to_superpax(script);
            let result = cross_compile_forth_gb(program);
            println!("{}", result);
        }
        Command::CompileC64 { .. } => {
            let mut program = convert_to_superpax(script);

            inline_into_function(&mut program, "main");
            let result = cross_compile_forth_c64(program);
            println!("{}", result);
        }
        Command::Optimize { .. } => {
            optimize_forth(script);
        }
        Command::Dump { .. } => {
            for (name, code) in script {
                println!("{:?}:", name);
                for (i, (op, pos)) in code.iter().enumerate() {
                    println!("[{:>3}]  {:?}", i, op);
                    println!("       ; {}:{}", arg_file.to_string_lossy(), pos);
                    println!();
                }
                println!();
            }
        }
        Command::Run { .. } => {
            let mut program = convert_to_superpax(script);

            inline_into_function(&mut program, "main");

            // optimize_function(&mut program, "main");

            let wasm = eval_forth(&program);
            paxconsola::eval::run_wasm(&wasm);
        }
    }

    Ok(())
}
