; nasm -f bin -o myfile.com myfile.asm

org 100h

mov dx, msg
mov ah, 9
int 21h

ret

msg db "Pax Consola!$"
