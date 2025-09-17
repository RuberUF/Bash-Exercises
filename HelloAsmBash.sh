#!/bin/bash

asm_file="hello.asm"
cat > "$asm_file" << 'EOF'
section .data
    msg db "Hola desde ASM!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    ; write(1, msg, len)
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall
EOF

nasm -f elf64 "$asm_file" -o hello.o
ld hello.o -o hello
./hello

rm -f hello.o "$asm_file" hello

