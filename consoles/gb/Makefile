OBJS = kernel/bank0.asm
OBJS_NAME = bank0

OBJ_NAME = paxconsola

ASM = rgbasm

LINK = rgblink

FIX = rgbfix

all : build/tiles.bin build/pax_generated.asm $(OBJS)
	$(ASM) -E -o$(OBJS_NAME).obj $(OBJS)
	$(LINK) -m$(OBJ_NAME).map -n$(OBJ_NAME).sym -o$(OBJ_NAME).gb $(OBJS_NAME).obj
	$(FIX) -v $(OBJ_NAME).gb
	rm $(OBJS_NAME).obj

build/pax_generated.asm: snake.fth
	paxforth compile snake.fth --target=gb > build/pax_generated.asm

build/tiles.bin: tiles.png
	rgbgfx -o build/tiles.bin tiles.png

run:
	make
	rboy -x 6 paxconsola.gb

debug:
	make
	/Applications/SameBoy.app/Contents/MacOS/SameBoy --scale 6 paxconsola.gb
