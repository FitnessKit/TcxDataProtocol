//
//  ActivityLap.swift
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
import XMLCoder

/// TCX Activity Lap
@available(swift 4.0)
public struct ActivityLap {
    // ActivityLap_t

    /// Start Time
    private(set) public var startTime: Date?

    /// Total Time
    ///
    /// - note: Seconds
    private(set) public var totalTime: Double

    /// Distance in Meters
    ///
    /// - note: Meters
    private(set) public var distance: Double

    /// Maximum Speed
    private(set) public var maximumSpeed: Double?

    /// Calories
    private(set) public var calories: UInt16

    /// Average Heart Rate
    private(set) public var averageHeartRate: HeartRateInBeatsPerMinute?

    /// Maximum Heart Rate
    private(set) public var maximumHeartRate: HeartRateInBeatsPerMinute?

    /// Intensity
    private(set) public var intensity: Intensity

    /// Cadence
    private(set) public var cadence: UInt8?

    /// Trigger Method
    private(set) public var triggerMethod: TriggerMethod

    /// Track
    private(set) public var track: [Track]?

    /// Notes
    private(set) public var notes: String?

    /// Extensions for Activity Lap
    private(set) public var extensions: [Extension]?

    public init(startTime: Date?,
                totalTime: Double,
                distance: Double,
                maximumSpeed: Double?,
                calories: UInt16,
                averageHeartRate: HeartRateInBeatsPerMinute?,
                maximumHeartRate: HeartRateInBeatsPerMinute?,
                intensity: Intensity,
                cadence: UInt8?,
                triggerMethod: TriggerMethod,
                track: [Track]?,
                notes: String?,
                extensions: [Extension]?)
    {
        self.startTime = startTime
        self.totalTime = totalTime
        self.distance = distance
        self.maximumSpeed = maximumSpeed
        self.calories = calories
        self.averageHeartRate = averageHeartRate
        self.maximumHeartRate = maximumHeartRate
        self.intensity = intensity

        if let cadence = cadence {
            self.cadence = min(cadence, 254)
        }

        self.triggerMethod = triggerMethod
        self.track = track
        self.notes = notes
        self.extensions = extensions
    }
}

extension ActivityLap: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ActivityLap, rhs: ActivityLap) -> Bool {
        return (lhs.startTime == rhs.startTime) &&
            (lhs.totalTime == rhs.totalTime) &&
            (lhs.distance == rhs.distance) &&
            (lhs.maximumSpeed == rhs.maximumSpeed) &&
            (lhs.calories == rhs.calories) &&
            (lhs.averageHeartRate == rhs.averageHeartRate) &&
            (lhs.maximumHeartRate == rhs.maximumHeartRate) &&
            (lhs.intensity == rhs.intensity) &&
            (lhs.cadence == rhs.cadence) &&
            (lhs.triggerMethod == rhs.triggerMethod) &&
            (lhs.track == rhs.track) &&
            (lhs.notes == rhs.notes) &&
            (lhs.extensions == rhs.extensions)
    }
}

extension ActivityLap: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.startTime)
        hasher.combine(self.totalTime)
        hasher.combine(self.distance)
        hasher.combine(self.maximumSpeed)
        hasher.combine(self.calories)
        hasher.combine(self.averageHeartRate)
        hasher.combine(self.maximumHeartRate)
        hasher.combine(self.intensity)
        hasher.combine(self.cadence)
        hasher.combine(self.triggerMethod)
        hasher.combine(self.track)
        hasher.combine(self.notes)
        hasher.combine(self.extensions)
    }
}

@available(swift 4.0)
extension ActivityLap: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        // attribute
        case startTime = "StartTime"

        case totalTime = "TotalTimeSeconds"
        case distance = "DistanceMeters"
        case maximumSpeed = "MaximumSpeed"
        case calories = "Calories"
        case averageHeartRate = "AverageHeartRateBpm"
        case maximumHeartRate = "MaximumHeartRateBpm"
        case intensity = "Intensity"
        case cadence = "Cadence"
        case triggerMethod = "TriggerMethod"
        case track = "Track"
        case notes = "Notes"
        case extensions = "Extensions"
    }
}

extension ActivityLap: DynamicNodeEncoding {
    
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case ActivityLap.CodingKeys.startTime:
            return .attribute
        default:
            return .element
        }
    }
}
