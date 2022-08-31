.section .data
dest: .asciz "Machine langauge is Love"
source: .ascii "gaug"
destlen: .int 24
pf: .asciz "NOT FOUND\n"
pf1: .asciz "Found at %d postion\n"

.section .text
.globl _start
_start:
leal dest,%edi
leal source,%esi
cld
lodsl #loads esi gaug to ecx for scasl
movl $6,%ecx

repne scasl
jne notfound

sall $2,%ecx
subl destlen,%ecx
negl %ecx

pushl %ecx
pushl $pf1
call printf
addl $8,%esp
jmp end
notfound:
	pushl $pf
	call printf
	addl $4,%esp
end:
	pushl $0
	call exit
