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

$(OUT): $(INPUT) build/paxconsola_generated.asm
	nasm -f bin -o $(OUT) $(INPUT) -l build/paxconsola.lst

run: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:" -c $(notdir $(OUT))
