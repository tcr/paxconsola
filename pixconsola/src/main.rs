use pixconsola::*;
use std::fs::File;
use std::path::PathBuf;
use structopt::*;

// With the "paw" feature enabled in structopt
#[derive(StructOpt)]
struct Args {
    // Support commands
    #[structopt(subcommand)]
    cmd: Command,
}

#[derive(StructOpt)]
enum Command {
    /// Decode
    Decode {
        #[structopt(parse(from_os_str))]
        input: PathBuf,
        #[structopt(short = "o", parse(from_os_str))]
        output: PathBuf,
    },
    /// Encode
    Encode {
        #[structopt(parse(from_os_str))]
        input: PathBuf,
        #[structopt(short = "o", parse(from_os_str))]
        output: PathBuf,
    },
}

#[paw::main]
fn main(args: Args) -> Result<(), Box<dyn std::error::Error>> {
    match args.cmd {
        Command::Decode { input, output } => {
            let mut source = File::open(&input)?;
            let mut dest = File::create(&output)?;

            encode_png_to_ega(&mut source, &mut dest);
            Ok(())
        }
        Command::Encode { input, output } => {
            let mut source = File::open(&input).unwrap();
            let mut dest = File::create(&output).unwrap();

            decode_ega_to_png(&mut source, &mut dest);
            Ok(())
        }
    }
}
