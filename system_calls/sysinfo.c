#include<sys/sysinfo.h>
#include <stdio.h>

int main(void)
{
	struct sysinfo sys;

	sysinfo(&sys);
	printf("Uptime: %ld\n",sys.uptime);
	printf("5 minute load average:%lu\n",sys.loads[0]);
	printf("10 minute load average:%lu\n",sys.loads[1]);
	printf("15 minute load average:%lu\n",sys.loads[2]);
	printf("Total Ram:%lu\n",sys.totalram);
	printf("Free Ram:%lu\n",sys.freeram);
	printf("Shared Ram:%lu\n",sys.sharedram);
	printf("Buffer Ram:%lu\n",sys.bufferram);
	printf("Total Swap:%lu\n",sys.totalswap);
	printf("Free Swap:%lu\n",sys.freeswap);
	printf("No. of procs: %hd\n",sys.procs);
	printf("Total high:%lu\n",sys.totalhigh);
	printf("Free high:%lu\n",sys.freehigh);
	printf("Memory unit:%d\n",sys.mem_unit);
	return 0;
}
/*
.section .rodata
pf1: .string "Uptime:%ld\n"
pf2: .string "No. of process:%hd\n"
pf3: .string "5 minute load average:%lu\n"
pf4: .string "10 minute load average:%lu\n"
pf5: .string "15 minute load average:%lu\n"
pf6: .string "Free ram:%lu\n"
pf7: .string "Shared ram:%lu\n"
pf8: .string "Buffered ram:%lu\n"
pf9: .string "Total ram:%lu\n"
pf10: .string "Total swap:%lu\n"
pf11: .string "Free swap:%lu\n"
pf12: .string "Total high:%lu\n"
pf13: .string "Free high:%lu\n"
pf14: .string "Memory unit:%d\n"

.section .text

.globl main
.type main,@function
main:
pushl %ebp
movl %esp,%ebp
subl $56,%esp

leal -56(%ebp),%ebx
movl $116,%eax
int $0x80

pushl -56(%ebp)
pushl $pf1
call printf
addl $8,%esp

pushl -52(%ebp)
pushl $pf3
call printf
addl $8,%esp

pushl -48(%ebp)
pushl $pf4
call printf
addl $8,%esp

pushl -44(%ebp)
pushl $pf5
call printf
addl $8,%esp

pushl -40(%ebp)
pushl $pf9
call printf
addl $8,%esp

pushl -36(%ebp)
pushl $pf6
call printf
addl $8,%esp

pushl -32(%ebp)
pushl $pf7
call printf
addl $8,%esp

pushl -28(%ebp)
pushl $pf8
call printf
addl $8,%esp

pushl -24(%ebp)
pushl $pf10
call printf
addl $8,%esp

pushl -20(%ebp)
pushl $pf11
call printf
addl $8,%esp


pushw -16(%ebp)
pushl $pf2
call printf
addl $6,%esp

pushl -12(%ebp)
pushl $pf12
call printf
addl $8,%esp

pushl -8(%ebp)
pushl $pf13
call printf
addl $8,%esp

pushl -4(%ebp)
pushl $pf14
call printf
addl $8,%esp

end:
movl %ebp,%esp
popl %ebp
call exit


*/