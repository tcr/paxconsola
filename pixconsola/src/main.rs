use derive_more::*;
use pixconsola::c64::*;
use pixconsola::ega::*;
use std::fs::File;
use std::path::PathBuf;
use structopt::*;

#[derive(Debug, Clone, enum_utils::FromStr, Display)]
pub enum Format {
    #[enumeration(rename = "ega")]
    #[display(fmt = "ega")]
    EGA,

    #[enumeration(rename = "c64-multicolor")]
    #[display(fmt = "c64-multicolor")]
    C64Multicolor,
}

pub fn parse_format(value: &str) -> Result<Format, String> {
    std::str::FromStr::from_str(value).map_err(|_| format!("{:?} is not a valid format", value))
}

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
        #[structopt(long, parse(try_from_str=parse_format))]
        #[allow(unused)]
        format: Format,
        #[structopt(parse(from_os_str))]
        input: PathBuf,
        #[structopt(short = "o", parse(from_os_str))]
        output: PathBuf,
        #[structopt(short = "w", long = "width")]
        width: usize,
        #[structopt(short = "h", long = "height")]
        height: usize,
    },
    /// Encode
    Encode {
        #[structopt(long, parse(try_from_str=parse_format))]
        #[allow(unused)]
        format: Format,
        #[structopt(parse(from_os_str))]
        input: PathBuf,
        #[structopt(short = "o", parse(from_os_str))]
        output: PathBuf,
    },
}

#[paw::main]
fn main(args: Args) -> Result<(), Box<dyn std::error::Error>> {
    match args.cmd {
        Command::Decode {
            input,
            output,
            width,
            height,
            format,
        } => {
            let mut source = File::open(&input)?;
            let mut dest = File::create(&output)?;

            match format {
                Format::EGA => {
                    decode_ega_to_png(&mut source, &mut dest, width, height);
                }
                Format::C64Multicolor => {
                    unimplemented!();
                }
            }
            Ok(())
        }
        Command::Encode {
            input,
            output,
            format,
        } => {
            let mut source = File::open(&input).unwrap();
            let mut dest = File::create(&output).unwrap();

            match format {
                Format::EGA => {
                    encode_png_to_ega(&mut source, &mut dest);
                }
                Format::C64Multicolor => {
                    encode_png_to_c64_multicolor(&mut source, &mut dest);
                }
            }
            Ok(())
        }
    }
}
