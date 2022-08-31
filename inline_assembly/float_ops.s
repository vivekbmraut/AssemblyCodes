	.file	"float_ops.c"
	.section	.rodata
.LC0:
	.string	"Enter angle"
.LC1:
	.string	"%f"
.LC3:
	.string	"sine(%f):%f | cos(%f):%f\n"
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
	subl	$36, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	addl	$16, %esp
	subl	$8, %esp
	leal	-32(%ebp), %eax
	pushl	%eax
	pushl	$.LC1
	call	__isoc99_scanf
	addl	$16, %esp
#APP
# 10 "float_ops.c" 1
	fldpi
# 0 "" 2
#NO_APP
	fstps	-28(%ebp)
	flds	-32(%ebp)
	fmuls	-28(%ebp)
	flds	.LC2
	fdivrp	%st, %st(1)
	fstps	-24(%ebp)
	flds	-24(%ebp)
#APP
# 12 "float_ops.c" 1
	fsincos
# 0 "" 2
#NO_APP
	fstps	-20(%ebp)
	fstps	-16(%ebp)
	flds	-20(%ebp)
	flds	-32(%ebp)
	flds	-16(%ebp)
	flds	-32(%ebp)
	fxch	%st(3)
	subl	$12, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	fxch	%st(1)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	$.LC3
	call	printf
	addl	$48, %esp
	movl	$0, %eax
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
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
	.section	.rodata
	.align 4
.LC2:
	.long	1127481344
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
