.section .text
.globl _start
_start:
movl $279,%ecx
movzx %ch,%ebx
movl $1,%eax
int $0x80
