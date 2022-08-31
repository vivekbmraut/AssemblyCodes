.section .data
pf:
.asciz "REP movsb ~~ %s\n"
bigword:
.asciz "floccinaucinihilipilification"

.section .bss
.lcomm smoll,29

.section .text
.globl _start
_start:
leal bigword,%esi
leal smoll,%edi

movl $10,%ecx
rep movsb

pushl $smoll
pushl $pf
call printf
addl $8,%esp

pushl $0
call exit
