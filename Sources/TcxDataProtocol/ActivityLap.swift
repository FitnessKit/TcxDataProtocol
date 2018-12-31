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

/// TCX Activity Lap
@available(swift 4.0)
public struct ActivityLap {
    // ActivityLap_t

    /// Start Time
    private(set) public var startTime: Date?

    /// Total Time
    private(set) public var totalTime: Double

    /// Distance in Meters
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
    // max 254
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
        self.cadence = cadence
        self.triggerMethod = triggerMethod
        self.track = track
        self.notes = notes
        self.extensions = extensions
    }
}

@available(swift 4.0)
extension ActivityLap: Codable {

    enum CodingKeys: String, CodingKey {
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
