//
//  ImagesService.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 25/04/21.
//

import Foundation

protocol PhotosServiceProtocol: class {
    func getPhotos(of query: String, completion: @escaping (Result<PhotoResponse, Error>) -> Void)
}

class PhotosService: PhotosServiceProtocol {
    private let apiService = APIService(.photos)
    
    func getPhotos(of query: String, completion: @escaping (Result<PhotoResponse, Error>) -> Void){
        // let endpoint = "search?query=\(query)"
        // apiService.fetch(endpoint, completion: completion)
        completion(.success(PhotoResponse.mock()))
    }
}
