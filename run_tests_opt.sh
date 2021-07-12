#!/bin/bash

set -e

cargo test -p paxforth --release -- --ignored --nocapture
