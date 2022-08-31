.section .bss
.comm a,4
.comm b,4
.comm c,4
.section .data
msg: 
.asciz "%d is greater than %d & %d\n"
msg1:
.asciz "%d is less than %d & %d\n"
msg2:
.asciz "%d is in between %d and %d\n"
msg3:
.asciz "Enter value-"
msg4:
.asciz "%d"
.section .text
.globl _start
_start:
	pushl $msg3
	call printf
	addl $4,%esp
	pushl $a
	pushl $msg4
	call scanf
	addl $8,%esp
	
	pushl $msg3
	call printf
	addl $4,%esp
	pushl $b
	pushl $msg4
	call scanf
	addl $8,%esp

	pushl $msg3
	call printf
	addl $4,%esp
	pushl $c
	pushl $msg4
	call scanf
	addl $8,%esp

	movl a,%eax
	movl b,%ebx
	movl c,%ecx

	cmp %ebx,%eax
	jle chb
	cmp %ecx,%eax
	jle chb
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $msg
	call printf
	addl $16,%esp
	jmp lch
chb:
	cmp %eax,%ebx
	jle ic
	cmp %ecx,%ebx
	jle ic
	pushl %ecx
	pushl %eax
	pushl %ebx
	pushl $msg
	call printf
	addl $16,%esp
	jmp lch
ic:
	pushl %ebx
	pushl %eax
	pushl %ecx
	pushl $msg
	call printf
	addl $16,%esp
lch:
	movl a,%eax
	movl b,%ebx
	movl c,%ecx

	cmp %ebx,%eax
	jge lchb
	cmp %ecx,%eax
	jge lchb
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $msg1
	call printf
	addl $16,%esp
	jmp bch
lchb:
	cmp %eax,%ebx
	jge lic
	cmp %ecx,%ebx
	jge lic
	pushl %eax
	pushl %ecx
	pushl %ebx
	pushl $msg1
	call printf
	addl $16,%esp
	jmp bch
lic:
	pushl %ebx
	pushl %eax
	pushl %ecx
	pushl $msg1
	call printf
	addl $16,%esp
bch:
	movl a,%eax
	movl b,%ebx
	movl c,%ecx

	cmp %ebx,%eax
	jle OR1
	cmp %ecx,%eax
	jge bchb
	jmp btres1
OR1:	
	cmp %ecx,%eax
	jle bchb
btres1:
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $msg2
	call printf
	addl $16,%esp
	jmp end
bchb:
	cmp %eax,%ebx
	jle OR2
	cmp %ecx,%ebx
	jge bic
	jmp btres2
OR2:	
	cmp %ecx,%ebx
	jle bic
btres2:
	pushl %ecx
	pushl %eax
	pushl %ebx
	pushl $msg2
	call printf
	addl $16,%esp
	jmp end
bic:
	pushl %ebx
	pushl %eax
	pushl %ecx
	pushl $msg2
	call printf
	addl $16,%esp
end:
	pushl $0
	call exit
