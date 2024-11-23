<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [NeluaImGui](#neluaimgui)
  - [Prerequisites](#prerequisites)
  - [Build and run](#build-and-run)
  - [Examples](#examples)
    - [glfw_opengl3, sdl2_opengl3](#glfw_opengl3-sdl2_opengl3)
    - [iconFontViewer](#iconfontviewer)
  - [SDL2 / GLFW / STB headers for Nelua](#sdl2--glfw--stb-headers-for-nelua)
  - [My tools version](#my-tools-version)
  - [History](#history)
  - [Other project](#other-project)
  - [SDL Game tutorial Platfromer project](#sdl-game-tutorial-platfromer-project)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### NeluaImGui

ImGui / CImGui with NeLua language

My experiment project for NeLua and ImGui / CImGui libraries.

Now work in progress.

#### Prerequisites

---

- Install [MSys2/MinGW](https://www.msys2.org/) 
- Install [NeLua](https://nelua.io/installing/)
- Windows OS 10 or later
   1. Install libraries
   
      ```sh
      pacman -S mingw-w64-x86_64-{glfw,pkgconf,SDL2,SDL2_image}
      ```
   
   1. Other tools
   
      ```sh
      pacman -S make
      ```

- Linux mint 22 ( or Ubuntu / Debian families ?)  
   1. Install libraries

      ```sh
      $ sudo apt install xorg-dev libopengl-dev libgl1-mesa-dev
      ```

      and for glfw3 and sdl2,

      ```sh
      $ sudo apt install libglfw3 libglfw3-dev
      $ sudo apt install libsdl2-dev
      ```

#### Build and run

---

1. Download this project.

   ```sh
   git clone --recurse-submodules https://github.com/dinau/neluaImGui
   ```
1. Go to one of the examples folder,

   ```sh
   cd neluaImGui/examples/glfw_opengl3
   ```

1. Build and run 

   ```sh
   make run 
   ```

####  Examples

---

##### glfw_opengl3, sdl2_opengl3

1. Icon fonts
1. Image loader
1. Image saving [jpg, bmp, png, tga]
1. Magnifying glass  
1. glfw_opengl3: Static link [^dllWindows]
1. sdl2_opengl3: Dynamic link

   ![glfw_opengl3.png](https://github.com/dinau/neluaImGui/raw/main/img/glfw_opengl3.png)

##### iconFontViewer 

1. Icon fonts
1. Magnifying glass  
1. Static link [^dllWindows]

   ![iconFontViewer.png](https://github.com/dinau/neluaImGui/raw/main/img/iconFontViewer.png)

[^dllWindows]: Only Windows executables (without .dll dependencies)


#### SDL2 / GLFW / STB headers for Nelua

---

These header files [libs/nelua/glfw](libs/nelua/glfw), [libs/nelua/sdl2](libs/nelua/sdl2), [libs/nelua/stb](libs/nelua/stb) have thankfully been copied form [nelua-decl libraries project](https://github.com/edubart/nelua-decl).

#### My tools version

---

- Nelua-0.2.0-dev
- Gcc.exe (Rev1, Built by MSYS2 project) 14.2.0)
- Git version 2.46.0.windows.1
- Make: GNU Make 4.4.1

#### History

---

- Started project at 2024/11 from NeLua-0.2.0-dev : ImGui/CImGui 1.91.4

#### Other ImGui / CImGui project

---

| Language             |          | Project                                                                                                                                         |
| -------------------: | :---:    | :----------------------------------------------------------------:                                                                              |
| **Nim**              | Compiler | [ImGuin](https://github.com/dinau/imguin), [Nimgl_test](https://github.com/dinau/nimgl_test), [Nim_implot](https://github.com/dinau/nim_implot) |
| **Lua**              | Script   | [LuaJITImGui](https://github.com/dinau/luajitImGui)                                                                                             |
| **Zig**, C lang.     | Compiler | [Dear_Bindings_Build](https://github.com/dinau/dear_bindings_build)                                                                             |
| **Zig**              | Compiler | [ImGuinZ](https://github.com/dinau/imguinz)                                                                                                     |
| **NeLua**            | Compiler | [NeLuaImGui](https://github.com/dinau/neluaImGui)                                                                                               |
| **Python**           | Script   | [DearPyGui for 32bit WindowsOS Binary](https://github.com/dinau/DearPyGui32/tree/win32)                                                         |

#### SDL game tutorial Platfromer project

---

![ald](https://github.com/dinau/nelua-platformer/raw/main/img/game.png)

| Language             |          | Project                                                            |
| -------------------: | :---:    | :----------------------------------------------------------------: |
| **Nim**              | Compiler | [Nim-Platformer](https://github.com/dinau/nim-platformer)          |
| **LuaJIT**           | Script   | [LuaJIT-Platformer](https://github.com/dinau/luajit-platformer)    |
| **Nelua**            | Compiler | [NeLua-Platformer](https://github.com/dinau/nelua-platformer)      |
