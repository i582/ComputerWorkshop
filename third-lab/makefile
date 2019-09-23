CC=g++

SOURCES=main.cpp
APP=app
PATH_THIRD=third_lab/

.PHONY: third-lab

third-lab: larray_proc lmatrix_proc
	${CC} ${SOURCES} -o ${PATH_THIRD}${APP}

larray_proc: array_proc.o
	${CC} -shared -o ${PATH_THIRD}array_proc.dll array_proc.o
lmatrix_proc: matrix_proc.o
	${CC} -shared -o ${PATH_THIRD}matrix_proc.dll matrix_proc.o
