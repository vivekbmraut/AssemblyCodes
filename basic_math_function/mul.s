.section .data
pf:
.asciz "Multiplication =%qd\n"
.section .text
.globl _start
_start:
movl $315814,%eax
movl $165432,%ebx
mull %ebx
pushl %edx
pushl %eax
pushl $pf
call printf
addl $12,%esp
pushl $0
call exit
