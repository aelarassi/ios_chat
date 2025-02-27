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
            url: "https://github.com/aelarassi/ios_chat/releases/download/1.1.2/Chatbot.xcframework.zip",
            checksum: "749d7747988eea59a89ac351efe2899ec5aaace461184e99e7425f6c689f8c54"
        )
    ]
)