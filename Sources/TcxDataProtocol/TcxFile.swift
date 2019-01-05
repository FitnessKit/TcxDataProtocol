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

// Encoder
@available(swift 4.0)
extension TcxFile {

    /// Encode TcxFile
    ///
    /// - Parameter prettyPrinted: Should Pretty Print TCX Data
    /// - Returns: TCX Data
    /// - Throws: EncodingError
    public func encode(prettyPrinted: Bool = true) throws -> Data {
        let encoder = XMLEncoder()
        encoder.dateEncodingStrategy = .formatted(TcxFile.formatter)

        if prettyPrinted {
            encoder.outputFormatting = [.prettyPrinted]
        }

        encoder.nodeEncodingStrategy = .custom { codableType, encoder in

            /// Array<ActivityLap> Attributes
            if let _ = codableType as? Array<ActivityLap>.Type {
                return {(key) in

                    if key.stringValue == ActivityLap.CodingKeys.startTime.rawValue {
                        return .attribute
                    }

                    return .default }
            }

            /// Array<Activity> Attributes
            if let _ = codableType as? Array<Activity>.Type {
                return {(key) in

                    if key.stringValue == Activity.CodingKeys.sport.rawValue {
                        return .attribute
                    }

                    return .default }
            }

            /// Training Attributes
            if let _ = codableType as? Training.Type {
                return {(key) in

                    if key.stringValue == Training.CodingKeys.virtualPartner.rawValue {
                        return .attribute
                    }

                    return .default }
            }

            /// Plan Attributes
            if let _ = codableType as? Plan.Type {
                return {(key) in

                    if key.stringValue == Plan.CodingKeys.trainingType.rawValue ||
                        key.stringValue == Plan.CodingKeys.intervalWorkout.rawValue  {
                        return .attribute
                    }

                    return .default }
            }

            /// Catch some Default Keys for Attribute
            return {(key) in
                if key.stringValue.hasPrefix("xsi:") || key.stringValue.hasPrefix("xmlns") {
                    return .attribute
                }

                return .default
            }
        }

        return try encoder.encode(database, withRootKey: "TrainingCenterDatabase")
    }
}

// Decoder
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
