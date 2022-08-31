.section .data
dat:
.int 0x12345678
.section .text
.globl _start
_start:
movl dat,%eax
movl $1,%eax
movl $0,%ebx
int $0x80
