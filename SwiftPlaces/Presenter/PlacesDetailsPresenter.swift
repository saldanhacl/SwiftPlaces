//
//  PlacesDetailsPresenter.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

protocol PlacesDetailsPresenterDelegate: class {
    
}

class PlacesDetailsPresenter {
    weak var view: PlacesDetailsViewController?
    weak var delegate: PlacesDetailsPresenterDelegate?
    private let photosService = PhotosService()

    init(delegate: PlacesDetailsPresenterDelegate) {
        self.delegate = delegate
    }
    
    func getPlaceDetailImages() {
        photosService.getPhotos(of: "food") { result in
            do {
                let photosResponse = try result.get()
                DispatchQueue.main.async {
                    self.view?.populateWithPhotos(photosResponse.photos)
                }
            } catch {
                // Ignore
            }
        }
    }
}
