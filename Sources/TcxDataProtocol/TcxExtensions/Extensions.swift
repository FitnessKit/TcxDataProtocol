//
//  Extensions.swift
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

/// TCX Extension
@available(swift 4.0)
public struct Extension {

    /// Activity TrackPoint Extension
    private(set) public var activityTrackpointExtension: ActivityTrackpointExtension?

    /// Activity Lap Extension
    private(set) public var activityLapExtension: ActivityLapExtension?

    /// Activity Goals
    private(set) public var activityGoals: ActivityGoals?

    public init(activityTrackpointExtension: ActivityTrackpointExtension?,
                activityLapExtension: ActivityLapExtension?,
                activityGoals: ActivityGoals?)
    {
        self.activityTrackpointExtension = activityTrackpointExtension
        self.activityLapExtension = activityLapExtension
        self.activityGoals = activityGoals
    }
}

@available(swift 4.0)
extension Extension: Codable {

    public enum CodingKeys: String, CodingKey {
        case activityTrackpointExtension = "ns3:TPX"
        case activityLapExtension = "ns3:LX"
        case activityGoals = "ns5:ActivityGoals"
    }

    public enum AlternateCodingKeys: String, CodingKey {
        case activityTrackpointExtension = "TPX"
        case activityLapExtension = "LX"
        case activityGoals = "ActivityGoals"
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringKey.self)
        var activityTrackpointExtension: ActivityTrackpointExtension?
        var activityLapExtension: ActivityLapExtension?
        var activityGoals: ActivityGoals?

        activityTrackpointExtension = try container.lazyDecode(ActivityTrackpointExtension.self,
                                                               keyOne: StringKey(stringValue: CodingKeys.activityTrackpointExtension.rawValue)!,
                                                               keyTwo: StringKey(stringValue: AlternateCodingKeys.activityTrackpointExtension.rawValue)!)


        activityLapExtension = try container.lazyDecode(ActivityLapExtension.self,
                                                        keyOne: StringKey(stringValue: CodingKeys.activityLapExtension.rawValue)!,
                                                        keyTwo: StringKey(stringValue: AlternateCodingKeys.activityLapExtension.rawValue)!)

        activityGoals = try container.lazyDecode(ActivityGoals.self,
                                                 keyOne: StringKey(stringValue: CodingKeys.activityGoals.rawValue)!,
                                                 keyTwo: StringKey(stringValue: AlternateCodingKeys.activityGoals.rawValue)!)

        self.init(activityTrackpointExtension: activityTrackpointExtension,
                  activityLapExtension: activityLapExtension,
                  activityGoals: activityGoals)
    }

}
