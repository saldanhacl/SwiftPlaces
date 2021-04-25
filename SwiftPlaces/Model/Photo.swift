//
//  Photo.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 25/04/21.
//

import Foundation

struct PhotoResponse: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
    let src: Source?
}

struct Source: Codable {
    let original: String?
    let medium: String?
}
