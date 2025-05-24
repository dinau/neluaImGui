#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += $(TARGET).nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIMPLOT_DIR   = ../../libs/cimplot
IMPLOT_DIR    =  $(CIMPLOT_DIR)/implot
VPATH        +=  $(CIMPLOT_DIR)
VPATH        +=  $(IMPLOT_DIR)
NELUA_CFLAGS += -I$(CIMPLOT_DIR)

# Options for C++ sources
CPPOPT       += -I$(IMPLOT_DIR)
CPPOPT       += -I../../libs/cimgui

OBJS +=  $(BUILD_DIR)/cimplot.o
OBJS +=  $(BUILD_DIR)/implot.o
OBJS +=  $(BUILD_DIR)/implot_demo.o
OBJS +=  $(BUILD_DIR)/implot_items.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
