#DEBUG_BUILD = true

#SHOW_CONSOLE = true

BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o $(BUILD_DIR)/imgui_impl_glfw.o
BACKENDS_OBJS += $(BUILD_DIR)/rlImGui.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

RAYLIB_DIR       = ../../../raylib
RAYLIB_NELUA_DIR = ../../../Raylib.nelua
COMMON_OPT      += -I$(RAYLIB_DIR)/include -Irlimgui -DNO_FONT_AWESOME
NELUA_CFLAGS    += $(COMMON_OPT)
CPPOPT          += $(COMMON_OPT)
NELUA_LDFLAGS   += -L$(RAYLIB_DIR)/lib -lraylib
OPT             += -L$(RAYLIB_NELUA_DIR) -D GLAD_NO_IMPL
VPATH           += :rlimgui

include ../makefile.common.mk
