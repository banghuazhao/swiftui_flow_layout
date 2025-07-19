// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwiftUIFlowLayout",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftUIFlowLayout",
            targets: ["SwiftUIFlowLayout"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUIFlowLayout",
            dependencies: [],
            path: "Sources/SwiftUIFlowLayout"
        ),
        .testTarget(
            name: "SwiftUIFlowLayoutTests",
            dependencies: ["SwiftUIFlowLayout"],
            path: "Tests/SwiftUIFlowLayoutTests"
        ),
    ]
) 