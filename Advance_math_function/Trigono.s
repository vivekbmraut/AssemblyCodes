.section .data
f180:
.float 180.0

pf:
.asciz "COS(%f) :%f SIN(%f):%f\n"
pf2:
.asciz "Enter cos_of and sin_of :"

sf:
.asciz "%f%f"
.section .bss
.lcomm cos,4
.lcomm sin,4 
.lcomm rad,4
.section .text
.globl _start
_start:
fldpi
fdivs f180
fstps rad

pushl $pf2
call printf
addl $4,%esp

pushl $sin
pushl $cos
pushl $sf
call scanf
addl $12,%esp

flds cos
flds cos
fmuls rad
fcos
flds sin
flds sin
fmuls rad
fsin

subl $8,%esp
fstpl (%esp)
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
