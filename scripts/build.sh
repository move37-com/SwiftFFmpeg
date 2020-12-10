#!/bin/bash

FFMPEG_VERSION=4.3-dev-m37
FFMPEG_SOURCE_DIR=FFmpeg-n$FFMPEG_VERSION
FFMPEG_LIBS="libavcodec libavdevice libavfilter libavformat libavutil libswresample libswscale"
ARCHS="x86_64 arm64"

if [ ! -d $FFMPEG_SOURCE_DIR ]; then
  echo "Start downloading FFmpeg..."
  curl -LJO https://codeload.github.com/move37-com/FFmpeg/tar.gz/n$FFMPEG_VERSION || exit 1
  tar -zxf FFmpeg-n$FFMPEG_VERSION.tar.gz || exit 1
  rm -f FFmpeg-n$FFMPEG_VERSION.tar.gz
fi

#(
#cd $FFMPEG_SOURCE_DIR
#arch -x86_64 ../configure_and_compile.sh
#../configure_and_compile.sh
#)


DEST=output/macos-arm64_x86_64/lib

rm -rf $DEST
mkdir -p $DEST

for LIB in $FFMPEG_LIBS; do
        lipo -create -output $DEST/$LIB.a output/*/lib/$LIB.a
done

cp -pr output/arm64/include output/macos-arm64_x86_64/

for LIB in $FFMPEG_LIBS; do
        ./build_framework.sh output/macos-arm64_x86_64 $LIB 4.3-dev-m37
done

cd output/macos-arm64_x86_64/xcframework

for LIB in $FFMPEG_LIBS; do
	zip -r $LIB.xcframework.zip $LIB.xcframework
#	rm -rf $LIB.xcframework
	swift package compute-checksum $LIB.xcframework.zip > $LIB.xcframework.zip.checksum
done
