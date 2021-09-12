INPUT = src/paxconsola.asm
OUT = build/PAXCNSLA.COM

FILE=snake_world.fth
OPTS=""

all: $(OUT)

clean:
	rm -rf build

# Build files
# Reference: https://cc65.github.io/doc/c64.html#s10



build/paxconsola_generated.asm: $(FILE)
	paxforth compile $(FILE) $(OPTS) --target dos > ./build/paxconsola_generated.asm

build/tiles.raw: lib/tiles.png
	pixconsola encode lib/tiles.png -o build/tiles.raw --format ega

$(OUT): $(INPUT) build/paxconsola_generated.asm build/tiles.raw
	nasm -f bin -o $(OUT) $(INPUT) -l build/paxconsola.lst

run: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:" -c $(notdir $(OUT))
