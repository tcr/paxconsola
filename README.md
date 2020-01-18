# Pax Consolas

An implementation of the forth programming language intended for cross-compilation.

Some things you can run:

```sh
./check.sh
cargo run -- examples/snake.txt --interactive
cargo run -- examples/gb.txt --compile --no-prelude > ./snake/gb/pax_generated.asm
```

## Snake on Gameboy

```
cd snake/gb
make allrun
```

Analysis for compilation:

```
RUST_BACKTRACE=1 cargo run -- examples/constprop.fs --compile
```

## Inspiration

* [NybbleForth](https://github.com/larsbrinkhoff/nybbleForth)
* [ColorForth](https://web.archive.org/web/20160310112802/http://colorforth.com/inst.htm)
