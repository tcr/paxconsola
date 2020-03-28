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

    let source_program =
        parse_to_superpax(code, Some(arg_file.to_string_lossy().to_string().as_str()));
    // TODO parse_to_superpax

    match args.cmd {
        Command::Inlineup { .. } => {
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
            let result = cross_compile_forth_gb(source_program);
            println!("{}", result);
        }
        Command::CompileC64 { .. } => {
            let mut program = source_program.clone();
            inline_into_function(&mut program, "main");
            let result = cross_compile_forth_c64(program);
            println!("{}", result);
        }

        Command::Optimize { .. } => {
            optimize_forth(source_program);
        }

        Command::Dump { .. } => {
            for (name, code) in source_program {
                println!("[function {:?}]", name);
                dump_blocks(&code);
                println!();
            }
        }

        // Run the program directly
        Command::Run { .. } => {
            let mut program = source_program.clone();
            inline_into_function(&mut program, "main");

            // optimize_function(&mut program, "main");

            let wasm = eval_forth(&program);
            paxconsola::eval::run_wasm(&wasm);
        }
    }

    Ok(())
}
