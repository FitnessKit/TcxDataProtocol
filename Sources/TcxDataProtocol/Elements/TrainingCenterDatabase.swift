//
//  TrainingCenterDatabase.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 1/1/19.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// TCX Training Center Database
///
/// This is the Root element of the TCX File
@available(swift 4.0)
public struct TrainingCenterDatabase {

    /// XSI Schema Location
    var schemaLocation: String = "http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd"

    var xmlnsNs2: String = "http://www.garmin.com/xmlschemas/UserProfile/v2"
    var xmlnsNs3: String = "http://www.garmin.com/xmlschemas/ActivityExtension/v2"
    var xmlnsNs4: String = "http://www.garmin.com/xmlschemas/ProfileExtension/v1"
    var xmlnsNs5: String = "http://www.garmin.com/xmlschemas/ActivityGoals/v1"

    var xmlns: String = "http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
    var xmlnsXsi: String = "http://www.w3.org/2001/XMLSchema-instance"

    /// Activities
    private(set) public var activities: ActivityList?

    /// Courses
    private(set) public var courses: CourseList?

    /// Author
    private(set) public var author: Author?

    public init(activities: ActivityList?,
                courses: CourseList?,
                author: Author?)
    {
        self.activities = activities
        self.courses = courses
        self.author = author
    }
}

extension TrainingCenterDatabase: Equatable {

    public static func == (lhs: TrainingCenterDatabase, rhs: TrainingCenterDatabase) -> Bool {
        return (lhs.activities == rhs.activities) &&
            (lhs.courses == rhs.courses) &&
            (lhs.author == rhs.author)
    }
}

@available(swift 4.0)
extension TrainingCenterDatabase: Codable {

    /// Coding Keys
    enum CodingKeys: String, CodingKey {
        case schemaLocation = "xsi:schemaLocation"

        case xmlnsNs2 = "xmlns:ns2"
        case xmlnsNs3 = "xmlns:ns3"
        case xmlnsNs4 = "xmlns:ns4"
        case xmlnsNs5 = "xmlns:ns5"

        case xmlns = "xmlns"
        case xmlnsXsi = "xmlns:xsi"

        case activities = "Activities"
        case author = "Author"
    }
}
