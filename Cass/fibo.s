.section .bss
.lcomm num,4
.lcomm a,4
.section .data
n1: .int 0
n2: .int 1
n3: .int 0
pf:
.asciz "%d\t"
pf1:
.asciz "Enter 'n' : "
sc:
.asciz "%d"
.section .text
.globl _start
_start:
pushl $pf1
call printf
addl $4,%esp

pushl $num
pushl $sc
call scanf
addl $8,%esp

movl num,%edi
movl $0,a
jmp while
body:
movl n2,%ebx
addl n1,%ebx
movl %ebx,n3

pushl n2
pushl $pf
call printf
addl $8,%esp

movl n2,%eax
movl %eax,n1
movl n3,%eax
movl %eax,n2

addl $1,a
while:
cmp %edi,a
jl body

pushl $0
call exit
