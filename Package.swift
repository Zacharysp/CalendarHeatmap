// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CalendarHeatmap",
    platforms: [.iOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "CalendarHeatmap",
            targets: ["CalendarHeatmap"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CalendarHeatmap",
            dependencies: [],
            path: "CalendarHeatmap"),
    ]
)
