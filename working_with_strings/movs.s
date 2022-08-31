.section .bss
.lcomm smoll,29
.section .data
bigword:
.asciz "floccinaucinihilipilification"
pf:
.asciz "MOVS ~~ %s\n"
.section .text
.globl _start
_start:
movl $bigword,%esi
leal smoll,%edi
movsb
pushl $smoll
pushl $pf
call printf
addl $8,%esp
movsw
pushl $smoll
pushl $pf
call printf
addl $8,%esp
movsl
pushl $smoll
pushl $pf
call printf
addl $8,%esp
pushl $0
call exit
