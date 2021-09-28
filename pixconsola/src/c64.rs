use crate::*;

pub fn encode_png_to_c64_multicolor(
    source: &mut impl std::io::Read,
    dest: &mut impl std::io::Write,
) {
    let ref mut dest_buffered = BufWriter::new(dest);

    let decoder = png::Decoder::new(source);
    let mut reader = decoder.read_info().unwrap();
    // Allocate the output buffer.
    let mut buf = vec![0; reader.output_buffer_size()];
    // Read the next frame. An APNG might contain multiple frames.
    let info = reader.next_frame(&mut buf).unwrap();
    // Grab the bytes of the image.
    let bytes = &buf[..info.buffer_size()];

    let mut out: Vec<u8> = vec![];
    for span in bytes.chunks(4) {
        let mut one = BitVec::<Lsb0, u8>::new();
        one.extend(
            span.iter()
                .rev()
                .map(|index| match index {
                    0 => vec![false, false],
                    1 => vec![false, true],
                    2 => vec![true, false],
                    3 => vec![true, true],
                    _ => {
                        panic!("Unexpected color index '{}' in PNG", index);
                    }
                })
                .flatten()
                .collect::<Vec<bool>>(),
        );
        out.push(one.load::<u8>());
    }
    dest_buffered.write_all(out.as_slice()).unwrap();
    eprintln!("Decoded {} bytes.", out.len());
}
