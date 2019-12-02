# Building FFmpeg

```
git clone https://github.com/move37-com/FFmpeg
cd FFmpeg

./configure --disable-shared --enable-static --enable-version3 --disable-postproc --disable-doc --disable-debug --disable-network --disable-programs --disable-autodetect --disable-protocols --disable-indevs --disable-outdevs --disable-parsers --disable-filters --disable-bsfs --disable-encoders --disable-decoders --disable-muxers --disable-demuxers --enable-protocol=file --enable-muxer=mov --enable-parser=h264 --enable-decoder=h264 --enable-bsf=extract_extradata 
make -j3

cp libavcodec/avcodec.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavcodec/
cp libavcodec/version.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavcodec/

cp libavdevice/avdevice.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavdevice/
cp libavdevice/version.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavdevice/

cp libavfilter/avfilter.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavfilter/
cp libavfilter/buffersink.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavfilter/
cp libavfilter/buffersrc.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavfilter/
cp libavfilter/version.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavfilter/

cp libavformat/avformat.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavformat/
cp libavformat/avio.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavformat/
cp libavformat/version.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavformat/

cp libavutil/attributes.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/avconfig.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/avutil.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/buffer.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/channel_layout.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/common.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/cpu.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/dict.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/error.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/file.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/frame.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/hwcontext.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/imgutils.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/intfloat.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/log.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/macros.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/mathematics.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/md5.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/mem.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/opt.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/rational.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/timestamp.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/pixdesc.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/pixfmt.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/samplefmt.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/
cp libavutil/version.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libavutil/

cp libswresample/swresample.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libswresample/
cp libswresample/version.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libswresample/

cp libswscale/swscale.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libswscale/
cp libswscale/version.h ../SwiftFFmpeg/Sources/CFFmpeg/include/libswscale/

cp libavcodec/libavcodec.a ../SwiftFFmpeg/Sources/CFFmpeg/lib/
cp libavdevice/libavdevice.a ../SwiftFFmpeg/Sources/CFFmpeg/lib/
cp libavfilter/libavfilter.a ../SwiftFFmpeg/Sources/CFFmpeg/lib/
cp libavformat/libavformat.a ../SwiftFFmpeg/Sources/CFFmpeg/lib/
cp libavutil/libavutil.a ../SwiftFFmpeg/Sources/CFFmpeg/lib/
cp libswresample/libswresample.a ../SwiftFFmpeg/Sources/CFFmpeg/lib/
cp libswscale/libswscale.a ../SwiftFFmpeg/Sources/CFFmpeg/lib/
```

Ignore warnings when building this package of the form:

`ld: warning: building for macOS, but linking in object file (Sources/CFFmpeg/lib/libswscale.a(input.o)) built for free standing`

These need a fix in the assembler used for FFmpeg:

https://github.com/yasm/yasm/issues/141

