GAME ?= 
PAX_OPTS=""

BUILD_DIR = build

INPUT = src/paxconsola.asm
OUT = $(BUILD_DIR)/paxconsola.gb
OBJ_NAME = build/paxconsola

# CC = cl65
# AS = ca65
# CFLAGS =
# AFLAGS =

GAME_PATH=../../games/$(GAME)

ASM = rgbasm
LINK = rgblink
FIX = rgbfix

all: check $(OUT)

.PHONY: $(GAME_PATH) check clean build run $(BUILD_DIR)/pax_generated.asm

check:
ifeq ($(GAME),)
	$(error GAME is a required argument)
endif

$(OUT): ENGINE = $(shell paxforth metadata $(GAME_PATH) | jq -r -e '.directives.engine')
$(OUT): ENGINE_FLAG = ENGINE_$(shell echo $(ENGINE) | tr a-z A-Z)
$(OUT): check $(BUILD_DIR)/tiles.bin $(BUILD_DIR)/pax_generated.asm $(INPUT) src/*.asm
	$(ASM) -E -D $(ENGINE_FLAG)=1 -o$(OBJ_NAME).obj $(INPUT)
	$(LINK) -m$(OBJ_NAME).map -n$(OBJ_NAME).sym -o$(OBJ_NAME).gb $(OBJ_NAME).obj
	$(FIX) -v $(OBJ_NAME).gb

$(BUILD_DIR)/pax_generated.asm: $(GAME_PATH)
	paxforth compile src/engines/gb-$(ENGINE).fth $(GAME_PATH) --target=gb > build/pax_generated.asm

build/tiles.bin: tiles.png
	rgbgfx -o build/tiles.bin tiles.png

run: $(OUT)
	rboy -x 6 build/paxconsola.gb 

debug: build/paxconsola.gb
	/Applications/SameBoy.app/Contents/MacOS/SameBoy --scale 6 build/paxconsola.gb

