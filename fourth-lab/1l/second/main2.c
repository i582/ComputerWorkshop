#include <stdlib.h>
#include <stdio.h>
#include <locale.h>

#include "array_proc.h"
#include "sum_z.h"

int main(int agrc, char** argv)
{
	setlocale(LC_ALL, "Rus");

	int z[70];

	array_input(z, 70);
	array_print(z, 70);

	double result = sum_z(z, 70);

	printf("%lf\n", result);

	scanf("%lf", &result);
	return 0;
}