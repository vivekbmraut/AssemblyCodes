#include <stdio.h>

char* cpu_name(void);

int main(void)
{

	char *cpu_nam;
	cpu_nam=cpu_name();
	printf("CpuID :\'%s\'\n",cpu_nam);
	return 0;
}