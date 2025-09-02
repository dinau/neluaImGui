#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA = iconFontTblDef.nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif


include ../makefile.common.mk

PHONY: gen

gen: iconFontTblDef.nelua

iconFontTblDef.nelua: makeIconFontTblDef.lua
	lua $<
