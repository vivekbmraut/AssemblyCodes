#include<stdio.h>

char* cpu_name(void);
float area_circ_int_rad(int);
int get_square(int);

int main(void)
{
	printf("CPU NAME: %s\n",cpu_name());
	printf("Area of circle : %f\n",area_circ_int_rad(10) );
	printf("Square:%d\n",get_square(20));
	return 0;
}
