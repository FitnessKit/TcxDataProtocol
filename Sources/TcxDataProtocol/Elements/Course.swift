//
//  Course.swift
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

/// TCX Course
@available(swift 4.0)
public struct Course {
    // Course_t

    /// Name
    private(set) public var name: String?

    /// Course Laps
    private(set) public var lap: [CourseLap]?

    /// Track
    private(set) public var track: [Track]?

    /// Notes
    private(set) public var notes: String?

    /// Course Point
    private(set) public var coursePoints: [CoursePoint]?

    /// Creator
    private(set) public var creator: Creator?

    public init(name: String?,
                lap: [CourseLap]?,
                track: [Track]?,
                notes: String?,
                coursePoints: [CoursePoint]?,
                creator: Creator?)
    {
        self.name = name?.boundToSize(15)
        self.lap = lap
        self.track = track
        self.notes = notes
        self.coursePoints = coursePoints
        self.creator = creator
    }
}

@available(swift 4.0)
extension Course: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case name = "Name"
        case lap = "Lap"
        case track = "Track"
        case notes = "Notes"
        case coursePoints = "CoursePoint"
        case creator = "Creator"
    }
}
