#include <stdio.h>
int main(void)
{
	int x=3,y=2,z=0;

	asm("imull %1,%2\n\t"
		"movl %2,%0":"=r"(z):"r"(x),"r"(y));
	printf("mult:%d\n", z);
	return 0;
}