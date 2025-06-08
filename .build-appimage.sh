#!/bin/sh


TOOL=appimagetool.AppImage
wget -q https://github.com/probonopd/go-appimage/releases/expanded_assets/continuous -O - \
	| grep "appimagetool-.*-$(uname -m).AppImage" \
	| head -n 1 \
	| cut -d '"' -f 2 \
	| xargs -I url wget "https://github.com/url" -O "$TOOL"
chmod +x "$TOOL"

# Prepare appdir
set -e
mkdir -p appdir/usr/share/applications/icons/hicolor/128x128/apps
cp misc/unix/grafx2.desktop appdir/usr/share/applications/
mkdir -p appdir/usr/share/metainfo
cp misc/unix/eu.grafx2.grafx2.metainfo.xml appdir/usr/share/metainfo/eu.grafx2.grafx2.metainfo.xml
convert share/icons/grafx2.svg -resize 128x128 appdir/usr/share/applications/icons/hicolor/128x128/apps/grafx2.png
cp appdir/usr/share/applications/icons/hicolor/128x128/apps/grafx2.png appdir/grafx2.png
( cd appdir/usr ; unzip -o ../../grafx2-sdl2-*-Linux.zip )
( cd appdir/usr/bin ; ln -s grafx2-sdl2 grafx2 )

# Build AppImage
export VERSION=$(cat VERSION)
export APPIMAGE_EXTRACT_AND_RUN=1
./${TOOL} deploy appdir/usr/share/applications/*.desktop
./${TOOL} appdir

