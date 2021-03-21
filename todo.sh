# last modulus fails with -37
cd paxforth
RUST_BACKTRACE=1 cargo run -- inlineup tests/check/loopimpl.fs >/dev/null
