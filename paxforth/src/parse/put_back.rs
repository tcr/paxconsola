/// An iterator adaptor that allows putting multiple
/// items in front of the iterator.
///
/// Iterator element type is `I::Item`.
#[derive(Debug, Clone)]
pub struct PutBackN<I: Iterator> {
    top: Vec<I::Item>,
    pub iter: I,
}

/// Create an iterator where you can put back multiple values to the front
/// of the iteration.
///
/// Iterator element type is `I::Item`.
pub fn put_back_n<I>(iterable: I) -> PutBackN<I::IntoIter>
where
    I: IntoIterator,
{
    PutBackN {
        top: Vec::new(),
        iter: iterable.into_iter(),
    }
}

impl<I: Iterator> PutBackN<I> {
    /// Puts x in front of the iterator.
    /// The values are yielded in order of the most recently put back
    /// values first.
    #[inline]
    pub fn put_back(&mut self, x: I::Item) {
        self.top.push(x);
    }
}

impl<I: Iterator> Iterator for PutBackN<I> {
    type Item = I::Item;
    #[inline]
    fn next(&mut self) -> Option<I::Item> {
        if self.top.is_empty() {
            self.iter.next()
        } else {
            self.top.pop()
        }
    }

    #[inline]
    fn size_hint(&self) -> (usize, Option<usize>) {
        let x = self.top.len();
        let (mut low, mut hi) = self.iter.size_hint();
        low = low.saturating_add(x);
        hi = hi.and_then(|elt| elt.checked_add(x));
        (low, hi)
    }
}
