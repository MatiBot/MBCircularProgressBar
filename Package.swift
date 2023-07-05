// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MBCircularProgressBar",
    products: [
        .library(name: "MBCircularProgressBar", targets: ["CircularProgressBar"])
    ],
    targets: [
        .target(
            name: "CircularProgressBar",
            path: "Sources",
            exclude: ["Example"]
        ),
    ]
)
