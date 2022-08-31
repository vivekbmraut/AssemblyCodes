.section .bss
.lcomm dest,9

.section .data
sour:
.ascii "Don't"
temp:
.ascii "-good"

pf:
.asciz "%s\n"

.section .text
.globl _start
_start:
leal sour,%esi
leal dest,%edi

movl $2,%ecx
rep movsl

pushl $dest
pushl $pf
call printf
addl $8,%esp
pushl $0
call exit

