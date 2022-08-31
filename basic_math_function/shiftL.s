.section .data
pf:
.asciz "Before left shift %d\n"
pf1:
.asciz "After left shift %d\n"
pf2:
.asciz "After %d left shift %d\n"

shift1:
.int 10
.section .text
.globl _start
_start:
pushl shift1
pushl $pf
call printf
addl $8,%esp
movl $shift1,%eax
sall (%eax) #sal with 1 operand
pushl (%eax)
pushl $pf1
call printf
addl $8,%esp
pushl shift1
pushl $pf
call printf
addl $8,%esp
	movl $3,%ecx
	movl $shift1,%eax
	sall %cl,(%eax)	#sal with 2 operand but %cl
	pushl shift1
	pushl %ecx
	pushl $pf2
	call printf
	addl $8,%esp
movl $shift1,%eax
sall $2,(%eax) #sal with 2 operand but shifter
pushl shift1
pushl $2
pushl $pf2
call printf
addl $8,%esp
pushl $0
call exit
