//
//  PlaceDetail.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

struct PlaceDetail: Codable {
    let id: Int
    let name: String
    let review: Double
    let type, about, phone, address: String
    let schedule: Schedule?
}
