.section .bss
.lcomm stat,2
.section .text
.globl _start
_start:
fstsw %ax
fstsw stat

movl $1,%eax
movl $0,%ebx
int $0x80
