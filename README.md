### neluaImGui

ImGui / CImGui wrapper for NeLua language

My experiment project for NeLua and ImGui / CImGui libraries.

Now work in progress.


### Prerequisites

---
1. Winodws OS 10 or later
1. Install [MSys2/MinGW](https://www.msys2.org/) 
1. Install [NeLua](https://nelua.io/installing/)
1. Install libraries

   ```sh
   pacman -S mingw-w64-x86_64-glfw 
   ```

1. Other tools

   ```sh
   pacman -S make
   ```

### Build and run

---

1. Download this project.

   ```sh
   git clone --recurse-submodules https://github.com/dinau/neluaImGui
   ```
1. Go to one of the examples folder,

   ```sh
   cd neluaImGui/examples/glfw_opengl3
   ```

1. Build and Run 

   ```sh
   make run 
   ```

   ![glfw_opengl3.png](img/glfw_opengl3.png)
