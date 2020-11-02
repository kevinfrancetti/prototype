#Disabling implicit rules
.SUFFIXES:

TARGET := myprog
CFLAGS := -MMD
CC := gcc #TODO

#why using wildcard function?: wildcard expansion dosen't normaly happen in variable declaration 
csrc := $(wildcard *.c)
cobjs := $(csrc:.c=.o)
cdeps := $(cobjs:.o=.d)


.PHONY: all
all: $(TARGET) 
	

$(TARGET): $(cobjs)
	$(CC) -o $@ $^ $(LDFLAGS)

#Make dosent require this command explicitaly, but i disabled the implicit rules.
%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<



.PHONY: clean
clean:
	$(RM) -v $(TARGET) $(cobjs) $(cdeps)
	
	
say_hello:
	@echo "Mucca dio cane"
	@echo '$(RM)'
	@echo '$(CC)'
	@echo '$(cobjs)'
	@echo '$(shell uname)'
	@echo '$(shell which gcc)'
	echo $(OS)
	sh --version
	bash --version
	which make
	which gcc
	which ls