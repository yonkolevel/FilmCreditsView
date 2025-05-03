// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FilmCreditsView",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "FilmCreditsView",
            targets: ["FilmCreditsView"]
        ),
        .executable(
            name: "FilmCreditsViewPreview",
            targets: ["FilmCreditsViewPreview"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FilmCreditsView",
            dependencies: [],
            resources: [.process("Resources")]
        ),
        .executableTarget(
            name: "FilmCreditsViewPreview",
            dependencies: ["FilmCreditsView"],
            path: "Sources/FilmCreditsViewPreview"
        ),
        .testTarget(
            name: "FilmCreditsViewTests",
            dependencies: ["FilmCreditsView"]
        ),
    ]
)
