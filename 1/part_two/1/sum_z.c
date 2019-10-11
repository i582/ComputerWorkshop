#include "sum_z.h"

double sum_z(int* mas, unsigned int count)
{
	unsigned int i = 0;

	int sum_pos = 0;
	int sum_neg = 0;

	for (; i < count; i++)
	{
		if (mas[i] > 0)
		{
			sum_pos += mas[i];
		}
		else
		{
			sum_neg += mas[i];
		}
	}

	return ((double)sum_pos + sum_neg)/(sum_pos - sum_neg);
}
