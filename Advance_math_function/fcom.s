.section .data
pf:
.asciz "%f is greater than %f\n"
pf1:
.asciz "Enter two floats: "
sf:
.asciz "%f%f"
.section .bss
.lcomm rhs,4
.lcomm lhs,4
.section .text
.globl _start
_start:
finit

pushl $pf1
call printf
addl $4,%esp

pushl $rhs
pushl $lhs
pushl $sf
call scanf
addl $12,%esp

movl $0,%eax
flds lhs
fcoms rhs
fstsw
sahf
ja greater
subl $8,%esp
fstpl (%esp)
flds rhs
subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $20,%esp
jmp end
greater:
	flds rhs
	subl $8,%esp
	fstpl (%esp)
	subl $8,%esp
	fstpl (%esp)
	pushl $pf
	call printf
	addl $20,%esp
end:
	pushl $0
	call exit	
