#include <stdio.h>

int main(void)
{
	int a,b;
	a=2;b=3;
	
	asm("addl %1,%0":"=r"(b):"r"(a),"0"(b));
	printf("result: %d\n",b);
	return 0;
}