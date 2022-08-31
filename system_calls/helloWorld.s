.section .data
wr1: .string "Hello world\n"
wrend:
.equ len,wrend-wr1

.section .text

.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp


movl $4,%eax
movl $1,%ebx
movl $wr1,%ecx
movl $len,%edx
int $0x80


movl %ebp,%esp
popl %ebp

movl $1,%eax
movl $0,%ebx
int $0x80
