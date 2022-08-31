.section .bss
.comm  cpu_nam 13

.section .text
.globl cpu_name
.type cpu_name,@function
cpu_name:
pushl %ebp
movl %esp,%ebp
pushl %ebx
pushl %edi

movl $0,%eax
cpuid
movl $cpu_nam,%edi
movl %ebx,(%edi)
movl %edx,4(%edi)
movl %ecx,8(%edi)

movl %edi,%eax

popl %edi
popl %ebx
movl %ebp,%esp
popl %ebp
ret
