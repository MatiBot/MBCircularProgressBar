// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MBCircularProgressBar",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "MBCircularProgressBar", targets: ["MBCircularProgressBar"])
    ],
    targets: [
        .target(
            name: "MBCircularProgressBar",
            path: "Sources",
            exclude: ["Example"],
            publicHeadersPath: "."
        ),
    ]
)
