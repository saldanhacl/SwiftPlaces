//
//  Photo.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 25/04/21.
//

import Foundation

struct PhotoResponse: Codable {
    let photos: [Photo]
    
    static func mock() -> PhotoResponse {
        return PhotoResponse(photos: [SwiftPlaces.Photo(id: 1581384, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/1581384/pexels-photo-1581384.jpeg"), medium: Optional("https://images.pexels.com/photos/1581384/pexels-photo-1581384.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 1484516, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/1484516/pexels-photo-1484516.jpeg"), medium: Optional("https://images.pexels.com/photos/1484516/pexels-photo-1484516.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 3887985, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/3887985/pexels-photo-3887985.jpeg"), medium: Optional("https://images.pexels.com/photos/3887985/pexels-photo-3887985.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 2263510, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/2263510/pexels-photo-2263510.jpeg"), medium: Optional("https://images.pexels.com/photos/2263510/pexels-photo-2263510.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 2290070, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/2290070/pexels-photo-2290070.jpeg"), medium: Optional("https://images.pexels.com/photos/2290070/pexels-photo-2290070.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 4255489, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/4255489/pexels-photo-4255489.jpeg"), medium: Optional("https://images.pexels.com/photos/4255489/pexels-photo-4255489.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 4913313, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/4913313/pexels-photo-4913313.jpeg"), medium: Optional("https://images.pexels.com/photos/4913313/pexels-photo-4913313.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 3201920, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/3201920/pexels-photo-3201920.jpeg"), medium: Optional("https://images.pexels.com/photos/3201920/pexels-photo-3201920.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 2504911, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/2504911/pexels-photo-2504911.jpeg"), medium: Optional("https://images.pexels.com/photos/2504911/pexels-photo-2504911.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 4676640, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/4676640/pexels-photo-4676640.jpeg"), medium: Optional("https://images.pexels.com/photos/4676640/pexels-photo-4676640.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 3745525, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/3745525/pexels-photo-3745525.jpeg"), medium: Optional("https://images.pexels.com/photos/3745525/pexels-photo-3745525.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 4577179, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/4577179/pexels-photo-4577179.jpeg"), medium: Optional("https://images.pexels.com/photos/4577179/pexels-photo-4577179.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 2878741, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/2878741/pexels-photo-2878741.jpeg"), medium: Optional("https://images.pexels.com/photos/2878741/pexels-photo-2878741.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 3534750, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/3534750/pexels-photo-3534750.jpeg"), medium: Optional("https://images.pexels.com/photos/3534750/pexels-photo-3534750.jpeg?auto=compress&cs=tinysrgb&h=350")))), SwiftPlaces.Photo(id: 2923034, src: Optional(SwiftPlaces.Source(original: Optional("https://images.pexels.com/photos/2923034/pexels-photo-2923034.jpeg"), medium: Optional("https://images.pexels.com/photos/2923034/pexels-photo-2923034.jpeg?auto=compress&cs=tinysrgb&h=350"))))])
    }
}

struct Photo: Codable {
    let id: Int
    let src: Source?
}

struct Source: Codable {
    let original: String?
    let medium: String?
}
