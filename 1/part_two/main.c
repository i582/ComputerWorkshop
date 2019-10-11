#include <stdlib.h>
#include <stdio.h>
#include <locale.h>

#include "array_proc.h"
#include "count_div_by_7.h"

int main(int agrc, char** argv)
{
	setlocale(LC_ALL, "Rus");

	int B[30];

	array_input(B, 30);
	array_print(B, 30);

	int count = count_div_by_7(B, 30);
	 
	printf("%d\n", count);

	scanf("%d", &count);
	return 0;
}