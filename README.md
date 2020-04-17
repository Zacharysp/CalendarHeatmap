# Calendar Heatmap

![CalendarHeatmap Title](https://raw.githubusercontent.com/Zacharysp/CalendarHeatmap/master/Resources/CalendarHeatmap.png)

[![CI Status](https://api.travis-ci.com/Zacharysp/CalendarHeatmap.png?branch=master)](https://travis-ci.org/Zacharysp/CalendarHeatmap)
[![Version](https://img.shields.io/cocoapods/v/CalendarHeatmap.svg?style=flat)](https://cocoapods.org/pods/CalendarHeatmap)
[![License](https://img.shields.io/cocoapods/l/CalendarHeatmap.svg?style=flat)](https://cocoapods.org/pods/CalendarHeatmap)
[![Platform](https://img.shields.io/cocoapods/p/CalendarHeatmap.svg?style=flat)](https://cocoapods.org/pods/CalendarHeatmap)

![example](https://raw.githubusercontent.com/Zacharysp/CalendarHeatmap/master/Resources/example.png)

## Introduction

`CalendarHeatmap` is a calendar based heatmap which presenting a time series of data points in colors, inspired by Github contribution chart, and written in Swift.

## Installation

CalendarHeatmap is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CalendarHeatmap'
```

CalendarHeatmap is also availabel through Carthage, by adding it to your Cartfile:

```ruby
github "Zacharysp/CalendarHeatmap"
```

## Usage

```swift
// minimum usage.
let startDate = Date()
let calendarHeatmap = CalendarHeatmap(startDate: startDate)
calendarHeatmap.delegate = self
view.addSubview(calendarHeatmap)
```

```swift
// provide a range of date.
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd"
let startDate = formatter.date(from: "2019-10-18")
let endDate = formatter.date(from: "2020-02-14")
// default endDate is now.
let calendarHeatmap = CalendarHeatmap(startDate: startDate, endDate: endDate)
```

```swift
// you could custom the heatmap by using CalendarHeatmapConfig.
let config = CalendarHeatmapConfig()
let calendarHeatmap = CalendarHeatmap(config: config, startDate: Date())
```

```swift
// reload the heatmap
let calendarHeatmap = CalendarHeatmap(startDate: ...)
calendarHeatmap.reload()
// reload with new range of date.
calendarHeatmap.reload(newStartDate: ..., newEndDate: ...)
```

`CalendarHeatmapConfig` details.

| Config Key        |   Type   | Default                                                      |
| ----------------- | :------: | :----------------------------------------------------------- |
| backgroundColor   | UIColor  | `UIColor.white`                                              |
| contentRightInset | CGFloat  | 60                                                           |
| itemColor         | UIColor  | `UIColor.clear`                                              |
| itemSide          | CGFloat  | 20                                                           |
| interitemSpacing  | CGFloat  | 4                                                            |
| lineSpacing       | CGFloat  | 4                                                            |
| weekDayColor      | UIColor  | `UIColor.black`                                              |
| weekDayStrings    | [String] | `DateFormatter().shortWeekdaySymbols.map{ \$0.capitalized }` |
| weekDayFont       |  UIFont  | `UIFont.systemFont(ofSize: 12, weight: .medium)`             |
| weekDayWidth      | CGFloat  | 30                                                           |
| weekDayStandard   |   Enum   | `USandCanada`                                                |
| monthColor        | UIColor  | `UIColor.black`                                              |
| monthStrings      | [String] | `DateFormatter().monthSymbols`                               |
| monthFont         |  UIFont  | `UIFont.systemFont(ofSize: 12, weight: .medium)`             |
| monthHeight       | CGFloat  | 20                                                           |

Starts Monday or Sunday.

```swift
var config = CalendarHeatmapConfig()
config.weekDayStandard = .USandCanada // starts Sunday. (default)
config.weekDayStandard = .International // starts Monday
```

Scroll the calendar programmatically
```swift
calendarHeatMap.scrollTo(date: Date(...), at: .right, animated: false)
```

Make your `ViewController` adopts `CalendarHeatmapDelegate`

```swift
// color for date
func colorFor(dateComponents: DateComponents) -> UIColor {
    guard let year = dateComponents.year,
        let month = dateComponents.month,
        let day = dateComponents.day else { return .clear}
    // manage your color based on date here
    let yourColor = {...}
    return yourColor
}

// (optional) selection at date
func didSelectedAt(dateComponents: DateComponents) {
    guard let year = dateComponents.year,
    let month = dateComponents.month,
    let day = dateComponents.day else { return }
    // do something here
}

// (optional) notify finish loading the calendar
func finishLoadCalendar() {
    // do something here
}
```

## Demo

Take a look at `Example`, to run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Zacharysp, dongjiezach@gmail.com

## License

CalendarHeatmap is available under the MIT license. See the LICENSE file for more info.
