use crate::*;

pub fn ega_color_to_rgb(i: u16) -> RGB {
    // https://moddingwiki.shikadi.net/wiki/EGA_Palette
    let bits = i.view_bits::<Lsb0>();
    RGB {
        r: (((bits[7] as u8) << 1) | (bits[6] as u8) << 0) * 85,
        g: (((bits[11] as u8) << 1) | (bits[10] as u8) << 0) * 85,
        b: (((bits[3] as u8) << 1) | (bits[2] as u8) << 0) * 85,
    }
}

// EGA palette lifted from ChibiKumas' tutorials.
pub fn ega_palette() -> Vec<RGB> {
    vec![
        0x250, 0x000, 0x555, 0xAAA, 0xFFF, 0x826, 0xD33, 0x3E3, 0x7E6, 0xAE5, 0xFF4, 0x2AA, 0x0FF,
        0x30D, 0x63B, 0xD0F,
    ]
    .into_iter()
    .map(ega_color_to_rgb)
    .collect()
}

pub fn decode_ega_to_png(source: &mut impl std::io::Read, dest: &mut impl std::io::Write) {
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
    for span in bytes.chunks(8) {
        out.extend(&[
            bit_plane_from_byte(0, span),
            bit_plane_from_byte(1, span),
            bit_plane_from_byte(2, span),
            bit_plane_from_byte(3, span),
        ]);
    }
    dest_buffered.write_all(out.as_slice()).unwrap();
    eprintln!("Decoded {} bytes.", out.len());
}

pub fn bit_plane_from_byte(index: usize, byte: &[u8]) -> u8 {
    let mut one = BitVec::<Lsb0, u8>::new();
    one.extend(
        byte.iter()
            .rev()
            .map(|x| if x & (1 << index) != 0 { true } else { false })
            .collect::<Vec<bool>>(),
    );
    one.load::<u8>()
}

pub fn encode_png_to_ega(source: &mut impl std::io::Read, dest: &mut impl std::io::Write) {
    let ref mut dest_buffered = BufWriter::new(dest);

    let mut encoder = png::Encoder::new(dest_buffered, 48, 48); // Width is 2 pixels and height is 1.
    encoder.set_color(png::ColorType::Indexed);

    // Setup EGA palette.
    let plte_chunk = ega_palette()
        .iter()
        .map(|x| x.to_rgb_vec())
        .flatten()
        .collect::<Vec<u8>>();
    encoder.set_palette(plte_chunk);

    let mut data = vec![];
    let mut writer = encoder.write_header().unwrap();

    let mut input = vec![];
    source.read_to_end(&mut input).unwrap();
    for planes in input.chunks(4) {
        // Create 4-value entry for each pixel in this word (8 pixels)
        let mut b = std::iter::repeat(0).take(8).collect::<Vec<_>>();

        // Enumerate each plane.
        for (p, plane) in planes.iter().enumerate() {
            // Update pixels.
            for (j, bit) in plane.view_bits::<Lsb0>().iter().take(8).rev().enumerate() {
                b[j] |= if *bit { 1 << p } else { 0 };
            }
        }
        // Write the indexed colors to the image.
        data.extend(b);
    }

    // Write the RGBA sequence to the Writer.
    writer.write_image_data(data.as_slice()).unwrap();
    eprintln!("Encoded {} bytes.", data.len());
}
