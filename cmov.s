.section .data
msg:
.asciz "value moved = %d\n"
chk:
.int 10
.section .text
.globl _start
_start:
movl $2,%eax
movl $1,%ebx
movl $0,%ecx
cmp %eax,%ebx
cmovbe chk,%ecx
movl %ecx,chk
pushl chk
pushl $msg
call printf
addl $8,%esp
push $0
call exit
