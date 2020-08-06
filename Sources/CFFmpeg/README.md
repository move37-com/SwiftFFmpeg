# Building FFmpeg

See the following:

* https://forums.swift.org/t/is-swiftpm-support-c-language-link-custom-build-static-library-inside-targets/21614
* https://forums.swift.org/t/packaging-a-static-c-libraries-in-swift-package-manager/28323/2
* https://github.com/FranzBusch/swift-evolution/blob/baf4f09dac450c91ece59dee45b1288b18e02ba5/proposals/0000-swiftpm-binary-dependencies.md
* https://forums.swift.org/t/se-0272-package-manager-binary-dependencies/30753
* https://forums.swift.org/t/binary-frameworks-with-swiftpm/26225

```
git clone https://github.com/move37-com/FFmpeg
cd FFmpeg

./configure --disable-shared --enable-static --disable-postproc --disable-doc --disable-debug --disable-network --disable-programs --disable-autodetect --disable-protocols --disable-indevs --disable-outdevs --disable-parsers --disable-filters --disable-bsfs --disable-encoders --disable-decoders --disable-muxers --disable-demuxers --enable-protocol=file --enable-muxer=mov --enable-parser=h264 --enable-decoder=hevc --enable-parser=hevc --enable-decoder=h264 --enable-bsf=extract_extradata --extra-cflags="-fno-stack-check"
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

cp libavcodec/libavcodec.a ../SwiftFFmpeg/libs/ffmpeg/
cp libavdevice/libavdevice.a ../SwiftFFmpeg/libs/ffmpeg/
cp libavfilter/libavfilter.a ../SwiftFFmpeg/libs/ffmpeg/
cp libavformat/libavformat.a ../SwiftFFmpeg/libs/ffmpeg/
cp libavutil/libavutil.a ../SwiftFFmpeg/libs/ffmpeg/
cp libswresample/libswresample.a ../SwiftFFmpeg/libs/ffmpeg/
cp libswscale/libswscale.a ../SwiftFFmpeg/libs/ffmpeg/
```

Ignore warnings when building this package of the form:

`ld: warning: building for macOS, but linking in object file (Sources/CFFmpeg/lib/libswscale.a(input.o)) built for free standing`

These need a fix in the assembler used for FFmpeg:

https://github.com/yasm/yasm/issues/141

# TODO for Xcode12 

We should build this as a FrameWork with shared-libraries see

* https://github.com/videovillage/FFmpeg/blob/build-for-screen/build-for-screen/build-for-screen
* https://github.com/sunlubo/SwiftFFmpeg/pull/41
