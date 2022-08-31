.section .data
rot1: .int -93
pf: .asciz "Before left rotate %d\n"
pf1: .asciz "After left rotate %d\n"
.section .text
.globl _start
_start:
pushl rot1
pushl $pf
call printf
addl $8,%esp
xor %eax,%eax
movb rot1,%al
rolb %al
movsx %al,%eax
pushl %eax
pushl $pf1
call printf
addl $8,%esp
pushl $0
call exit
