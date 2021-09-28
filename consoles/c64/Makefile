GAME ?= 
PAX_OPTS=""
ENGINE ?= 

CC = cl65
AS = ca65
CFLAGS =
AFLAGS =

ENGINE_FLAG=ENGINE_$(shell echo $(ENGINE) | tr a-z A-Z)

all: check build/paxconsola.prg

check:
ifeq ($(ENGINE),)
	$(error ENGINE is a required argument)
endif
ifeq ($(GAME),)
	$(error GAME is a required argument)
endif
	touch $(GAME)

clean:
	rm -f build

# Build files
# Reference: https://cc65.github.io/doc/c64.html#s10

build/paxconsola_generated.asm: $(GAME)
	paxforth compile src/engines/c64-$(ENGINE).fth $(GAME) $(PAX_OPTS) --target c64 > ./build/paxconsola_generated.asm

build/paxconsola.o: src/paxconsola.asm build/paxconsola_generated.asm
	$(AS) $(CFLAGS) -t c64 -D $(ENGINE_FLAG)=1 -g src/paxconsola.asm -l build/paxconsola.lst -o $@

build/paxconsola.prg: build/paxconsola.o
	$(CC) $(CFLAGS) -u __EXEHDR__ -t c64 -C c64-asm.cfg -g build/paxconsola.o -o $@ -Ln build/paxconsola.lbl -l build/paxconsola.lst -m build/paxconsola.map

# Interactive

run: all
	x64sc -moncommands "vice-debugger.vs" -nativemonitor -VICIIfilter 0 build/paxconsola.prg

# Debugging

dump:
	paxforth dump $(GAME) $(PAX_OPTS) > build/$(GAME).dump
