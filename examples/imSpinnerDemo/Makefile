#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += imSpinnerDemo.nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIMSPINNER_DIR = ../../libs/cimspinner/imspinner
VPATH         +=  $(CIMSPINNER_DIR)
NELUA_CFLAGS  += -I$(CIMSPINNER_DIR)

# Options for C++ sources
CPPOPT       += -I$(CIMSPINNER_DIR)/imspinner
CPPOPT       += -I../../libs/cimgui

# Adding spinner widgets.
# See  ../../libs/cimspinner/imspinner/cimspinner.h         <--- Available names defined
#      ../../libs/cimspinner/imspinner/cimspinner_config.h  <--- Default enabled sipnners
#      ../../libs/cimspinner/imspinner/cimspinner.cpp       <--- Function signatures
CPPOPT += -D SPINNER_SCALESQUARES
CPPOPT += -D IMSPINNER_DEMO

OBJS +=  $(BUILD_DIR)/cimspinner.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
