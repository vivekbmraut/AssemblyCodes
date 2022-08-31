.section .data
upack1: .byte 0x05,0x02,0x01,0x08,0x02
upack2: .byte 0x03,0x03,0x09,0x02,0x05
.section .bss
.lcomm sum,6
.section .text
.globl _start
_start:
xor %edi,%edi
movl $5,%ecx 
loop1:
movb upack1(,%edi,1),%al
adcb upack2(,%edi,1),%al
aaa #adjust binary to bcd in al
movb %al,sum(,%edi,1)
inc %edi
loop loop1
adcb $0,sum(,%edi,4)
movl $1,%eax
movl $0,%ebx
int $0x80
