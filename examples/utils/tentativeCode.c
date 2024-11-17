#define CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"

float getFramerate(void) {

  ImGuiIO *io = igGetIO();
  return io->Framerate;

}
