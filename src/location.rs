use serde::*;

#[derive(Debug, Clone, PartialEq, Default, Copy, Serialize, Deserialize)]
pub struct Pos {
    pub line: usize,
    pub col: usize,
}

impl std::fmt::Display for Pos {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}:{}", self.line, self.col)
    }
}

pub type Located<T> = (T, Pos);
