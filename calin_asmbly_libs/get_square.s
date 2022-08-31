.section .text

.globl get_square
.type get_square,@function
get_square:
pushl %ebp
movl %esp,%ebp

movl 8(%ebp),%eax
imull %eax


movl %ebp,%esp
popl %ebp
ret
