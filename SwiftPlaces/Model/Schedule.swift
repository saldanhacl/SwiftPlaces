//
//  Schedule.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation


// MARK: - Schedule
struct Schedule: Codable {
    let monday, tuesday, wednesday, thursday: Day
    let friday, saturday, sunday: Day
}

// MARK: - Day
struct Day: Codable {
    let dayOpen, close: String

    enum CodingKeys: String, CodingKey {
        case dayOpen = "open"
        case close
    }
}
