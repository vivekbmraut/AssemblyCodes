.section .data
val1:
.double 124.582,526.989
val2:
.double -5846.648,-4641.658
.section .bss
.lcomm hoe,16
.lcomm joe,8
.section .text
.globl _start
_start:
movupd val1,%xmm0
movupd val2,%xmm1
movlpd %xmm1,joe
movupd %xmm0,hoe
movl $1,%eax
movl $0,%ebx
int $128
