#!/bin/bash

set -x

rustup toolchain install stable
cargo install trunk
./compile-workers.sh
trunk build
