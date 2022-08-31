.section .bss
.lcomm hoe,4
.section .data
pf:
.asciz "I_MULTIPLICATION  of %d and %d is %qd\n"
pf1:
.asciz "I_MULTIPLICATION 2nd Method  of %d and %d is %d\n"
pf2:
.asciz "I_MULTIPLICATION 3rd Method  of  multi:%d  and %d is %d\n"
.section .text
.globl _start
_start:
movl $-240,%eax
movl %eax,hoe  #just for printf
movl $620,%ebx
imull %ebx #1st Method
pushl %edx
pushl %eax
pushl %ebx
pushl hoe
pushl $pf
call printf
addl $20,%esp
movl $-40,%ecx
movl %ecx,hoe  #just for printf
movl $40,%ebx
imull %ebx,%ecx #2nd Method
pushl %ecx
pushl hoe
pushl %ebx
pushl $pf1
call printf
addl $16,%esp
movl $60,hoe #for printf sake
movl $-2,%ecx
imull $60,%ecx,%edx #3rd Method multiplier compulsory immediate value
pushl %edx
pushl %ecx
pushl hoe
pushl $pf2
call printf
addl $16,%esp
pushl $0
call exit
