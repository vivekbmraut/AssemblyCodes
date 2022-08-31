.section .data
source:
.asciz "abcde"
dest:
.asciz "abcde"

pf:
.asciz "String EQUAL\n"
pf1:
.asciz "String NOT EQUAL\n"

.section .text
.globl _start
_start:
leal source,%esi
leal dest,%edi
movl $5,%ecx
cld

repe cmpsb

je eql
	pushl $pf1
	call printf
	addl $8,%esp
jmp end
eql:
	pushl $pf
	call printf
	addl $8,%esp
end:
pushl $0
call exit
