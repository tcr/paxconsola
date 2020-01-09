OBJS = kernel/bank0.asm
OBJS_NAME = bank0

OBJ_NAME = paxconsola

ASM = rgbasm

LINK = rgblink

FIX = rgbfix

all : $(OBJS)
	$(ASM) -E -o$(OBJS_NAME).obj $(OBJS)
	$(LINK) -m$(OBJ_NAME).map -n$(OBJ_NAME).sym -o$(OBJ_NAME).gb $(OBJS_NAME).obj
	$(FIX) -v $(OBJ_NAME).gb
	rm $(OBJS_NAME).obj

run:
	make
	rboy -x 6 gb.gb

debug:
	make
	/Applications/SameBoy.app/Contents/MacOS/SameBoy --scale 6 gb.gb
