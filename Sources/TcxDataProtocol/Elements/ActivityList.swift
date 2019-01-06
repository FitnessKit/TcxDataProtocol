//
//  ActivityList.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 1/5/19.
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

/// TCX Activity List
@available(swift 4.0)
public struct ActivityList {
    // ActivityList_t

    /// Activities
    private(set) public var activities: [Activity]?

    /// Multi Sport Sessions
    private(set) public var multiSportSession: [MultiSportSession]?

    public init(activities: [Activity]?, multiSportSession: [MultiSportSession]?) {
        self.activities = activities
        self.multiSportSession = multiSportSession
    }
}

extension ActivityList: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ActivityList, rhs: ActivityList) -> Bool {
        return (lhs.activities == rhs.activities) &&
            (lhs.multiSportSession == rhs.multiSportSession)
    }
}

@available(swift 4.0)
extension ActivityList: Codable {

    /// Coding Keys
    enum CodingKeys: String, CodingKey {
        case activities = "Activity"
        case multiSportSession = "MultiSportSession"
    }
}
