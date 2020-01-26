#![allow(deprecated)]

use paxconsola::*;
use std::fs::File;
use std::io::prelude::*;
use std::path::PathBuf;
use structopt::StructOpt;

const PRELUDE: &str = r"

: drop    if then ;
: 2drop   + drop ;

variable  temp \ 578
: swap   >r temp ! r> temp @ ;
: over   >r temp ! temp @ r> temp @ ;
: rot    >r swap r> swap ;

\ note: must preserve return address!
: r@   r> r> temp ! temp @ >r temp @ swap >r ;

: dup    temp ! temp @ temp @ ;
: 2dup   over over ;
: ?dup   temp ! temp @ if temp @ temp @ then ;

: cells dup + ;

: invert   -1 nand ;
: negate   invert 1 + ;
: -        negate + ;

: 1+   1 + ;
: 1-   -1 + ;
: +!   dup >r @ + r> ! ;
: 0=   if 0 else -1 then ;
: =    - 0= ;
: <>   = 0= ;
: ==   - 0= ;

: or   invert swap invert nand ;
: xor   2dup nand 1+ dup + + + ;
: and   nand invert ;

\ return stack pops off index, then limit, reverse of initial stack order
\ compare, if equal then cleanup and return 1, else increase index, push, return 0
\ note: must preserve return address!
: loopimpl r> r> r> 1+ 2dup = if 2drop 1 else >r >r 0 then swap >r ;
: -loopimpl r> r> rot r> swap - 2dup = if 2drop 1 else >r >r 0 then swap >r ;

\ note: must preserve return address!
: i r> r> r> temp ! temp @ >r >r >r temp @ ;
: j r> r> r> r> r> temp ! temp @ >r >r >r >r >r temp @ ;

: * >r 0 r> 0 do over + loop swap drop ;

: 0<   $8000 nand invert if -1 else 0 then ;
: % ( value divisor -- modulus ) begin 2dup - dup 0< if rot drop + -1 else rot drop swap 0 then until ;

";

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

    let mut code = vec![];
    if !args.no_prelude {
        code.extend(PRELUDE.as_bytes());
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
    code.extend(&buffer);
    let script = parse_forth(code);

    match args.cmd {
        Command::Compile { .. } => {
            cross_compile_forth_gb(script);
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
            eval_forth(&program, interactive);
        }
    }

    Ok(())
}
