.section .data
.align 4
val1:
.float 1.25,125.79,200.0,-312.5
val2:
.int 1,-435,0,-25
.section .bss
.lcomm hoe,16
.section .text
.globl _start
_start:
cvtps2dq val1,%xmm0
cvttps2dq val1,%xmm1 #truncated
cvtdq2ps val2,%xmm2
movdqu %xmm0,hoe
movl $1,%eax
movl $0,%ebx
int $0x80
