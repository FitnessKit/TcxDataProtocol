# TcxDataProtocol

[![Swift4](https://img.shields.io/badge/swift4.2-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/TcxDataProtocol.svg?style=flat)](http://cocoapods.org/pods/TcxDataProtocol)
[![License](https://img.shields.io/cocoapods/l/TcxDataProtocol.svg?style=flat)](http://cocoapods.org/pods/TcxDataProtocol)
[![Platform](https://img.shields.io/cocoapods/p/TcxDataProtocol.svg?style=flat)](http://cocoapods.org/pods/TcxDataProtocol)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/fitnesskit/tcxdataprotocol)](http://clayallsopp.github.io/readme-score?url=https://github.com/fitnesskit/tcxdataprotocol)

Provides a Swift version of the TCX XML format.


## Installation

TcxDataProtocol is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'TcxDataProtocol'
```

Swift Package Manager:
```swift
dependencies: [
    .package(url: "https://github.com/FitnessKit/TcxDataProtocol", from: "0.1.0")
]
```
## How to Use

### Decode

```swift
let tcxUrl = URL(fileURLWithPath: "TestFile" + ".tcx")
let tcxData = try? Data(contentsOf: tcxUrl)

if let tcxData = tcxData {
    let tcxFile = try? TcxFile.decode(from: tcxData)
}
```

### Encode

```swift

let build = Build(version: Version(major: 0, minor: 1, buildMajor: 0, buildMinor: 0), time: nil, builder: nil, type: .alpha)
let author = Author(name: "TcxDataProtocol", build: build, language: nil, partNumber: "11-22-33")

let lap = ActivityLap(startTime: Date(), totalTime: 45.0, distance: 12.0, maximumSpeed: nil, calories: 120, averageHeartRate: nil, maximumHeartRate: nil, intensity: .active, cadence: nil, triggerMethod: .manual, track: nil, notes: nil, extensions: nil)

let activity = Activity(sport: .biking, identification: Date(), lap: [lap], notes: nil, training: nil, creator: nil)

let activities = ActivityList(activities: [activity], multiSportSession: nil)

let database = TrainingCenterDatabase(activities: activities, courses: nil, author: author)

let TCXFile = TcxFile(database: database)

let encodedData = try? TCXFile.encode(prettyPrinted: true)

if let encodedData = encodedData {
    let xml = String(bytes: encodedData, encoding: .utf8)
    print(xml!)
}

```

### Supported Elements

* `ActivityList`
* `Activity`
* `ActivityLap`
* `ActivityReference`
* `Application`
* `Author`
* `Build`
* `BuildType`
* `Course`
* `CourseLap`
* `CourseList`
* `CoursePoint`
* `CoursePointType`
* `Creator`
* `Gender`
* `HeartRateInBeatsPerMinute`
* `HeartRateInBeatsPercentMax`
* `Intensity`
* `MultiSportSession`
* `NextSport`
* `Plan`
* `Position`
* `QuickWorkoutResults`
* `SensorState`
* `Sport`
* `Track`
* `Trackpoint`
* `Training`
* `TrainingType`
* `TriggerMethod`
* `Version`

### Supported Extensions

* ActivityExtension
    * `CadenceSensorType`
    * `ActivityTrackpointExtension`
    * `ActivityLapExtension`

* ActivityGoals
    * `Measure`
    * `RecurrenceCode`
    * `Period`
    * `ActivityGoal`
    * `ActivityGoals`


## Author

This package is developed and maintained by Kevin A. Hoogheem

## License

BluetoothMessageProtocol is available under the [MIT license](http://opensource.org/licenses/MIT)
