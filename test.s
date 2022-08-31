.section .data
pf: .string "Hello World"
pf1: .string "flt:%f\n"
pf2: .string "%d %d\n"

scf: .string "%f"
.section .text
.type main,@function
.globl main
main:
pushl %ebp
movl %esp,%ebp
subl $8,%esp

leal -4(%ebp),%ecx
pushl %ecx
pushl $scf
call scanf
addl $12,%esp

pushl $pf
call puts
addl $4,%esp

flds -4(%ebp)
subl $8,%esp
fstpl (%esp)
pushl $pf1
call printf
addl $12,%esp



movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80
