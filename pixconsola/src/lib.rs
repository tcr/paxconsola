pub mod c64;
pub mod ega;

use bitvec::prelude::*;
use std::io::BufWriter;
use std::io::Write;

#[derive(Debug)]
pub struct RGB {
    r: u8,
    g: u8,
    b: u8,
}

// Basic color struct for RGB values.
// Each color is stored as 8 bits, precision may be dropped depending on output format.
impl RGB {
    pub fn to_rgba_vec(&self) -> Vec<u8> {
        vec![self.r, self.g, self.b, 255]
    }

    pub fn to_rgb_vec(&self) -> Vec<u8> {
        vec![self.r, self.g, self.b]
    }
}
