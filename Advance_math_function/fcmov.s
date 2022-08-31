.section .data
flt:
.float 90.34
flt1:
.float 76.2
pf:
.asciz "MAX:%f\n"
.section .text
.globl _start
_start:
flds flt1
flds flt
fcomi %st(1),%st(0)
fcmovb %st(1),%st(0)
subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $12,%esp
pushl $0
call exit
