.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $12,%esp

movl 4(%ebp),%eax
cmpl $2,%eax
jl end

movl $5,%eax				#open
movl 12(%ebp),%ebx			#argv[1]
movl $02,%ecx				#O_RDWR
int $0x80
test %eax,%eax
js end

movl %eax,-4(%ebp)			#fd


movl %eax,%ebx				#fd
movl $0,%ecx				#offset
movl $2,%edx				#SEEK_END
movl $19,%eax				#lseek
int $0x80
test %eax,%eax
js end

movl %eax,-12(%ebp)			#size

movl $90,%eax				#mmap
pushl $0					#offset
pushl -4(%ebp)				#fd
pushl $1					#MAP_SHARE
pushl $3					#PROT_READ|PROT_WRITE
pushl -12(%ebp)				#length
pushl $0					#addr
movl %esp,%ebx
int $0x80
addl $24,%esp

movl %eax,-8(%ebp)			#map_loc

movl $6,%eax				#close
movl -4(%ebp),%ebx			#fd
int $0x80

pushl -12(%ebp)				#size
pushl -8(%ebp)				#m_loc
call convert
addl $8,%esp

movl $91,%eax				#munmap
movl -8(%ebp),%ebx			#addr
movl -12(%ebp),%ecx			#size
int $0x80

movl $0,-8(%ebp)

end:
movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80



.globl convert
.type convert,@function 	#convert(char* str,int size);
convert:
pushl %ebp
movl %esp,%ebp
pushl %esi
pushl %edi

movl 8(%ebp),%esi
movl %esi,%edi

movl 12(%ebp),%ecx

loop_cnvrt:
lodsb
cmpb $97,%al
jl skip
cmpb $122,%al
jg skip
subb $32,%al
skip:
stosb
loop loop_cnvrt

popl %edi
popl %esi
movl %ebp,%esp
popl %ebp
ret

