.section .bss
.lcomm hoe,8
.section .data
val1:
.float 3.146
val2:
.double 420.69
.section .text
.globl _start
_start:
flds val1
fldl val2
fstl hoe
fsts hoe
movl $1,%eax
movl $0,%ebx
int $128
