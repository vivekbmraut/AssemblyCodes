.section .data
dividend:
.float 41.25
divisor:
.float 2.5

pf:
.asciz "Remainder is %f\n"
.section .text
.globl _start
_start:
finit
flds divisor
flds dividend
loop:
	fprem1
	fstsw %ax
	testb $4,%ah
	jnz loop
subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $12,%esp
pushl $1
call exit
