.section .data

pf: .string "\n--------LIST-----\n"
pf1: .string "%d-> "
pf2: .string "[BEG]-> "
pf3: .string "[END]\n"
pf4: .string "\nEMPTY LIST\n"
pf5: .string "ADDRESS = %lu\n"
.section .text
.globl createList
.type createList,@function
createList:	#createList(int**p)
pushl %ebp
movl %esp,%ebp
subl $40,%esp

pushl $0
call getNode
addl $4,%esp

movl 8(%ebp),%ebx	#ebx=*p
movl %eax,(%ebx)	#(ebx)=*p=eax

# movl -4(%ebp),%ebx 		#ebx=p

movl %ebp,%esp
popl %ebp
ret


.globl getNode
.type getNode,@function
getNode:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

pushl $8
call malloc		#8bytes allocate
addl $4,%esp


movl 8(%ebp),%ebx
movl %ebx,(%eax)		#p->data=dat
movl $0,4(%eax)			#p->next=0


movl %ebp,%esp
popl %ebp
ret


.globl insertBeg
.type insertBeg,@function
insertBeg:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

pushl 12(%ebp)	#sending DATA
call getNode
addl $4,%esp

movl %eax,-4(%ebp)			#*p=getNode(data);


movl 8(%ebp),%ebx 			#ebx=pList
movl -4(%ebp),%edx			#edx=p
movl 4(%ebx),%ecx			#ecx=pList->link
movl %ecx,4(%edx)			#p->link=pList->link
movl %edx,4(%ebx)			#pList->link=p


movl %ebp,%esp
popl %ebp
ret



.globl showList
.type showList,@function
showList:
pushl %ebp
movl %esp,%ebp
subl $40,%esp


movl 8(%ebp),%ebx 		#ebx=pList
movl 4(%ebx),%edx		#edx=pList->link
movl %edx,-4(%ebp)		#next=pList->link

cmpl $0,%edx			#if(next==NULL) return
je empty


pushl $pf2
call printf
addl $4,%esp


jmp while
body:

movl -4(%ebp),%ebx 		#ebx=p
pushl (%ebx)			#ebx->data
pushl $pf1				#%d->
call printf
addl $8,%esp


movl -4(%ebp),%ebx
movl 4(%ebx),%edx
movl %edx,-4(%ebp)		#next=next->link
while:
cmpl $0,-4(%ebp) #next!=0
jne body

pushl $pf3
call printf
addl $4,%esp


jmp end
empty:
pushl $pf4
call printf
addl $4,%esp			#printing empty and return

end:movl %ebp,%esp
popl %ebp
ret


.globl destroy
.type destroy,@function
destroy:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

movl 8(%ebp),%ebx 	#ebx=plist
movl 4(%ebx),%ecx	#ecx=pList
movl %ecx,-4(%ebp)	#next=pList->link
movl $0,4(%ebx)

movl $0,-8(%ebp)

jmp while1
body1:
movl -4(%ebp),%ebx
movl %ebx,-8(%ebp)		#prev=next

movl 4(%ebx),%ecx
movl %ecx,-4(%ebp)		#next=next->link

pushl -8(%ebp)
call free
addl $4,%esp

while1:cmpl $0,-4(%ebp)	#next!=0
jne body1

movl %ebp,%esp
popl %ebp
ret


.globl delBeg
.type delBeg,@function
delBeg:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

movl 8(%ebp),%ebx
movl 4(%ebx),%ebx 	#ebx=pList->link
movl %ebx,-4(%ebp)	#next=pList->link

cmpl $0,-4(%ebp)
je empty1

movl -4(%ebp),%ebx 		#ebx=next
movl 8(%ebp),%ecx		#ecx=plist
movl 4(%ebx),%ebx 		#ebx=next->link
movl %ebx,4(%ecx)		#plist->link=next->link

pushl -4(%ebp) 			#free(next)
call free
addl $4,%esp

jmp end1

empty1:
pushl $pf4
call printf
addl $4,%esp

end1:movl %ebp,%esp
popl %ebp
ret


.globl insertLast
.type insertLast,@function #inserLast(*plist,data)
insertLast:
pushl %ebp
movl %esp,%ebp
subl $40,%esp


movl 8(%ebp),%ebx
movl 4(%ebx),%ebx
movl %ebx,-4(%ebp)		#next=pList->link

movl -4(%ebp),%ecx
movl 4(%ecx),%ecx		#ecx=next->link

jmp while2
body2:

movl %ecx,-4(%ebp)		#next=next->link
movl -4(%ebp),%ecx
movl 4(%ecx),%ecx		#ecx=next->link

while2:cmpl $0,%ecx		#next->link!=NULL
jne body2


pushl 12(%ebp)
call getNode
addl $4,%esp

movl -4(%ebp),%ecx
movl %eax,4(%ecx)		#next->link=getnode(data)


movl %ebp,%esp
popl %ebp
ret



.globl delLast
.type delLast,@function
delLast:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

movl 8(%ebp),%ebx
movl 4(%ebx),%ebx
movl %ebx,-4(%ebp)		#next=pList->link

cmpl $0,-4(%ebp)
je empty2

movl -4(%ebp),%ecx
movl 4(%ecx),%ecx		#ecx=next->link

movl 8(%ebp),%ebx
movl %ebx,-8(%ebp)	#prev=pList

jmp while3
body3:
movl -4(%ebp),%ebx
movl %ebx,-8(%ebp)		#prev=next
movl %ecx,-4(%ebp)		#next=next->link
movl -4(%ebp),%ecx
movl 4(%ecx),%ecx		#ecx=next->link


while3:cmpl $0,%ecx
jne body3


movl -8(%ebp),%ebx
movl $0,4(%ebx)

pushl -4(%ebp)
call free
addl $4,%esp 

jmp end2
empty2:
pushl $pf4
call printf
addl $4,%esp

end2:movl %ebp,%esp
popl %ebp
ret

