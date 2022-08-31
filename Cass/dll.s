#local variabel till -32(%ebp)
.section .data
dfintro: .string "\n**********************************************\nDEDICATED TO YOGESHWAR SIR\n**********************************************\n"
dfln: .string "\n"
df: .string "List after insert_beg\n"
df1: .string "List after del_beg\n"
df2: .string "List after insert_end\n"
df3: .string "List after del_end\n"
df4: .string "List after insertAfter\n"
df5: .string "Element not found insertAfter unsuccessful\n"
df6: .string "List after insertBefore\n"
df7: .string "Element not found insertBefore unsuccessful\n"
df8: .string "List after delData\n"
df9: .string "Element not found delData unsuccessful\n"
df10: .string "List1:"
df11: .string "List2:"
df12: .string "List2 appended after List1:\n"
df13: .string "Concatened List of plist1 and plist2\n"
df14: .string "Merged List of plist1 and plist2\n"
df15: .string "Merged List p_merge after reverse\n"
df16: .string "p_rev1 reverse of plist1:\n"
df17: .string "p_array from p_merge\n"
df18: .string "[%d]"
df19: .string "p_arrayList from p_array\n"
dfdum : .string "plist=%d\n"
dfdum1: .string "plist1=%d\n"
dfdum2: .string "p_concat=%d\n"
dfdum3: .string "p_merge=%d\n"
dfdum4: .string "p_rev1=%d\n"
dfdum5: .string "p_arrList=%d\n"

.section .text

.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $40,%esp

pushl $dfintro
call printf
addl $4,%esp

movl $0,-4(%ebp)	#node* DUMMY=0;
leal -4(%ebp),%ebx 	#**ebx=&DUMMY
pushl %ebx
call createList		#prototype: createList(node **plist)
addl $4,%esp

movl $1,-8(%ebp)	#i=0

jmp for
body:
movl -8(%ebp),%ebx
addl $100,%ebx
pushl %ebx
pushl -4(%ebp)
call insertBeg 		#prototype: insertBeg(node *plist,int data)
addl $8,%esp

addl $1,-8(%ebp)
for:cmpl $7,-8(%ebp)
jle body


pushl $df
pushl -4(%ebp)
call display		#prototype: display(node *plist,char *s)
addl $8,%esp

pushl -4(%ebp)
call delBeg			#prototype: delBeg(node* plist)
addl $4,%esp


pushl $df1
pushl -4(%ebp)
call display 		#prototype: display(int *plist,char *s)
addl $8,%esp

pushl $725
pushl -4(%ebp)
call insertEnd		#prototype:insertEnd(node *plist,int data)
addl $8,%esp

pushl $df2
pushl -4(%ebp)
call display		#prototype: display(int *plist,char *s)
addl $8,%esp


pushl -4(%ebp)
call delEnd			#prototype:delEnd(node *plist)
addl $4,%esp

pushl $df3
pushl -4(%ebp)
call display		#prototype: display(int *plist,char *s)
addl $8,%esp


pushl $983
pushl $103
pushl -4(%ebp)
call insertAfter 	#prototype: insertAfter(node *plist,int search_data,int newdat)
addl $12,%esp

cmpl $0,%eax
je noInsert

pushl $df4
pushl -4(%ebp)
call display
addl $8,%esp

jmp success
noInsert:
pushl $df5
call printf
addl $4,%esp

success:
pushl $965
pushl $103
pushl -4(%ebp)
call insertBefore 	#prototype: insertBefore(node *plist,int search_data,int newdat)
addl $12,%esp

cmpl $0,%eax
je noInsert1

pushl $df6
pushl -4(%ebp)
call display
addl $8,%esp

jmp success1
noInsert1:
pushl $df7
call printf
addl $4,%esp

success1:
pushl $103
pushl -4(%ebp)
call delData		#prototype: delData(node *plist,int data)
addl $8,%esp

cmpl $0,%eax
je noDel

pushl $df8
pushl -4(%ebp)
call display
addl $8,%esp

jmp success2
noDel:
pushl $df9
call printf
addl $4,%esp


success2:

leal -4(%ebp),%ebx 	#plist destroy
pushl %ebx
call destroyList 	#prototype: destroyList(node **plist)
addl $4,%esp

pushl -4(%ebp)
pushl $dfdum
call printf
addl $8,%esp


leal -4(%ebp),%ebx	#plist1
pushl %ebx
call createList
addl $4,%esp

leal -12(%ebp),%ebx	#plist2
pushl %ebx
call createList
addl $4,%esp

movl $1,-8(%ebp)
jmp while
body1:
movl -8(%ebp),%ebx
addl $500,%ebx

pushl %ebx
pushl -4(%ebp)
call insertEnd
addl $8,%esp

movl -8(%ebp),%ebx
addl $600,%ebx

pushl %ebx
pushl -12(%ebp)
call insertEnd
addl $8,%esp


addl $1,-8(%ebp)
while:cmpl $5,-8(%ebp)
jle body1


pushl $df10
pushl -4(%ebp)
call display
addl $8,%esp

pushl $df11
pushl -12(%ebp)
call display
addl $8,%esp


pushl -12(%ebp)
pushl -4(%ebp)
call concatList 	#prototype:node*  concatList(node *plist1,node* pList2)
addl $8,%esp

movl %eax,-16(%ebp) #p_concat

pushl $df13
pushl -16(%ebp)
call display
addl $8,%esp


pushl $720
pushl -4(%ebp)
call insertEnd 	#inserting extra node at plist1 to check merging 
addl $8,%esp

pushl -12(%ebp)
pushl -4(%ebp)
call mergeList 		#mergeList:node*  mergerList(node *pList1,node* pLsit2)
addl $8,%esp

mov %eax,-20(%ebp)	#p_merge

pushl $df14
pushl -20(%ebp)
call display
addl $8,%esp

pushl -20(%ebp) #pmerge getting reversed
call reverseList
addl $4,%esp

pushl $df15
pushl -20(%ebp)  #pmerge_reversed display
call display
addl $8,%esp


pushl -4(%ebp)
call getReversedList #prototype:getReversedList(node *plist)
addl $4,%esp

movl %eax,-24(%ebp) #p_rev1=getReverseList(plist1)

pushl $df16
pushl -24(%ebp)		#p_rev1 display
call display
addl $8,%esp

pushl $df17
call printf
addl $4,%esp

leal -28(%ebp),%ebx #p_array
leal -32(%ebp),%ecx #p_size
pushl %ecx
pushl %ebx
pushl -20(%ebp)
call listToArray		#prototype:listToArray(node *plist,int **arr,int *size)
addl $12,%esp



movl $0,-8(%ebp) 		#i=0
movl -8(%ebp),%ebx
jmp for1
body2:
movl -28(%ebp),%edx		#edx=parray

pushl (%edx,%ebx,4)
pushl $df18
call printf
addl $8,%esp

addl $1,-8(%ebp) 		#i++
movl -8(%ebp),%ebx		#ebx=i
for1:cmpl -32(%ebp),%ebx #i<*p_size
jl body2

pushl $dfln
call printf
addl $4,%esp


pushl -32(%ebp)
pushl -28(%ebp)
call arrayToList
addl $8,%esp

movl %eax,-36(%ebp) #p_arrnode

pushl $df19
pushl -36(%ebp)
call display
addl $8,%esp

pushl -12(%ebp)
pushl -4(%ebp)
call appendList		#prototype:appendList(node *plist1,node *plist2)
addl $8,%esp


pushl $df12
pushl -4(%ebp)
call display
addl $8,%esp



leal -4(%ebp),%ebx 		#plist1 destroy
pushl %ebx
call destroyList
addl $4,%esp


pushl -4(%ebp)
pushl $dfdum1
call printf
addl $8,%esp


leal -16(%ebp),%ebx			#pconcat destroy
pushl %ebx
call destroyList
addl $4,%esp

pushl -16(%ebp)
pushl $dfdum2
call printf
addl $8,%esp


leal -20(%ebp),%ebx			#pmerge destroy
pushl %ebx
call destroyList
addl $4,%esp

pushl -20(%ebp)
pushl $dfdum3
call printf
addl $8,%esp

leal -24(%ebp),%ebx
pushl %ebx
call destroyList			#p_revl destroy
addl $4,%esp

pushl -24(%ebp)
pushl $dfdum4
call printf
addl $8,%esp

movl -28(%ebp),%edx #p_array free
pushl %edx
call free
addl $4,%esp

movl $0,-28(%ebp)


leal -36(%ebp),%ebx
pushl %ebx					#p_arrayList destroy
call destroyList
addl $4,%esp

pushl -36(%ebp)
pushl $dfdum5
call printf
addl $8,%esp


end:
movl %ebp,%esp
popl %ebp
 
pushl $0
call exit
