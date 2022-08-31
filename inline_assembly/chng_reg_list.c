#include <stdio.h>

int main(void)
{
	int a=9;//will remain unused
	int b=8;

	asm("movl $10,%%eax\n\t "
		"addl %%eax,%0":"=r"(b):"r"(a),"0"(b):"%eax");
	printf("addition: %d\n",b );
	return 0;
}