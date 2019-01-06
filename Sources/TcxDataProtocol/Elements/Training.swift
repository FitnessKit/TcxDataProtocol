//
//  Training.swift
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

/// TCX Training Type
public enum TrainingType: String, Codable {
    /// TrainingType_t

    /// Workout
    case workout = "Workout"
    /// Course
    case course = "Course"
}

/// TCX Training
@available(swift 4.0)
public struct Training {
    // Training_t

    /// Virtual Partner
    private(set) public var virtualPartner: Bool

    /// Workout Results
    private(set) public var workoutResults: QuickWorkoutResults?

    public init(virtualPartner: Bool, workoutResults: QuickWorkoutResults?) {
        self.virtualPartner = virtualPartner
        self.workoutResults = workoutResults
    }
}

extension Training: Equatable {

    public static func == (lhs: Training, rhs: Training) -> Bool {
        return (lhs.virtualPartner == rhs.virtualPartner) &&
            (lhs.workoutResults == rhs.workoutResults)
    }
}

@available(swift 4.0)
extension Training: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        // attribute
        case virtualPartner = "VirtualPartner"

        case workoutResults = "QuickWorkoutResults"
    }
}
