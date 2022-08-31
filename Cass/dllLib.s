.section .data

pf1: .string "[ %d ]<=>"
pf2: .string "[BEG]<=>"
pf3: .string "[END]\n"
pf4: .string "\n%s\nEMPTY LIST\n"
pf5: .string " data=%d\n"
pf6: .string "After Destruction\n"
pf7: .string "NO CREATION OCCURED\n"
pfdum: .string "DUMDISP\n"

.section .text
#----------------INITIALS-------------

.globl createList
.type createList,@function #createList(node **plist)
createList:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

pushl $0
call getNode	#prototype: getNode(int dat)
addl $4,%esp

movl 8(%ebp),%ebx
movl %eax,(%ebx) #*p=getnode(dat)

movl %ebp,%esp
popl %ebp
ret


.globl getNode
.type getNode,@function 	#node* getnode(int data)
getNode:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

pushl $12
call malloc	#malloc(12)
addl $4,%esp

movl 8(%ebp),%ebx
movl  %ebx,(%eax) #p->dat=dat
movl %eax,4(%eax) #p->prev=p
movl %eax,8(%eax) #p->next=p

movl %ebp,%esp
popl %ebp
ret


#--------Insertion Section---------

.globl insertBeg	#prototype: insertBeg(int *plist,int data)
.type insertBeg,@function
insertBeg:
pushl %ebp
movl %esp,%ebp
subl $8,%esp

movl 8(%ebp),%ebx
cmpl $0,%ebx
je nocreate1


pushl 12(%ebp) #data
call getNode
addl $4,%esp
movl %eax,-4(%ebp)	#node=getnode(dat) ie mid

movl 8(%ebp),%ebx	#ebx=plist
pushl 8(%ebx)		#end=beg->next
pushl -4(%ebp)		#mid=node
pushl 8(%ebp)		#beg=plist
call genericInsert
addl $12,%esp

jmp end3
nocreate1:
pushl $pf7
call printf
addl $4,%esp

end3:
movl %ebp,%esp
popl %ebp
ret


.globl insertEnd
.type insertEnd,@function #insertEnd(node *plist,int data)
insertEnd:
pushl %ebp
movl %esp,%ebp
subl $8,%esp

movl 8(%ebp),%ebx
cmpl $0,%ebx
je nocreate4

pushl 12(%ebp) #data
call getNode
addl $4,%esp
movl %eax,-4(%ebp)	#node=getNode(dat) ie mid

movl 8(%ebp),%ebx
pushl 8(%ebp)	#end=plist
pushl -4(%ebp)	#mid=node
pushl 4(%ebx)	#beg=plist->prev
call genericInsert
addl $12,%esp

jmp end5
nocreate4:
pushl $pf7
call printf
addl $4,%esp

end5:
movl %ebp,%esp
popl %ebp
ret


.globl insertAfter
.type insertAfter,@function #bool insertAfter(node *plist,int search_data,int newdata)
insertAfter:
pushl %ebp
movl %esp,%ebp
subl $12,%esp

pushl 12(%ebp)
pushl 8(%ebp)
call locateNode
addl $8,%esp

cmpl $0,%eax
je notFound

movl %eax,-4(%ebp)	#locatedNode=locatNode(plist,data)

pushl 16(%ebp)
call getNode
addl $4,%esp

movl %eax,-8(%ebp)	#newnode=getnode(data)


movl -4(%ebp),%ebx 	#ebx=locatedNode
movl 8(%ebx),%ebx 	#ebx=locatedNode->next

pushl %ebx 			#end=locateNode->next
pushl -8(%ebp)		#mid=newnode
pushl -4(%ebp)		#beg=locatedNode
call genericInsert
addl $12,%esp

movl $1,%eax
jmp end7

notFound:
movl $0,%eax

end7:
movl %ebp,%esp
popl %ebp
ret



.globl insertBefore
.type insertBefore,@function #bool insertBefore(node *plist,int search_data,int newdata)
insertBefore:
pushl %ebp
movl %esp,%ebp
subl $12,%esp

pushl 12(%ebp)
pushl 8(%ebp)
call locateNode
addl $8,%esp

cmpl $0,%eax
je notFound1

movl %eax,-4(%ebp)	#locatedNode=locatNode(plist,data)

pushl 16(%ebp)
call getNode
addl $4,%esp

movl %eax,-8(%ebp)	#newnode=getnode(data)


movl -4(%ebp),%ebx 	#ebx=locatedNode
movl 4(%ebx),%ebx 	#ebx=locatedNode->prev

pushl -4(%ebp) 		#end=locatedNode
pushl -8(%ebp)		#mid=newnode
pushl %ebx			#beg=locatedNode->prev
call genericInsert
addl $12,%esp

movl $1,%eax
jmp end8

notFound1:
movl $0,%eax

end8:
movl %ebp,%esp
popl %ebp
ret






.globl genericInsert #genericInsert(node *beg,node *mid,node *end)
.type genericInsert,@function
genericInsert:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

movl 8(%ebp),%ebx	#%ebx=beg

movl 12(%ebp),%ecx	#ecx=mid
movl %ecx,8(%ebx)	#beg->next=mid
movl %ebx,4(%ecx)	#mid->prev=beg

movl 16(%ebp),%edx	#edx=end
movl %edx,8(%ecx)	#mid->next=end
movl %ecx,4(%edx)	#end->prev=mid


movl %ebp,%esp
popl %ebp
ret




#-------------Deletion Section---------


.globl delBeg	#delBeg(node *plist)
.type delBeg,@function
delBeg:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

movl 8(%ebp),%ebx
cmpl $0,%ebx
je nocreate2


movl 8(%ebp),%ebx #ebx=plist
movl 8(%ebx),%ecx #ecx=plist->next

pushl %ecx
call genericDelete
addl $4,%esp

jmp end4

nocreate2:
pushl $pf7
call printf
addl $4,%esp

end4:
movl %ebp,%esp
popl %ebp
ret



.globl delEnd
.type delEnd,@function
delEnd:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

movl 8(%ebp),%ebx
cmpl $0,%ebx
je nocreate5

movl 8(%ebp),%ebx #ebx=plist
movl 4(%ebx),%ecx #ecx=plist->prev

pushl %ecx
call genericDelete
addl $4,%esp

jmp end6
nocreate5:
pushl $pf7
call printf
addl $4,%esp

end6:
movl %ebp,%esp
popl %ebp
ret



.globl delData
.type delData,@function #delData(node *plist,int data)
delData:
pushl %ebp
movl %esp,%ebp
subl $8,%esp

pushl 12(%ebp)
pushl 8(%ebp)
call locateNode
addl $8,%esp

cmpl $0,%eax
je notFound2
movl %eax,-4(%ebp) #locatednode

pushl -4(%ebp)
call genericDelete
addl $4,%esp

movl $1,%eax
jmp end9
notFound2:
movl $0,%eax

end9:
movl %ebp,%esp
popl %ebp
ret






.globl genericDelete	#genericDelete(node* del_node)
.type genericDelete,@function
genericDelete:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

movl 8(%ebp),%ebx #ebx=del_node

movl 4(%ebx),%ecx #ecx=del_node->prev
movl 8(%ebx),%edx #edx=del_node->next

movl %edx,8(%ecx) #del_node->prev->next=del_node->next
movl %ecx,4(%edx) #del_node->next->prev=del_node->prev

movl 8(%ebp),%ebx #ebx=del_node
movl $0,8(%ebx) #del_node->prev=NULL
movl $0,4(%ebx) #del_node->next=NULL
pushl 8(%ebp) 
call free		#free(del_node)
addl $4,%esp

movl %ebp,%esp
popl %ebp
ret



.globl destroyList	#destroyList(node **plist)
.type destroyList,@function
destroyList:
pushl %ebp
movl %esp,%ebp
subl $8,%esp

movl 8(%ebp),%ebx	#ebx=*plist
movl (%ebx),%ebx	#ebx=plist
movl %ebx,-4(%ebp)	#pnode=plist

cmpl $0,%ebx #if(plist==NULL) jmp nocreate3
je nocreate3

movl -4(%ebp),%edx #edx=pnode OR plist
movl 8(%edx),%edx #%edx=plist->next

jmp for1
body1:

pushl %edx
call genericDelete
addl $4,%esp

movl -4(%ebp),%edx 	#edx=pnode
movl 8(%edx),%edx 

for1:cmpl -4(%ebp),%edx	#plist->next!=plist OR pnode
jne body1


movl 8(%ebp),%ebx
pushl $pf6
pushl (%ebx)
call display
addl $4,%esp

movl 8(%ebp),%ebx
pushl (%ebx)
call free
addl $4,%esp

movl 8(%ebp),%ebx
movl $0,(%ebx)

jmp end2

nocreate3:
pushl $pf7
call printf
addl $4,%esp

end2:
movl %ebp,%esp
popl %ebp
ret


#-------------Display-------------------
.globl display
.type display,@function
display:
pushl %ebp
movl %esp,%ebp
subl $8,%esp


movl 8(%ebp),%ebx		#ebx=plist
movl 8(%ebx),%ebx		#ebx=plist->next
movl 8(%ebp),%ecx		#ecx=plist

cmpl %ecx,%ebx
je empty

pushl 12(%ebp)
call printf
addl $4,%esp

pushl $pf2
call printf
addl $4,%esp

movl 8(%ebp),%ebx		#ebx=plist
movl 8(%ebx),%ebx		#ebx=plist->next
movl %ebx,-4(%ebp)		#nextNode=plist->next
movl -4(%ebp),%ecx		

jmp while
body:
movl -4(%ebp),%eax
pushl (%eax)
pushl $pf1
call printf
addl $4,%esp

movl -4(%ebp),%ecx
movl 8(%ecx),%ecx
movl %ecx,-4(%ebp)	

while:cmpl 8(%ebp),%ecx
jne body

pushl $pf3
call printf
addl $4,%esp
jmp end
empty:
pushl 12(%ebp)
pushl $pf4
call printf
addl $8,%esp

end:movl %ebp,%esp
popl %ebp
ret

#-------------AUXILLIARY SUBROUTINES/HELPERS-------------

.globl locateNode #node *locateNode(node *plist,int data)
.type locateNode,@function
locateNode:
pushl %ebp
movl %esp,%ebp
subl $8,%esp

movl 8(%ebp),%ebx	#ebx=plist
movl 8(%ebx),%ebx	#ebx=plist->nextNode
movl %ebx,-4(%ebp)	#p_run=plist->next
movl -4(%ebp),%ecx	#ecx=_prun

jmp while1
body2:

movl -4(%ebp),%ebx	#ebx=prun
movl (%ebx),%ebx	#ebx=ebx->data
cmpl %ebx,12(%ebp)	#if(search_dat=ebx)
je found			#goto found

movl -4(%ebp),%ebx
movl 8(%ebx),%ebx 	#ebx=p_run->next
movl %ebx,-4(%ebp) 	#prun=prun->next
movl -4(%ebp),%ecx
while1:cmpl 8(%ebp),%ecx #while(prun!=plist)
jne body2

movl $0,%eax
jmp end1

found:
movl -4(%ebp),%eax

end1:
movl %ebp,%esp
popl %ebp
ret




.globl appendList
.type appendList,@function
appendList:
pushl %ebp
movl %esp,%ebp
subl $4,%esp

movl 8(%ebp),%ebx 	#plist1
movl 12(%ebp),%ecx	#plist2


movl 4(%ebx),%ebx 	#ebx=plist1->prev
movl 8(%ecx),%ecx	#ecx=plist2->next 
movl %ecx,8(%ebx)	#plist1->prev->next=plist2->next

movl 8(%ebp),%ebx 	#plist1
movl 12(%ebp),%ecx	#plist2

movl 4(%ecx),%ecx 	#ecx=plist2->prev
movl %ebx,8(%ecx)	#plist2->prev->next=plist1


movl 12(%ebp),%ecx	#plist2

movl 8(%ecx),%ecx	#ecx=plist2->next
movl 4(%ebx),%ebx  	#ebx=plist1->prev
movl %ebx,4(%ecx)	#plist2->next->prev=plist->prev	

movl 8(%ebp),%ebx 	#plist1
movl 12(%ebp),%ecx	#plist2

movl 4(%ecx),%ecx	#ecx=plist2->prev
movl %ecx,4(%ebx)	#plist->prev=plist2->prev


pushl 12(%ebp)
call free
addl $4,%esp


movl %ebp,%esp
popl %ebp
ret





.globl concatList
.type concatList,@function #concatList(node *plist1,node *plist2)
concatList:
pushl %ebp
movl %esp,%ebp
subl $16,%esp

movl $0,-4(%ebp)
leal -4(%ebp),%ebx #p_concat
pushl %ebx
call createList
addl $4,%esp

movl 8(%ebp),%ebx 		#ebx=plist1
movl 8(%ebx),%ebx 		#ebx=plist1->next
movl %ebx,-8(%ebp)		#p_run1=plist1->next

jmp while2
body3:

movl -8(%ebp),%ecx
pushl (%ecx) 		#p_run1->data
pushl -4(%ebp)		#p_concat
call insertEnd
addl $8,%esp

movl -8(%ebp),%ebx 	#ebx=p_run1
movl 8(%ebx),%ebx 	#ebx=p_run1->next
movl %ebx,-8(%ebp)	#p_run1=p_run1->next

while2:cmpl 8(%ebp),%ebx 	#while(p_run1!=plist1)
jne body3


movl 12(%ebp),%ebx 		#ebx=plist2
movl 8(%ebx),%ebx 		#ebx=plist2->next
movl %ebx,-12(%ebp)		#p_run2=plist2->next

jmp while3
body4:

movl -12(%ebp),%ecx	#ecx=prun_2
pushl (%ecx) 		#p_run2->data
pushl -4(%ebp)		#p_concat
call insertEnd
addl $8,%esp

movl -12(%ebp),%ebx #ebx=p_run2
movl 8(%ebx),%ebx 	#ebx=p_run2->next
movl %ebx,-12(%ebp)	#p_run2=p_run2->next

while3:cmpl 12(%ebp),%ebx 	#while(p_run2!=plist2)
jne body4


movl -4(%ebp),%eax #return p_concat in eax

movl %ebp,%esp
popl %ebp
ret




.globl mergeList
.type mergeList,@function
mergeList:
pushl %ebp
movl %esp,%ebp
subl $16,%esp

movl $0,-12(%ebp) 		#pmerge=0
leal -12(%ebp),%ebx 	#createList(**pmerge)
pushl %ebx
call createList
addl $4,%esp

movl 8(%ebp),%ebx 		#ebx=plist1
movl 8(%ebx),%ebx 		#ebx=plist1->next
movl %ebx,-4(%ebp)		#prun1=plist1->next

movl 12(%ebp),%ebx 		#ebx=plist2
movl 8(%ebx),%ebx 		#ebx=plist2->next
movl %ebx,-8(%ebp) 		#prun2=plist2->next

jmp while4
body5:

movl -4(%ebp),%ebx 		#ebx=p_run1
cmpl 8(%ebp),%ebx 		#if(p_run1==plist1)
jne if1
movl -8(%ebp),%ebx 		#ebx=p_run2
jmp inwhile1
bodyinwhile1:

pushl (%ebx)
pushl -12(%ebp)
call insertEnd
addl $8,%esp

movl -8(%ebp),%ebx 		#ebx=p_run2
movl 8(%ebx),%ebx 		#ebx=p_run2->next
movl %ebx,-8(%ebp)		#prun2=prun2->next
inwhile1:cmpl 12(%ebp),%ebx 	#while(p_run2!=plist2)
jne bodyinwhile1

jmp brake  #break outside while4

if1:movl -8(%ebp),%ebx
cmpl 12(%ebp),%ebx 		#if(p_run2==plist2)
jne if2

movl -4(%ebp),%ebx  	#ebx=p_run1
jmp inwhile2
bodyinwhile2:

pushl (%ebx)	#p_run1->data
pushl -12(%ebp)	#pmerge
call insertEnd
addl $8,%esp

movl -4(%ebp),%ebx 	#ebx=p_run1
movl 8(%ebx),%ebx 	#ebx=p_run1->next
movl %ebx,-4(%ebp) 	#p_run1=p_run1->next

inwhile2:cmpl 8(%ebp),%ebx #while(p_run1!=plist1)
jne bodyinwhile2

jmp brake #jump out of while4

if2:
movl -4(%ebp),%ebx 		#ebx=p_run1
movl (%ebx),%ebx 		#ebx=p_run1->data
movl -8(%ebp),%ecx		#ecx=p_run2
cmpl (%ecx),%ebx 		#if(p_run1->data < p_run2->data)
jge else

pushl %ebx 				#p_run1->data
pushl -12(%ebp) 		#pmerge
call insertEnd
addl $8,%esp

movl -4(%ebp),%ebx  	#ebx=p_run1
movl 8(%ebx),%ebx 		#ebx=p_run1->next
movl %ebx,-4(%ebp)		#p_run1=prun1->next

jmp afterElse
else:
pushl (%ecx)			#p_run2->data
pushl -12(%ebp)			#pmerge
call insertEnd
addl $8,%esp

movl -8(%ebp),%ebx 		#ebx=p_run2
movl 8(%ebx),%ebx 		#ebx=p_run2->next
movl %ebx,-8(%ebp)		#p_run2=p_run2->next
afterElse:
while4:jmp body5

brake:

movl -12(%ebp),%eax

movl %ebp,%esp
popl %ebp
ret





.globl reverseList
.type reverseList,@function #reverseList(node *plist)
reverseList:
pushl %ebp
movl %esp,%ebp
subl $16,%esp


movl 8(%ebp),%ebx 	#ebx=plist
movl 4(%ebx),%ebx 	#ebx=plist->prev
movl %ebx,-4(%ebp) 	#prev_origin=plist->prev

movl 4(%ebx),%ebx 	#ebx=plist->prev->prev
movl %ebx,-8(%ebp)	#p_run=plist->prev->prev


movl -8(%ebp),%ebx

jmp revwhile
revwhilebody:
movl -8(%ebp),%ebx 	#ebx=prun
movl 4(%ebx),%ebx 	#ebx=prun->prev
movl %ebx,-12(%ebp) #p_run_prev=prun->prev

movl 8(%ebp),%ecx 	#ecx=plist
pushl 8(%ebp) 		#end=plist
pushl -8(%ebp)		#mid=p_run
pushl 4(%ecx)		#beg=plist->prev
call genericInsert
addl $12,%esp

movl -12(%ebp),%ebx 	#ebx=p_run_prev
movl %ebx,-8(%ebp) 		#p_run=p_run_prev
revwhile:cmpl 8(%ebp),%ebx 	#while(prun!=plist)
jne revwhilebody

movl -4(%ebp),%ebx 	#ebx=prev_origin
movl 8(%ebp),%ecx 	#ecx=plist
movl %ecx,4(%ebx) 	#prev_origin->prev=plist
movl %ebx,8(%ecx) 	#plist->next=prev_origin

movl %ebp,%esp
popl %ebp
ret




.globl getReversedList
.type getReversedList,@function
getReversedList:
pushl %ebp
movl %esp,%ebp
subl $12,%esp

movl $0,-4(%ebp) #p_revlist=0
leal -4(%ebp),%ebx
pushl %ebx
call createList #createList(**p_revlist)
addl $4,%esp

movl 8(%ebp),%ebx 	#ebx=plist
movl 8(%ebx),%ebx 	#ebx=plist->next
movl %ebx,-8(%ebp) 	#p_run=plist->next
jmp getrevwhile
getrevwhilebody:
movl -8(%ebp),%ecx

pushl (%ecx) 	#p_run->data
pushl -4(%ebp) #p_revlist
call insertBeg
addl $8,%esp

movl -8(%ebp),%ebx 	#ebx=p_run
movl 8(%ebx),%ebx 	#ebx=p_run->next
movl %ebx,-8(%ebp) 	#p_run=p_run->next

getrevwhile:cmpl 8(%ebp),%ebx #while(p_run!=plist)
jne getrevwhilebody


movl -4(%ebp),%eax #return(p_revlist)


movl %ebp,%esp
popl %ebp
ret



.globl getLength
.type getLength,@function 	#getLength(node *plist)
getLength:
pushl %ebp
movl %esp,%ebp
subl $12,%esp

movl $0,-4(%ebp)
movl 8(%ebp),%ecx	#ecx=plist
movl 8(%ecx),%ecx	#ecx=plist->next
movl %ecx,-8(%ebp)	#prun=plist->next

jmp while5
getlenbody:

addl $1,-4(%ebp)

movl -8(%ebp),%ecx
movl 8(%ecx),%ecx
movl %ecx,-8(%ebp) #prun=prun->next

while5:cmpl 8(%ebp),%ecx #while(prun!=plist)
jne getlenbody

movl -4(%ebp),%eax

movl %ebp,%esp
popl %ebp
ret




.globl listToArray
.type listToArray,@function #listToArray(node *plist,int **arr,int *size)
listToArray:
pushl %ebp
movl %esp,%ebp
subl $20,%esp

pushl 8(%ebp)
call getLength
addl $4,%esp

movl %eax,-4(%ebp) #p_local_size
movl 16(%ebp),%ebx
movl %eax,(%ebx) #p_size=eax cause eax contains length

sall $2,%eax #multiply by shifting left plist_length
pushl %eax
call malloc
addl $4,%esp

movl %eax,-8(%ebp) #p_local_array

movl 8(%ebp),%ebx 	#ebx=plist
movl 8(%ebx),%ebx 	#ebx=plist->next
movl %ebx,-12(%ebp) #p_run=plist->next

movl $0,-16(%ebp) #i=0
jmp while6
larrbody:

movl (%ebx),%ebx #ebx=p_run->data
movl -8(%ebp),%edx #p_array_local
movl -16(%ebp),%ecx #ecx=i

movl %ebx,(%edx,%ecx,4) #arr[i]=p_run->data

movl -12(%ebp),%ebx
movl 8(%ebx),%ebx
movl %ebx,-12(%ebp) 	#p_run=p_run->next
addl $1,-16(%ebp) 		#i++

while6:cmpl 8(%ebp),%ebx #p_run!=plist
jne larrbody

movl 12(%ebp),%ebx
movl -8(%ebp),%ecx
movl %ecx,(%ebx)

movl %ebp,%esp
popl %ebp
ret


.globl arrayToList
.type arrayToList,@function #arrayToList(node *plsit,int size)
arrayToList:
pushl %ebp
movl %esp,%ebp
subl $12,%esp


leal -4(%ebp),%ebx #ebx=&pnode
pushl %ebx
call createList			#createList(**pnodearr)
addl $4,%esp



movl $0,-8(%ebp) #i=0
movl -8(%ebp),%ebx
jmp while7
arrlbody:

movl 8(%ebp),%edx
pushl (%edx,%ebx,4)		#p_arr[i]
pushl -4(%ebp) 			#pnodearr
call insertEnd
addl $8,%esp

addl $1,-8(%ebp) 	#i++
movl -8(%ebp),%ebx 	
while7:cmpl 12(%ebp),%ebx 	#while(i<p_size)
jl arrlbody

movl -4(%ebp),%eax

movl %ebp,%esp
popl %ebp
ret






