.section .data
pf: .string "%s\n"

.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

leal 16(%ebp),%ebx
movl %ebx,-4(%ebp)
jmp while
body:

pushl (%ebx)
pushl $pf
call printf
addl $8,%esp
addl $4,-4(%ebp)
movl -4(%ebp),%ebx
while:cmpl $0,(%ebx)
jne body

movl %ebp,%esp
popl %ebp

pushl $0
call exit
