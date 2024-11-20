#DEBUG_BUILD = true

#SHOW_CONSOLE = true

RES += res/nelua64.res

DEP_NELUA = iconFontTblDef.nelua

STATIC_OPT = -static

BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o



include ../makefile.common.mk



iconFontTblDef.nelua: makeIconFontTblDef.nims
	-nim $<
