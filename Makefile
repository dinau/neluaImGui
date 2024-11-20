# All examples will be built at a time.
#
EXAMPLE_DIRS := \
							examples/glfw_opengl3 \
							examples/iconFontViewer \
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
