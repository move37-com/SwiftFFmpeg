#!/bin/bash

ARCH=`uname -m`

echo "building ${ARCH}"

mkdir $ARCH
cd $ARCH

../configure \
  --prefix=../../output/$ARCH \
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
  --extra-cflags="-fno-stack-check" \
  --disable-debug

make -j8 install
