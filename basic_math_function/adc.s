.section .data
Quad1:
.quad 7970940532
Quad2:
.quad 7511215836
msg:
.asciz "ADC = %qd\n"
.section .text
.globl _start
_start:
movl Quad1,%ebx
movl Quad1+4,%eax
movl Quad2,%edx
movl Quad2+4,%ecx
addl %ebx,%edx
adcl %eax,%ecx
pushl %ecx
pushl %edx
pushl $msg
call printf
add $12,%esp
pushl $0
call exit
