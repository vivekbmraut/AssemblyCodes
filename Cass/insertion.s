.section .data
pf: .string "Enter size of array : "

sf: .string "%d"

.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $48,%esp

pushl $pf
call printf
addl $4,%esp

leal -4(%ebp),%eax	#eax=&n
pushl %eax
pushl $sf
call scanf
addl $8,%esp

movl -4(%ebp),%ebx	#ebx=n
sall $2,%ebx		#ebx=ebx*4

movl $0,%eax
pushl %ebx
call malloc		#malloc(%ebx)
movl %eax,-8(%ebp)	#arr=%eax=malloc(%ebx)

pushl -4(%ebp)
pushl -8(%ebp)
call accept		#accept(arr,n)
addl $4,%esp

pushl -4(%ebp)
pushl -8(%ebp)
call display		#display(arr,n)
addl $4,%esp

pushl -4(%ebp)
pushl -8(%ebp)
call insertionSort
addl $8,%esp

pushl -4(%ebp)
pushl -8(%ebp)
call display		#display(arr,n)
addl $4,%esp


pushl -8(%ebp)
call free
addl $4,%esp

movl %ebp,%esp
popl %ebp

pushl $0
call exit

