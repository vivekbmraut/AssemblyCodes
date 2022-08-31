.section .rodata
wr1: .string "This print is from asmbly\n"


.section .text
.globl test_print
.type test_print,@function
test_print:
pushl %ebp
pushl %ebx

movl $4,%eax
movl $1,%ebx
movl $wr1,%ecx
movl $26,%edx
int $0x80


popl %ebx
popl %ebp
ret
