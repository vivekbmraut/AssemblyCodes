.section .data
msg:
.asciz "The maximum is %d\n"
a:
.int 10
b:
.int 15
.section .text
.globl _start
_start:
	movl a,%eax
	movl b,%ebx
	cmp %eax,%ebx
	jle amax
	pushl %ebx
	pushl $msg
	call printf
	jmp end
amax:
	pushl %eax
	pushl $msg
	call printf
end:
	addl $8,%esp
	pushl $0
	call exit
