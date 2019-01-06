//
//  Position.swift
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

/// TCX Position
@available(swift 4.0)
public struct Position {
    /// Position_t

    /// Bounds Latitude Degrees
    private let latitudeDegreesBounds = ClosedRange(uncheckedBounds: (lower: -90.0, upper: 90.0))

    /// Bounds Longitude Degrees
    private let longitudeDegreesBounds = ClosedRange(uncheckedBounds: (lower: -180.0, upper: 180.0))


    /// Latitude Degrees
    ///
    /// - note: Bounds -90.0 to 90.0
    private(set) public var latitudeDegrees: Double?

    /// Longitude Degrees
    ///
    /// - note: Bounds -180 to 180
    private(set) public var longitudeDegrees: Double?

    public init(latitudeDegrees: Double?, longitudeDegrees: Double?) {

        if let latitudeDegrees = latitudeDegrees {
            if latitudeDegreesBounds.contains(latitudeDegrees) {
                self.latitudeDegrees = latitudeDegrees
            }
        }

        if let longitudeDegrees = longitudeDegrees {
            if longitudeDegreesBounds.contains(longitudeDegrees) {
                self.longitudeDegrees = longitudeDegrees
            }
        }
    }
}

extension Position: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Position, rhs: Position) -> Bool {
        return (lhs.latitudeDegrees == rhs.latitudeDegrees) &&
            (lhs.longitudeDegrees == rhs.longitudeDegrees)
    }
}

@available(swift 4.0)
extension Position: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case latitudeDegrees = "LatitudeDegrees"
        case longitudeDegrees = "LongitudeDegrees"
    }
}
