#include<stdio.h>

int main(void)
{
	int a=502;
	int b=5;
	int remainder=0,quotient=0;
	puts("Careful if result is above 255 error would be generated");	
	printf("Enter dividend\n");
	scanf("%d",&a);
	printf("Enter divisor\n");
	scanf("%d",&b);

	asm("divb %3\n\t"
		"movb %%al,%0\n\t"
		"movb %%ah,%1\n\t":"=m"(quotient),"=m"(remainder):"a"(a),"m"(b));
	printf("\t\t(%d/%d)\nQuotient:%d | Remainder:%d\n",a,b,quotient,remainder);
	return 0;
}