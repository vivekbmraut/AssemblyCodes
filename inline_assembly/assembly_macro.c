#include <stdio.h>

#define MAX(a,b,max) ({ \
asm("cmpl %1,%2\n\t" \
"jge 0f\n\t" \
"movl %1,%0\n\t" \
"jmp 1f\n\t" \
"0:movl %2,%0\n\t" \
"1:":"=r"(max):"r"(a),"r"(b)); \
})

int main(void)
{
	int data1=40,data2=60,data3=70,res;
	MAX(data1,data2,res);
	printf("max is %d\n",res );
	MAX(data3,data2,res);
	printf("max is %d\n",res );
	return 0;
}