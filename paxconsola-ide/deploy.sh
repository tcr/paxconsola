#!/bin/bash

cargo web build --bin compilation_worker --release
cp target/wasm32-unknown-unknown/release/compilation_worker.* build/bin/

(rm build/*.* || true) &&
    cargo web deploy --release --output build &&
    now ./build --prod
