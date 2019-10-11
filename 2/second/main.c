#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "str_proc.h"

int str_change(char* str, unsigned int count);

int main(int argc, char** argv)
{
	char* str;
	int N = 0;
	printf("Enter count: ");
	scanf("%d", &N);

	printf("Enter string: ");
	str = str_input();

	if (!str_change(str, N))
	{
		printf("Error: enter count > string length\n");
		return -1;
	}

	printf("Result: ");
	str_print(str);

	scanf("%d", &N);
	return 0;
}

int str_change(char* str, unsigned int count)
{
	unsigned int i = 0;
	char temp = 0;
	unsigned int length = strlen(str);

	if (count >= length)
		return 0;

	for (; i < count; i++)
	{
		temp = str[i];
		str[i] = str[length - 1 - i];
		str[length - 1 - i] = temp;
	}

	return 1;
}
