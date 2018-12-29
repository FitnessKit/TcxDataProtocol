//
//  Application.swift
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

/// Identifies a PC software application
@available(swift 4.0)
public struct Application: Codable {
    /// Application_t

    /// Build Info
    private(set) public var build: Build?

    /// Language
    ///
    /// Specifies the two character ISO 693-1 language id that identifies
    /// the installed language of this application. see http://www.loc.gov/standards/iso639-2/
    /// for appropriate ISO identifiers
    private(set) public var language: String?

    /// Part Number
    private(set) public var partNumber: String?

    enum CodingKeys: String, CodingKey {
        case build = "Build"
        case language = "LangID"
        case partNumber = "PartNumber"
    }

}
