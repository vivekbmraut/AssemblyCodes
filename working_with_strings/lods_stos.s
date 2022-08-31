.section .bss
.comm dest,501
.section .data
at:
.asciz "@"
.section .text
.globl _start
_start:
movl $at,%esi
movl $dest,%edi
movl $500,%ecx
cld

lodsb
rep stosb

pushl $dest
call printf
addl $4,%esp

pushl $0
call exit

