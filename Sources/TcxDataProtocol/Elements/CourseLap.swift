//
//  CourseLap.swift
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

/// TCX Course Lap
@available(swift 4.0)
public struct CourseLap {
    // CourseLap_t

    /// Total Time
    ///
    /// - note: Seconds
    private(set) public var totalTime: Double

    /// Distance in Meters
    ///
    /// - note: Meters
    private(set) public var distance: Double

    /// Begin Position
    private(set) public var beginPosition: Position?

    /// Begin Altitude
    ///
    /// - note: Meters
    private(set) public var beginAltitude: Double?

    /// End Position
    private(set) public var endPosition: Position?

    /// End Altitude
    ///
    /// - note: Meters
    private(set) public var endAltitude: Double?

    /// Average Heart Rate
    private(set) public var averageHeartRate: HeartRateInBeatsPerMinute?

    /// Maximum Heart Rate
    private(set) public var maximumHeartRate: HeartRateInBeatsPerMinute?

    /// Intensity
    private(set) public var intensity: Intensity

    /// Cadence
    private(set) public var cadence: UInt8?

    public init(totalTime: Double,
                distance: Double,
                beginPosition: Position?,
                beginAltitude: Double?,
                endPosition: Position?,
                endAltitude: Double?,
                averageHeartRate: HeartRateInBeatsPerMinute?,
                maximumHeartRate: HeartRateInBeatsPerMinute?,
                intensity: Intensity,
                cadence: UInt8?)
    {
        self.totalTime = totalTime
        self.distance = distance
        self.beginPosition = beginPosition
        self.beginAltitude = beginAltitude
        self.endPosition = endPosition
        self.endAltitude = endAltitude
        self.averageHeartRate = averageHeartRate
        self.maximumHeartRate = maximumHeartRate
        self.intensity = intensity

        if let cadence = cadence {
            self.cadence = min(cadence, 254)
        }
    }
}

extension CourseLap: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CourseLap, rhs: CourseLap) -> Bool {
        return (lhs.totalTime == rhs.totalTime) &&
            (lhs.distance == rhs.distance) &&
            (lhs.beginPosition == rhs.beginPosition) &&
            (lhs.beginAltitude == rhs.beginAltitude) &&
            (lhs.endPosition == rhs.endPosition) &&
            (lhs.endAltitude == rhs.endAltitude) &&
            (lhs.averageHeartRate == rhs.averageHeartRate) &&
            (lhs.maximumHeartRate == rhs.maximumHeartRate) &&
            (lhs.intensity == rhs.intensity) &&
            (lhs.cadence == rhs.cadence)
    }
}

@available(swift 4.0)
extension CourseLap: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case totalTime = "TotalTimeSeconds"
        case distance = "DistanceMeters"
        case beginPosition = "BeginPosition"
        case beginAltitude = "BeginAltitudeMeters"
        case endPosition = "EndPosition"
        case endAltitude = "EndAltitudeMeters"
        case averageHeartRate = "AverageHeartRateBpm"
        case maximumHeartRate = "MaximumHeartRateBpm"
        case intensity = "Intensity"
        case cadence = "Cadence"
    }
}
