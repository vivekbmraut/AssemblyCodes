#sum of n natural number
.section .bss
.comm n,4
.section .data
prnt1:
.asciz "The sum of %d natural no. is %d\n"
prnt2:
.asciz "Enter 'n' for sum - "
scn1:
.asciz "%d"
.section .text
.globl _start
_start:
	pushl $prnt2
	call printf
	addl $4,%esp
	pushl $n
	pushl $scn1
	call scanf
	addl $8,%esp

	movl n,%ecx
	movl $0,%eax
	movl $1,%edx
for:
	cmp %ecx,%edx
	jg out
	addl %edx,%eax
	incl %edx
	jmp for
out:
	pushl %eax
	pushl n
	pushl $prnt1
	call printf
	addl $12,%esp
	pushl $0
	call exit
