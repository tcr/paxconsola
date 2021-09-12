use pixconsola::ega::*;
use std::fs::File;

#[test]
fn test_ega_conversion() {
    let mut source = File::open("tests/test-ega.raw").unwrap();
    let compare = std::fs::read("tests/test-ega.expected.png").unwrap();

    let mut output = vec![];
    encode_png_to_ega(&mut source, &mut output);

    assert_eq!(output, compare);
}
