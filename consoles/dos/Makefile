clean:
	rm -rf build

build: paxconsola.asm
	nasm -f bin -o build/paxconsola.com paxconsola.asm

run: build
	/applications/dosbox.app/contents/macos/dosbox -c "mount c \"$$(pwd)/build\"" -c "c:" -c "PAXCON~1.com"
