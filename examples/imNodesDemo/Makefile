#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += $(TARGET).nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIMNODES_DIR = ../../libs/cimnodes
IMNODES_DIR  =  $(CIMNODES_DIR)/imnodes
VPATH        +=  $(CIMNODES_DIR)
VPATH        +=  $(IMNODES_DIR)
NELUA_CFLAGS += -I$(CIMNODES_DIR)

# Options for C++ sources
CPPOPT       += -I$(IMNODES_DIR)
CPPOPT       += -I../../libs/cimgui
# Additional definition
CPPOPT       += -D IMNODES_NAMESPACE=imnodes

OBJS +=  $(BUILD_DIR)/cimnodes.o
OBJS +=  $(BUILD_DIR)/imnodes.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
