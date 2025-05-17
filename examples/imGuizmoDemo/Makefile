#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += $(TARGET).nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIMGUIZMO_DIR = ../../libs/cimguizmo
IMGUIZMO_DIR  =  $(CIMGUIZMO_DIR)/ImGuizmo
VPATH        +=  $(CIMGUIZMO_DIR)
VPATH        +=  $(IMGUIZMO_DIR)
NELUA_CFLAGS += -I$(CIMGUIZMO_DIR)

# Options for C++ sources
CPPOPT       += -I$(IMGUIZMO_DIR)
CPPOPT       += -I../../libs/cimgui

OBJS +=  $(BUILD_DIR)/cimguizmo.o
OBJS +=  $(BUILD_DIR)/GraphEditor.o
OBJS +=  $(BUILD_DIR)/ImCurveEdit.o
OBJS +=  $(BUILD_DIR)/ImGuizmo.o
OBJS +=  $(BUILD_DIR)/ImSequencer.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
