.PHONY: all clean

all:
	mkdir -p build
	asl src/invaders.asm -cpu tms1100 -o build/invaders.p
	p2bin build/invaders.p build/invaders-linear.bin -r 0-0x7ff -l 127
	python lfsr-encode.py build/invaders-linear.bin build/invaders.bin

clean:
	rm -rf build

run:
	mame -window -video opengl microvsn -cart ./build/invaders.bin
