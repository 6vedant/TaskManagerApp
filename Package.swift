// swift-tools-version:5.8

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "TaskManagementApp",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "TaskManagementApp",
            type: .static,
            targets: [
                "TaskManagementApp"
            ]
        )
    ],
    dependencies: [
       .package(url: "https://github.com/6vedant/TaskManagementSDK.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "TaskManagementApp",
            dependencies: [
            	 .product(name: "TaskManagementSDK", package: "TaskManagementSDK"),
            ],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)