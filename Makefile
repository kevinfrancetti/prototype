#Disabling implicit rules
.SUFFIXES:

TARGET := myprog
CFLAGS := -MMD
#LDFLAGS := -L/c/Program\ Files/mingw-w64/x86_64-8.1.0-posix-seh-rt_v6-rev0/mingw64/x86_64-w64-mingw32/lib
CC := gcc #TODO, on windows dosen't work without this line

#why using wildcard function?: wildcard expansion dosen't normaly happen in variable declaration 
csrc := $(wildcard *.c)\
		$(wildcard src/*.c)\
		$(wildcard src/engine/*c)
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
	