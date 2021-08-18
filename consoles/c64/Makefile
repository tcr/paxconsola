CC = cl65
AS = ca65
CFLAGS =
AFLAGS =

all: build/paxconsola.prg

clean:
	rm -f build

# Review: https://cc65.github.io/doc/c64.html#s10

build/paxconsola.prg: build/paxconsola.o
	$(CC) $(CFLAGS) -u __EXEHDR__ -t c64 -C c64-asm.cfg -g build/paxconsola.o -o $@ -Ln build/paxconsola.lbl -l build/paxconsola.lst -m build/paxconsola.map

build/paxconsola.o: paxconsola.asm paxconsola_generated.asm
	$(AS) $(CFLAGS) -t c64 -g paxconsola.asm -l build/paxconsola.lst -o $@
