# Pax Consola

An implementation of the Forth programming language intended for cross-compilation.

### Tests

```sh
cd paxforth
cargo test
```

Broken tests: `paxforth check paxforth/tests/check/invert.fs`

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
* [Easy Forth](https://skilldrick.github.io/easyforth/)
* [Hardware Simulation in Forth](https://comp.lang.forth.narkive.com/6U6BPhcA/hardware-simulation-in-forth#post2)
* [liforth prelude](https://github.com/howerj/libforth/blob/b851c6a25150e7d2114804fc8712664c6d825214/forth.fth)
* [Building Forth Structures](http://www.figuk.plus.com/articles/jb/struct.htm)
