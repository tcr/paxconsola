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

    #[structopt(long = "--no-prelude")]
    no_prelude: bool,
}

#[derive(StructOpt, Debug)]
enum Command {
    Compile {
        #[structopt(flatten)]
        file: FileOpts,
    },

    Optimize {
        #[structopt(flatten)]
        file: FileOpts,
    },

    Run {
        #[structopt(short, long)]
        interactive: bool,

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
    };

    let mut file = File::open(&arg_file).unwrap_or_else(|err| panic!("{}", err));
    let mut buffer = Vec::with_capacity(file.metadata().map(|m| m.len()).unwrap_or(0) as usize);
    file.read_to_end(&mut buffer)
        .unwrap_or_else(|err| panic!("{}", err));

    let mut code = buffer.clone();
    if !args.no_prelude {
        if let Command::Run { .. } = args.cmd {
            code.extend(
                r"

\ Positions synced with VM (for now)
variable graphics 575 cells allot \ 0-575
variable last-key \ 576
variable random-register \ 577

: random random-register @ swap % ;

"
                .as_bytes(),
            );
        }
    }
    code = inject_prelude(&code);

    let script = parse_forth(code);
    // TODO parse_to_superpax

    match args.cmd {
        Command::Compile { .. } => {
            let mut program = convert_to_superpax(script);
            cross_compile_forth_gb(program);
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
        Command::Run { interactive, .. } => {
            let mut program = convert_to_superpax(script);

            inline_into_function(&mut program, "main");

            optimize_function(&mut program, "main");

            let wasm = eval_forth(&program, interactive);
            paxconsola::eval::run_wasm(&wasm);
        }
    }

    Ok(())
}
