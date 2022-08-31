.section .data
pf: .string "\n----------ARRAY-----------\n"
pf1: .string "%d  "
pf2: .string "Enter Elements\n"

sf: .string "%d"
escN: .string "\n"
.section .text
.globl display
.type display,@function
display:
pushl %ebp
movl %esp,%ebp
subl $12,%esp

pushl $pf		#display TAG
call printf
addl $4,%esp

movl 12(%ebp),%eax  	#n

movl $0,-4(%ebp)	#i=0
jmp for
body:

movl -4(%ebp),%ecx  	#ecx=i
movl 8(%ebp),%ebx
pushl (%ebx,%ecx,4)  	#arr[i]
pushl $pf1		#"%d  "
call printf
addl $8,%esp

addl $1,-4(%ebp)	#i++

movl 12(%ebp),%eax 	#n
for:cmpl %eax,-4(%ebp)	#i<n
jl body


pushl $escN
call printf
addl $4,%esp		#\n

movl %ebp,%esp
popl %ebp
ret



.globl accept
.type accept,@function
accept:
pushl %ebp
movl %esp,%ebp
subl $8,%esp

pushl $pf2		#Enter Elements
call printf
addl $4,%esp

movl 12(%ebp),%eax	#n

movl $0,-4(%ebp)	#i=0
jmp for1
body1:
movl 8(%ebp),%ebx	#arr
movl -4(%ebp),%ecx	
sall $2,%ecx
addl %ecx,%ebx		#arr+offset

pushl %ebx		#&arr
pushl $sf
call scanf		#scanf("%d",arr);
addl $8,%esp


addl $1,-4(%ebp)	#i++
movl 12(%ebp),%eax 	#n
for1:cmpl %eax,-4(%ebp)	#i<n
jl body1

movl %ebp,%esp
popl %ebp
ret


.globl insertionSort
.type insertionSort,@function
insertionSort:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

movl $0,-4(%ebp)	#i=1;
movl $0,-8(%ebp)	#j=0;
movl $0,-12(%ebp)	#key=0;


jmp for3
body3:
movl 8(%ebp),%ebx	#ebx=a
movl -4(%ebp),%ecx	#ecx=i

movl (%ebx,%ecx,4),%eax	#eax=a[i]
movl %eax,-12(%ebp)	#key=eax=a[i]

movl -4(%ebp),%ecx	#ecx=i
subl $1,%ecx		#ecx=ecx-1
movl %ecx,-8(%ebp)	#j=i-1

jmp for4
body4:
	movl 8(%ebp),%ebx	#ebx=a
	movl -8(%ebp),%ecx	#ecx=j
	movl (%ebx,%ecx,4),%edx	#edx=a[j]
	addl $1,%ecx		#ecx=j+1
	movl %edx,(%ebx,%ecx,4)	#a[j+1]=a[j]

	subl $1,-8(%ebp)	#j--
for4:
	cmpl $0,-8(%ebp)	#j>=0
	jl toi
	movl 8(%ebp),%ebx	#ebx=a
	movl -8(%ebp),%ecx	#ecx=j
	movl (%ebx,%ecx,4),%edx	#edx=a[j]
	cmpl %edx,-12(%ebp)	#key<a[j]
	jl body4

toi:	
	movl -8(%ebp),%ecx
	addl $1,%ecx
	movl %eax,(%ebx,%ecx,4)	#a[j+1]=key
	
	movl -12(%ebp),%eax
	addl $1,-4(%ebp)	#i++
	movl 12(%ebp),%eax	#eax=n
for3:
	cmpl %eax,-4(%ebp) #i<n
	jl body3



movl %ebp,%esp
popl %ebp
ret
