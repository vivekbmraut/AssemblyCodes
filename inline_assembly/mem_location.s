	.file	"mem_location.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"Careful if result is above 255 error would be generated"
.LC1:
	.string	"Enter dividend"
.LC2:
	.string	"%d"
.LC3:
	.string	"Enter divisor"
	.align 4
.LC4:
	.string	"\t\t(%d/%d)\nQuotient:%d | Remainder:%d\n"
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
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$32, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$502, -28(%ebp)
	movl	$5, -24(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC1
	call	puts
	addl	$16, %esp
	subl	$8, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC3
	call	puts
	addl	$16, %esp
	subl	$8, %esp
	leal	-24(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf
	addl	$16, %esp
	movl	-28(%ebp), %eax
#APP
# 14 "mem_location.c" 1
	divb -24(%ebp)
	movb %al,-16(%ebp)
	movb %ah,-20(%ebp)
	
# 0 "" 2
#NO_APP
	movl	-20(%ebp), %ebx
	movl	-16(%ebp), %ecx
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %eax
	subl	$12, %esp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$.LC4
	call	printf
	addl	$32, %esp
	movl	$0, %eax
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
	je	.L3
	call	__stack_chk_fail
.L3:
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
