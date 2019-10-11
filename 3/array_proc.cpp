#include "array_proc.h"

extern "C" __declspec(dllexport) int array_proc(int* mas, int count)
{
	int count_7 = 0;
	int i = 0;
	for (; i < count; i++)
	{
		if (mas[i] % 7 == 0)
		{
			count_7++;
		}
	}
	return count_7;
}
