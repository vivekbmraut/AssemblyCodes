.section .data
source:
.asciz "abcde"
sourlen: .int 5

dest: .asciz "abcde"
destlen: .int 5

tes: .asciz "test\n"
pf: .asciz "source greater than dest\n"
pf1: .asciz "source lesser than dest\n"
pf2: .asciz "source equal than dest\n"
.section .text
.globl _start
_start:
movl $source,%esi
movl $dest,%edi
cld
movl sourlen,%eax
movl destlen,%ecx
cmpl %eax,%ecx 
jb small
movl %eax,%ecx
small:
repe cmpsb
jl less
	
jg great
	movl sourlen,%eax
	movl destlen,%ecx
	cmpl %ecx,%eax
	jl less
	jg great
	pushl $pf2
	call printf
	addl $4,%esp
jmp end
great:
	pushl $pf
	call printf
	addl $4,%esp
jmp end
less:
	pushl $pf1
	call printf
	addl $4,%esp
end:
pushl $0
call exit
