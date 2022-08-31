#include<stdio.h>

void test_print(void);

int main(void)
{
	puts("BEGIN");
	puts("Printing 1st time");
	test_print();
	puts("Printing 2nd time");
	test_print();
	puts("END");
	return 0;
}