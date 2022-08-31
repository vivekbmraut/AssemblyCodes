.section .data
cake:
.quad -25635869573
pf:
.asciz "Signed div Quotient( %d ) & Remainder ( %d )\n"
.section .text
.globl _start
_start:
movl cake,%eax
movl cake+4,%edx
movl $694,%ebx
idivl %ebx
pushl %edx
pushl %eax
pushl $pf
call printf
addl $12,%esp
pushl $0
call exit
