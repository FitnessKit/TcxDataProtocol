//
//  ActivityExtension.swift
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

//
/// TCX Activity Trackpoint Extension
@available(swift 4.0)
public struct ActivityTrackpointExtension {
    // ActivityTrackpointExtension_t

    /// Speed
    private(set) public var speed: Double?

    /// Run Cadence
    // max 254 (CadenceValue_t)
    private(set) public var runCadence: UInt8?

    /// Watts
    private(set) public var watts: UInt16?

    /// Cadence ensor Type
    private(set) public var cadenceSensor: CadenceSensorType?

    public init (speed: Double?,
                 runCadence: UInt8?,
                 watts: UInt16?,
                 cadenceSensor: CadenceSensorType?)
    {
        self.speed = speed
        self.runCadence = runCadence
        self.watts = watts
        self.cadenceSensor = cadenceSensor
    }
}

@available(swift 4.0)
extension ActivityTrackpointExtension: Codable {

    enum CodingKeys: String, CodingKey {
        case speed = "ns3:Speed"
        case runCadence = "ns3:RunCadence"
        case watts = "ns3:Watts"

        //attribute
        case cadenceSensor = "ns3:CadenceSensorType"
    }
}

/// TCX Activity Lap Extension
@available(swift 4.0)
public struct ActivityLapExtension {
    // ActivityLapExtension_t

    /// Distance in Meters
    private(set) public var avgSpeed: Double?

    /// Maximum Bike Cadence
    // max 254 (CadenceValue_t)
    private(set) public var maximumBikeCadence: UInt8?

    /// Average Run Cadence
    // max 254 (CadenceValue_t)
    private(set) public var averageRunCadence: UInt8?

    /// Maximum Run Cadence
    // max 254 (CadenceValue_t)
    private(set) public var maximumRunCadence: UInt8?

    /// Steps
    private(set) public var steps: UInt16?

    /// Average Watts
    private(set) public var averageWatts: UInt16?

    /// Maximum Watts
    private(set) public var maximumWatts: UInt16?

    public init (avgSpeed: Double?,
                 maximumBikeCadence: UInt8?,
                 averageRunCadence: UInt8?,
                 maximumRunCadence: UInt8?,
                 steps: UInt16?,
                 averageWatts: UInt16?,
                 maximumWatts: UInt16?)
    {
        self.avgSpeed = avgSpeed
        self.maximumBikeCadence = maximumBikeCadence
        self.averageRunCadence = averageRunCadence
        self.maximumRunCadence = maximumRunCadence
        self.steps = steps
        self.averageWatts = averageWatts
        self.maximumWatts = maximumWatts
    }
}

@available(swift 4.0)
extension ActivityLapExtension: Codable {

    enum CodingKeys: String, CodingKey {
        case avgSpeed = "ns3:AvgSpeed"
        case maximumBikeCadence = "ns3:MaxBikeCadence"
        case averageRunCadence = "ns3:AvgRunCadence"
        case maximumRunCadence = "ns3:MaxRunCadence"
        case steps = "ns3:Steps"
        case averageWatts = "ns3:AvgWatts"
        case maximumWatts = "ns3:MaxWatts"
    }
}

/// TCX Cadence Sensor Type
@available(swift 4.0)
public enum CadenceSensorType: String, Codable {
    // CadenceSensorType_t

    /// Footpod
    case footpod = "Footpod"
    /// Bike
    case bike = "Bike"
}
