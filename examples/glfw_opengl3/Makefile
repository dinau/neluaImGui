#DEBUG_BUILD = true

#SHOW_CONSOLE = true



BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif



include ../makefile.common.mk
