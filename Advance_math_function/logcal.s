.section .data
pf:
.asciz "ST(1):%f  ST(0):%f\n"
logOf:
.float 60
var2:
.float 2
.section .text
.globl _start
_start:
finit
fldl2t
fld1
flds logOf
fyl2x
fdiv %st(1),%st(0)
subl $8,%esp
fstpl (%esp)
subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $20,%esp
pushl $0
call exit
