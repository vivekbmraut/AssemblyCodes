.section .rodata
ps1: .string "Enter a1 , b1"
ps2: .string "Enter a2 , b2"

scf1: .string "%d %d"
pf: .string "a1>a2:%x , b1>b2:%x\n"

.section .text
.type main,@function
.globl main
main:
pushl %ebp
movl %esp,%ebp
subl $24,%esp


pushl $ps1
call puts
addl $4,%esp
leal -4(%ebp),%eax
leal -8(%ebp),%ebx

pushl %eax
pushl %ebx
pushl $scf1
call scanf
addl $12,%esp


pushl $ps2
call puts
addl $4,%esp
leal -12(%ebp),%eax
leal -16(%ebp),%ebx

pushl %eax
pushl %ebx
pushl $scf1
call scanf
addl $12,%esp

movq -8(%ebp),%mm0
movq -16(%ebp),%mm1

pcmpgtd %mm1,%mm0

movq %mm0,-24(%ebp)

pushl -20(%ebp)
pushl -24(%ebp)
pushl $pf
call printf
addl $12,%esp


movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80
