.section .rodata
wr1: .string "Insufficient args\n"


.section .text
.type main,@function
.globl main
main:
pushl %ebp
movl %esp,%ebp
subl $1028,%esp

movl 4(%ebp),%ecx
cmpl $2,%ecx
jl end

movl $5,%eax		#open
movl 12(%ebp),%ebx
movl $00,%ecx
int $0x80

test %eax,%eax
js end

movl %eax,1028(%ebp)

read:
movl $3,%eax
movl 1028(%ebp),%ebx
leal 1024(%ebp),%ecx
movl $1024,%edx
int $0x80
test %eax,%eax
jz end
js end
movl %eax,%edx
movl $4,%eax
movl $1,%ebx
leal 1024(%ebp),%ecx
int $0x80
test %eax,%eax
js end
jmp read

done:
movl $6,%eax		#close
movl 1028(%ebp),%ebx
int $0x80


end:
movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80



