.section .rodata
mmx_present: .string "MMX present\n"
sse_present: .string "SSE present\n"
sse2_present: .string "SSE2 present\n"
sse3_present: .string "SSE3 present\n"

.section .text
.type main,@function
.globl main
main:
pushl %ebp
movl %esp,%ebp
subl $8,%esp


movl $1,%eax
cpuid
movl %edx,-4(%ebp)
movl %ecx,-8(%ebp)

test $0x00800000,%edx
jz end

movl $1,%ebx
movl $mmx_present,%ecx
movl $12,%edx
movl $4,%eax
int $0x80
movl -4(%ebp),%edx

chk_sse: test $0x02000000,%edx
jz end

movl $1,%ebx
movl $sse_present,%ecx
movl $12,%edx
movl $4,%eax
int $0x80
movl -4(%ebp),%edx

chk_sse2 :test $0x04000000,%edx
jz end

movl $1,%ebx
movl $sse2_present,%ecx
movl $13,%edx
movl $4,%eax
int $0x80
movl -8(%ebp),%ecx

chk_sse3:test $0x00000001,%ecx
jz end

movl $1,%ebx
movl $sse3_present,%ecx
movl $13,%edx
movl $4,%eax
int $0x80

end:
movl %ebp,%esp
popl %ebp
movl $1,%eax
movl $0,%ebx
int $0x80


