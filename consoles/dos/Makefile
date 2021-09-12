PAX_FILE=sword_world.fth
PAX_OPTS=""
PAX_ENGINE=taurus

INPUT = src/paxconsola.asm
OUT = build/PAXCNSLA.COM

all: $(OUT)

clean:
	rm -rf build

# Build files

build/paxconsola_generated.asm: $(PAX_FILE)
	paxforth compile $(PAX_FILE) $(PAX_OPTS) --target dos > ./build/paxconsola_generated.asm

build/tiles.raw: lib/tiles.png
	pixconsola encode lib/tiles.png -o build/tiles.raw --format ega

$(OUT): $(INPUT) build/paxconsola_generated.asm build/tiles.raw
	nasm -f bin -o $(OUT) $(INPUT) -l build/paxconsola.lst

run: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:" -c $(notdir $(OUT))
