#![allow(deprecated)]

use std::io::prelude::*;
use std::fs::File;
use std::path::PathBuf;
use structopt::StructOpt;
use paxconsolas::*;

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

: r@   r> temp ! temp @ >r temp @ ;
: 2>r   r> swap rot >r >r >r ;
: 2r>   r> r> r> rot >r swap ;

: dup    temp ! temp @ temp @ ;
: 2dup   over over ;
: ?dup   temp ! temp @ if temp @ temp @ then ;

: random random-register @ swap % ;

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

";

#[derive(StructOpt, Debug)]
#[structopt(name = "paxconolas")]
struct Args {
    #[structopt(short, long)]
    compile: bool,

    #[structopt(short, long)]
    interactive: bool,

    #[structopt(name = "FILE", parse(from_os_str))]
    file: PathBuf,
}

#[paw::main]
fn main(args: Args) -> Result<(), std::io::Error> {
    let mut file = File::open(&args.file).unwrap_or_else(|err| panic!("{}", err));
    let mut buffer = Vec::with_capacity(file.metadata().map(|m|m.len()).unwrap_or(0) as usize);
    file.read_to_end(&mut buffer).unwrap_or_else(|err| panic!("{}", err));

    if args.compile {
        let script = parse_forth(buffer);
        cross_compile_forth_gb(script);
    } else {
        let mut code = PRELUDE.as_bytes().to_owned();
        code.extend(&buffer);
        let script = parse_forth(code);
        eval_forth(script, args.interactive);
    }

    Ok(())
}
