#DEBUG_BUILD = true

#SHOW_CONSOLE = true

RES += res/nelua64.res

BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_sdl2.o

CPPOPT += $(shell pkgconf --cflags sdl2)


include ../makefile.common.mk
