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
    let type, about, phone, adress: String
    let schedule: Schedule?
    
    static func mock() -> PlaceDetail {
        return PlaceDetail(id: 2, name: "Hangar", review: 3.8, type: "Restaurante", about: "Aliquet ac litora dui ornare cursus iaculis. massa turpis at dictumst cubilia blandit interdum class ultrices pretium, mollis sagittis porta luctus orci consequat feugiat iaculis quis, inceptos euismod vel leo dolor magna mauris blandit. commodo tellus litora convallis vivamus aliquet malesuada, dictum hendrerit vel vivamus eleifend est commodo, luctus mi porttitor phasellus gravida. ", phone: "+3198888877", adress: "Avenida Primeiro de Março,936,Ideal,Belo Horizonte,Minas Gerais", schedule: Optional(SwiftPlaces.Schedule(sunday: Optional(SwiftPlaces.Day(dayOpen: "17h", close: "22h")), wednesday: Optional(SwiftPlaces.Day(dayOpen: "17h", close: "22h")), thursday: Optional(SwiftPlaces.Day(dayOpen: "17h", close: "22h")), friday: Optional(SwiftPlaces.Day(dayOpen: "17h", close: "1h")), saturday: Optional(SwiftPlaces.Day(dayOpen: "17h", close: "1h")))))
    }
}
