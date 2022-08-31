.section .bss
.comm value,4

.section .data
pf:
.string "Area =%f\n"
pres:
.byte 0x7f,0x00

.section .text
.globl _start
_start:
finit
fldcw pres
movl $0,%eax

movl $5,%ebx
call area

subl $8,%esp
fstpl (%esp)
pushl $pf
call printf
addl $12,%esp

pushl $0
call exit

.type area,@function
area:
imull %ebx,%ebx
fldpi
movl %ebx,value
fimuls value
ret
