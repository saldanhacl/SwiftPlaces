//
//  PlaceDetailViewModel.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

class PlaceDetailViewModel {
    private let placeDetail: PlaceDetail
    
    var name: String!
    var reviewScore: Double!
    var review: String!
    var about: String!
    var timeSchedule: String!
    var phoneNumber: String!
    var location: String!
    var imageUrl: String?

    init(imageUrl: String?, placeDetail: PlaceDetail) {
        self.imageUrl = imageUrl
        self.placeDetail = placeDetail
        self.prepare()
    }
    
    func prepare() {
        self.name = placeDetail.name
        self.reviewScore = placeDetail.review
        self.review = String(placeDetail.review)
        self.about = placeDetail.about
        self.timeSchedule = "seg a sex: 7h às 23h\nsáb e dom: 8h às 20h"
        self.phoneNumber = placeDetail.phone
        self.location = placeDetail.adress
    }
}
