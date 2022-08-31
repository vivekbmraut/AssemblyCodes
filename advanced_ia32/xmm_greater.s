.section .rodata
pf1: .string "Enter a1 b1 c1 d1"
pf2: .string "Enter a2 b2 c2 d2"
pf3: .string "RESULT a:%x b:%x c:%x d:%x\n"

scf: .string "%f %f %f %f"

.section .text
.type main,@function
.globl main
main:
pushl %ebp
movl %esp,%ebp
subl $32,%esp

pushl $pf1
call puts
addl $4,%esp

leal -4(%ebp),%ecx
pushl %ecx
leal -8(%ebp),%ecx
pushl %ecx
leal -12(%ebp),%ecx
pushl %ecx
leal -16(%ebp),%ecx
pushl %ecx
pushl $scf
call scanf
addl $20,%esp

pushl $pf2
call puts
addl $4,%esp

leal -20(%ebp),%ecx
pushl %ecx
leal -24(%ebp),%ecx
pushl %ecx
leal -28(%ebp),%ecx
pushl %ecx
leal -32(%ebp),%ecx
pushl %ecx
pushl $scf
call scanf
addl $20,%esp

movups -16(%ebp),%xmm0
movups -32(%ebp),%xmm1

cmpps $6,%xmm1,%xmm0

subl $16,%esp
movups %xmm0,(%esp)
pushl $pf3
call printf
addl $20,%esp

movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80
