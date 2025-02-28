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
            url: "https://github.com/aelarassi/ios_chat/releases/download/1.1.4/Chatbot.xcframework.zip",
            checksum: "55e98b3a9ce5400d90ddc01285ffd90d7d0d6d5333aeee2a2b3291010379f90e"
        )
    ]
)