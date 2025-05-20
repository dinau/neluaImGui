#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += $(TARGET).nelua


BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

CIGFD_DIR     = ../../libs/CImGuiFileDialog
IGFD_DIR      =  $(CIGFD_DIR)/libs/ImGuiFileDialog
VPATH        +=  $(CIGFD_DIR)
VPATH        +=  $(IGFD_DIR)
NELUA_CFLAGS += -I$(CIGFD_DIR) -I$(IGFD_DIR) -I../utils/fonticon

# Options for C++ sources
CPPOPT       += -I$(IGFD_DIR) -I$(CIGFD_DIR)
CPPOPT       += -I../../libs/cimgui -I../utils/fonticon

# This definition is optional. It can changes open dialog appearance.
CPPOPT       += -D CUSTOM_IMGUIFILEDIALOG_CONFIG="<customIconFont.h>"

OBJS         +=  $(BUILD_DIR)/ImGuiFileDialog.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
