FILE = snake_world.fth

OBJS = src/paxconsola.asm
OBJS_NAME = build/paxconsola

OBJ_NAME = build/paxconsola

ASM = rgbasm

LINK = rgblink

FIX = rgbfix

build/paxconsola.gb: build/tiles.bin build/pax_generated.asm $(OBJS) src/*.asm
	$(ASM) -E -o$(OBJS_NAME).obj $(OBJS)
	$(LINK) -m$(OBJ_NAME).map -n$(OBJ_NAME).sym -o$(OBJ_NAME).gb $(OBJS_NAME).obj
	$(FIX) -v $(OBJ_NAME).gb
	rm $(OBJS_NAME).obj

build/pax_generated.asm: $(FILE)
	paxforth compile $(FILE) --target=gb > build/pax_generated.asm

build/tiles.bin: tiles.png
	rgbgfx -o build/tiles.bin tiles.png

run: build/paxconsola.gb
	rboy -x 6 build/paxconsola.gb

debug: build/paxconsola.gb
	/Applications/SameBoy.app/Contents/MacOS/SameBoy --scale 6 build/paxconsola.gb

