#include<stdio.h>

float area_circ_int_rad(int);

int main(void)
{
	int rad=10;
	float area_circ=0;
	area_circ=area_circ_int_rad(rad);

	printf("%f\n",area_circ);
	return 0;
}