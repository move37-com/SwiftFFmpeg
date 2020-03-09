// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFFmpeg",
    products: [
        .library(
            name: "SwiftFFmpeg",
            type: .dynamic,
            targets: ["SwiftFFmpeg"]
        )
    ],
    targets: [
        .target(
            name: "CFFmpeg",
            dependencies: [],
            linkerSettings: [
                LinkerSetting.unsafeFlags(["-Llibs/ffmpeg"])
            ]
        ),
        .target(
            name: "SwiftFFmpeg",
            dependencies: ["CFFmpeg"]
        ),
        .target(
            name: "SwiftFFmpegExamples",
            dependencies: ["SwiftFFmpeg"],
            path: "Sources/Examples"
        ),
        .testTarget(
            name: "SwiftFFmpegTests",
            dependencies: ["SwiftFFmpeg"]
        )
    ]
)
