#DEBUG_BUILD = true

#SHOW_CONSOLE = true

DEPS_NELUA += $(TARGET).nelua

BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o

###### Specify compiler to Clang
#OPT += --cc clang
################################

CIMPLOT_DIR    = ../../libs/cimplot
IMPLOT_DIR     =  $(CIMPLOT_DIR)/implot
VPATH         +=  $(CIMPLOT_DIR)
VPATH         +=  $(IMPLOT_DIR)
NELUA_CFLAGS  += -I$(CIMPLOT_DIR)
# 3D
CIMPLOT3D_DIR  = ../../libs/cimplot3d
IMPLOT3D_DIR   =  $(CIMPLOT3D_DIR)/implot3d
VPATH         +=  $(CIMPLOT3D_DIR)
VPATH         +=  $(IMPLOT3D_DIR)
NELUA_CFLAGS  += -I$(CIMPLOT3D_DIR)

# Options for C++ sources
CPPOPT        += -I$(IMPLOT_DIR)
CPPOPT        += -I$(IMPLOT3D_DIR)
CPPOPT        += -I../../libs/cimgui

OBJS += $(BUILD_DIR)/cimplot.o
OBJS += $(BUILD_DIR)/implot.o
OBJS += $(BUILD_DIR)/implot_demo.o
OBJS += $(BUILD_DIR)/implot_items.o
# 3D
OBJS += $(BUILD_DIR)/cimplot3d.o
OBJS += $(BUILD_DIR)/implot3d.o
OBJS += $(BUILD_DIR)/implot3d_demo.o
OBJS += $(BUILD_DIR)/implot3d_items.o
OBJS += $(BUILD_DIR)/implot3d_meshes.o

ifeq ($(OS),Windows_NT)
	RES += res/nelua64.res
	STATIC_OPT = -static
endif

include ../makefile.common.mk
