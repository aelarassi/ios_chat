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
            url: "https://github.com/aelarassi/ios_chat/releases/download/1.1.5/Chatbot.xcframework.zip",
            checksum: "d25c985342bd76b3ebae5164d7e85682f6ff6d5f46bdde2e2f4cddf77b10f0b7"
        )
    ]
)