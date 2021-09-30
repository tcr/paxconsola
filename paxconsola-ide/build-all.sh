#!/bin/bash

set -x
set -e

# For netlify
rustup target add wasm32-unknown-unknown

VERSION="v0.14.0"
wget -qO- https://github.com/thedodd/trunk/releases/download/${VERSION}/trunk-x86_64-unknown-linux-gnu.tar.gz | tar -xzf-
wget -qO- https://github.com/rust-lang/mdBook/releases/download/v0.4.12/mdbook-v0.4.12-x86_64-unknown-linux-gnu.tar.gz | tar -xzf-
wget -qO- https://github.com/rustwasm/wasm-bindgen/releases/download/0.2.78/wasm-bindgen-0.2.78-x86_64-unknown-linux-musl.tar.gz | tar -xzf-
mv wasm-bindgen-0.2.78-x86_64-unknown-linux-musl/wasm-bindgen .

export PATH=$(pwd):$PATH

(cd ../doc; mdbook build; )
./compile-workers.sh
./trunk build
