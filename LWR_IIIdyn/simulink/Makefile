############################################################
#
# Makefile for simulink s functions
#
# author = Kai Krieger
#
############################################################

# usage make MEX='sfunction.cpp' INC_DIR='-IincludedDirectory' LIBS='-LlibraryDirectory -lLibrary'
# version of matlab can be choosen via MATLAB_PATH

INC_DIR = 
LIBS = 
MEX = 
DEPENDENCY = 

MATLAB_PATH=/opt/matlab/v18

# Compiler Properties C compiler
##############################
CC = gcc
CFLAGS = -fPIC -D_GNU_SOURCE -pthread -fexceptions -m32
CDEBUGFLAGS        = -g
COPTIMFLAGS        = -O -DNDEBUG
CLIBS              = -Wl,-rpath-link,$(MATLAB_PATH)/bin/glnx86 -L$(MATLAB_PATH)/bin/glnx86 -lmx -lmex -lmat -lm -lm -lstdc++
arguments          =  -DMX_COMPAT_32

# Compiler Properties C++ compiler
##############################
CXX                = g++
CXXFLAGS           = -fPIC -ansi -D_GNU_SOURCE -pthread 
CXXDEBUGFLAGS      = -g
CXXOPTIMFLAGS      = -O -DNDEBUG
CXXLIBS            = -Wl,-rpath-link,$(MATLAB_PATH)/bin/glnx86 -L$(MATLAB_PATH)/bin/glnx86 -lmx -lmex -lmat -lm -lm
arguments          =  -DMX_COMPAT_32

# Linker Properties
##############################
LD                 = gcc
LDFLAGS            = -pthread -shared -m32 -Wl,--version-script,$(MATLAB_PATH)/extern/lib/glnx86/mexFunction.map
LDDEBUGFLAGS       = -g
LDOPTIMFLAGS       = -O
LDEXTENSION        = .mexglx

MATLAB_INC_DIR = -I$(MATLAB_PATH)/extern/include -I$(MATLAB_PATH)/simulink/include
MEX_DEF = -DMATLAB_MEX_FILE

DIR = obj

all: $(MEX)

# LINK MEX FILE
##############################
%.mexglx: obj/%.o obj/mexversion.o 
	@echo ++++++++++++++++++++
	@echo creating mex file $@
	@echo
	$(LD) $< obj/mexversion.o -o $@ $(LDFLAGS) $(LDOPTIMFLAGS) $(LIBS) $(CLIBS)
	@echo 

# SFUNCTION object file c and cpp
##############################
.PRECIOUS: obj/%.o
obj/%.o: %.c $(DEPENDENCY)
	@echo ++++++++++++++++++++
	@echo creating object file $@
	@echo
	$(CC) -c $< -o $@ $(INC_DIR) $(MATLAB_INC_DIR) $(MEX_DEF) $(CFLAGS) $(arguments) $(COPTIMFLAGS)
	@echo

obj/%.o: %.cpp $(DEPENDENCY)
	@echo ++++++++++++++++++++
	@echo creating object file $@
	@echo
	$(CXX) -c $< -o $@ $(INC_DIR) $(MATLAB_INC_DIR) $(MEX_DEF) $(CXXFLAGS) $(arguments) $(CXXOPTIMFLAGS)
	@echo

# MEXVERSION object file
##############################
obj/mexversion.o: $(DIR)
	@echo ++++++++++++++++++++
	@echo creating object file $@
	@echo
	$(LD) -c  $(MATLAB_PATH)/extern/src/mexversion.c -o $@ $(INC_DIR) $(MATLAB_INC_DIR) $(MEX_DEF) $(C_FLAGS) $(arguments) $(COPTIMFLAGS)
	@echo


# DIRECTORIES
##############################
$(DIR):
	@echo ++++++++++++++++++++
	@echo creating directory $@
	mkdir $@
	@echo


.PHONY: clean

# CLEAN
##############################
clean:
	@echo cleaning up obj
	@rm -rfv obj
	@echo cleaning up mex
	@rm -rfv *.mexglx
