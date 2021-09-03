CC = cl65
AS = ca65
CFLAGS =
AFLAGS =

FILE=sword_world.fth
OPTS=""

all: build/paxconsola.prg

clean:
	rm -f build

# Build files
# Reference: https://cc65.github.io/doc/c64.html#s10

build/paxconsola_generated.asm: $(FILE)
	paxforth compile $(FILE) $(OPTS) --target c64 > ./build/paxconsola_generated.asm

build/paxconsola.prg: build/paxconsola.o
	$(CC) $(CFLAGS) -u __EXEHDR__ -t c64 -C c64-asm.cfg -g build/paxconsola.o -o $@ -Ln build/paxconsola.lbl -l build/paxconsola.lst -m build/paxconsola.map

build/paxconsola.o: paxconsola.asm build/paxconsola_generated.asm
	$(AS) $(CFLAGS) -t c64 -g paxconsola.asm -l build/paxconsola.lst -o $@

# Interactive

run: all
	x64sc -moncommands "paxconsola.vs" -nativemonitor build/paxconsola.prg

# Debugging

dump:
	paxforth dump $(FILE) $(OPTS) > build/$(FILE).dump
