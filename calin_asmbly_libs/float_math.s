
.section .text

#float_math(float,int,float,float,float,int,float,float)
.globl float_math
.type float_math,@function
float_math:
pushl %ebp
movl %esp,%ebp

flds 8(%ebp)
fidiv 12(%ebp)
flds 16(%ebp)
flds 20(%ebp)
fmulp
faddp
flds 24(%ebp)
fimuls 28(%ebp)
flds 32(%ebp)
flds 36(%ebp)
fdivrp
fsubrp
fdivrp

movl %ebp,%esp
popl %ebp
ret
