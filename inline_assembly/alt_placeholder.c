#include<stdio.h>


int main(void)
{
	int a=5,b=9;
	asm("addl %[val2],%[val1]":[val1]"=r"(b):[val2]"r"(a),"0"(b));
	printf("add: %d\n",b );
	return 0;
}