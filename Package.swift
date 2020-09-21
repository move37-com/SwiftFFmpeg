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
      path: "xcframework/libavcodec.xcframework"
    ),
    .binaryTarget(
      name: "libavdevice",
      path: "xcframework/libavdevice.xcframework"
    ),
    .binaryTarget(
      name: "libavfilter",
      path: "xcframework/libavfilter.xcframework"
    ),
    .binaryTarget(
      name: "libavformat",
      path: "xcframework/libavformat.xcframework"
    ),
    .binaryTarget(
      name: "libavutil",
      path: "xcframework/libavutil.xcframework"
    ),
    .binaryTarget(
      name: "libswresample",
      path: "xcframework/libswresample.xcframework"
    ),
    .binaryTarget(
      name: "libswscale",
      path: "xcframework/libswscale.xcframework"
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
