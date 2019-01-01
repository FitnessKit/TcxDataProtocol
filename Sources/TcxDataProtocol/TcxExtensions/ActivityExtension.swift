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

// Schema
// https://www8.garmin.com/xmlschemas/ActivityExtensionv2.xsd

/// TCX Cadence Sensor Type
@available(swift 4.0)
public enum CadenceSensorType: String, Codable {
    // CadenceSensorType_t

    /// Footpod
    case footpod = "Footpod"
    /// Bike
    case bike = "Bike"
}

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

        if let runCadence = runCadence {
            self.runCadence = min(runCadence, 254)
        }

        self.watts = watts
        self.cadenceSensor = cadenceSensor
    }
}

@available(swift 4.0)
extension ActivityTrackpointExtension: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case speed = "ns3:Speed"
        case runCadence = "ns3:RunCadence"
        case watts = "ns3:Watts"

        //attribute
        case cadenceSensor = "ns3:CadenceSensorType"
    }

    /// Alternate Coding Keys
    public enum AlternateCodingKeys: String, CodingKey {
        case speed = "Speed"
        case runCadence = "RunCadence"
        case watts = "Watts"

        //attribute
        case cadenceSensor = "CadenceSensorType"
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringKey.self)
        var speed: Double?
        var runCadence: UInt8?
        var watts: UInt16?
        var cadenceSensor: CadenceSensorType?

        speed = try container.lazyDecode(Double.self,
                                         keyOne: StringKey(stringValue: CodingKeys.speed.rawValue)!,
                                         keyTwo: StringKey(stringValue: AlternateCodingKeys.speed.rawValue)!)

        runCadence = try container.lazyDecode(UInt8.self,
                                              keyOne: StringKey(stringValue: CodingKeys.runCadence.rawValue)!,
                                              keyTwo: StringKey(stringValue: AlternateCodingKeys.runCadence.rawValue)!)

        watts = try container.lazyDecode(UInt16.self,
                                         keyOne: StringKey(stringValue: CodingKeys.watts.rawValue)!,
                                         keyTwo: StringKey(stringValue: AlternateCodingKeys.watts.rawValue)!)

        cadenceSensor = try container.lazyDecode(CadenceSensorType.self,
                                                 keyOne: StringKey(stringValue: CodingKeys.cadenceSensor.rawValue)!,
                                                 keyTwo: StringKey(stringValue: AlternateCodingKeys.cadenceSensor.rawValue)!)

        self.init(speed: speed,
                  runCadence: runCadence,
                  watts: watts,
                  cadenceSensor: cadenceSensor)
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

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case avgSpeed = "ns3:AvgSpeed"
        case maximumBikeCadence = "ns3:MaxBikeCadence"
        case averageRunCadence = "ns3:AvgRunCadence"
        case maximumRunCadence = "ns3:MaxRunCadence"
        case steps = "ns3:Steps"
        case averageWatts = "ns3:AvgWatts"
        case maximumWatts = "ns3:MaxWatts"
    }

    /// Alternate Coding Keys
    public enum AlternateCodingKeys: String, CodingKey {
        case avgSpeed = "AvgSpeed"
        case maximumBikeCadence = "MaxBikeCadence"
        case averageRunCadence = "AvgRunCadence"
        case maximumRunCadence = "MaxRunCadence"
        case steps = "Steps"
        case averageWatts = "AvgWatts"
        case maximumWatts = "MaxWatts"
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringKey.self)
        var avgSpeed: Double?
        var maximumBikeCadence: UInt8?
        var averageRunCadence: UInt8?
        var maximumRunCadence: UInt8?
        var steps: UInt16?
        var averageWatts: UInt16?
        var maximumWatts: UInt16?

        avgSpeed = try container.lazyDecode(Double.self,
                                            keyOne: StringKey(stringValue: CodingKeys.avgSpeed.rawValue)!,
                                            keyTwo: StringKey(stringValue: AlternateCodingKeys.avgSpeed.rawValue)!)

        maximumBikeCadence = try container.lazyDecode(UInt8.self,
                                                      keyOne: StringKey(stringValue: CodingKeys.maximumBikeCadence.rawValue)!,
                                                      keyTwo: StringKey(stringValue: AlternateCodingKeys.maximumBikeCadence.rawValue)!)

        averageRunCadence = try container.lazyDecode(UInt8.self,
                                                     keyOne: StringKey(stringValue: CodingKeys.averageRunCadence.rawValue)!,
                                                     keyTwo: StringKey(stringValue: AlternateCodingKeys.averageRunCadence.rawValue)!)

        maximumRunCadence = try container.lazyDecode(UInt8.self,
                                                     keyOne: StringKey(stringValue: CodingKeys.maximumRunCadence.rawValue)!,
                                                     keyTwo: StringKey(stringValue: AlternateCodingKeys.maximumRunCadence.rawValue)!)

        steps = try container.lazyDecode(UInt16.self,
                                         keyOne: StringKey(stringValue: CodingKeys.steps.rawValue)!,
                                         keyTwo: StringKey(stringValue: AlternateCodingKeys.steps.rawValue)!)

        averageWatts = try container.lazyDecode(UInt16.self,
                                                keyOne: StringKey(stringValue: CodingKeys.averageWatts.rawValue)!,
                                                keyTwo: StringKey(stringValue: AlternateCodingKeys.averageWatts.rawValue)!)

        maximumWatts = try container.lazyDecode(UInt16.self,
                                                keyOne: StringKey(stringValue: CodingKeys.maximumWatts.rawValue)!,
                                                keyTwo: StringKey(stringValue: AlternateCodingKeys.maximumWatts.rawValue)!)


        self.init(avgSpeed: avgSpeed,
                  maximumBikeCadence: maximumBikeCadence,
                  averageRunCadence: averageRunCadence,
                  maximumRunCadence: maximumRunCadence,
                  steps: steps,
                  averageWatts: averageWatts,
                  maximumWatts: maximumWatts)
    }

}
