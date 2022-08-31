#include<stdio.h>

int get_max(int,int);

int main(void)
{
	int i,j,max;
	puts("Enter 2 values");
	scanf("%d%d",&i,&j);

	max=get_max(i,j);
	printf("MAX: %d\n",max );
	return 0;
}