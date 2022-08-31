.section .data
source:
.asciz "abcdefghi\n"
length:
.int 11
divisor:
.int 4
.section .bss
.lcomm dest,12

.section .text
.globl _start
_start:
leal source,%esi
leal dest,%edi

movl length,%ecx
shrl $2,%ecx #dividing by 4 to length by shifting 2 times right
rep movsl

#last moving bytes prep
movl length,%ecx
subl $1,divisor
andl divisor,%ecx

rep movsb #repeat till last bytes of reminder

pushl $dest
call printf
addl $4,%esp
pushl $0
call exit
