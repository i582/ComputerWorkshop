#include <stdio.h>
#include <stdlib.h>

#ifdef __linux

#include <dlfcn.h>

void LoadRun(const char* const s, const char* const func_name) {
	void* lib;
	void (*fun)(void);
	lib = dlopen(s, RTLD_LAZY);
	if (!lib) {
		printf("cannot open library '%s'\n", s);
		return;
	}
	fun = (void (*)(void))dlsym(lib, func_name);
	if (fun == NULL) {
		printf("cannot load function func\n");
	}
	else {
		fun();
	}
	dlclose(lib);
}

#elif defined _WIN32

#include <windows.h>

void LoadRun(const char* const s, const char* const func_name) {
	void* lib;
	void (*fun)(void);
	lib = LoadLibrary(s);
	if (!lib) {
		printf("cannot open library '%s'\n", s);
		return;
	}
	fun = (void (*)(void))GetProcAddress((HINSTANCE)lib, func_name);
	if (fun == NULL) {
		int error = GetLastError();
		printf("cannot load function %s, error is %d mazafaka\n", func_name, error);
	}
	else {
		fun();
	}
	FreeLibrary((HINSTANCE)lib);
}

#endif

#include "array_proc.h"
#include "matrix_proc.h"
#include "iostream"
using namespace std;


int main(int argc, char** argv)
{
	setlocale(LC_ALL, "Rus");

	
	int selected = 1;
	

	while (selected)
	{

	cout << "Что вы хотите использовать?" << endl;
	cout << "1. Массив" << endl;
	cout << "2. Матрица" << endl;
	cout << "0. Выход" << endl;


	cin >> selected;
	switch(selected)
	{

		case 1:
		{
			LoadRun("array_proc.dll", "array_proc\0");

			int* mas = new int[73];

			for (int i = 0; i < 73; i++)
			{		
				mas[i] = rand() % 100 - 50;
			}
			int count_7 = array_proc(mas, 72);
			printf("Результат %d\n\n", count_7);

			delete[] mas;
			break;
		}

		case 2:
		{
			LoadRun("matrix_proc.dll", "matrix_proc\0");


			int** matrix = new int*[7];
			for (int i = 0; i < 7; i++)
			{
				matrix[i] = new int[10];
			}

			for (int i = 0; i < 7; i++)
			{
				for (int j = 0; j < 10; j++)
				{
					matrix[i][j] = rand() % 100 - 50;
				}
			}
			int count_matrix_7 = matrix_proc(matrix, 7, 10);
			printf("Результат %d\n\n", count_matrix_7);
	
			break;
		}

	}

	}

	return 0;
}