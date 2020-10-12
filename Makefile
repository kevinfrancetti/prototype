.SUFFIXES: .c .o

say_hello:
	@echo "Mucca dio cane"
	
build:
	gcc -v -o aids main.c

build-debug:
	gcc -g -o aids-debug main.c
	
clean:
	rm -v aids.exe aids-debug.exe