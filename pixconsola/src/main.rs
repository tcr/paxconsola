use bitvec::prelude::*;
use std::fs::File;
use std::io::BufWriter;
use std::path::Path;

const sprite_test: &[u8] = include_bytes!("../tests/test-ega.raw");

#[derive(Debug)]
struct RGB {
    r: u8,
    g: u8,
    b: u8,
}

impl RGB {
    fn to_rgba_vec(&self) -> Vec<u8> {
        vec![self.r, self.g, self.b, 255]
    }

    fn to_rgb_vec(&self) -> Vec<u8> {
        vec![self.r, self.g, self.b]
    }

    fn new(r: u8, g: u8, b: u8) -> RGB {
        RGB { r, g, b }
    }
}

fn bit_16(input: u16, bit: u16) -> u8 {
    if input & (1 << bit) != 0 {
        1
    } else {
        0
    }
}

fn from_palette_color(i: u16) -> RGB {
    // https://moddingwiki.shikadi.net/wiki/EGA_Palette
    RGB {
        r: (((bit_16(i, 7) << 1) | (bit_16(i, 6) << 0)) * 85) as u8,
        g: (((bit_16(i, 11) << 1) | (bit_16(i, 10) << 0)) * 85) as u8,
        b: (((bit_16(i, 3) << 1) | (bit_16(i, 2) << 0)) * 85) as u8,
    }
}

fn palette() -> Vec<RGB> {
    vec![
        from_palette_color(0x250),
        from_palette_color(0x000),
        from_palette_color(0x555),
        from_palette_color(0xAAA),
        from_palette_color(0xFFF),
        from_palette_color(0x826),
        from_palette_color(0xD33),
        from_palette_color(0x3E3),
        from_palette_color(0x7E6),
        from_palette_color(0xAE5),
        from_palette_color(0xFF4),
        from_palette_color(0x2AA),
        from_palette_color(0x0FF),
        from_palette_color(0x30D),
        from_palette_color(0x63B),
        from_palette_color(0xD0F),
    ]
}

fn main() {
    let decoder = png::Decoder::new(File::open("in.png").unwrap());
    let mut reader = decoder.read_info().unwrap();
    // Allocate the output buffer.
    let mut buf = vec![0; reader.output_buffer_size()];
    // Read the next frame. An APNG might contain multiple frames.
    let info = reader.next_frame(&mut buf).unwrap();
    // Grab the bytes of the image.
    let bytes = &buf[..info.buffer_size()];
    // Inspect more details of the last read frame.
    // let in_animation = reader.info().frame_control.is_some();
    eprintln!("{:?}", info.width);

    let mut out: Vec<u8> = vec![];
    for span in bytes.chunks(8) {
        out.extend(&[
            bit_plane_from_byte(0, span),
            bit_plane_from_byte(1, span),
            bit_plane_from_byte(2, span),
            bit_plane_from_byte(3, span),
        ]);
    }
    std::fs::write("out.raw", out);
}

fn bit_plane_from_byte(index: usize, byte: &[u8]) -> u8 {
    let mut one = BitVec::<Lsb0, u8>::new();
    one.extend(
        byte.iter()
            .rev()
            .map(|x| if x & (1 << index) != 0 { true } else { false })
            .collect::<Vec<bool>>(),
    );
    one.load::<u8>()
}

fn main2() {
    let path = Path::new(r"out.png");
    let file = File::create(path).unwrap();
    let ref mut w = BufWriter::new(file);

    let mut encoder = png::Encoder::new(w, 48, 48); // Width is 2 pixels and height is 1.
    encoder.set_color(png::ColorType::Indexed);

    let plte_chunk = palette()
        .iter()
        .map(|x| x.to_rgb_vec())
        .flatten()
        .collect::<Vec<u8>>();
    encoder.set_palette(plte_chunk);
    // encoder.set_depth(png::BitDepth::Eight);
    // encoder.set_trns(vec!(0xFFu8, 0xFFu8, 0xFFu8, 0xFFu8));
    // encoder.set_source_gamma(png::ScaledFloat::from_scaled(45455)); // 1.0 / 2.2, scaled by 100000
    // encoder.set_source_gamma(png::ScaledFloat::new(1.0 / 2.2));     // 1.0 / 2.2, unscaled, but rounded
    // let source_chromaticities = png::SourceChromaticities::new(     // Using unscaled instantiation here
    //     (0.31270, 0.32900),
    //     (0.64000, 0.33000),
    //     (0.30000, 0.60000),
    //     (0.15000, 0.06000)
    // );
    // encoder.set_source_chromaticities(source_chromaticities);

    let mut data = vec![];
    let mut writer = encoder.write_header().unwrap();

    // let mut output_array = vec![];
    // transpose::transpose(&sprite_test, &mut output_array, 24, 48);

    eprintln!("---> {:?}", palette());

    for planes in sprite_test.chunks(4) {
        // Create 4-value entry for each pixel in this word (8 pixels)
        let mut b = std::iter::repeat(0).take(8).collect::<Vec<_>>();

        // Enumerate each plane.
        for (p, plane) in planes.iter().enumerate() {
            // Update pixels.
            for (j, bit) in plane.view_bits::<Lsb0>().iter().take(8).rev().enumerate() {
                b[j] |= if *bit { 1 << p } else { 0 };
            }
        }
        eprintln!(">> {:?}", b);
        for byte in b {
            if byte == 0 {
                // data.extend(&[0, 0, 0, 0]);
                data.push(0);
            } else {
                data.push(byte);
                // data.extend(palette()[byte].to_rgba_vec());
            }
        }
    }

    // data = data[0..9216].to_vec();

    // let data = [255, 0, 0, 255, 0, 0, 0, 255]; // An array containing a RGBA sequence. First pixel is red and second pixel is black.
    writer.write_image_data(data.as_slice()).unwrap(); // Save
}
