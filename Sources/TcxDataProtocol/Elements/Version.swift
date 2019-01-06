//
//  Version.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 9/3/18.
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

/// TCX Version
@available(swift 4.0)
public struct Version {

    /// Major
    private(set) public var major: UInt16

    /// Minor
    private(set) public var minor: UInt16

    /// Build Major
    private(set) public var buildMajor: UInt16?

    /// Build Minor
    private(set) public var buildMinor: UInt16?

    public init(major: UInt16,
                minor: UInt16,
                buildMajor: UInt16?,
                buildMinor: UInt16?)
    {
        self.major = major
        self.minor = minor
        self.buildMajor = buildMajor
        self.buildMinor = buildMinor
    }
}

extension Version: Equatable {

    public static func == (lhs: Version, rhs: Version) -> Bool {
        return (lhs.major == rhs.major) &&
            (lhs.minor == rhs.minor) &&
            (lhs.buildMajor == rhs.buildMajor) &&
            (lhs.buildMinor == rhs.buildMinor)
    }
}

@available(swift 4.0)
extension Version: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case major = "VersionMajor"
        case minor = "VersionMinor"
        case buildMajor = "BuildMajor"
        case buildMinor = "BuildMinor"
    }
}
