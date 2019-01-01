//
//  CoursePoint.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 12/29/18.
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

/// TCX Course Point
@available(swift 4.0)
public struct CoursePoint {
    /// CoursePoint_t

    /// Course Point Name
    private(set) public var name: String?

    /// Altitude in Meters
    private(set) public var altitude: Double?

    /// Course Point Type
    private(set) public var pointType: CoursePointType

    /// Notes
    private(set) public var notes: String?

    public init(name: String?,
                altitude: Double?,
                pointType: CoursePointType,
                notes: String?)
    {
        self.name = String.boundedSize(name, maxCount: 10)
        self.altitude = altitude
        self.pointType = pointType
        self.notes = notes
    }
}

@available(swift 4.0)
extension CoursePoint: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case name = "Name"
        case altitude = "AltitudeMeters"
        case pointType = "PointType"
        case notes = "Notes"
    }
}

/// Identifies CoursePoint Type
@available(swift 4.0)
public enum CoursePointType: String, Codable {
    // CoursePointType_t

    /// Generic
    case generic = "Generic"
    /// Summit
    case summit = "Summit"
    /// Valley
    case valley = "Valley"
    /// Water
    case water = "Water"
    /// Food
    case food = "Food"
    /// Danger
    case danger = "Danger"
    /// Left
    case left = "Left"
    /// Right
    case right = "Right"
    /// Straight
    case straight = "Straight"
    /// First Aid
    case firstAid = "First Aid"
    /// 4th Category
    case fourthCategory = "4th Category"
    /// 3rd Category
    case thirdCategory  = "3rd Category"
    /// 2nd Category
    case secondCategory = "2nd Category"
    /// 1st Category
    case firstCategory = "1st Category"
    /// Hors Category
    case horsCategory = "Hors Category"
    /// Sprint
    case sprint = "Sprint"
}
