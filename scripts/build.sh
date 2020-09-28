#!/bin/bash

FFMPEG_VERSION=4.3-dev-m37
FFMPEG_SOURCE_DIR=FFmpeg-n$FFMPEG_VERSION
FFMPEG_LIBS="libavcodec libavdevice libavfilter libavformat libavutil libswresample libswscale"
PREFIX=`pwd`/output
ARCH="x86_64"

if [ ! -d $FFMPEG_SOURCE_DIR ]; then
  echo "Start downloading FFmpeg..."
  curl -LJO https://codeload.github.com/move37-com/FFmpeg/tar.gz/n$FFMPEG_VERSION || exit 1
  tar -zxvf FFmpeg-n$FFMPEG_VERSION.tar.gz || exit 1
  rm -f FFmpeg-n$FFMPEG_VERSION.tar.gz
fi

echo "Start compiling FFmpeg..."

rm -rf $PREFIX
cd $FFMPEG_SOURCE_DIR

./configure \
  --prefix=$PREFIX \
  --disable-x86asm \
  --disable-shared \
  --enable-static \
  --disable-postproc \
  --disable-network \
  --disable-autodetect \
  --disable-protocols \
  --disable-indevs \
  --disable-outdevs \
  --disable-parsers \
  --disable-filters \
  --disable-bsfs \
  --disable-encoders \
  --disable-decoders \
  --disable-muxers \
  --disable-demuxers \
  --enable-protocol=file \
  --enable-muxer=mov \
  --enable-demuxer=mov \
  --enable-parser=h264 \
  --enable-parser=hevc \
  --enable-decoder=hevc \
  --enable-decoder=h264 \
  --enable-bsf=extract_extradata \
  --disable-programs \
  --disable-doc \
  --arch=$ARCH \
  --extra-cflags="-fno-stack-check" \
  --disable-debug || exit 1

make clean
make -j8 install || exit 1

cd ..

for LIB in $FFMPEG_LIBS; do
  ./build_framework.sh $PREFIX $LIB $FFMPEG_VERSION || exit 1
done

echo "The compilation of FFmpeg is completed."
