.section .data
lf: .string "\nList after insertion\n"
lf1: .string "\nList after deletion Beg\n"
lf2: .string "\nList after destruction\n"
lf3: .string "\nList after insertion last\n"
lf4: .string "\nList after deletion last\n"
#pf1: .string "%d->\n"

.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

#-4(%ebp)=plist

leal -4(%ebp),%ebx
pushl %ebx
call createList		#dummy NODE
addl $4,%esp


movl $1,-8(%ebp)
jmp for
body:

pushl -8(%ebp)
pushl -4(%ebp)
call insertBeg
addl $8,%esp

addl $1,-8(%ebp)

for:cmpl $5,-8(%ebp)
jle body

pushl $lf
call printf
addl $4,%esp

pushl -4(%ebp)
call showList
addl $4,%esp

pushl -4(%ebp)
call delBeg		#delete ONE ELEMENT
addl $4,%esp

pushl $lf1
call printf
addl $4,%esp

pushl -4(%ebp)
call showList
addl $4,%esp


movl $1,-8(%ebp)
jmp for1
body1:

movl -8(%ebp),%ecx
addl $10,%ecx

pushl %ecx
pushl -4(%ebp)
call insertLast
addl $8,%esp

addl $1,-8(%ebp)

for1:cmpl $5,-8(%ebp)
jle body1

pushl $lf3
call printf
addl $4,%esp

pushl -4(%ebp)
call showList
addl $4,%esp


pushl -4(%ebp)
call delLast
addl $8,%esp


pushl $lf4
call printf
addl $4,%esp

pushl -4(%ebp)
call showList
addl $4,%esp




pushl -4(%ebp)
call destroy
addl $4,%esp	

pushl $lf2
call printf
addl $4,%esp

pushl -4(%ebp)
call showList
addl $4,%esp


movl -4(%ebp),%ebx
pushl %ebx
call free
addl $4,%esp


movl %ebp,%esp
popl %ebp

pushl $0
call exit
