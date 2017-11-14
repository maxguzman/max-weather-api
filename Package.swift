// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "max-weather-api",
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-CURL.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "max-weather-api",
            dependencies: ["PerfectHTTPServer","PerfectCURL"]),
    ]
)
