.section .bss
.lcomm doub,8
.section .data
flt1:
.float 43.65
pf:
.asciz "$st0:- %f\n"

.section .text
.globl _start
_start:
finit
flds flt1

subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $12,%esp
pushl $0
call exit
