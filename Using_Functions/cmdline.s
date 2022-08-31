.section .data
pf: .string "%s\n"
pf1: .string "There are %d parameters\n"

.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $48,%esp

pushl 4(%ebp)
pushl $pf1
call printf
addl $8,%esp

movl 4(%ebp),%eax
movl %eax,-4(%ebp)
movl -4(%ebp),%ecx
movl $0,-8(%ebp)
jmp for
body:
movl %ebp,%ebx
addl $8,%ebx
movl -8(%ebp),%edx

pushl (%ebx,%edx,4)
pushl $pf
call printf
addl $8,%esp

addl $1,-8(%ebp)
movl -4(%ebp),%ecx

for:cmpl %ecx,-8(%ebp)
jl body

movl %ebp,%esp
popl %ebp
pushl $0
call exit

