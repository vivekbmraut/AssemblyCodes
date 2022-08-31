.section .data
sf: .string "%f"
pf: .string "Enter radius:"
pf1: .string "Area of Circle =%f\n"

.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

movl $0,%eax
pushl $pf
call printf
addl $4,%esp

leal -8(%ebp),%eax
pushl %eax
pushl $sf
call scanf
addl $8,%esp

pushl -8(%ebp)
call CalArea
addl $4,%esp


#flds -8(%ebp)
subl $8,%esp
fstpl (%esp)
pushl $pf1
call printf
addl $12,%esp

movl %ebp,%esp
popl %ebp

pushl $0
call exit


.type CalArea.@function
CalArea:
pushl %ebp
movl %esp,%ebp

flds 8(%ebp)
fmul %st(0),%st(0)
fldpi
fmulp %st(0),%st(1)

movl %ebp,%esp
popl %ebp

ret
