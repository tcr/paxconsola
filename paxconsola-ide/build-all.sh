#!/bin/bash

set -x

# For netlify
rustup toolchain install stable
rustup target add wasm32-unknown-unknown

cargo install trunk
(cd ../doc; mdbook build; )
./compile-workers.sh
trunk build
