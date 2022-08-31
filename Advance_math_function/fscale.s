.section .data
powerOF:
.float 3
multi:
.float 0.25
pf:
.asciz "%f multiplied by 2^%f =%f\n"
.section .text
.globl _start
_start:
flds powerOF
subl $16,%esp
fstl (%esp)
flds multi
subl $8,%esp
fstl (%esp)
fscale
addl $16,%esp
fstl (%esp)
subl $16,%esp
pushl $pf
call printf
addl $24,%esp
pushl $0
call exit

