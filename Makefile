.PHONY: all clean
all: caesar
clean:
	rm -rf caesar *.o
functions.o: functions.s
	gcc -c -o functions.o functions.s
main.o: main.c functions.h
	gcc -c  -o main.o main.c
caesar: main.o functions.o functions.h
	gcc -o caesar main.o functions.o
