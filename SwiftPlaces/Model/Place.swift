//
//  Place.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

struct PlaceListResponse: Codable {
    let listLocations: [Place]
}

struct Place: Codable {
    let id: Int
    let name: String
    let review: Double
    let type: String
    var cardImageUrl: String?
    var originalImageUrl: String?
}
