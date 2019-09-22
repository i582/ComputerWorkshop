# компилятор
COMPILER = gcc
FLAGS = -c
EXECUTABLE = app


all: main

main: main.o array_proc.o count_div_by_7.o
	$(COMPILER) -o $(EXECUTABLE) main.o array_proc.o count_div_by_7.o

main.o: main.c
	$(COMPILER) $(FLAGS) main.c

array_proc.o: array_proc.c
	$(COMPILER) $(FLAGS) array_proc.c

count_div_by_7.o: count_div_by_7.c
	$(COMPILER) $(FLAGS) count_div_by_7.c
