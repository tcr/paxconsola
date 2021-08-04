build:
	nasm -f bin -o myfile.com myfile.asm

run: build
	/applications/dosbox.app/contents/macos/dosbox -c "mount c \"$$(pwd)\"" -c "c:" -c "myfile.com"
