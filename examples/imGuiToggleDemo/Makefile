#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += $(TARGET).nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIMTOGGLE_DIR = ../../libs/cimgui_toggle
IMTOGGLE_DIR  = $(CIMTOGGLE_DIR)/imgui_toggle
VPATH         +=   $(CIMTOGGLE_DIR)
VPATH         +=   $(IMTOGGLE_DIR)
NELUA_CFLAGS  += -I$(CIMTOGGLE_DIR)

# Options for C++ sources
CPPOPT       += -I$(IMTOGGLE_DIR)
CPPOPT       += -I../../libs/cimgui

CPPOPT += -D SPINNER_SCALESQUARES

OBJS +=  $(BUILD_DIR)/cimgui_toggle.o
OBJS +=  $(BUILD_DIR)/cimgui_offset_rect.o
OBJS +=  $(BUILD_DIR)/cimgui_toggle_presets.o
OBJS +=  $(BUILD_DIR)/imgui_toggle.o
OBJS +=  $(BUILD_DIR)/imgui_toggle_palette.o
OBJS +=  $(BUILD_DIR)/imgui_toggle_presets.o
OBJS +=  $(BUILD_DIR)/imgui_toggle_renderer.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
