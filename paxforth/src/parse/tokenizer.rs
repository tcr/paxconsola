use crate::*;
use lazy_static::*;
use regex::Regex;

#[derive(Debug, Clone, PartialEq)]
pub enum Token {
    Word(String),
    Literal(isize),
}

#[derive(Debug, Clone)]
pub struct Tokenizer {
    pub code: String,
    pub pos: Pos,
}

impl Tokenizer {
    pub fn new(filename: &str, code: &str) -> Tokenizer {
        Tokenizer {
            code: code.to_string(),
            pos: Pos {
                filename: filename.to_string(),
                function: "main".to_string(),
                line: 1,
                col: 1,
            },
        }
    }

    pub fn move_forward(&mut self, length: usize) -> Pos {
        for c in self.code[..length].chars() {
            if c == '\n' {
                self.pos.line += 1;
                self.pos.col = 1;
            } else {
                self.pos.col += 1;
            }
        }
        self.code = self.code[length..].to_string();
        self.pos.clone()
    }

    pub fn consume_until(&mut self, compare: char) -> String {
        let mut len = 0;
        for c in self.code.chars() {
            if c == compare {
                break;
            }
            len += 1;
            if c == '\n' {
                self.pos.line += 1;
                self.pos.col = 1;
            } else {
                self.pos.col += 1;
            }
        }
        let prefix = self.code[0..len].to_string();
        self.code = self.code[len..].to_string();
        prefix
    }
}

impl Iterator for Tokenizer {
    type Item = Located<Token>;

    fn next(&mut self) -> Option<Located<Token>> {
        lazy_static! {
            static ref RE_INT: Regex =
                Regex::new(r"(?s)^(\-?\$[a-fA-F0-9]+|\-?\d+)(\s+.*?)?$").unwrap();
            static ref RE_WORD: Regex = Regex::new(r"(?s)^(\S*)(\s+.*?)?$").unwrap();
        }

        let code_input = self.code.trim_start().to_string();
        if code_input.is_empty() {
            return None;
        }
        let pos_at = self.move_forward(self.code.len() - code_input.len());

        let matches = RE_INT.captures(&code_input);
        match matches {
            Some(cap) => {
                self.move_forward(
                    self.code.len() - cap.get(2).map(|x| x.as_str().len()).unwrap_or(0),
                );

                if let Some(index) = cap[1].find("$") {
                    return Some((
                        Token::Literal(isize::from_str_radix(&cap[1][index + 1..], 16).unwrap()),
                        pos_at,
                    ));
                } else {
                    return Some((Token::Literal(cap[1].parse::<isize>().unwrap()), pos_at));
                }
            }
            _ => {}
        }

        let matches = RE_WORD.captures(&code_input);
        match matches {
            Some(cap) => {
                self.move_forward(
                    self.code.len() - cap.get(2).map(|x| x.as_str().len()).unwrap_or(0),
                );
                return Some((Token::Word(cap[1].to_string()), pos_at));
            }
            _ => {}
        }

        panic!("incomplete parse: {:?}", &code_input);
    }
}
