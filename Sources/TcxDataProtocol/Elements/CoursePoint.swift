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

extension CoursePoint: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CoursePoint, rhs: CoursePoint) -> Bool {
        return (lhs.name == rhs.name) &&
            (lhs.altitude == rhs.altitude) &&
            (lhs.pointType == rhs.pointType) &&
            (lhs.notes == rhs.notes)
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
