#Disabling implicit rules
.SUFFIXES:

TARGET := myprog
LDFLAGS =

csrc := $(wildcard *.c)
cobjs := $(csrc:.c=.o)


all: $(TARGET) 
	

$(TARGET): $(cobjs)
	$(CC) -o $@ $^

#Make dosent require this command explicitaly, but i disabled the implicit rules.
%.o : %.c
	$(CC) -c -o $@ $<



.PHONY: clean
clean:
	$(RM) -v $(TARGET) $(cobjs)
	
	
say_hello:
	@echo "Mucca dio cane"
	@echo '$(RM)'
	@echo '$(CC)'
	@echo '$(cobjs)'
