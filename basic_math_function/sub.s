.section .data
sc:
.asciz "%d%d"
pf:
.asciz "Subtraction of %d and %d=%d\n"
pf1:
.asciz "Enter n1 and n2\n"
.section .bss
.lcomm n1,4
.lcomm n2,4
.section .text
.globl _start
_start:
pushl $pf1
call printf
addl $4,%esp
pushl $n2
pushl $n1
pushl $sc
call scanf
addl $12,%esp
movl n1,%eax
subl n2,%eax
pushl %eax
pushl n2
pushl n1
pushl $pf
call printf
addl $16,%esp
pushl $0
call exit
