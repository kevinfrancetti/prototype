.SUFFIXES:

PROG_NAME := myprog
LDFLAGS =

csrc := $(wildcard *.c)
cobjs := $(csrc:.c=.o)


all: $(PROG_NAME) $(PROG_NAME)-debug
	
.PHONY: build
$(PROG_NAME): $(objs)
	$(CC) -o $@ main.c
	
	
.PHONY: build-debug
$(PROG_NAME)-debug:
	$(CC) -g -o $(PROG_NAME)-debug main.c
	
	
.PHONY: clean
clean:
	$(RM) -v $(PROG_NAME) $(PROG_NAME)-debug
	
	
say_hello:
	@echo "Mucca dio cane"
	@echo '$(RM)'
	@echo '$(CC)'
	@echo '$(cobjs)'
