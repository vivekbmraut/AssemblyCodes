#include<stdio.h>


int main(void)
{
	int a=6,b=2,max=0;
	puts("enter 2 nos");
	scanf("%d%d",&a,&b);
	asm("cmpl %1,%2\n\t"
		"jge 0f\n\t"
		"movl %1,%0\n\t"
		"jmp 1f\n\t"
		"0:movl %2,%0\n\t"
		"1:":"=r"(max):"r"(a),"r"(b));
	printf("Max Number : %d\n",max);
	puts("enter 2 nos");
	scanf("%d%d",&a,&b);
	asm("cmpl %1,%2\n\t"
		"jge 0f\n\t"
		"movl %1,%0\n\t"
		"jmp 1f\n\t"
		"0:movl %2,%0\n\t"
		"1:":"=r"(max):"r"(a),"r"(b));
	
	printf("Max Number : %d\n",max);
	return 0;
}