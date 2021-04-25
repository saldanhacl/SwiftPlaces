//
//  Schedule.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

struct Schedule: Codable {
    let sunday, wednesday, thursday, friday, saturday: Day?
}

// MARK: - Day
struct Day: Codable {
    let dayOpen, close: String

    enum CodingKeys: String, CodingKey {
        case dayOpen = "open"
        case close
    }
}
