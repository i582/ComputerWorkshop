#include "array_proc.h"

void array_print(int* mas, unsigned int count)
{
	unsigned int i = 0;

	printf("������: ");

	for (; i < count; i++)
	{
		printf("%d ", mas[i]);
	}

	printf("\n");
}

void array_input(int* mas, unsigned int count)
{
	unsigned int i = 0;

	printf("������� ������: ");

	for (; i < count; i++)
	{
		scanf("%d", &mas[i]);
	}
}
