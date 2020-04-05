# Pax Consola

An implementation of the forth programming language intended for cross-compilation.

Some things you can run:

```sh
./check.sh
cargo run -- run examples/snake.txt --interactive
cargo run -- compile examples/gb.txt > ./snake/gb/pax_generated.asm
```

## Snake on Gameboy

```
cd snake/gb
make run
```

Analysis for compilation:

```
RUST_BACKTRACE=1 cargo run -- compile examples/constprop.fs
```

## Inspiration

* [NybbleForth](https://github.com/larsbrinkhoff/nybbleForth)
* [ColorForth](https://web.archive.org/web/20160310112802/http://colorforth.com/inst.htm)
