.section .data
cake:
.int 501
pf:
.asciz "DIVISION of %d by %d : QUOTIENT( %d )  REMAINDER( %d )\n"
.section .text
.globl _start
_start:
movw cake,%ax
movw cake+2,%dx
movw $5,%bx
divw %bx
movzx %ax,%eax #tried to pushw ax but the program was acting in wierd way even after doing %d in printf so I converted it to 32 bit
movzx %dx,%edx
movzx %bx,%ebx
pushl %edx
pushl %eax
pushl %ebx
pushl cake
pushl $pf
call printf
addl $20,%esp
pushl $0
call exit
