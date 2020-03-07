CC = cl65
AS = ca65
CFLAGS =
AFLAGS =

all: paxconsola.com

clean:
	rm -f paxconsola.o paxconsola.lst paxconsola.com

# Review: https://cc65.github.io/doc/c64.html#s10

paxconsola.com: paxconsola.o
	$(CC) $(CFLAGS) -u __EXEHDR__ -t c64 -C c64-asm.cfg -g paxconsola.o -o $@ -Ln paxconsola.lbl -m paxconsola.map

paxconsola.o: paxconsola.s generated.asm
	$(CC) $(CFLAGS) -t c64 -g -c paxconsola.s -o $@
