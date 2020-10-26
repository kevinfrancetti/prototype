.SUFFIXES:

TARGET := myprog
LDFLAGS =

csrc := $(wildcard *.c)
cobjs := $(csrc:.c=.o)


all: $(TARGET) 
	

$(TARGET): $(cobjs)
	$(CC) -o $@ $^

#%.o : %.c
#	@echo fuck



.PHONY: clean
clean:
	$(RM) -v $(TARGET) 
	
	
say_hello:
	@echo "Mucca dio cane"
	@echo '$(RM)'
	@echo '$(CC)'
	@echo '$(cobjs)'
