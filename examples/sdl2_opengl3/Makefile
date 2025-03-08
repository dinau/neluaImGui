#DEBUG_BUILD = true

#SHOW_CONSOLE = true

BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_sdl2.o

STATIC = true
STATIC_SDL2 = false

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	ifeq ($(STATIC),true)
		ifeq ($(STATIC_SDL2),false)
			STATIC_OPT += -static -lSDL2.dll -L./lib
		else
			STATIC_OPT += -static -lSDL2 \
														-lgdi32 \
														-ladvapi32 \
														-lcomdlg32 \
														-ldinput8 \
														-ldxerr8 \
														-ldxguid \
														-lgdi32 \
														-lhid \
														-lkernel32 \
														-lole32 \
														-loleaut32 \
														-lsetupapi \
														-lshell32 \
														-luser32 \
														-luuid \
														-lversion \
														-lwinmm \
														-lwinspool \
														-lws2_32 \
														-lopengl32 \
														-lshell32 \
														-luser32
			endif
	endif
endif

CPPOPT += $(shell pkgconf --cflags sdl2)


include ../makefile.common.mk
