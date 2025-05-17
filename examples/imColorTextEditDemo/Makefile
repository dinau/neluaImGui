#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += $(TARGET).nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIMCTE_DIR                = ../../libs/cimCTE
IMGUI_COLOR_TEXTEDIT_DIR  =  $(CIMCTE_DIR)/ImGuiColorTextEdit
VPATH                    +=  $(CIMCTE_DIR)
VPATH                    +=  $(IMGUI_COLOR_TEXTEDIT_DIR)
NELUA_CFLAGS             += -I$(CIMCTE_DIR)

# Options for C++ sources
CPPOPT       += -I$(IMGUI_COLOR_TEXTEDIT_DIR)
CPPOPT       += -I$(IMGUI_COLOR_TEXTEDIT_DIR)/vendor/regex/include
CPPOPT       += -I../../libs/cimgui
#CPPOPT       += -fexceptions

OBJS +=  $(BUILD_DIR)/cimCTE.o
OBJS +=  $(BUILD_DIR)/TextEditor.o
OBJS +=  $(BUILD_DIR)/ImGuiDebugPanel.o
OBJS +=  $(BUILD_DIR)/LanguageDefinitions.o
OBJS +=  $(BUILD_DIR)/UnitTests.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
