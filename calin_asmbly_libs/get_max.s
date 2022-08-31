.section .text

.globl get_max
.type get_max,@function 
get_max:
pushl %ebp
movl %esp ,%ebp

movl 8(%ebp),%ecx
movl 12(%ebp),%edx

cmpl %ecx,%edx  #i<j
jg sec_par
movl 8(%ebp),%eax
jmp end
sec_par:
movl 12(%ebp),%eax

end:
movl %ebp,%esp
popl %ebp
ret

