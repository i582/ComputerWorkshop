#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "str_proc.h"

int is_hex(char* str, int length);

int main(int argc, char** argv)
{
	char* str;
	int N = 0;

	printf("Enter string: ");
	str = str_input();

	if (!is_hex(str, strlen(str)))
	{
		printf("%s is not hex string\n", str);
	}
	else
	{
		printf("%s is hex string\n", str);
	}

	scanf("%d", &N);
	return 0;
}

int is_hex(char* str, int length)
{
	unsigned int i = 0;

	for (; i < length; i++)
		if (!(
			(str[i] >= 'A' && str[i] <= 'F')
			||
			(str[i] >= 'a' && str[i] <= 'f')
			||
			(str[i] >= '0' && str[i] <= '9')))
			return 0;

	return 1;
}
