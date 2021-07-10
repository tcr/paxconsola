use paxforth::*;
use std::path::PathBuf;
use structopt::StructOpt;

use crate::check::*;
use crate::debug::*;
use crate::targets::c64::*;
use crate::targets::gb::*;
use crate::targets::tom1::*;
use crate::targets::wasm::*;
use crate::targets::*;

#[derive(StructOpt, Debug)]
#[structopt(name = "paxforth")]
struct Args {
    #[structopt(subcommand)]
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
        #[structopt(long, parse(try_from_str=parse_target))]
        target: Target,
    },

    // Optimize {
    //     #[structopt(flatten)]
    //     file: FileOpts,
    // },
    Check {
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

    Debug {
        #[structopt(flatten)]
        file: FileOpts,
    },
}

#[derive(StructOpt, Debug)]
struct FileOpts {
    #[structopt(name = "FILE", parse(from_os_str))]
    file: PathBuf,

    /// Inline all functions into main.
    #[structopt(long)]
    inline: bool,

    /// Optimize all functions.
    #[structopt(long)]
    optimize: bool,
}

#[paw::main]
fn main(args: Args) -> Result<(), std::io::Error> {
    // Extract file
    let file_opts = match &args.cmd {
        Command::Compile { file, .. } |
        // Command::Optimize { file, .. } => file.file.to_owned(),
        Command::Dump { file, .. } |
        Command::Check { file, .. } |
        Command::Run { file, .. } |
        Command::Inlineup { file, .. } |
        Command::Debug { file, .. } => file,
    };

    // Extract inline
    let arg_file = file_opts.file.to_owned();
    let arg_inline = file_opts.inline;
    let arg_optimize = file_opts.optimize;

    // Read the file into a Vec<u8>
    let code = std::fs::read_to_string(&arg_file).expect("could not read file");
    let mut source_program =
        parse_to_pax(&code, Some(arg_file.to_string_lossy().to_string().as_str()));

    // Inline arguments.
    if arg_inline {
        inline_into_function(&mut source_program, "main");
    }
    if arg_optimize {
        let main_opt = propagate_registers(&source_program, "main");
        source_program.remove("main");
        source_program.insert("main".to_string(), main_opt);
        // strip_branches(&mut source_program, "main");
    }

    // Strip unneeded values from source_program.
    strip(&mut source_program);

    match args.cmd {
        Command::Compile { target, .. } => match target {
            Target::Commodore64 => {
                let mut program = source_program.clone();
                inline_into_function(&mut program, "main");
                let result = C64ForthCompiler::compile(&program);
                println!("{}", &result);
            }
            Target::Gameboy => {
                let result = GameboyForthCompiler::compile(&source_program);
                println!("{}", &result);
            }
            Target::WebAssembly => {
                let result = WasmForthCompiler::compile(&source_program);
                println!("{}", &result);
            }
            Target::TOM => {
                let mut program = source_program.clone();
                inline_into_function(&mut program, "main");
                let result = Tom1ForthCompiler::compile(&program);
                println!("{}", &result);
            }
        },

        // Command::Optimize { .. } => {
        //     optimize_forth(source_program);
        // }
        Command::Dump { .. } => {
            dump_program(&source_program);
        }

        // Check the program output
        Command::Check { .. } => {
            if !check_program(&code, &source_program, CheckMode::Wasm) {
                std::process::exit(1);
            }
        }

        // Run the program directly
        Command::Run { .. } => {
            let wasm = WasmForthCompiler::compile_binary(&source_program);
            run_wasm(&wasm, false).expect("run_wasm failed");
        }

        Command::Debug { .. } => {
            if !debug_program(&code, &source_program) {
                std::process::exit(1);
            }
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
                // optimize_function(&mut program, name);

                // eprintln!("----------> WHAT");
                // dump_blocks(program.get("main").unwrap());

                inline_into_function(&mut program, "main");

                // FIXME allow optimization in main after independent optimization!
                // optimize_function(&mut program, "main");

                let wasm = WasmForthCompiler::compile_binary(&program);
                run_wasm(&wasm, false).unwrap();
                // break;
                println!();
            }

            println!("\ndone.");
        }
    }

    Ok(())
}
