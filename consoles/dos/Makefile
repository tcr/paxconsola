GAME ?= 
PAX_OPTS=""
ENGINE ?= 

BUILD_DIR = build

INPUT = src/paxconsola.asm
OUT = $(BUILD_DIR)/PAXCNSLA.COM

# CC = cl65
# AS = ca65
# CFLAGS =
# AFLAGS =

ENGINE_FLAG=ENGINE_$(shell echo $(ENGINE) | tr a-z A-Z)

all: check $(OUT)

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

$(BUILD_DIR)/paxconsola_generated.asm: $(GAME)
	paxforth compile src/engines/dos-$(ENGINE).fth $(GAME) $(PAX_OPTS) --target dos > $(BUILD_DIR)/paxconsola_generated.asm

$(BUILD_DIR)/%.raw: lib/%.png
	pixconsola encode $< -o $@ --format ega

$(OUT): src/* $(BUILD_DIR)/paxconsola_generated.asm $(BUILD_DIR)/tiles.raw $(BUILD_DIR)/tiles-linear.raw $(BUILD_DIR)/tiles-block.raw
	nasm -f bin -D $(ENGINE_FLAG)=1 -o $(OUT) $(INPUT) -l build/paxconsola.lst

run: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:" -c $(notdir $(OUT))

debug: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:"
