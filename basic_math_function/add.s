.section .data
use:
.int 47
sign:
.int -25
.section .text
.globl _start
_start:
movl $0,%eax
movl $0,%ebx
movl $10,%ecx
movb $29,%al
addb $50,%al
movsx %al,%eax
movw $95,%bx
addw $72,%bx
movsx %bx,%ebx
addl use,%ecx
addl %ebx,use
movl $-200,%edx
addl sign,%edx
movl $1,%eax
movl $0,%ebx
int $128
