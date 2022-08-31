#include<stdio.h>

float float_math(float,int,float,float,float,int,float,float);
int main(void)
{
	float result=0;
	result=float_math(43.65,22,76.35,3.1,12.43,6,140.2,94.21);
	printf("%f\n",result);

	return 0;
}