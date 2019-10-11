#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main(int argc, char** argv)
{
	unsigned int K = 0;
	unsigned short i = 1;
	unsigned short count = 0;

	printf("Enter number: ");
	scanf("%u", &K);

	for (; i <= (unsigned short)sqrt(K); i++)
	{
		if (K % i == 0)
		{
			count++;
		}
	}

	count *= 2;

	printf("count = %u", count);

	scanf("%u", &K);
	return 0;
}
