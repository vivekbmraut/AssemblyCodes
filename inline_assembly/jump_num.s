	.file	"jump_num.c"
	.section	.rodata
.LC0:
	.string	"enter 2 nos"
.LC1:
	.string	"%d%d"
.LC2:
	.string	"Max Number : %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$6, -24(%ebp)
	movl	$2, -20(%ebp)
	movl	$0, -16(%ebp)
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	addl	$16, %esp
	subl	$4, %esp
	leal	-20(%ebp), %eax
	pushl	%eax
	leal	-24(%ebp), %eax
	pushl	%eax
	pushl	$.LC1
	call	__isoc99_scanf
	addl	$16, %esp
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
#APP
# 9 "jump_num.c" 1
	cmpl %eax,%edx
	jge 0f
	movl %eax,%eax
	jmp 1f
	0:movl %edx,%eax
	1:
# 0 "" 2
#NO_APP
	movl	%eax, -16(%ebp)
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	addl	$16, %esp
	subl	$4, %esp
	leal	-20(%ebp), %eax
	pushl	%eax
	leal	-24(%ebp), %eax
	pushl	%eax
	pushl	$.LC1
	call	__isoc99_scanf
	addl	$16, %esp
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
#APP
# 18 "jump_num.c" 1
	cmpl %eax,%edx
	jge 0f
	movl %eax,%eax
	jmp 1f
	0:movl %edx,%eax
	1:
# 0 "" 2
#NO_APP
	movl	%eax, -16(%ebp)
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	movl	$0, %eax
	movl	-12(%ebp), %ecx
	xorl	%gs:20, %ecx
	je	.L3
	call	__stack_chk_fail
.L3:
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
