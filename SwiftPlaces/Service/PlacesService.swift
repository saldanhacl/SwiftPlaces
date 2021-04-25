//
//  PlacesService.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

protocol PlacesServiceProtocol: class {
    func getPlaces(completion: @escaping (Result<PlaceListResponse, Error>) -> Void)
    func getPlaceDetail(id: Int, completion: @escaping (Result<PlaceDetail, Error>) -> Void)
}

class PlacesService: PlacesServiceProtocol {
    private let apiService = APIService()
    
    func getPlaces(completion: @escaping (Result<PlaceListResponse, Error>) -> Void){
        let endpoint = "locations"
        apiService.fetch(endpoint, completion: completion)
    }
    
    func getPlaceDetail(id: Int, completion: @escaping (Result<PlaceDetail, Error>) -> Void) {
        let endpoint = "locations/\(id)"
        apiService.fetch(endpoint, completion: completion)
    }
}
