TARGET = $(notdir $(CURDIR))

ifeq ($(DEBUG_BUILD),true)
	#
else
	OPT += -r  # Release compilation: faster speed, no runtime checking
endif

ifeq ($(OS),Windows_NT)
	EXE = .exe
	ifneq ($(SHOW_CONSOLE),true)
		HIDE_CONSOLE = -mwindows
	endif
	IMM32LIB = -limm32
endif


#OPT += --no-cache

BUILD_DIR    = .build
LIBS_DIR     = ../../libs
CIMGUI_DIR   = $(LIBS_DIR)/cimgui
IMGUI_DIR    = $(CIMGUI_DIR)/imgui
UTILS_DIR    = ../utils
FONTICON_DIR = $(UTILS_DIR)/fonticon

# Specify C compiler
#OPT += --cc clang           # clang or gcc or zig cc ?

# Set cache folder
NELUA_CACHE = .neluacache
OPT += --cache-dir $(NELUA_CACHE)

# C includes
C_INCS += -I$(CIMGUI_DIR) \
				 	-I$(IMGUI_DIR)  \
					-I$(UTILS_DIR)  \
					-I$(FONTICON_DIR)

ifeq ($(OS),Windows_NT)
	API_PREFIX = -DIMGUI_IMPL_API="extern \"C\" __declspec(dllexport)"
else
	API_PREFIX = -DIMGUI_IMPL_API="extern \"C\""
endif

CFLAGS += $(C_INCS) \
          $(API_PREFIX) \
          -MMD -MP


NELUA_CFLAGS += --cflags="-O2           \
				 	      -Wl,-s                  \
					      -I$(IMGUI_DIR)/backends \
				 	      -I$(IMGUI_DIR)          \
				 	      -I$(CIMGUI_DIR)         \
                $(HIDE_CONSOLE)         \
					      "
C_OBJS        += $(BUILD_DIR)/tentativeCode.o \
                 $(BUILD_DIR)/setupFonts.o
LINUX_LIB_DIR = /usr/lib/x86_64-linux-gnu
NELUA_LDFLAGS += --ldflags="-L$(LINUX_LIB_DIR)  -L$(BUILD_DIR) $(BACKENDS_OBJS) $(C_OBJS) $(RES) $(STATIC_OPT) -lcimgui -lstdc++ $(IMM32LIB) "

OPT += $(NELUA_CFLAGS)
OPT += $(NELUA_LDFLAGS)

# Nelua libs dir
OPT += -L $(LIBS_DIR)/nelua/glfw   \
       -L $(LIBS_DIR)/nelua/imgui  \
       -L $(LIBS_DIR)/nelua/stb    \
       -L $(LIBS_DIR)/nelua/sdl2   \
       -L ../utils/fonticon        \
       -L ../utils

VPATH = $(CIMGUI_DIR)          \
				:$(IMGUI_DIR)          \
				:$(IMGUI_DIR)/backends \
	      :$(UTILS_DIR)

# ImGui / CImGui objs
OBJS =  $(BUILD_DIR)/cimgui.o
OBJS += $(BUILD_DIR)/imgui.o
OBJS += $(BUILD_DIR)/imgui_draw.o
OBJS += $(BUILD_DIR)/imgui_demo.o
OBJS += $(BUILD_DIR)/imgui_tables.o
OBJS += $(BUILD_DIR)/imgui_widgets.o
AR := ar -rc

CPPOPT += -O2 -fno-exceptions -fno-rtti
CPPOPT += $(API_PREFIX)
CPPOPT += -I$(IMGUI_DIR)/backends -I$(IMGUI_DIR)
CPPOPT += -DIMGUI_ENABLE_WIN32_DEFAULT_IME_FUNCTIONS
CPPOPT += -DImDrawIdx="unsigned int"

DEPS_NELUA += $(wildcard $(UTILS_DIR)/*.nlua )

DEPS_ALL += $(TARGET).nelua \
						$(DEPS_NELUA) \
						$(BUILD_DIR)/libcimgui.a \
					 	$(BACKENDS_OBJS) \
						$(C_OBJS) \
						Makefile \
						$(LIBS_DIR)/nelua/imgui/imgui.nelua


all: ver  $(BUILD_DIR) $(TARGET)$(EXE)

ver:
	@nelua -v

$(TARGET)$(EXE): $(DEPS_ALL)
	nelua  $(OPT) -o $@ $<
	@strip $(TARGET)$(EXE)
	@ls -lks $(TARGET)$(EXE)

$(BUILD_DIR):
	@-mkdir -p $@

$(BUILD_DIR)/libcimgui.a:$(OBJS) Makefile
	@echo Generated: $(BUILD_DIR)/libcimgui.a
	@$(AR) $@ $(OBJS)

$(BUILD_DIR)/%.o:%.c Makefile
	@echo [$(CC) ] $<
	@$(CC) -c -O2 $(CFLAGS) -o $@ $<

$(BUILD_DIR)/%.o:%.cpp Makefile
	@echo [$(CXX)]  $<
	@$(CXX) -c -O2 $(CPPOPT) -o $@ $<

PHONY: run clean r upx dupx

run: all
	./$(TARGET)$(EXE)

r: run

clean:
	@-rm -f $(TARGET)$(EXE)
	@-rm -fr $(NELUA_CACHE) $(BUILD_DIR)

upx:
	upx --lzma $(TARGET)$(EXE)
dupx:
	upx -d $(TARGET)$(EXE)

-include $(BUILD_DIR)/*.d
