#include "stdio.h"
#include "stdlib.h"
#include "math.h"

int main(int argc, char** argv)
{
	double Y = 0.0;
	double i = 1.0;

	for (; i <= 2; i += 0.1)
	{
		Y += sin(i);
	}

	printf("Result = %lf", Y);

	scanf("%lf", &Y);
	return 0;
}
