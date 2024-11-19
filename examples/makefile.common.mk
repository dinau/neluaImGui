TARGET = $(notdir $(CURDIR))

ifeq ($(DEBUG_BUILD),true)
	#
else
	OPT += -r  # Release compilation: faster speed, no runtime checking
endif

ifeq ($(OS),Windows_NT)
	EXE = .exe
endif

ifneq ($(SHOW_CONSOLE),true)
	HIDE_CONSOLE = -mwindows
endif

OPT += --no-cache


BUILD_DIR    = .build
LIBS_DIR     = ../../libs
CIMGUI_DIR   = $(LIBS_DIR)/cimgui
IMGUI_DIR    = $(LIBS_DIR)/cimgui/imgui
UTILS_DIR    = ../utils
FONTICON_DIR = $(UTILS_DIR)/fonticon

# Specify C compiler
#OPT += --cc clang           # clang or tcc

# Set cache folder
NELUA_CACHE = .neluacache
OPT += --cache-dir $(NELUA_CACHE)

# C includes
C_INCS += -I$(CIMGUI_DIR) \
				 	-I$(IMGUI_DIR)  \
					-I$(UTILS_DIR)  \
					-I$(FONTICON_DIR)

CFLAGS += $(C_INCS) \
          -DIMGUI_IMPL_API="extern \"C\" __declspec(dllexport)" \
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

RES += res/imguin64.res
LDFLAGS += --ldflags="-static -L$(BUILD_DIR) $(BACKENDS_OBJS) $(C_OBJS)  $(RES) -lcimgui -lstdc++ -limm32"

OPT += $(NELUA_CFLAGS)
OPT += $(LDFLAGS)
# Nelua libs dir
OPT += -L $(LIBS_DIR)/nelua/glfw  \
       -L $(LIBS_DIR)/nelua/imgui \
       -L $(LIBS_DIR)/nelua/stb   \
       -L ../utils/fontIcon       \
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
CPPOPT += -DIMGUI_ENABLE_WIN32_DEFAULT_IME_FUNCTIONS
CPPOPT += -DImDrawIdx="unsigned int"

all: $(BUILD_DIR) $(TARGET)$(EXE)

DEPS_ALL += $(TARGET).nelua \
						$(DEP_NELUA) \
						$(BUILD_DIR)/libcimgui.a \
					 	$(BACKENDS_OBJS) \
						$(C_OBJS) \
						Makefile \
						$(LIBS_DIR)/nelua/imgui/imgui.nelua

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
	@echo $<
	@$(CC) -c -O2 $(CFLAGS) -o $@ $<

$(BUILD_DIR)/%.o:%.cpp Makefile
	@echo $<
	@$(CXX) -c -O2 $(CPPOPT) -o $@ $<

PHONY: run clean

run: all
	./$(TARGET)$(EXE)

r: run

clean:
	@-rm -f *$(EXE)
	@-rm -fr $(NELUA_CACHE) $(BUILD_DIR)


-include $(BUILD_DIR)/*.d
