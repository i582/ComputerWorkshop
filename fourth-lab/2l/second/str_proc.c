#include "str_proc.h"

void str_print(char* str)
{
	printf("%s", str);
}

char* str_input()
{
	char* str = (char*)malloc(sizeof(char) * 100);
	scanf("%s", str);
	return str;
}
