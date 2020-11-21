#Disabling implicit rules
.SUFFIXES:

TARGET := myprog
CFLAGS := -MMD
CC := gcc #TODO, on windows dosen't work without this line

#why using wildcard function?: wildcard expansion dosen't normaly happen in variable declaration 
csrc := $(wildcard *.c)
cobjs := $(csrc:.c=.o)
cdeps := $(cobjs:.o=.d)


.PHONY: all
all: $(TARGET)


-include $(cdeps)


$(TARGET): $(cobjs)
	$(CC) -o $@ $^ $(LDFLAGS)

#Make dosent require this command explicitaly, but I disabled the implicit rules.
%.o : %.c
	$(CC) $(CFLAGS) -g -c -o $@ $<


.PHONY: clean
clean:
	$(RM) -v $(TARGET) $(cobjs) $(cdeps)
		
say_hello:
	@echo $(@:llo=E)
	@echo $(@:E=X)
	