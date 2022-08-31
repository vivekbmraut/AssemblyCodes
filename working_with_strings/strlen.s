.section .bss
.comm str,50
.section .data
pf: .asciz "Enter string\n"
pf1: .asciz "Length of string \" %s \" is %d\n"
pf2: .asciz "NOT FOUND\n"
sc: .asciz "%[^\n]%*c"
.section .text
.globl _start
_start:
pushl $pf
call printf
addl $4,%esp

pushl $str
pushl $sc
call scanf
addl $8,%esp

leal str,%edi
movl $0,%eax
movl $0xffff,%ecx #REP limit
cld
repne scasb
jne notfound
subw $0xffff,%cx
neg %cx
dec %cx
movsx %cx,%ecx

pushl %ecx
pushl $str
pushl $pf1
call printf
addl $12,%esp
jmp end
notfound:
pushl $pf2
call printf
addl $4,%esp

end:
pushl $0
call exit



