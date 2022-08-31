#include<iostream>
using std::cout;
extern "C"
{
	char* cpu_name(void);
	float area_circ_int_rad(int);
	int get_square(int);
}

int main(void)
{
	cout<<"CPU NAME :"<<cpu_name()<<"\n";
	cout<<"Area of circle: "<<area_circ_int_rad(10)<<"\n";
	cout<<"Square : "<<get_square(20)<<"\n";
	return 0;
}