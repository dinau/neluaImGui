#include <float.h>
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <stdbool.h>

#define CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"
//#include "utils.h"
#include "setupFonts.h"

#define ImGui_GetIO igGetIO

const char* IconFontPath = "../utils/fonticon/fa6/fa-solid-900.ttf";
char sBufFontPath[2048];

/*-------------
 * existFile()
 * -----------*/
bool existsFile(const char* path) {
  FILE* fp = fopen(path, "r");
  if (fp == NULL) return false;
  fclose(fp);
  return true;
}

/*-----------------
 * getFontPath()
 *----------------*/
const char* WinJpFontName   = "meiryo.ttc";

char* getWinFontPath(char* sBuf, int bufSize, const char* fontName) {
  char* sWinDir = getenv("windir");
  if (sWinDir == NULL) return NULL;
  snprintf(sBuf, bufSize, "%s\\Fonts\\%s", sWinDir, fontName);
  return sBuf;
}
/*--------------------
 * getLinuxFontPath()
 *------------------*/
// For Linux Mint 22 (Ubuntu/Debian family ok ?)
#define MAX_FONT_NAME  100
char LinuxFontNameTbl[][MAX_FONT_NAME] = {
                            "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc"          // JP
                           ,"/usr/share/fonts/opentype/ipafont-gothic/ipag.ttf"               // Debian
                           ,"/usr/share/fonts/opentype/ipafont-gothic/ipam.ttf"               // Debian
                           ,"/usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf" // Linux Mint English
                           };

/*------------
 * point2px()
 *-----------*/
float point2px(float point) { //## Convert point to pixel
  return (point * 96) / 72;
}

const ImWchar ranges_icon_fonts[]  = {(ImWchar)ICON_MIN_FA, (ImWchar)ICON_MAX_FA, (ImWchar)0};
/*--------------
 * setupFonts()
 *-------------*/
void setupFonts(void) {
  ImGuiIO* pio = ImGui_GetIO();
  ImFontConfig* config  = ImFontConfig_ImFontConfig();
  ImFont* font = NULL;
  char* fontPath = getWinFontPath(sBufFontPath, sizeof(sBufFontPath), WinJpFontName);
  if (existsFile(fontPath)) {
      printf("Found JpFontPath: [%s]\n",fontPath);
      font = ImFontAtlas_AddFontFromFileTTF(pio->Fonts, fontPath, point2px(14.5)
                                    , config
                                    , ImFontAtlas_GetGlyphRangesJapanese(pio->Fonts));
  }else{
    int tableLen = sizeof(LinuxFontNameTbl) / MAX_FONT_NAME;
    for(int i=0; i<tableLen; i++){
      fontPath = LinuxFontNameTbl[i];
      if (existsFile(fontPath)) {
        font = ImFontAtlas_AddFontFromFileTTF(pio->Fonts, fontPath, point2px(13)
            , config
            , ImFontAtlas_GetGlyphRangesJapanese(pio->Fonts));
        printf("Found FontPath: [%s]\n",fontPath);
        break;
      }
    }
  }
  if (font == NULL) {
    printf("Error!: Not found FontPath: in %s\n", __FILE__);
    printf("Set default font.\n");
    ImFontAtlas_AddFontDefault(pio->Fonts, NULL);
  }
  // Merge IconFont
  config->MergeMode = true;
  ImFontAtlas_AddFontFromFileTTF(pio->Fonts, IconFontPath, point2px(11), config , ranges_icon_fonts);
}
ImVec2 getMainViewport_WorkSize() {
  return igGetMainViewport()->WorkSize;
}
ImVec2 getIO_MousePos() {
  ImGuiIO* pio = ImGui_GetIO();
  return pio->MousePos;
}
