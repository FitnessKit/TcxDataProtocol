//
//  Author.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 12/29/18.
//

import Foundation

/// TCX Author
@available(swift 4.0)
public struct Author: Codable {
    // AbstractSource_t - Only Name is required

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

    enum CodingKeys: String, CodingKey {
        case type = "xsi:type"
        case name = "Name"

        case build = "Build"
        case language = "LangID"
        case partNumber = "PartNumber"
    }

}
