#include<stdio.h>

int main(void)
{
	float angle,pi;
	float radian,sine,cosine;

	puts("Enter angle");
	scanf("%f",&angle);
	asm("fldpi":"=t"(pi));
	radian=(angle*pi)/180;
	asm("fsincos":"=t"(cosine),"=u"(sine):"0"(radian));
	printf("sine(%f):%f | cos(%f):%f\n",angle,sine,angle,cosine);

	return 0;
}