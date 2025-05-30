# All examples will be built at a time.
#
EXAMPLE_DIRS := \
							glfw_opengl3 \
							glfw_opengl3_jp \
							iconFontViewer \
							imColorTextEditDemo \
							imFileDialogDemo \
							imGuiToggleDemo \
							imGuizmoDemo \
							imKnobsDemo \
							imNodesDemo \
							imPlot3DDemo \
							imPlotDemo \
							imSpinnerDemo \
							sdl2_opengl3

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
	@echo --------------------
	@echo --- Enter: examples/$(1) $(2)
	@echo --------------------
	@$(MAKE) -C  examples/$(1) $(2)

endef

MAKEFLAGS += --no-print-directory

#-----------------------------------
# Generate libs/nelua/imgui/*.nelua
#-----------------------------------
CFLAGS += -Ilibs/cimgui
OPT += --cflags="$(CFLAGS)"
ORG_H = libs/CImGuiFileDialog/libs/ImGuiFileDialog/ImGuiFileDialog.h
TMP_H = tmp.h
SAVE_H = ImGuiFileDialog.h.org
NELUA_IMGUI_DIR = libs/nelua/imgui
gen:
	@cp -f $(ORG_H) $(SAVE_H)
	@(echo "#include \"cimgui.h\"" > $(TMP_H); cat $(ORG_H) >> $(TMP_H); mv -f $(TMP_H) $(ORG_H) )
	@nelua $(OPT) genLibsBind.nelua
	@mv -f $(SAVE_H) $(ORG_H)

genimplot:
	@echo Generated [$(NELUA_IMGUI_DIR)/imPlotFuncs.nelua]
	@-(cd $(NELUA_IMGUI_DIR); ruby genImPlotFuncs.rb)
