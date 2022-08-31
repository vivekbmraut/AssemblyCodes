.section .bss
.comm flag,28
.comm st,30

.section .data
set:
.asciz "SET :%s\n"

str:
.asciz "floccinaucinihilipilification"

i: .int 0

.section .text
.globl _start
_start:
leal str,%esi
leal st,%edi
cld
movl $28,%edx
jmp for

in:
movl i,%ecx
movb str(,%ecx,1),%bl
subb $97,%bl
movsx %bl,%ebx
movb flag(,%ebx,1),%cl
movsx %cl,%ecx
lodsb	#str to al 
cmpl $0,%ecx
jne incr
movsx %al,%ecx
movl $97,%ebx
subl %ebx,%ecx
movb $1,flag(,%ecx,1)
stosb
incr:addl $1,i
for:cmp %edx,i
jle in

pushl $st
pushl $set
call printf
addl $8,%esp

pushl $0
call exit
