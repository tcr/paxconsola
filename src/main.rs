#![allow(deprecated)]

use std::io::prelude::*;
use std::fs::File;
use std::path::PathBuf;
use structopt::StructOpt;
use paxconsola::*;

const PRELUDE: &str = r"

: cells ;

\ Positions synced with VM (for now)
variable graphics 575 cells allot \ 0-575
variable last-key \ 576
variable random-register \ 577

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

: random random-register @ swap % ;

";

#[derive(StructOpt, Debug)]
#[structopt(name = "paxconsola")]
struct Args {
    #[structopt(short, long)]
    compile: bool,

    #[structopt(short, long)]
    interactive: bool,

    #[structopt(short, long)]
    dump: bool,

    #[structopt(long = "--no-prelude")]
    no_prelude: bool,

    #[structopt(name = "FILE", parse(from_os_str))]
    file: PathBuf,
}

#[paw::main]
fn main(args: Args) -> Result<(), std::io::Error> {
    let mut file = File::open(&args.file).unwrap_or_else(|err| panic!("{}", err));
    let mut buffer = Vec::with_capacity(file.metadata().map(|m|m.len()).unwrap_or(0) as usize);
    file.read_to_end(&mut buffer).unwrap_or_else(|err| panic!("{}", err));

    let mut code = vec![];
    if !args.no_prelude {
        code.extend(PRELUDE.as_bytes());
    }
    code.extend(&buffer);
    let script = parse_forth(code);

    if args.compile {
        cross_compile_forth_gb(script);
    } else {
        if args.dump {
            for (i, op) in script.iter().enumerate() {
                println!("[{:>3}]  {:?}", i, op);
            }
        } else {
            eval_forth(script, args.interactive);
        }
    }

    Ok(())
}
