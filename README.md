# Pax Consolas

An implementation of the forth programming language intended for cross-compilation.

Some things you can run:

```sh
./check.sh
cargo run -- examples/snake.txt --interactive
cargo run -- examples/gb.txt --compile --no-prelude > ./snake/gb/pax_generated.asm
```

## Inspiration

* [NybbleForth](https://github.com/larsbrinkhoff/nybbleForth)
* [ColorForth](https://web.archive.org/web/20160310112802/http://colorforth.com/inst.htm)
