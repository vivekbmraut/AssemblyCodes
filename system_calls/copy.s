.section .rodata
wr1: .string "Insufficient arguments [./copy source destin]\n"
wr2: .string "source file open error\n"
wr3: .string "destination file open error\n"


.section .text
.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $8,%esp


cmpl $2,4(%ebp)
jle insuf


movl $5,%eax			#open
movl 12(%ebp),%ebx		#source file name
movl $00,%ecx			#O_RDONLY
movl $0666,%edx			#0666 perms
int $0x80

movl %eax,-4(%ebp)	#fdsrc=open(argv[1],O_RDONLY,0666)
cmpl $0,%eax
jl srcErr

movl $5,%eax			#open
movl 16(%ebp),%ebx		#dest file name
movl $01,%ecx			#O_WRONLY
orl $0100,%ecx			#O_CREAT
orl $01000,%ecx			#O_TRUNC
movl $0666,%edx			#0666 perms
int $0x80

movl %eax,-8(%ebp)	#fddest=open(argv[1],O_RDONLY,0666)
cmpl $0,%eax
jl destErr



#copy(fdsrc,fddest)
pushl -8(%ebp)
pushl -4(%ebp)
call copy
addl $8,%esp


movl -8(%ebp),%ebx
movl $6,%eax
int $0x80

movl -4(%ebp),%ebx
movl $6,%eax
int $0x80

jmp end


destErr:
movl -4(%ebp),%ebx
movl $6,%eax
int $0x80

movl $1,%ebx
movl $wr3,%ecx
movl $28,%edx
movl $4,%eax
int $0x80
jmp end

srcErr:
movl $4,%eax
movl $1,%ebx
movl $wr2,%ecx
movl $23,%edx
int $0x80
jmp end

insuf:
movl $1,%ebx
movl $wr1,%ecx
movl $46,%edx
movl $4,%eax
int $0x80

end:
movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80





.type copy,@function
copy:
pushl %ebp
movl %esp,%ebp
subl $1028,%esp
jmp while

body:
movl $4,%eax			#write
movl 12(%ebp),%ebx		#fddest
leal -1024(%ebp),%ecx	#buf
movl -1028(%ebp),%edx	#rdcnt
int $0x80

while:
movl $3,%eax 			#read
movl 8(%ebp),%ebx   	#fdsrc
leal -1024(%ebp),%ecx	#buf 
movl $1024,%edx			#1024
int $0x80

movl %eax,-1028(%ebp)	#rdcnt=read(fdsrc,buf,1024)
cmpl $0,%eax
jg body

movl %ebp,%esp
popl %ebp
ret

