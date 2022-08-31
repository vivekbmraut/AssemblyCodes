#include<stdio.h>

int main(void)
{
	float radius;
	float area;

	puts("Enter radius");
	scanf("%f",&radius);

	asm("flds %1\n\t"
		"fmuls %1\n\t"
		"fldpi\n\t"
		"fmul %%st(1),%%st(0)\n\t":"=t"(area):"m"(radius):"%st(1)");
	printf("%f\n",area );

	return 0;
}