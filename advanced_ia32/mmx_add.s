.section .rodata
scf: .string "%d"

pf1: .string "Enter number of elements"
pf2: .string "Enter elements ARRAY1"
pf7: .string "Enter elements ARRAY2"
pf3: .string "-----------ARRAY1----------"
pf6: .string "-----------ARRAY2----------"
pf4: .string "%d\t"
pf5: .string "\n--------------------------"
pf8: .string "%d\t%d\n"
pf9: .string "-----------Addition Array----------"
pf10: .string "Memory allocation FAIL"

.section .text
.type main,@function
.globl main
main:
pushl %ebp
movl %esp,%ebp
subl $28,%esp

pushl $pf1
call puts
addl $4,%esp

leal -4(%ebp),%ecx	#n
pushl %ecx
pushl $scf
call scanf
addl $8,%esp


movl -4(%ebp),%ecx
sall $2,%ecx
pushl %ecx
call malloc
addl $4,%esp

test %eax,%eax
jnz v1

pushl $pf10
call puts
addl $4,%esp

movl $0,%ebx
movl $1,%eax
int $0x80

v1:movl %eax,-8(%ebp)	#*arr

movl -4(%ebp),%ecx
sall $2,%ecx
pushl %ecx
call malloc
addl $4,%esp
test %eax,%eax
jnz v2

pushl $pf10
call puts
addl $4,%esp

movl $0,%ebx
movl $1,%eax
int $0x80

v2:movl %eax,-16(%ebp)	#*arr2

movl -4(%ebp),%ecx
sall $2,%ecx
pushl %ecx
call malloc
addl $4,%esp
jnz v3

pushl $pf10
call puts
addl $4,%esp

movl $0,%ebx
movl $1,%eax
int $0x80

v3:movl %eax,-20(%ebp)	#*arr3


pushl $pf2
call puts
addl $4,%esp

movl $0,-12(%ebp)	#i=0
movl $0,%ecx

#-------------------------------GET ARRAY 1 ELEMENTS--------------------------

jmp for
body:
movl -8(%ebp),%eax

leal (%eax,%ecx,4),%eax
pushl %eax
pushl $scf
call scanf
addl $8,%esp

movl -12(%ebp),%ecx
addl $1,%ecx
movl %ecx,-12(%ebp)

for:cmpl -4(%ebp),%ecx
jl body

#-------------------------------------------------------------------------------
#-------------------------------GET ARRAY 2 ELEMENTS--------------------------
pushl $pf7
call puts
addl $4,%esp

movl $0,%ecx
movl %ecx,-12(%ebp)

jmp for3
body3:
movl -16(%ebp),%eax

leal (%eax,%ecx,4),%eax
pushl %eax
pushl $scf
call scanf
addl $8,%esp

movl -12(%ebp),%ecx
addl $1,%ecx
movl %ecx,-12(%ebp)

for3:cmpl -4(%ebp),%ecx
jl body3

#-------------------------------------------------------------------------------


#--------------------------------PRINTING ARRAY 1 ELEMENTS----------------------
pushl $pf3
call puts
addl $4,%esp

movl $0,-12(%ebp)	#i=0
movl $0,%ecx

jmp for2
body2:
movl -8(%ebp),%eax

pushl (%eax,%ecx,4)
pushl $pf4
call printf
addl $8,%esp

movl -12(%ebp),%ecx
addl $1,%ecx
movl %ecx,-12(%ebp)

for2:cmpl -4(%ebp),%ecx
jl body2

pushl $pf5
call puts 
addl $4,%esp

#------------------------------------------------------------------------------
#--------------------------------PRINTING ARRAY 2 ELEMENTS----------------------
pushl $pf6
call puts
addl $4,%esp

movl $0,-12(%ebp)	#i=0
movl $0,%ecx

jmp for4
body4:
movl -16(%ebp),%eax

pushl (%eax,%ecx,4)
pushl $pf4
call printf
addl $8,%esp

movl -12(%ebp),%ecx
addl $1,%ecx
movl %ecx,-12(%ebp)

for4:cmpl -4(%ebp),%ecx
jl body4

pushl $pf5
call puts 
addl $4,%esp

#-----------------------------------------------------------------------------
movl -4(%ebp),%edx
movl %edx,%eax

andl $0x00000001,%edx
sarl $1,%eax

movl %eax,-24(%ebp)	#quotient
movl %edx,-28(%ebp)	#remainder

movl $0,%ecx
movl -8(%ebp),%edx
movl -16(%ebp),%ebx
jmp for_arr3
body_arr3:
movq (%edx,%ecx,8),%mm0
movq (%ebx,%ecx,8),%mm1
paddd %mm1,%mm0

movl -20(%ebp),%eax
movq %mm0,(%eax,%ecx,8)

addl $1,%ecx

for_arr3:cmpl -24(%ebp),%ecx
jl body_arr3

movl -28(%ebp),%eax
test %eax,%eax
jz print
movl -8(%ebp),%edx
movl -16(%ebp),%ebx
movl -20(%ebp),%eax
movl (%edx,%ecx,8),%edx
addl (%ebx,%ecx,8),%edx

movl %edx,(%eax,%ecx,8)
print:
#--------------------------------PRINTING ARRAY 3 ELEMENTS----------------------
pushl $pf9
call puts
addl $4,%esp

movl $0,-12(%ebp)	#i=0
movl $0,%ecx

jmp for5
body5:
movl -20(%ebp),%eax

pushl (%eax,%ecx,4)
pushl $pf4
call printf
addl $8,%esp

movl -12(%ebp),%ecx
addl $1,%ecx
movl %ecx,-12(%ebp)

for5:cmpl -4(%ebp),%ecx
jl body5

pushl $pf5
call puts 
addl $4,%esp

#-----------------------------------------------------------------------------
 

pushl -8(%ebp)
call free
addl $4,%esp

movl $0,-8(%ebp)

pushl -16(%ebp)
call free
addl $4,%esp

movl $0,-16(%ebp)

pushl -20(%ebp)
call free
addl $4,%esp

movl $0,-20(%ebp)

movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80


