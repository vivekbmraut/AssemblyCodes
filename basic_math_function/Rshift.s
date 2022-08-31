.section .data
shift1: .int 160
pf: .asciz "Before shift %d\n"
pf1: .asciz "After shift %d\n"
.section .text
.globl _start
_start:
pushl shift1
pushl $pf
call printf
addl $8,%esp
movl shift1,%eax
sarl $2,%eax
pushl %eax
pushl $pf1
call printf
addl $8,%esp
pushl $0
call exit
