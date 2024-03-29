#include <stdio.h>
#include <stdlib.h>

#ifdef __linux

#include <dlfcn.h>

#define LOAD_LIBRARY(lib_name, flags) dlopen(lib_name, flags)
#define LOAD_FUNCTION(lib, func_name) dlsym(lib, func_name)
#define CLOSE_LIBRARY(lib) dlclose(lib)


#elif defined _WIN32

#include <windows.h>

#define LOAD_LIBRARY(lib_name, flags) LoadLibrary(lib_name)
#define LOAD_FUNCTION(lib, func_name) GetProcAddress((HINSTANCE)lib, func_name)
#define CLOSE_LIBRARY(lib) FreeLibrary((HINSTANCE)lib);


#endif


#include "iostream"
using namespace std;


int main(int argc, char** argv)
{
	setlocale(LC_ALL, "Rus");

	
	int selected = 1;
	

	while (selected)
	{

	cout << "��� �� ������ ������������?" << endl;
	cout << "1. ������" << endl;
	cout << "2. �������" << endl;
	cout << "0. �����" << endl;


	cin >> selected;
	switch(selected)
	{

		case 1:
		{
			void* lib = LOAD_LIBRARY("array_proc.dll", NULL);
			if (!lib)
			{
				printf("Error open lib\n");
				break;
			}
			int (__stdcall *array_proc) (int*, int) = (__stdcall int (*)(int*, int))LOAD_FUNCTION(lib, "array_proc\0");
			

			int* mas = new int[73];

			for (int i = 0; i < 73; i++)
			{		
				mas[i] = rand() % 100 - 50;
			}
			int count_7 = array_proc(mas, 72);
			printf("��������� %d\n\n", count_7);

			delete[] mas;
			break;
		}

		case 2:
		{
			void* lib = LOAD_LIBRARY("matrix_proc.dll", NULL);
			if (!lib)
			{
				printf("Error open lib\n");
				break;
			}
			int (__stdcall *matrix_proc) (int**, int, int) = (__stdcall int (*)(int**, int, int))LOAD_FUNCTION(lib, "matrix_proc\0");


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
			printf("��������� %d\n\n", count_matrix_7);
	
			break;
		}

	}

	}

	return 0;
}