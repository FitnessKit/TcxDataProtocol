//
//  Author.swift
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

/// TCX Author
@available(swift 4.0)
public struct Author {
    // AbstractSource_t

    /// Type
    private(set) public var type: String?

    /// Author Name
    private(set) public var name: String

    /// Build Info
    private(set) public var build: Build?

    /// Language
    ///
    /// Specifies the two character ISO 693-1 language id that identifies the installed
    /// language of this application. see http://www.loc.gov/standards/iso639-2/ for
    /// appropriate ISO identifiers
    private(set) public var language: String?

    /// Part Number
    private(set) public var partNumber: String?

    public init(name: String,
                build: Build?,
                language: String?,
                partNumber: String?)
    {
        self.type = "Application_t"
        self.name = name
        self.build = build
        self.language = language
        self.partNumber = partNumber
    }
}

extension Author: Equatable {

    public static func == (lhs: Author, rhs: Author) -> Bool {
        return (lhs.type == rhs.type) &&
            (lhs.name == rhs.name) &&
            (lhs.build == rhs.build) &&
            (lhs.language == rhs.language) &&
            (lhs.partNumber == rhs.partNumber)
    }
}

@available(swift 4.0)
extension Author: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        // attribute
        case type = "xsi:type"

        case name = "Name"
        case build = "Build"
        case language = "LangID"
        case partNumber = "PartNumber"
    }
}
