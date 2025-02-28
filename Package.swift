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
            url: "https://github.com/aelarassi/ios_chat/releases/download/1.1.3/Chatbot.xcframework.zip",
            checksum: "5b02353b3a8241b4f946ec42528ca4a43cacc24ab989626a6a7695fa2dc1fca2"
        )
    ]
)