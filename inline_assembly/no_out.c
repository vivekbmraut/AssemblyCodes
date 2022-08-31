#include <stdio.h>

int main(void)
{
	char str1[13]="Hello World\n";
	char str2[13];
	int length=13;

	asm volatile ("rep movsb"::"S"(str1),"D"(str2),"c"(length));
	printf("%s", str2);
	return 0;
}