use maplit::hashset;
use paxforth::*;
use std::path::PathBuf;
use structopt::StructOpt;

use crate::check::*;
use crate::debug::*;
use crate::program::optimize;
use crate::program::*;
use crate::runner::wasm::run_wasm;
use crate::targets::c64::*;
use crate::targets::dos::*;
use crate::targets::gb::*;
use crate::targets::parse_target;
use crate::targets::tom1::*;
use crate::targets::wasm::*;
use crate::targets::Target;

#[derive(StructOpt, Debug)]
#[structopt(name = "paxforth")]
struct Args {
    #[structopt(subcommand)]
    cmd: Command,
}

#[derive(StructOpt, Debug)]
enum Command {
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
    env_logger::builder().format_timestamp(None).init();

    // Extract file
    let file_opts = match &args.cmd {
        Command::Compile { file, .. } |
        // Command::Optimize { file, .. } => file.file.to_owned(),
        Command::Dump { file, .. } |
        Command::Check { file, .. } |
        Command::Run { file, .. } |
        Command::Debug { file, .. } => file,
    };

    // Extract inline
    let arg_file = file_opts.file.to_owned();
    let arg_inline = file_opts.inline;
    let arg_optimize = file_opts.optimize;

    // Read the file into a Vec<u8>
    let code = std::fs::read_to_string(&arg_file).expect("could not read file");

    match args.cmd {
        Command::Compile { target, .. } => match target {
            Target::Commodore64 => {
                let mut program = C64ForthCompiler::parse(&code, Some(&arg_file));
                program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                let result = C64ForthCompiler::compile(&program);
                println!("{}", &result);
            }
            Target::Gameboy => {
                let mut program = GameboyForthCompiler::parse(&code, Some(&arg_file));
                program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                let result = GameboyForthCompiler::compile(&program);
                println!("{}", &result);
            }
            Target::WebAssembly => {
                let mut program = WasmForthCompiler::parse(&code, Some(&arg_file));
                program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                let result = WasmForthCompiler::compile(&program);
                println!("{}", &result);
            }
            Target::DOS => {
                let mut program = DosForthCompiler::parse(&code, Some(&arg_file));
                program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                let result = DosForthCompiler::compile(&program);
                println!("{}", &result);
            }
            Target::TOM => {
                let mut program = Tom1ForthCompiler::parse(&code, Some(&arg_file));
                program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
                inline_into_function(&mut program, "main", &hashset! {});
                let result = Tom1ForthCompiler::compile(&program);
                println!("{}", &result);
            }
        },

        Command::Dump { .. } => {
            let mut program = WasmForthCompiler::parse(&code, Some(&arg_file));
            program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
            dump_program(&program);
        }

        // Check the program output
        Command::Check { .. } => {
            let mut program = WasmForthCompiler::parse(&code, Some(&arg_file));
            program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);

            if !check_program(
                &arg_file.display().to_string(),
                &code,
                &program,
                CheckMode::Wasm,
            ) {
                std::process::exit(1);
            }
        }

        // Run the program directly
        Command::Run { .. } => {
            let mut program = WasmForthCompiler::parse(&code, Some(&arg_file));
            program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
            let wat = WasmForthCompiler::compile(&program);

            // Run as WASM.
            let wasm = wat::parse_str(&wat).unwrap();
            run_wasm(&wasm, false).expect("run_wasm failed");
        }

        Command::Debug { .. } => {
            let mut program = WasmForthCompiler::parse(&code, Some(&arg_file));
            program = optimize::optimize_main(program.clone(), arg_inline, arg_optimize);
            if !debug_program(&code, &program) {
                std::process::exit(1);
            }
        }
    }

    Ok(())
}
