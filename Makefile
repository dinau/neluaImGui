# All examples will be built at a time.
#
EXAMPLE_DIRS := \
							examples/glfw_opengl3 \
							examples/glfw_opengl3_jp \
							examples/iconFontViewer \
							examples/imColorTextEditDemo \
							examples/imFileDialogDemo \
							examples/imGuiToggleDemo \
							examples/imGuizmoDemo \
							examples/imKnobsDemo \
							examples/imNodesDemo \
							examples/imSpinnerDemo \
							examples/sdl2_opengl3

ifeq ($(OS),Windows_NT)
	#EXAMPLE_DIRS +=  examples/sdl3_opengl3
endif

all:
	@nelua --version
	@$(foreach exdir,$(EXAMPLE_DIRS), $(call def_make,$(exdir),$@))

.PHONY: clean

clean:
	@$(foreach exdir,$(EXAMPLE_DIRS), $(call def_make,$(exdir),clean))


#
define def_make
	@echo ====
	@echo ==== Enter: $(1) $(2)
	@echo ====
	@$(MAKE) -C  $(1) $(2)

endef

MAKEFLAGS += --no-print-directory

# Generate libs/nelua/imgui/cimgui.nelua
CFLAGS += -Ilibs/cimgui
OPT += --cflags="$(CFLAGS)"
gen:
	nelua $(OPT) genLibsBind.nelua
	@cat libs/nelua/imgui/cimgui_header.lua > tmp.nelua
	@cat libs/nelua/imgui/cimgui.nelua >> tmp.nelua
	@mv -f tmp.nelua libs/nelua/imgui/cimgui.nelua
	@rm -f tmp.nelua
