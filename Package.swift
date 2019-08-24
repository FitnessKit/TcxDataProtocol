// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TcxDataProtocol",
    platforms: [.iOS("10.0"), .macOS("10.12"), .tvOS("10.0"), .watchOS("3.0")],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "TcxDataProtocol",
            targets: ["TcxDataProtocol"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/MaxDesiatov/XMLCoder", from: "0.8.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TcxDataProtocol",
            dependencies: [
                "XMLCoder",
            ]),
        .testTarget(
            name: "TcxDataProtocolTests",
            dependencies: ["TcxDataProtocol"]),
    ]
)
