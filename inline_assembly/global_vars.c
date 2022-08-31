#include <stdio.h>
int a=12;

int main(void)
{
	printf("Before assembly a: %d\n",a);
	asm("pushal\n\t"
		"movl $22,%eax\n\t"
		"movl %eax,a\n\t"
		"popal");
	printf("After assembly a: %d\n",a);
	return 0;
}