.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $1036,%esp

movl 4(%ebp),%ecx
cmpl $3,%ecx
jl end

movl $5,%eax		#open
movl 12(%ebp),%ebx
movl $00,%ecx
int $0x80

test %eax,%eax
js end

movl %eax,-1028(%ebp) 	#fdsrc

movl $5,%eax		#open
movl 16(%ebp),%ebx
movl $01101,%ecx
movl $0666,%edx
int $0x80
test %eax,%eax
js src_cl

movl %eax,-1036(%ebp)	#fdst

jmp rd_loop

body:
movl %eax,-1032(%ebp)	#rdcnt
pushl -1032(%ebp)
leal -1024(%ebp),%ecx
pushl %ecx
call convert
addl $8,%esp

movl $4,%eax
movl -1036(%ebp),%ebx
leal -1024(%ebp),%ecx
movl -1032(%ebp),%edx
int $0x80 
test %eax,%eax
js dst_cl

rd_loop:
movl $3,%eax
movl -1028(%ebp),%ebx
leal -1024(%ebp),%ecx
movl $1024,%edx
int $0x80
cmpl $0,%eax
jg body


dst_cl:
movl $6,%eax		#close
movl -1036(%ebp),%ebx
int $0x80


src_cl:
movl $6,%eax		#close
movl -1028(%ebp),%ebx
int $0x80


end:
movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80


.globl convert
.type convert,@function
convert:								#convert(char * str,size)
pushl %ebp
movl %esp,%ebp
pushl %esi
pushl %edi

movl 12(%ebp),%ecx 		#size
movl 8(%ebp),%esi		#esi=str
movl %esi,%edi			#edi=str

loop_str:
lodsb
cmpb $97,%al
jl skip
cmpb $122,%al
jg skip
subb $32,%al
skip:
stosb
loop loop_str


popl %edi
popl %esi
movl %ebp,%esp
popl %ebp
ret	
