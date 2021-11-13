GAME ?= 
PAX_OPTS=""

BUILD_DIR = build

INPUT = src/paxconsola.asm
OUT = $(BUILD_DIR)/paxconsola.prg

LD = ld65
AS = ca65
CFLAGS =
AFLAGS =

GAME_PATH=../../games/$(GAME)

all: check build/paxconsola.prg

.PHONY: $(GAME_PATH) check check_engine

check:
ifeq ($(GAME),)
	$(error GAME is a required argument. Please specify a game file from the root "games" folder)
endif

clean:
	rm -f build

# Build files
# Reference: https://cc65.github.io/doc/c64.html#s10

build/paxconsola_generated.asm: $(GAME_PATH)
	paxforth compile src/engines/c64-$(ENGINE).fth $(GAME_PATH) $(PAX_OPTS) --target c64 > ./build/paxconsola_generated.asm

build/paxconsola.o: src/paxconsola.asm build/paxconsola_generated.asm
	$(AS) -t c64 -D $(ENGINE_FLAG)=1 -g src/paxconsola.asm -l build/paxconsola.lst -o $@

# https://stackoverflow.com/questions/51790718/ca65-assembler-and-ld65-linker
$(OUT): ENGINE = $(shell paxforth metadata $(GAME_PATH) | jq -r -e '.directives.engine')
$(OUT): ENGINE_FLAG = ENGINE_$(shell echo $(ENGINE) | tr a-z A-Z)
$(OUT): check build/paxconsola.o
	$(LD) --lib c64.lib -C c64-asm.cfg -u __EXEHDR__ build/paxconsola.o -o $@ -Ln build/paxconsola.lbl -m build/paxconsola.map

# Interactive

run: $(OUT)
	x64sc -moncommands "vice-debugger.vs" -nativemonitor -VICIIfilter 0 build/paxconsola.prg

# Debugging

dump:
	paxforth dump $(GAME) $(PAX_OPTS) > build/$(GAME).dump

run-browser: $(OUT)
	../../emularity/serve.py c64 $(OUT)
