#[derive(Debug, Clone, PartialEq, Default, Copy)]
pub struct Pos {
    pub line: usize,
    pub col: usize,
}

pub type Located<T> = (T, Pos);
