use serde::*;

#[derive(Debug, Clone, PartialEq, Default, Serialize, Deserialize)]
pub struct Pos {
    pub filename: String,
    pub function: String,
    pub line: usize,
    pub col: usize,
}

impl std::fmt::Display for Pos {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{}:{}:{} in `{}`",
            self.filename, self.line, self.col, self.function
        )
    }
}

pub type Located<T> = (T, Pos);
