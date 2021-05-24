# Pax Consola

An implementation of the Forth programming language intended for cross-compilation.

### Tests

```sh
cd paxforth
cargo test
```

### Compile Snake

```sh
cd paxforth
cargo run -- run snake/gb/snake.pax
```

### Run snake on Gameboy

```sh
cd paxconsola-ide/snake/gb
make run
```

### Run the paxconsola IDE

```sh
cd paxconsola-ide
./deploy.sh
```

## Inspiration

* [NybbleForth](https://github.com/larsbrinkhoff/nybbleForth)
* [ColorForth](https://web.archive.org/web/20160310112802/http://colorforth.com/inst.htm)
* [Retroforth](https://stackoverflow.com/a/12548223)
