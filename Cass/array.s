.section .data
sf: .string "%d"


pf: .string "Enter number of elements :"
pf1: .string "Enter Elements\n"
pf2: .string "\n--------Array--------\n"
pf3: .string "%d\t"
pf4: .string "\n"

.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $60,%esp

pushl $pf
call printf
addl $4,%esp

leal -44(%ebp),%eax
pushl %eax
pushl $sf
call scanf
addl $8,%esp

pushl $pf1
call printf
addl $4,%esp


movl $0,-48(%ebp) 	#i=0
movl -48(%ebp),%ecx
jmp for
body:

leal -40(%ebp,%ecx,4),%eax
pushl %eax
pushl $sf
call scanf
addl $8,%esp

movl -48(%ebp),%ecx
addl $1,%ecx 		#i++
movl %ecx,-48(%ebp)
for:cmpl -44(%ebp),%ecx #i<n
jl body

pushl $pf2
call printf
addl $4,%esp


movl $0,-48(%ebp) 	#i=0
movl -48(%ebp),%ecx
jmp for2
body2:
movl -40(%ebp,%ecx,4),%ebx
pushl %ebx
pushl $pf3
call printf
addl $8,%esp

movl -48(%ebp),%ecx
addl $1,%ecx 		#i++
movl %ecx,-48(%ebp)
for2:cmpl -44(%ebp),%ecx #i<n
jl body2


pushl $pf4
call printf
addl $4,%esp

end:
movl %ebp,%esp
popl %ebp

pushl $0
call exit
