############################################################
#
# Makefile for LWR_III dyn lib
#
############################################################
MATLAB_SYMBOLIC := maple
export MATLAB_SYMBOLIC
PWD ?= $(shell pwd)

# Compiler Properties
############################################################
CXX = gcc
CPPFLAGS = -Wall -I$(PWD)/include # -I$(INC_DIR)
LDFLAGS = 
TARGET = sled11-x86-gcc4.x
TARGET64 = linux-x86_64-gcc4.x
AR = ar

# Library
############################################################
LIB_DIR = $(PWD)/lib/$(TARGET)
LIB_DIR64 = $(PWD)/lib/$(TARGET64)
LIB_SUFFIX = .a
LIB = $(LIB_DIR)/libLWR_IIIdyn$(LIB_SUFFIX)
LIB64 = $(LIB_DIR64)/libLWR_IIIdyn$(LIB_SUFFIX)

DIR += $(PWD)/lib \
	$(LIB_DIR)

DIR64 += $(PWD)/lib \
	$(LIB_DIR64)

# Python
############################################################
DIR += $(PWD)/python
DIR64 += $(PWD)/python

SWIG_INCLUDE += -I/usr/include/Python


# Includes
############################################################
INC_DIRS = $(PWD)/include

# to be generated files
############################################################
FILES = lbrDynamic \
	lbrTransformations \
	lbrZeroJacobiansDot \
	lbrZeroJacobians \
	lbrBodyJacobians 



# Maple generate files 
############################################################
SRC_GEN_DIR = $(PWD)/src_gen
MATLAB_GEN_DIR = $(PWD)/matlabSrc
DIR += $(SRC_GEN_DIR) \
       $(MATLAB_GEN_DIR)
DIR64 += $(SRC_GEN_DIR) \
       $(MATLAB_GEN_DIR)


GEN_FILES = $(addsuffix .c,\
	$(addprefix $(SRC_GEN_DIR)/, $(FILES)) )

GEN_FILES_DEPENDENCY = $(addprefix $(PWD)/calculations/newtonEuler/, \
                                   forwardBackward.m \
	                           initialize.m \
	                           kinematic.m \
	                           NewtonEulerForwBackw.m \
	                           codeGeneration.m \
	                           codeGenerationInit.m \
	                           generateCode.m )


# Object files
############################################################

OBJ_DIR = $(PWD)/obj/$(TARGET)

DIR += $(PWD)/obj \
	$(OBJ_DIR)

OBJ = $(addsuffix .o,\
	$(addprefix $(OBJ_DIR)/, $(FILES)) )


OBJ_DIR64 = $(PWD)/obj/$(TARGET64)

DIR64 += $(PWD)/obj \
	$(OBJ_DIR64)

OBJ64 = $(addsuffix .o,\
	$(addprefix $(OBJ_DIR64)/, $(FILES)) )

# Mex files
############################################################
MEX = lbrDynamicStaticBase_sfun.mexglx \
      lbrDynCoriolis_sfun.mexglx \
      lbrDynFloatingBase_sfun.mexglx \
      lbrDynGravitation_sfun.mexglx \
      lbrDynMass_sfun.mexglx \
      lbrDynReaction_sfun.mexglx \
      lbrDynTcpFloating_sfun.mexglx \
      lbrJacobian_EE_sfun.mexglx \
      lbrJacobiansDot_sfun.mexglx \
      lbrZeroJacobians_sfun.mexglx \
      lbrZeroJacobiansWithEE_sfun.mexglx \
      lbrBodyJacobians_sfun.mexglx \
      lbrBodyJacobiansWithEE_sfun.mexglx \
      lbrTransformation_EE_sfun.mexglx \
      lbrTransformations_sfun.mexglx
MEX_FILES = $(addprefix $(PWD)/simulink/, $(MEX) )
MEX_DEPS = $(PWD)/lib/sled11-x86-gcc4.x/libLWR_IIIdyn.a


all: linux-x86_64-gcc4.x sled11-x86-gcc4.x qnx-ppc-gcc33 vxworks $(MEX_FILES) win7-x86-vc10 target-python #target-winxp-x86-vc9

vxworks: vxworks6.7-x86-gcc4.x    vxworks6.8-x86-gcc4.x    vxworks6.9-x86-gcc4.x \
         vxworks6.7smp-x86-gcc4.x vxworks6.8smp-x86-gcc4.x vxworks6.9smp-x86-gcc4.x 


target: $(LIB)
target64: $(LIB64)

# targets
############################################################
sled11-x86-gcc4.x: $(MEX_FILES)
	@echo " "
	@echo "##################################################"
	@echo "# BUILDING sled11-x86-gcc4.x"
	@echo "##################################################"
	@echo " "
	@$(MAKE) target

linux-x86_64-gcc4.x: $(MEX_FILES)
	@echo " "
	@echo "##################################################"
	@echo "# BUILDING linux-x86_64-gcc4.x"
	@echo "##################################################"
	@echo " "
	@$(MAKE) target64	

vxworks%-x86-gcc4.x:
	@echo " "
	@echo "##################################################"
	@echo "# BUILDING $@"
	@echo "##################################################"
	@echo " "
	@$(MAKE) target TARGET='$@' \
			CC='/opt/vxworks/wrapper/linux/bin/$@-gcc' \
			AR='/opt/vxworks/wrapper/linux/bin/$@-ar' \
			CPPFLAGS='-Wall -I$(PWD)/include'

target-python: $(DIR)
	@echo " "	
	@echo "##################################################"
	@echo "# BUILDING $@"
	@echo "##################################################"
	@echo " "	
	@$(MAKE) -C python

win7-x86-vc10:
	@echo " "
	@echo "##################################################"
	@echo "# BUILDING winxp-x86-vc9"
	@echo "##################################################"
	@echo " "
	@$(MAKE) addalloca \
	TARGET=win7-x86-vc10 \
	AR=/home/schm_fl/downloads/mingw32_4.2.1.dfsg-1_i386/usr/bin/i586-mingw32msvc-ar 
	@$(MAKE) target	\
	TARGET=win7-x86-vc10 \
	CXX=/home/schm_fl/downloads/mingw32_4.2.1.dfsg-1_i386/usr/bin/i586-mingw32msvc-gcc \
	AR=/home/schm_fl/downloads/mingw32_4.2.1.dfsg-1_i386/usr/bin/i586-mingw32msvc-ar \
	CPPFLAGS='-Wall -I$(PWD)/include' \
	CXXFLAGS="$(CXXFLAGS) -D__WIN32__ -ansi" \
	LIB_SUFFIX=".lib"

.ONESHELL:
qnx-ppc-gcc33:
	@echo " "
	@echo "##################################################"
	@echo "# BUILDING qnx-ppc-gcc33"
	@echo "##################################################"
	@echo " "
	@export QNX_CONFIGURATION=/opt/qnx/qnx && \
	export QNX_HOST=/opt/qnx/host/linux/x86 && \
	export QNX_TARGET=/opt/qnx/target/qnx6 && \
	$(MAKE) target \
	TARGET=qnx-ppc-gcc33 \
	CXX=/opt/qnx/host/linux/x86/usr/bin/QCC \
	CPPFLAGS='-Wall -I$(PWD)/include' \
	CXXFLAGS="-V3.3.5,gcc_ntoppcbe -DRT"

.PHONY: simulink
$(MEX_FILES): $(LIB)
	@echo " "
	@echo "##################################################"
	@echo "# BUILDING simulink sfunctions"
	@echo "##################################################"
	@echo " "
	$(MAKE) -C simulink \
	INC_DIR='-I$(INC_DIRS)'  \
	LIBS=-'L$(PWD)/lib/sled11-x86-gcc4.x -lLWR_IIIdyn' \
	MEX='$(MEX)' 
#DEPENDENCY='$(MEX_DEPS)'

addalloca: $(OBJ_DIR)/_chkstk.o


# library
############################################################
$(LIB): | $(OBJ)
	@echo ++++++++++++++++++
	@echo creating library $(LIB)
	$(AR) rsv $(LIB) $(OBJ_DIR)/*.o
	@echo 

$(LIB64): | $(OBJ64)
	@echo ++++++++++++++++++
	@echo creating library $(LIB64)
	$(AR) rsv $(LIB64) $(OBJ_DIR64)/*.o
	@echo 

# objects
############################################################
$(OBJ_DIR)/_chkstk.o: $(DIR)
	$(AR) x /home/schm_fl/downloads/mingw32_4.2.1.dfsg-1_i386/usr/lib/gcc/i586-mingw32msvc/4.2.1-sjlj/libgcc.a _chkstk.o
	mv _chkstk.o $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(PWD)/src/%.c 
	@echo ++++++++++++++++++
	@echo creating object file $@
	$(CXX) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
	@echo

$(OBJ_DIR)/%.o: $(PWD)/src_gen/%.c 
	@echo ++++++++++++++++++
	@echo creating object file $@
	$(CXX) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
	@echo

$(OBJ_DIR64)/_chkstk.o: $(DIR64)
	$(AR) x /home/schm_fl/downloads/mingw32_4.2.1.dfsg-1_i386/usr/lib/gcc/i586-mingw32msvc/4.2.1-sjlj/libgcc.a _chkstk.o
	mv _chkstk.o $(OBJ_DIR)

$(OBJ_DIR64)/%.o: $(PWD)/src/%.c 
	@echo ++++++++++++++++++
	@echo creating object file $@
	$(CXX) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
	@echo

$(OBJ_DIR64)/%.o: $(PWD)/src_gen/%.c 
	@echo ++++++++++++++++++
	@echo creating object file $@
	$(CXX) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
	@echo

$(OBJ): | $(DIR) $(SRC_GEN) 

$(OBJ64): | $(DIR64) $(SRC_GEN) 

# Generated files
#############################
.PRECIOUS: $(PWD)/src_gen/%.c
$(PWD)/src_gen/%.c: $(GEN_FILES_DEPENDENCY)
	@rm -f src_gen/* 
	@rm -f matlabSrc/*
	@echo $@
	@echo ++++++++++++++++++++
	@echo call matlab for calculating the dynamic
	cd calculations/newtonEuler && \
	/opt/matlab/2007b/bin/matlab_acad -nodesktop -r calcNewtonEuler
	@echo 

$(SRC_GEN): | $(DIR) 

# DIRECTORIES
##############################
$(DIR):
	@echo ++++++++++++++++++++
	@echo creating directory $@
	mkdir $@
	@echo

$(DIR64):
	@echo ++++++++++++++++++++
	@echo creating directory $@
	mkdir $@
	@echo

.PHONY: clean


# CLEAN
##############################
.phony: clean
clean: clean-sled11-x86-gcc4.x clean-qnx-ppc-gcc33 clean-winxp-x86-vc9 clean-simulink
	rm -rf 
	rm -rf src_gen
	rm -rf matlabSrc	
	rm -rf obj
	rm -rf lib
	$(MAKE) -C simulink clean
	$(MAKE) -C python clean

clean-sled11-x86-gcc4.x:
	@echo cleaning up sled11-x86-gcc4.x
	@rm -rf sled11-x86-gcc4.x

clean-qnx-ppc-gcc33:
	@echo cleaning up qnx-ppc-gcc33
	@rm -rf qnx-ppc-gcc33

clean-winxp-x86-vc9:
	@echo cleaning up winxp-x86-vc9
	@rm -rf winxp-x86-vc9

clean-simulink:
	@echo cleaning up simulink
	$(MAKE) clean -C simulink