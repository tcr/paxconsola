CC = cl65
AS = ca65
CFLAGS =
AFLAGS =

all: paxconsola.prg

clean:
	rm -f paxconsola.o paxconsola.lst paxconsola.prg

# Review: https://cc65.github.io/doc/c64.html#s10

paxconsola.prg: paxconsola.o
	$(CC) $(CFLAGS) -u __EXEHDR__ -t c64 -C c64-asm.cfg -g paxconsola.o -o $@ -Ln paxconsola.lbl -l paxconsola.lst -m paxconsola.map

paxconsola.o: paxconsola.s generated.asm
	$(AS) $(CFLAGS) -t c64 -g paxconsola.s -l paxconsola.lst -o $@
