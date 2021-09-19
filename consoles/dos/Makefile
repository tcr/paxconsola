GAME ?= 
PAX_OPTS=""
ENGINE ?= 

INPUT = src/paxconsola.asm
OUT = build/PAXCNSLA.COM

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

build/paxconsola_generated.asm: $(GAME)
	paxforth compile src/engines/dos-$(ENGINE).fth $(GAME) $(PAX_OPTS) --target dos > ./build/paxconsola_generated.asm

build/tiles.raw: lib/tiles.png
	pixconsola encode lib/tiles.png -o build/tiles.raw --format ega

build/tiles-linear.raw: lib/tiles-linear.png
	pixconsola encode lib/tiles-linear.png -o build/tiles-linear.raw --format ega

build/tiles-hero.raw: lib/tiles-hero.png
	pixconsola encode lib/tiles-hero.png -o build/tiles-hero.raw --format ega

$(OUT): src/* build/paxconsola_generated.asm build/tiles.raw build/tiles-linear.raw
	nasm -f bin -D $(ENGINE_FLAG)=1 -o $(OUT) $(INPUT) -l build/paxconsola.lst

run: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:" -c $(notdir $(OUT))

debug: $(OUT)
	dosbox-x -c "mount c \"$$(pwd)/build\"" -c "c:"
