.section .rodata
pf1: .string "Enter number of elements"
pf2: .string "Enter float elements array1"
pf2a: .string "Enter float elements array2"
pf3: .string "%f\t"
pf4: .string "------------------------ARRAY1---------------------------------"
pf5: .string "------------------------ARRAY2---------------------------------"
pf6: .string "\n--------------------------------------------------------------"
pf7: .string "------------------------ADDITION-------------------------------"
pf8: .string "MALLOC FAILURE"

scf1: .string "%d"
scf2: .string "%f"

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

leal -4(%ebp),%eax 		#n
pushl %eax
pushl $scf1
call scanf
addl $12,%esp

movl -4(%ebp),%ecx
sall $2,%ecx
pushl %ecx
call malloc
addl $4,%esp

test %eax,%eax
jnz v1
pushl $pf8
call puts
addl $4,%esp

movl $1,%eax
movl $0,%ebx
int $0x80

v1:movl %eax,-8(%ebp)		#arr

movl -4(%ebp),%ecx
sall $2,%ecx
pushl %ecx
call malloc
addl $4,%esp

test %eax,%eax
jnz v2
pushl $pf8
call puts
addl $4,%esp

movl $1,%eax
movl $0,%ebx
int $0x80

v2:movl %eax,-16(%ebp)		#arr2
movl -4(%ebp),%ecx
sall $2,%ecx
pushl %ecx
call malloc
addl $4,%esp

test %eax,%eax
jnz v3
pushl $pf8
call puts
addl $4,%esp

movl $1,%eax
movl $0,%ebx
int $0x80

v3:movl %eax,-20(%ebp)		#arr3


#--------------------------------------------GET ARRAY 1 ---------------------------------
pushl $pf2
call puts
addl $4,%esp

movl $0,%ecx
jmp f1
b1:
movl -8(%ebp),%edx
leal (%edx,%ecx,4),%edx
pushl %edx
pushl $scf2 
call scanf
addl $8,%esp

movl -12(%ebp),%ecx
addl $1,%ecx


f1:movl %ecx,-12(%ebp)
cmpl -4(%ebp),%ecx
jl b1


#-----------------------------------------------------------------------------------------
#------------------------------------------- GET ARRAY 2 ---------------------------------
pushl $pf2a
call puts 
addl $4,%esp

movl $0,%ecx
jmp f3
b3:
movl -16(%ebp),%edx
leal (%edx,%ecx,4),%edx
pushl %edx
pushl $scf2 
call scanf
addl $8,%esp

movl -12(%ebp),%ecx
addl $1,%ecx


f3:movl %ecx,-12(%ebp)
cmpl -4(%ebp),%ecx
jl b3


#-----------------------------------------------------------------------------------------

#--------------------------------------------PRINT ARRAY 1 ---------------------------------
pushl $pf4
call puts
addl $4,%esp

movl $0,%ecx
jmp f2
b2:
movl -8(%ebp),%edx
flds (%edx,%ecx,4)
subl $8,%esp
fstpl (%esp)
pushl $pf3 
call printf
addl $12,%esp

movl -12(%ebp),%ecx
addl $1,%ecx

f2:movl %ecx,-12(%ebp)
cmpl -4(%ebp),%ecx
jl b2

pushl $pf6
call puts
addl $4,%esp

#-----------------------------------------------------------------------------------------
#-------------------------------------------- PRINT ARRAY 2 ---------------------------------
pushl $pf5
call puts
addl $4,%esp

movl $0,%ecx
jmp f4
b4:
movl -16(%ebp),%edx
flds (%edx,%ecx,4)
subl $8,%esp
fstpl (%esp)
pushl $pf3 
call printf
addl $12,%esp

movl -12(%ebp),%ecx
addl $1,%ecx

f4:movl %ecx,-12(%ebp)
cmpl -4(%ebp),%ecx
jl b4

pushl $pf6
call puts
addl $4,%esp

#-----------------------------------------------------------------------------------------
movl -4(%ebp),%ecx
movl %ecx,%edx
sarl $2,%ecx
andl $0x00000003,%edx
movl %ecx,-24(%ebp)		#quotient
movl %edx,-28(%ebp)		#remainder

movl $0,%ecx
jmp f5
b5:
movl -8(%ebp),%eax
movl -16(%ebp),%ebx
movl -20(%ebp),%edx
leal (%eax,%ecx,8),%eax
movups (%eax,%ecx,8),%xmm0
leal (%ebx,%ecx,8),%ebx
movups (%ebx,%ecx,8),%xmm1
addps %xmm1,%xmm0

leal (%edx,%ecx,8),%edx
movups %xmm0,(%edx,%ecx,8)

addl $1,%ecx

f5:cmpl -24(%ebp),%ecx
jl b5

movl -28(%ebp),%eax
test %eax,%eax
jz print
movl -8(%ebp),%eax
leal (%eax,%ecx,8),%eax
leal (%eax,%ecx,8),%eax
movl -16(%ebp),%ebx
leal (%ebx,%ecx,8),%ebx
leal (%ebx,%ecx,8),%ebx
movl -20(%ebp),%edx
leal (%edx,%ecx,8),%edx
leal (%edx,%ecx,8),%edx

movl $0,%ecx
jmp f7
b7:
movss (%eax,%ecx,4),%xmm0
movss (%ebx,%ecx,4),%xmm1

addss %xmm1,%xmm0
movss %xmm0,(%edx,%ecx,4)

addl $1,%ecx
f7:cmpl -28(%ebp),%ecx
jl b7

print:
#-------------------------------------------- PRINT ARRAY 3 ---------------------------------
pushl $pf7
call puts
addl $4,%esp

movl $0,%ecx
jmp f6
b6:
movl -20(%ebp),%edx
flds (%edx,%ecx,4)
subl $8,%esp
fstpl (%esp)
pushl $pf3 
call printf
addl $12,%esp

movl -12(%ebp),%ecx
addl $1,%ecx

f6:movl %ecx,-12(%ebp)
cmpl -4(%ebp),%ecx
jl b6

pushl $pf6
call puts
addl $4,%esp

#-----------------------------------------------------------------------------------------

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

