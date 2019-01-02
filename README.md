# TcxDataProtocol

[![Swift4](https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)

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


### Encode


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
