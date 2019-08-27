import XCTest
@testable import TcxDataProtocol

final class TcxDataProtocolTests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let build = Build(version: Version(major: 0, minor: 1, buildMajor: 0, buildMinor: 0), time: nil, builder: nil, type: .alpha)
        let author = Author(name: "Garmin Connect API", build: build, language: "en", partNumber: "006-D2449-00")
        
        let lap = ActivityLap(startTime: Date(), totalTime: 45.0, distance: 12.0, maximumSpeed: nil, calories: 120, averageHeartRate: nil, maximumHeartRate: nil, intensity: .active, cadence: nil, triggerMethod: .manual, track: nil, notes: nil, extensions: nil)
        
        let version = Version(major: 8, minor: 80, buildMajor: 0, buildMinor: 0)
        let creator = Creator(name: "Edge 820", version: version, unitIdentification: "3960008421", productIdentification: nil)
        let activity = Activity(sport: .biking, identification: Date(), lap: [lap], notes: nil, training: nil, creator: creator)
        
        
        let activities = ActivityList(activities: [activity], multiSportSession: nil)
        
        let database = TrainingCenterDatabase(activities: activities, courses: nil, author: author)
        
        let TCXFile = TcxFile(database: database)
        
        let encodedData = try? TCXFile.encode(prettyPrinted: true)
        
        if let encodedData = encodedData {
            let xml = String(bytes: encodedData, encoding: .utf8)
            print(xml!)
        }
        

    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
