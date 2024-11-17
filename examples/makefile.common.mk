TARGET = $(notdir $(CURDIR))

ifeq ($(OS),Windows_NT)
	EXE = .exe
endif

BUILD_DIR  = .build
LIBS_DIR   = ../../libs
CIMGUI_DIR = $(LIBS_DIR)/cimgui
IMGUI_DIR  = $(LIBS_DIR)/cimgui/imgui
UTILS_DIR  = ../utils

# Specify C compiler
#OPT += --cc clang           # clang or tcc

OPT += -r                 # Release compilation: faster speed, no runtime checking
# Set cache folder
NELUA_CACHE = .neluacache
OPT += --cache-dir $(NELUA_CACHE)

# Optimize level is -O2, strip debug symbols("-Wl,-s")

CFLAGS += -I$(CIMGUI_DIR) -I$(IMGUI_DIR) -DIMGUI_IMPL_API="extern \"C\" __declspec(dllexport)"

NELUA_CFLAGS += --cflags="-O2           \
				 	      -Wl,-s                  \
					      -I$(IMGUI_DIR)/backends \
				 	      -I$(IMGUI_DIR)          \
				 	      -I$(CIMGUI_DIR)         \
                -mwindows               \
					      "
BACKENDS_OBJS += $(BUILD_DIR)/imgui_impl_opengl3.o \
								 $(BUILD_DIR)/imgui_impl_glfw.o
C_OBJS        += $(BUILD_DIR)/tentativeCode.o

RES += res/imguin64.res
LDFLAGS += --ldflags="-static -L$(BUILD_DIR) $(BACKENDS_OBJS) $(C_OBJS)  $(RES) -lcimgui -lstdc++ -limm32"

OPT += $(NELUA_CFLAGS)
OPT += $(LDFLAGS)
OPT += -L $(LIBS_DIR)/nelua/glfw  \
       -L $(LIBS_DIR)/nelua/imgui \
       -L $(LIBS_DIR)/nelua/stb  \
       -L ../utils
#OPT += --no-cache
#OPT += --verbose

VPATH = $(CIMGUI_DIR)          \
				:$(IMGUI_DIR)          \
				:$(IMGUI_DIR)/backends \
	      :$(UTILS_DIR)

OBJS =  $(BUILD_DIR)/cimgui.o
OBJS += $(BUILD_DIR)/imgui.o
OBJS += $(BUILD_DIR)/imgui_draw.o
OBJS += $(BUILD_DIR)/imgui_demo.o
OBJS += $(BUILD_DIR)/imgui_tables.o
OBJS += $(BUILD_DIR)/imgui_widgets.o
AR := ar -rc

CPPOPT += -DIMGUI_IMPL_API="extern \"C\" __declspec(dllexport)"
CPPOPT += $(CXXGLAGS) -I$(IMGUI_DIR)/backends -I$(IMGUI_DIR)
CPPOPT += -O2 -fno-exceptions -fno-rtti

all: $(BUILD_DIR) static $(BACKENDS_OBJS) $(C_OBJS)
	nelua  $(OPT) -o $(TARGET)$(EXE) $(TARGET).nelua
	@strip $(TARGET)$(EXE)
	@ll $(TARGET)$(EXE)

$(BUILD_DIR):
	-mkdir -p $@

static:$(OBJS)
	$(AR) $(BUILD_DIR)/libcimgui.a $(OBJS)

$(BUILD_DIR)/%.o:%.c Makefile
	$(CC) -c -O2 $(CFLAGS) -o $@ $<

$(BUILD_DIR)/%.o:%.cpp Makefile
	$(CXX) -c -O2 $(CPPOPT) -o $@ $<

PHONY: run clean

run: all
	./$(TARGET)$(EXE)
r: run

clean:
	@-rm -f *$(EXE)
	@-rm -fr $(NELUA_CACHE) $(BUILD_DIR)
