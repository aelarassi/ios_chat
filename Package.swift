// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Chatbot",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Chatbot",
            targets: ["Chatbot"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "Chatbot",
            path: "Build/Chatbot.xcframework.zip"
        )
    ]
)