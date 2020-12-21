#Disabling implicit rules
.SUFFIXES:



#Compiler options
CFLAGS := -MMD

CC := gcc #TODO, on windows dosen't work without this line

#why using wildcard function?: wildcard expansion dosen't normaly happen in variable declaration
#Files path defintions
TARGET := myprog

csrcpath := src/
cdepspath := cdeps/
csrc := $(wildcard *.c)\
		$(wildcard $(csrcpath)*.c)\
		$(wildcard $(csrcpath)engine/*c)
		
cobjs := $(csrc:.c=.o)
cdeps := $(cobjs:.o=.d)
cdeps := $(notdir $(cdeps))
cdeps := $(addprefix $(cdepspath),$(cdeps))	

#cdeps := $(patsubst pattern,replacement,$(cobjs))



.PHONY: all
all: $(TARGET)


-include $(cdeps)


$(TARGET): $(cobjs)
	$(CC) -o $@ $^ $(LDFLAGS)

#Make dosent require this command explicitaly, but I disabled the implicit rules.
%.o : %.c $(cdepspath)
	$(CC) $(CFLAGS) -MF $(addprefix $(cdepspath),$(notdir $(<:.c=.d))) -g -c -o $@ $<

$(cdepspath):
	mkdir -p $@

.PHONY: clean
clean:
	$(RM) -v $(TARGET) $(cobjs) $(cdeps)
	
path := srcsrc/src/ciao/src/cavolo/
		
say_hello:
	@echo $(@:llo=E)
	@echo $(@:E=X)
	@echo $(@:llo=E)
	@echo $(@:E=X)
	@echo 1 $(notdir $(csrc))
	@echo 1.5 $(addprefix $(path),$(notdir $(csrc)))
	@echo 2 $(notdir $(csrc:.c=.o))
	@echo 3 $(csrc)
	@echo 4 $(realpath main.c)
	@echo 5 $(dir $(csrc))
	@echo 6 $(subst src/,bin/,$(path))
	@echo 7 $(patsubst src%,bin%,$(path))
	@echo 8 $(cobjs)
	@echo 9 $(cdeps)
	@echo 10 $(addprefix $(cdepspath),$(notdir $(cdeps))) 
	@echo 11  $(cdeps)	
#@echo 8 $(patsubst src%,bin,$(patsubst $(path))) 
	