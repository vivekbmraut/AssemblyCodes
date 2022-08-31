.section .bss
.lcomm rad,4
.section .data
f180:
.int 180

flt1:
.float 30

pf:
.asciz "SINres :%f  COSres:%f TANres:%f\n"

.section .text
.globl _start
_start:

fldpi
fidivs f180
fstps rad

flds flt1
fmuls rad
fsincos
flds flt1
fmuls rad
fptan

fstps flt1	#popping 1.0 of Fptan

subl $8,%esp
fstpl (%esp)
subl $8,%esp
fstpl (%esp)
subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $28,%esp
pushl $0
call exit
