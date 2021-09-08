INPUT = src/paxconsola.asm
OUT = build/PAXCNSLA.COM

all: $(OUT)

clean:
	rm -rf build

$(OUT): $(INPUT)
	nasm -f bin -o $(OUT) $(INPUT) -l build/paxconsola.lst

run: $(OUT)
	dosbox -c "mount c \"$$(pwd)/build\"" -c "c:" -c $(notdir $(OUT))
