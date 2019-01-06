//
//  Activity.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 12/31/18.
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

/// TCX Activity
@available(swift 4.0)
public struct Activity {
    // Activity_t

    /// Sport
    private(set) public var sport: Sport

    /// Activity ID
    private(set) public var identification: Date

    /// Lap
    private(set) public var lap: [ActivityLap]

    /// Notes
    private(set) public var notes: String?

    /// Training
    private(set) public var training: Training?

    /// Creator
    private(set) public var creator: Creator?

    public init(sport: Sport,
                identification: Date,
                lap: [ActivityLap],
                notes: String?,
                training: Training?,
                creator: Creator?)
    {
        self.sport = sport
        self.identification = identification
        self.lap = lap
        self.notes = notes
        self.training = training
        self.creator = creator
    }
}

extension Activity: Equatable {

    public static func == (lhs: Activity, rhs: Activity) -> Bool {
        return (lhs.sport == rhs.sport) &&
            (lhs.identification == rhs.identification) &&
            (lhs.lap == rhs.lap) &&
            (lhs.notes == rhs.notes) &&
            (lhs.training == rhs.training)  &&
            (lhs.creator == rhs.creator) 
    }
}

@available(swift 4.0)
extension Activity: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        // attribute
        case sport = "Sport"

        // xsd:dateTime
        case identification = "Id"
        case lap = "Lap"
        case notes = "Notes"
        case training = "Training"
        case creator = "Creator"
    }
}
