#Disabling implicit rules
.SUFFIXES:



#Compiler options
CFLAGS := -MMD

CC := gcc #TODO, on windows dosen't work without this line

#Program name
TARGET := myprog

#Files paths
csrcpath := src/
cdepspath := cdeps/

#why using wildcard function?: wildcard expansion dosen't normaly happen in variable declaration
csrc := $(wildcard *.c)\
		$(wildcard $(csrcpath)*.c)\
		$(wildcard $(csrcpath)engine/*c)
		
cobjs := $(csrc:.c=.o)

cdeps := $(cobjs:.o=.d)
cdeps := $(notdir $(cdeps))
cdeps := $(addprefix $(cdepspath),$(cdeps))	

#cdeps := $(patsubst pattern,replacement,$(cobjs))

###Util functions###
fun_dep_path = $(addprefix $(cdepspath),$(notdir $(1:.c=.d)))

#Params:
#1: new path
#2: filename
#3: old extension
#4: new extension
##:Usage examble $(call fun_change_path_and_extension,some/cool/place,this/file/here.c,c,d);
#This function changes the path and the file extension of a given file
fun_change_path_and_extension = $(addprefix $(1),$(notdir $(2:.$(3)=.$(4))))

####################

.PHONY: all
all: $(TARGET) ketchup


-include $(cdeps)


$(TARGET) ketchup: $(cobjs)
	$(CC) -o $@ $^ $(LDFLAGS)
	echo $@

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
	@echo 3 $(csrc)
	@echo 8 $(cobjs)
	@echo 9 $(cdeps)
	@echo 12 $(cdepspath)
	@echo 13 $(call fun_dep_path,$(csrc))
	@echo 14 $(call fun_change_path_and_extension,$(cdepspath),$(csrc),c,d);
	@echo 15 $(call fun_change_path_and_extension,$(csrcpath),$(cdeps),d,c);
#@echo 8 $(patsubst src%,bin,$(patsubst $(path))) 
	