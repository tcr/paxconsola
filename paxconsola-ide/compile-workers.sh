#!/bin/bash

# set -e

cargo build --target=wasm32-unknown-unknown --bin compilation_worker
mkdir -p ../target/workers/
wasm-bindgen --target no-modules ../target/wasm32-unknown-unknown/debug/compilation_worker.wasm \
    --out-dir ../target/workers/
