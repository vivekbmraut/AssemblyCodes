.section .data
valu1:
.int 65,87
valu2:
.byte 0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18
.section .text
.globl _start
_start:
movq valu1,%mm0
movq valu2,%mm1
movl $1,%eax
movl $0,%ebx
int $0x80
