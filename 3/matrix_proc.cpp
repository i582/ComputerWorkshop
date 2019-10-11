#include "matrix_proc.h"

extern "C" __declspec(dllexport) int matrix_proc(int* matrix[], int m, int n)
{
	int count_7 = 0;
	for (int i = 0; i < m; i++)
	{
		for (int j = 0; j < n; j++)
		{
			if (matrix[i][j] % 7 == 0)
			{
				count_7++;
			}
		}
	}
	return count_7;
}
