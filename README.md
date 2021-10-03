# Pax Consola

An implementation of the Forth programming language intended for cross-compilation.

```
cargo install -p paxforth
cargo install -p pixconsola
```


### Tests

You can run all tests for the `paxforth` repository:

```sh
./run_tests.sh
./run_tests_opt.sh
```


### Run snake on Gameboy / DOS / C64

```sh
cd consoles/gb/
make run GAME=snake_world.fth ENGINE=taurus
```


### Run the paxconsola IDE

```sh
cd paxconsola-ide
make serve
```


### Pix Consola

Convert graphics for different target systems using `pixconsola`.

```
pixconsola encode lib/sprite-hero.png -o build/sprite-hero.raw --format c64-multicolor
```

This program works especially well with PNGs authored with Aseprite.



### License

Pax Forth, Pax Consola, and Pix Consola are under the MIT License.


## Inspiration

* [NybbleForth](https://github.com/larsbrinkhoff/nybbleForth)
* [ColorForth](https://web.archive.org/web/20160310112802/http://colorforth.com/inst.htm)
* [Retroforth](https://stackoverflow.com/a/12548223)
* [Easy Forth](https://skilldrick.github.io/easyforth/)
* [Hardware Simulation in Forth](https://comp.lang.forth.narkive.com/6U6BPhcA/hardware-simulation-in-forth#post2)
* [liforth prelude](https://github.com/howerj/libforth/blob/b851c6a25150e7d2114804fc8712664c6d825214/forth.fth)
* [Building Forth Structures](http://www.figuk.plus.com/articles/jb/struct.htm)

Documentation:

* [CS 331 Spring 2016: A Quick Introduction to
  Forth](https://www.cs.uaf.edu/~chappell/class/2016_spr/cs331/docs/forth_quick.html)

Reading:

* https://www.bradrodriguez.com/papers/moving1.htm
