.section .data
msg:
.asciz "Value of a=%d\n"
msg1:
.asciz "After bswap\nValue of a=%d\n"
a:
.int 128
.section .text
.globl _start
_start:
pushl a
pushl $msg
call printf
movl a,%eax
bswap %eax
movl %eax,a
addl $8,%esp
pushl a
pushl $msg1
call printf
addl $8,%esp
pushl $0
call exit
