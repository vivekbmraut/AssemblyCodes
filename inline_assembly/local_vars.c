#include<stdio.h>

int main(void)
{
	int x=3,y=2,z=0;
	asm("imull %%eax,%%ebx\n\t"
		"movl %%ebx,%%edx":"=d"(z):"b"(y),"a"(x));
	printf("%d\n",z);
	return 0;
}