.section .text
.globl _start
_start:
movl $0,%ebx
dec %ebx
movl $1,%eax
cmp $0,%ebx
jle ex
int $0x80
ex:
movl $2,%ebx
int $0x80
