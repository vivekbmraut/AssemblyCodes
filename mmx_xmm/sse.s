.section .data
val1:
.float 3.124,6.34,12.84,14.51
val2:
.float -5.43,15.98,-9.54,10.55
.section .bss
.lcomm hoe,16
.section .text
.globl _start
_start:
movups val1,%xmm0
movups val2,%xmm1
movlhps %xmm0,%xmm2
movhlps %xmm1,%xmm2
movhps %xmm0,hoe
movl $1,%eax
movl $0,%ebx
int $128
