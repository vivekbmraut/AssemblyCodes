.section .data
msg:
.asciz "Value of a=%d  b=%d\n"
msg1:
.asciz "After swap\nValue of a=%d b=%d\n"
a:
.int 10
b:
.int 20
.section .text
.globl _start
_start:
pushl b
pushl a
pushl $msg
call printf
movl a,%eax
movl b,%ebx
xchg %eax,%ebx
movl %eax,a
movl %ebx,b
addl $12,%esp
pushl b
pushl a
pushl $msg1
call printf
addl $12,%esp
pushl $0
call exit
