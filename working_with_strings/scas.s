.section .data
str: .asciz "True Peace @ Assembly"
strl: .int 21
search: .ascii "@"
pf: .asciz "The search found at %d postion\n"
pf1: .asciz "NOT FOUND\n"
.section .text
.globl _start
_start:
movl $str,%edi
movl strl,%ecx
movb $'@',%al

repne scasb
jne notfound #jnz can also be used

subl strl,%ecx
negl %ecx

pushl %ecx
pushl $pf
call printf
addl $8,%esp
jmp end

notfound:
	pushl $pf1
	call printf
	addl $4,%esp
end:
	pushl $0
	call exit
