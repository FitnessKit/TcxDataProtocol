# TcxDataProtocol

[![Swift5](https://img.shields.io/badge/swift5.0-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
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
    .package(url: "https://github.com/FitnessKit/TcxDataProtocol", from: "1.0.0")
]
```
## How to Use

### Decode

```swift
let tcxUrl = URL(fileURLWithPath: "TestFile" + ".tcx")
let tcxData = try? Data(contentsOf: tcxUrl)

if let tcxData = tcxData {

do {
  let tcxFile = try TcxFile.decode(from: tcxData)
  guard let numActivities = tcxFile.database.activities?.activities?.count else { return  }
  
  for activity in 0..<numActivities {    
    guard let numLaps = tcxFile.database.activities?.activities?[activity].lap.count else {  }
    for laps in 0..<numLaps {
      guard let lapStartTime = tcxFile.database.activities?.activities?[activity].lap[laps].startTime else { }
      guard let numTracks = tcxFile.database.activities?.activities?[activity].lap[laps].track?.count else {  }
      
      for tracks in 0..<numTracks {
        guard let numTrackPoints = tcxFile.database.activities?.activities?[activity].lap[laps].track?[tracks].trackPoint?.count else {  }
        
        for trackpoints in 0..<numTrackPoints {
          let pwr = tcxFile.database.activities?.activities?[activity].lap[laps].track?[tracks].trackPoint?[trackpoints].extensions?[0].activityTrackpointExtension?.watts
          let spd = tcxFile.database.activities?.activities?[activity].lap[laps].track?[tracks].trackPoint?[trackpoints].extensions?[0].activityTrackpointExtension?.speed
          let hr = tcxFile?.database.activities?.activities?[activity].lap[laps].track?[tracks].trackPoint?[trackpoints].heartRate?.heartRate
          let lat = tcxFile?.database.activities?.activities?[activity].lap[laps].track?[tracks].trackPoint?[trackpoints].position?.latitudeDegrees
          let lon = tcxFile?.database.activities?.activities?[activity].lap[laps].track?[tracks].trackPoint?[trackpoints].position?.longitudeDegrees
          let dist = tcxFile?.database.activities?.activities?[activity].lap[laps].track?[tracks].trackPoint?[trackpoints].distance

          if let pwr = pwr {
            // do something
          }
        }
      }
     }
   }
  } catch {
    print(error)
  }


```

### Encode

Each Trackpoint time has to be unique. Below example shows a per second increment from the previous. 

```swift
let workoutStartDateTime = Date()
let build = Build(version: Version(major: 0, minor: 1, buildMajor: 0, buildMinor: 0), time: nil, builder: nil, type: .alpha)
let author = Author(name: "TcxDataProtocol", build: build, language: nil, partNumber: "11-22-33")
let track = [Track(trackPoint: [
                    Trackpoint(time: workoutStartDateTime.addingTimeInterval(Double(1)), position: nil, altitude: nil, distance: 1.11, heartRate: HeartRateInBeatsPerMinute(heartRate: 100), cadence: 100, sensorState: SensorState.present, extensions: [Extension(activityTrackpointExtension: ActivityTrackpointExtension.init(speed: 11.2, runCadence: nil, watts: 111, cadenceSensor: CadenceSensorType(rawValue: "bike")), activityLapExtension: nil, activityGoals: nil)]),
                    Trackpoint(time: workoutStartDateTime.addingTimeInterval(Double(2)), position: nil, altitude: nil, distance: 1.11, heartRate: HeartRateInBeatsPerMinute(heartRate: 101), cadence: 101, sensorState: SensorState.present, extensions: [Extension(activityTrackpointExtension: ActivityTrackpointExtension.init(speed: 11.3, runCadence: nil, watts: 222, cadenceSensor: CadenceSensorType(rawValue: "bike")), activityLapExtension: nil, activityGoals: nil)])
                    ])]

let lap = ActivityLap(startTime: workoutStartDateTime, totalTime: 45.0, distance: 12.0, maximumSpeed: nil, calories: 120, averageHeartRate: nil, maximumHeartRate: nil, intensity: .active, cadence: nil, triggerMethod: .manual, track: track, notes: nil, extensions: nil)

let activity = Activity(sport: .biking, identification: workoutStartDateTime, lap: [lap], notes: nil, training: nil, creator: nil)

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

TcxDataProtocol is available under the [MIT license](http://opensource.org/licenses/MIT)
