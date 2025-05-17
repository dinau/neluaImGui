#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += imKnobsDemo.nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIMKNOBS_DIR = ../../libs/cimgui-knobs
IMKNOBS_DIR  = $(CIMKNOBS_DIR)/libs/imgui-knobs
VPATH         +=   $(CIMKNOBS_DIR)
VPATH         +=   $(IMKNOBS_DIR)
NELUA_CFLAGS  += -I$(CIMKNOBS_DIR)

# Options for C++ sources
CPPOPT       += -I$(IMKNOBS_DIR)
CPPOPT       += -I../../libs/cimgui

CPPOPT += -D SPINNER_SCALESQUARES

OBJS +=  $(BUILD_DIR)/cimgui-knobs.o
OBJS +=  $(BUILD_DIR)/imgui-knobs.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
