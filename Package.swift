// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftFFmpeg",
  platforms: [.iOS(.v9), .macOS(.v10_10), .tvOS(.v10)],
  products: [
    .library(
      name: "SwiftFFmpeg",
      targets: ["SwiftFFmpeg"]
    )
  ],
  targets: [
    .target(
      name: "SwiftFFmpeg",
      dependencies: ["CFFmpeg"]
    ),
    .target(
      name: "CFFmpeg",
      dependencies: [
        "libavcodec",
        "libavdevice",
        "libavfilter",
        "libavformat",
        "libavutil",
        "libswresample",
        "libswscale",
      ],
      linkerSettings: [
        .linkedLibrary("z"),
        .linkedLibrary("bz2"),
        .linkedLibrary("iconv"),
        .linkedLibrary("lzma"),
        .linkedFramework("Security"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreVideo"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("VideoToolbox"),
        .linkedFramework("OpenGL"),
        .linkedFramework("CoreImage"),
        .linkedFramework("AppKit"),
      ]
    ),
    .binaryTarget(
      name: "libavcodec",
      url: "https://github.com/move37-com/SwiftFFmpeg/blob/xcode12/xcframework/libavcodec.zip?raw=true",
      checksum: "18de8a06cb8e6ec35a387cba074618e911314c13264edbd65e01042add6218af"
    ),
    .binaryTarget(
      name: "libavdevice",
      url:
        "https://github.com/move37-com/SwiftFFmpeg/blob/xcode12/xcframework/libavdevice.zip?raw=true",
      checksum: "2af42e4df49fb3ca4bf89304371f21dc615b114eea8603180f77191f39806c66"
    ),
    .binaryTarget(
      name: "libavfilter",
      url:
        "https://github.com/move37-com/SwiftFFmpeg/blob/xcode12/xcframework/libavfilter.zip?raw=true",
      checksum: "701a05b1a70c17403656767eff4430c2f803d7328f949b37f932dcb04f6184d6"
    ),
    .binaryTarget(
      name: "libavformat",
      url:
        "https://github.com/move37-com/SwiftFFmpeg/blob/xcode12/xcframework/libavformat.zip?raw=true",
      checksum: "74ac041f470efc47513c3c2ac09d81206ef2de387670552031ec741ab983260a"
    ),
    .binaryTarget(
      name: "libavutil",
      url: "https://github.com/move37-com/SwiftFFmpeg/blob/xcode12/xcframework/libavutil.zip?raw=true",
      checksum: "f334e32212556930ece1398dcda06765e2b65c28ef2335152731e4e01d6a53f3"
    ),
    .binaryTarget(
      name: "libswresample",
      url:
        "https://github.com/move37-com/SwiftFFmpeg/blob/xcode12/xcframework/libswresample.zip?raw=true",
      checksum: "d3662131f0270b512d370a8da93b173c00dc69632a8f0ed98dcb4d61fe11f3f7"
    ),
    .binaryTarget(
      name: "libswscale",
      url: "https://github.com/move37-com/SwiftFFmpeg/blob/xcode12/xcframework/libswscale.zip?raw=true",
      checksum: "69b2f524a8587111c5a9aa9e0ce0baa7ddf55973b4b3f5a4e15bec846d7094b5"
    ),
    .target(
      name: "SwiftFFmpegExamples",
      dependencies: ["SwiftFFmpeg"]
    ),
    .testTarget(
      name: "SwiftFFmpegTests",
      dependencies: ["SwiftFFmpeg"]
    ),
  ]
)
