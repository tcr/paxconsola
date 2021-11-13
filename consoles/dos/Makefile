GAME ?= 
PAX_OPTS=""

BUILD_DIR = build

INPUT = src/paxconsola.asm
OUT = $(BUILD_DIR)/PAXCNSLA.COM
OUTPUT = $(BUILD_DIR)/paxconsola.o

# CC = cl65
# AS = ca65
# CFLAGS =
# AFLAGS =

GAME_PATH=../../games/$(GAME)

all: check $(OUT)

.PHONY: $(GAME_PATH) check clean build run

check:
ifeq ($(GAME),)
	$(error GAME is a required argument. Please specify a game file from the root "games" folder)
endif

clean:
	rm -rf build

# Build files

$(BUILD_DIR)/paxconsola_generated.asm: $(GAME_PATH)
	mkdir -p $(BUILD_DIR)
	paxforth compile src/engines/dos-$(ENGINE).fth $(GAME_PATH) $(PAX_OPTS) --target dos > $(BUILD_DIR)/paxconsola_generated.asm

$(BUILD_DIR)/%.raw: lib/%.png
	pixconsola encode $< -o $@ --format ega

build/level-1.asm:
	cd lib; python tmx-to-asm.py > ../build/level-1.asm

$(OUT): ENGINE = $(shell paxforth metadata $(GAME_PATH) | jq -r -e '.directives.engine')
$(OUT): ENGINE_FLAG = ENGINE_$(shell echo $(ENGINE) | tr a-z A-Z)
$(OUT): check src/* $(BUILD_DIR)/paxconsola_generated.asm build/level-1.asm $(BUILD_DIR)/tiles.raw $(BUILD_DIR)/tiles-linear.raw $(BUILD_DIR)/tiles-block.raw $(BUILD_DIR)/tilesheet.raw $(BUILD_DIR)/tiles-hero.raw
	asl -D $(ENGINE_FLAG)=1 -o $(OUTPUT) $(INPUT) -relaxed
	p2bin $(OUTPUT) $(OUT)

run: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:" -c $(notdir $(OUT))

debug: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:"

run-browser: $(OUT)
	../../emularity/serve.py dos $(OUT)
