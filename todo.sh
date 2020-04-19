# atm while optimization is working, should get the game back
# up and running in webassembly and gb and then c64
# and then repeat with a new optimization pass
# meanwhile making current one structured / usable

set -e

# fails whenever first line is added
cargo run -- optimize examples/invert-2.fs

# ultimately
# cargo test
