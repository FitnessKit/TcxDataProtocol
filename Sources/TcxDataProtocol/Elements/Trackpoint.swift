//
//  Trackpoint.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 1/6/19.
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

/// TCX Track Point
@available(swift 4.0)
public struct Trackpoint {
    // Trackpoint_t

    /// Time
    private(set) public var time: Date?

    /// Position
    private(set) public var position: Position?

    /// Altitude in Meters
    private(set) public var altitude: Double?

    /// Distance in Meters
    private(set) public var distance: Double?

    /// Heart Rate
    private(set) public var heartRate: HeartRateInBeatsPerMinute?

    /// Cadence
    // max 254 (CadenceValue_t)
    private(set) public var cadence: UInt8?

    /// Sensor State
    private(set) public var sensorState: SensorState?

    /// Extensions for TrackPoint
    private(set) public var extensions: [Extension]?

    public init(time: Date?,
                position: Position?,
                altitude: Double?,
                distance: Double?,
                heartRate: HeartRateInBeatsPerMinute?,
                cadence: UInt8?,
                sensorState: SensorState?,
                extensions: [Extension]?)
    {
        self.time = time
        self.altitude = altitude
        self.distance = distance
        self.heartRate = heartRate

        if let cadence = cadence {
            self.cadence = min(cadence, 254)
        }

        self.sensorState = sensorState
        self.extensions = extensions
    }
}

extension Trackpoint: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Trackpoint, rhs: Trackpoint) -> Bool {
        return (lhs.time == rhs.time) &&
            (lhs.altitude == rhs.altitude) &&
            (lhs.distance == rhs.distance) &&
            (lhs.heartRate == rhs.heartRate) &&
            (lhs.cadence == rhs.cadence)  &&
            (lhs.sensorState == rhs.sensorState) &&
            (lhs.extensions == rhs.extensions)
    }
}

@available(swift 4.0)
extension Trackpoint: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case time = "Time"
        case position = "Position"
        case altitude = "AltitudeMeters"
        case distance = "DistanceMeters"
        case heartRate = "HeartRateBpm"
        case cadence = "Cadence"
        case sensorState = "SensorState"

        case extensions = "Extensions"
    }
}
