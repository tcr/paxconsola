#![allow(deprecated)]

use derive_more::*;
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

#[derive(Debug, Clone, enum_utils::FromStr, Display)]
enum Target {
    #[enumeration(rename = "wasm")]
    #[display(fmt = "wasm")]
    WebAssembly,
    #[enumeration(rename = "gb")]
    #[display(fmt = "fb")]
    Gameboy,
    #[enumeration(rename = "c64")]
    #[display(fmt = "c64")]
    Commodore64,
}

fn parse_target(value: &str) -> Result<Target, String> {
    std::str::FromStr::from_str(value).map_err(|_| format!("{:?} is not a valid target", value))
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
        #[structopt(long, parse(try_from_str=parse_target))]
        target: Target,
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
        Command::Compile { file, .. } => file.file.to_owned(),
        Command::Optimize { file, .. } => file.file.to_owned(),
        Command::Dump { file, .. } => file.file.to_owned(),
        Command::Run { file, .. } => file.file.to_owned(),
        Command::Inlineup { file, .. } => file.file.to_owned(),
    };

    // Read the file into a Vec<u8>
    let mut file = File::open(&arg_file).unwrap_or_else(|err| panic!("{}", err));
    let mut code = Vec::with_capacity(file.metadata().map(|m| m.len()).unwrap_or(0) as usize);
    file.read_to_end(&mut code)
        .unwrap_or_else(|err| panic!("{}", err));

    // Parse program into Pax.
    let source_program =
        parse_to_superpax(code, Some(arg_file.to_string_lossy().to_string().as_str()));

    match args.cmd {
        Command::Compile { target, .. } => match target {
            Target::Commodore64 => {
                let mut program = source_program.clone();
                inline_into_function(&mut program, "main");
                let result = cross_compile_forth_c64(program);
                println!("{}", result);
            }
            Target::Gameboy => {
                let result = cross_compile_forth_gb(source_program);
                println!("{}", result);
            }
            Target::WebAssembly => {
                todo!("can't compile to wasm and print it yet");
            }
        },

        Command::Optimize { .. } => {
            let mut program = source_program.clone();

            eprintln!("[optimize] dump_blocks");
            dump_blocks(program.get("main").unwrap());
            eprintln!();

            eprintln!("[optimize] reduce_branches(main)");
            reduce_branches(&mut program, "main");
            eprintln!();

            eprintln!("[optimize] dump_blocks");
            dump_blocks(program.get("main").unwrap());
            eprintln!();

            eprintln!("[optimize] inline_into_function(main)");
            inline_into_function(&mut program, "main");
            eprintln!();

            eprintln!("[optimize] reduce_branches(main)");
            reduce_branches(&mut program, "main");
            eprintln!();

            eprintln!("[optimize] optimize_function(main)");
            optimize_function(&mut program, "main");
            eprintln!();

            eprintln!("[optimize] reduce_branches(main)");
            reduce_branches(&mut program, "main");
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
            // Main must be inlined before evaluating in WebAssembly.
            let mut program = source_program.clone();
            inline_into_function(&mut program, "main");
            // optimize_function(&mut program, "main");
            let wasm = cross_compile_forth_wasm(&program);
            run_wasm(&wasm, false).unwrap();
        }

        Command::Inlineup { .. } => {
            let fns = source_program.keys().collect::<Vec<_>>();

            for name in fns.iter() {
                // for name in vec!["myloopimpl"] {
                if *name == "main" || *name == "*" {
                    continue;
                }

                let mut program = source_program.clone();

                // let name = "drop";
                println!("[inlining] fn {:?}", name);

                inline_into_function(&mut program, name);
                optimize_function(&mut program, name);

                // eprintln!("----------> WHAT");
                // dump_blocks(program.get("main").unwrap());

                inline_into_function(&mut program, "main");

                // FIXME allow optimization in main after independent optimization!
                optimize_function(&mut program, "main");

                let wasm = cross_compile_forth_wasm(&program);
                run_wasm(&wasm, false).unwrap();
                // break;
                println!();
            }

            println!("\ndone.");
        }
    }

    Ok(())
}
