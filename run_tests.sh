#!/bin/bash

set -e

# CLI invocation
cargo run --release -p paxforth -- check paxforth/tests/check/addition.fth

# Cargo test
cargo test -p paxforth --release

cargo doc
