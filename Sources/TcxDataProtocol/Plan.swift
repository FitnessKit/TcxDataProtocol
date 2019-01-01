//
//  Plan.swift
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

/// TCX Plan
public struct Plan {
    // Plan_t

    /// Name
    private(set) public var name: String?

    /// Training Type
    private(set) public var trainingType: TrainingType

    /// Interval Workout
    private(set) public var intervalWorkout: Bool

    public init(name: String?,
                trainingType: TrainingType,
                intervalWorkout: Bool)
    {

        self.name = String.boundedSize(name, maxCount: 15)
        self.trainingType = trainingType
        self.intervalWorkout = intervalWorkout
    }
}

@available(swift 4.0)
extension Plan: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case name = "name"

        // attribute
        case trainingType = "TrainingType"
        // attribute
        case intervalWorkout = "IntervalWorkout"
    }
}
