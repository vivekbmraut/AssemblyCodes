.section .data
pf: .string "Addition of %d & %d is %d\n"

.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

cmpl $1,4(%ebp)
je end

movl $0,%eax
pushl 12(%ebp)
call atoi
addl $4,%esp

movl %eax,-4(%ebp)

movl $0,%eax
pushl 16(%ebp)
call atoi
addl $4,%esp
movl %eax,-8(%ebp)

movl -4(%ebp),%ebx
addl -8(%ebp),%ebx

pushl %ebx
pushl -8(%ebp)
pushl -4(%ebp)
pushl $pf
call printf
addl $16,%esp

end:movl %ebp,%esp
popl %ebp

pushl $0
call exit
