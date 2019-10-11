#include "count_div_by_7.h"

int count_div_by_7(int* mas, unsigned int count)
{
	unsigned int i = 0;
	unsigned int count_numbers = 0;

	for (; i < count; i++)
	{
		count_numbers += mas[i] % 7 == 0;
	}

	return count_numbers;
}
