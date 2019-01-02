//
//  TcxFile.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 1/2/19.
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
import XMLCoder

/// TCX File
@available(swift 4.0)
public struct TcxFile {

    /// TXC xss:timedate Formatter
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter
    }()

    /// Training Center Database
    private(set) public var database: TrainingCenterDatabase

    public init(database: TrainingCenterDatabase) {
        self.database = database
    }

}

@available(swift 4.0)
extension TcxFile {

    /// Decodes TXC Data into a TrainingCenterDatabase
    ///
    /// - Parameter data: TCX File Data
    /// - Returns: Optional TrainingCenterDatabase
    /// - Throws: DecodingError
    public static func decode(from data: Data) throws -> TcxFile {
        var tcxFile: TrainingCenterDatabase?

        let decoder = XMLDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)

        tcxFile = try decoder.decode(TrainingCenterDatabase.self, from: data)

        if let tcxFile = tcxFile {
            return TcxFile(database: tcxFile)
        }

        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "No TCX data found."))
    }
}
