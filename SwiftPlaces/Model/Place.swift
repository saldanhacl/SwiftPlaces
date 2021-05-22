//
//  Place.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

struct PlaceListResponse: Codable {
    let listLocations: [Place]
    
    static func mock() -> PlaceListResponse {
        return PlaceListResponse(listLocations: [SwiftPlaces.Place(id: 1, name: "Café Escritório", review: 3.8, type: "Coworking", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 2, name: "Hangar", review: 3.8, type: "Restaurante", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 3, name: "Padaria Pelicano", review: 4.5, type: "Padaria", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 4, name: "KPOPKA", review: 0.0, type: "Sucos Naturais", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 5, name: "Baianera", review: 1.1, type: "Restaurante", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 6, name: "Garage", review: 4.4, type: "Cafeteria", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 7, name: "Passaí", review: 4.0, type: "Sucos Naturais", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 8, name: "Simple", review: 5.0, type: "Produtos naturais", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 9, name: "Café Kitsumé", review: 3.5, type: "Cafeteria", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 10, name: "Rebmul Barbearia", review: 2.7, type: "Barbearia", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 11, name: "AreP Hortifrut", review: 3.0, type: "Supermercado", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 12, name: "ElkrapS Taqueria Artesanal", review: 4.9, type: "Bares", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 13, name: "Pub 1014", review: 4.1, type: "Bares", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 14, name: "Fire Mexican", review: 5.0, type: "Restaurante", cardImageUrl: nil, originalImageUrl: nil), SwiftPlaces.Place(id: 15, name: "BBQ Pit House", review: 1.0, type: "Restaurante", cardImageUrl: nil, originalImageUrl: nil)])
    }
}

struct Place: Codable {
    let id: Int
    let name: String
    let review: Double
    let type: String
    var cardImageUrl: String?
    var originalImageUrl: String?
}
