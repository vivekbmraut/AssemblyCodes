.section .data
flt:
.float 5
flt1:
.float 6
pf:
.asciz "Greater %f\n"
pf1:
.asciz "Smaller %f\n"
.section .text
.globl _start
_start:
finit
flds flt
flds flt1
fcomi %st(1),%st(0)
ja greater
subl $8,%esp
fstpl (%esp)
pushl $pf1
call printf
addl $12,%esp
jmp end
greater:
	subl $8,%esp
	fstpl (%esp)
	pushl $pf
	call printf
	addl $12,%esp
end:
pushl $0
call exit
