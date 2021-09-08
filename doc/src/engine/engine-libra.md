# "libra" engine

The `libra` engine for Pax Consola is designed for tile-based games with few sprites.

Possible support sheet: https://lemonspawn.com/support-sheet/

## low res

Atari 2600 - Possible to use the PitKat engine: https://atariage.com/forums/topic/308669-pitkat/

* 8x11 grid of 8x8 tiles with one color/gradient each

Channel F (128x64 pixels)

- 12x7 grid of 8x8 tiles each with ? pallette

## medium res

Gameboy - [Background](https://www.copetti.org/writings/consoles/game-boy/)

* 10x9 grid of 16x16 tiles with 4 colors each

C64 - [Multicolor Character mode](https://grumbel.blogspot.com/2011/03/c64s-graphical-capabilities.html?m=1 )

* 20x12 grid of 16x16 (twice wide 8x16) with ~4 colors each

DOS - [VGA Text Mode](https://www.copetti.org/writings/consoles/game-boy/) or [text 40 x 25
color](http://www.wagemakers.be/english/doc/vga) mode. See [DOS
mode](https://retrocomputing.stackexchange.com/questions/11219/how-did-old-ms-dos-games-utilize-various-graphic-cards),
see "Programmer's Guide to the Ega, Vga, and Super Vga Cards",

* CGA: 320x100 = 20x12 16x16 tiles at 16 colors (via Composite aritfacting?), or 20x12 8x8 tiles at 16
  colors, or 10x6 16x16 tiles at 16 colors
* EGA: 320x200 = 20x12 16x16 tiles at 16 colors (aka mode 0Dh)
* VGA: 320x200 = 20x12 16x16 tiles in 256 colors (aka mode 13h)

NES - https://bitbeamcannon.com/nes-graphical-specs/

* 16x14 grid of 16x16 tiles with ~4 colors each

SNES 

* 16x14 grid of 16x16 tiles with ~16 colors each(?)

Colecovision https://gametrog.com/colecovision-information-specs/
https://8bitworkshop.com/blog/platforms/coleco/
https://github.com/retrobrews/colecovision-games/blob/master/deepdungeonadventure.png

- 16x12 grid of 16x16 tiles with ~2 or ~8 colors each

