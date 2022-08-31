.section .data
n1:
.quad 7970940532
n2:
.quad 7511215836
pf:
.asciz "Result %qd\n"
.section .text
.globl _start
_start:
movl n1,%eax
movl n1+4,%ebx
movl n2,%ecx
movl n2+4,%edx
subl %ecx,%eax
sbbl %edx,%ebx
pushl %ebx
pushl %eax
pushl $pf
call printf
addl $12,%esp
pushl $0
call exit
