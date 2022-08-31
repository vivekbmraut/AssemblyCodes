.section .data
abs: .float -45.5
sign: .float 59.43
sqrt: .float 625

flt1:
.float 87.50

rndwn:
.byte 0x7f,0x07

rndup:
.byte 0x7f,0x0b

pf:
.asciz "Round default %f\n"
pf1:
.asciz "Round down %f\n"
pf2:
.asciz "Round up %f\n"
pf3:
.asciz "Absolute %f\n"
pf4:
.asciz "Square root %f\n"
pf5:
.asciz "Sign change %f\n"

.section .text
.globl _start
_start:
finit
flds abs
fabs

subl $8,%esp
fstpl (%esp)
pushl $pf3
call printf
addl $12,%esp

flds sqrt
fsqrt

subl $8,%esp
fstpl (%esp)
pushl $pf4
call printf
addl $12,%esp

flds sign
fchs

subl $8,%esp
fstpl (%esp)
pushl $pf5
call printf
addl $12,%esp

flds flt1
frndint

subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $12,%esp

flds flt1
fldcw rndwn
frndint

subl $8,%esp
fstpl (%esp)
pushl $pf1
call printf
addl $12,%esp

flds flt1
fldcw rndup
frndint

subl $8,%esp
fstpl (%esp)
pushl $pf2
call printf
addl $12,%esp

pushl $0
call exit
