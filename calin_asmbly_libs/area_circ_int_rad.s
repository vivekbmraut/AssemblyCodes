.section .text

.globl area_circ_int_rad
.type area_circ_int_rad , @function
area_circ_int_rad:
pushl %ebp
movl %esp,%ebp

fldpi
filds 8(%ebp)
fmul %st(0),%st(0)
fmul %st(1),%st(0) 


movl %ebp,%esp
popl %ebp
ret
