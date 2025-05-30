#include <float.h>
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <stdbool.h>

#define CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"
//#include "utils.h"
#include "setupFonts.h"

#define ImGui_GetIO igGetIO_Nil

const char* IconFontPath = "../utils/fonticon/fa6/fa-solid-900.ttf";
const ImWchar ranges_icon_fonts[]  = {(ImWchar)ICON_MIN_FA, (ImWchar)ICON_MAX_FA, (ImWchar)0};
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

#define MAX_FONT_NAME  100
/*-------------------
 * WindosFontNameTbl
 *-----------------*/
char WinFontNameTbl[][MAX_FONT_NAME]   = {
                                       "meiryo.ttc"   // JP
                                      ,"YuGothM.ttc"  // JP
                                      ,"segoeuil.ttf" // English
                                      };
/*------------------
 * LinuxFontNameTbl
 *----------------*/
// For Linux Mint 22 (Ubuntu/Debian family ok ?)
char LinuxFontNameTbl[][MAX_FONT_NAME] = {
                            "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc"          // JP
                           ,"/usr/share/fonts/opentype/ipafont-gothic/ipag.ttf"               // JP Debian
                           ,"/usr/share/fonts/opentype/ipafont-gothic/ipam.ttf"               // JP Debian
                           ,"/usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf" // English Linux Ubuntu
                           };
/*-----------------
 * getWinFontPath()
 *----------------*/
char* getWinFontPath(char* sBuf, int bufSize, const char* fontName) {
  char* sWinDir = getenv("windir");
  if (sWinDir == NULL) return NULL;
  snprintf(sBuf, bufSize, "%s\\Fonts\\%s", sWinDir, fontName);
  return sBuf;
}

/*------------
 * point2px()
 *-----------*/
float point2px(float point) { //## Convert point to pixel
  return (point * 96) / 72;
}

/*--------------
 * setupFonts()
 *-------------*/
void setupFonts(void) {
  ImGuiIO* pio = ImGui_GetIO();
  ImFontConfig* config  = ImFontConfig_ImFontConfig();
  ImFont* theFont = NULL;
  // For Windows
  int tableLen = sizeof(WinFontNameTbl) / MAX_FONT_NAME;
  for(int i=0; i<tableLen; i++){
    char *fontPath = getWinFontPath(sBufFontPath, sizeof(sBufFontPath), WinFontNameTbl[i]);
    if (existsFile(fontPath)) {
        printf("Found FontPath: [%s]\n",fontPath);
        theFont = ImFontAtlas_AddFontFromFileTTF(pio->Fonts, fontPath, point2px(14.5)
                                      , config
                                      , ImFontAtlas_GetGlyphRangesJapanese(pio->Fonts));
        break;
    }
  }
  // For Linux
  if(theFont == NULL){
    tableLen = sizeof(LinuxFontNameTbl) / MAX_FONT_NAME;
    for(int i=0; i<tableLen; i++){
      char *fontPath = LinuxFontNameTbl[i];
      if (existsFile(fontPath)) {
        theFont = ImFontAtlas_AddFontFromFileTTF(pio->Fonts, fontPath, point2px(13)
            , config
            , ImFontAtlas_GetGlyphRangesJapanese(pio->Fonts));
        printf("Found FontPath: [%s]\n",fontPath);
        break;
      }
    }
  }
  if (theFont == NULL) {
    printf("Error!: Not found all FontPath. in %s\n", __FILE__);
    printf("The default fixed font has been set.\n");
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
