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
public struct ActivityTrackpointExtension: Codable {
    // ActivityTrackpointExtension_t

    /// Speed
    private(set) public var speed: Double?

    /// Run Cadence
    // max 254 (CadenceValue_t)
    private(set) public var runCadence: UInt8?

    /// Watts
    private(set) public var watts: UInt16?

    /// Cadence ensor Type
    //attribute
    private(set) public var cadenceSensor: CadenceSensorType?

    enum CodingKeys: String, CodingKey {
        case speed = "ns3:Speed"
        case runCadence = "ns3:RunCadence"
        case watts = "ns3:Watts"
        case cadenceSensor = "ns3:CadenceSensorType"
    }
}

/// TCX Activity Lap Extension
@available(swift 4.0)
public struct ActivityLapExtension: Codable {
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
