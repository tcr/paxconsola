.PHONY: all clean

all:
	mkdir -p build
	asl src/hello.asm -cpu 8048 -o build/hello.p
	p2bin build/hello.p build/hello.bin -r 1024-3071

clean:
	rm -rf build

run:
	mame -window -video opengl odyssey2 -cart ./build/hello.bin
