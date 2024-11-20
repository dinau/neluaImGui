# windres.exe is included bintuils package
# pacman -S mingw-w64-ucrt-x86_64-binutils

RC_NAME = nelua

all: res

#png:
#	pip install qrcode
#	qr https://github.com/dinau/$(RC_NAME) > img/$(RC_NAME).png


res:
	#png2ico  img/$(RC_NAME).ico ../icon.png
	windres -O coff $(RC_NAME).rc -o $(RC_NAME)32.res
	windres -O coff $(RC_NAME).rc -o $(RC_NAME)64.res
