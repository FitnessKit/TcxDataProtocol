//
//  NextSport.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 1/1/19.
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

/// TCX Next Sport
@available(swift 4.0)
public struct NextSport {

    /// Transition
    private(set) public var transition: ActivityLap?

    /// Activity
    private(set) public var activity: Activity

    public init(transition: ActivityLap?, activity: Activity) {
        self.transition = transition
        self.activity = activity
    }
}

extension NextSport: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: NextSport, rhs: NextSport) -> Bool {
        return (lhs.transition == rhs.transition) &&
            (lhs.activity == rhs.activity)
    }
}

@available(swift 4.0)
extension NextSport: Codable {

    /// Coding Keys
    enum CodingKeys: String, CodingKey {
        case transition = "Transition"
        case activity = "Activity"
    }
}
