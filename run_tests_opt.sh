#!/bin/bash

set -e

RUST_LOG=paxforth=warn cargo test -p paxforth --release -- --ignored --nocapture
