// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftFFmpeg",
  platforms: [.iOS(.v9), .macOS(.v10_15), .tvOS(.v10)],
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
      ]
    ),
    .binaryTarget(
      name: "libavcodec",
      url: "https://raw.githubusercontent.com/move37-com/SwiftFFmpeg/sidedataicc-xcode12-thies/xcframework/libavcodec.xcframework.zip",
      checksum: "0970be267ddb98fa8dac4d673c71079c050749b06bb82b02a5a080961d4658de"
    ),
    .binaryTarget(
      name: "libavdevice",
      url: "https://raw.githubusercontent.com/move37-com/SwiftFFmpeg/sidedataicc-xcode12-thies/xcframework/libavdevice.xcframework.zip",
      checksum: "fb46aa3042140e5897e2589a5f2af56c1e021df18dd771b3a0d6768deb200478"
    ),
    .binaryTarget(
      name: "libavfilter",
      url: "https://raw.githubusercontent.com/move37-com/SwiftFFmpeg/sidedataicc-xcode12-thies/xcframework/libavfilter.xcframework.zip",
      checksum: "6ae6e302dfa3a4d5d17bf9ab5b239fc2289593ddcafa33523866eddc414ff5ca"
    ),
    .binaryTarget(
      name: "libavformat",
      url: "https://raw.githubusercontent.com/move37-com/SwiftFFmpeg/sidedataicc-xcode12-thies/xcframework/libavformat.xcframework.zip",
      checksum: "0e987fcb7f9e3ac9964f5110b3f5d347f251da8d8c3c71e43f5539217e3eee93"
    ),
    .binaryTarget(
      name: "libavutil",
      url: "https://raw.githubusercontent.com/move37-com/SwiftFFmpeg/sidedataicc-xcode12-thies/xcframework/libavutil.xcframework.zip",
      checksum: "cec6fe1b87a741de0c1abf21033d84fbef34f149ddf3e5b4e1b805c055ec82e9"
    ),
    .binaryTarget(
      name: "libswresample",
      url: "https://raw.githubusercontent.com/move37-com/SwiftFFmpeg/sidedataicc-xcode12-thies/xcframework/libswresample.xcframework.zip",
      checksum: "c2eeacfd47db13424185add3c0c49cf6fb5343c2d68827a0bffce59a3e988d21"
    ),
    .binaryTarget(
      name: "libswscale",
      url: "https://raw.githubusercontent.com/move37-com/SwiftFFmpeg/sidedataicc-xcode12-thies/xcframework/libswscale.xcframework.zip",
      checksum: "115b8849734fbb2d789d3015dabf1132aa91aa8c917f36aa163d00c66c1e6ca0"
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
