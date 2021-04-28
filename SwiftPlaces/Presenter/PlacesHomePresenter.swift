//
//  PlacesHomePresenter.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

protocol PlacesHomePresenterDelegate: class {
    func routeToDetails(_ placeDetail: PlaceDetailViewModel)
}

class PlacesHomePresenter {
    weak var delegate: PlacesHomePresenterDelegate?
    private let placesService = PlacesService()
    private let photosService = PhotosService()
    weak var view: PlacesHomeViewController?

    init(delegate: PlacesHomePresenterDelegate) {
        self.delegate = delegate

    }
    
    func getPlaces() {
        self.view?.startLoading()
        placesService.getPlaces { result in
            do {
                let placesList = try result.get()
                DispatchQueue.main.async {
                    self.view?.stopLoading()
                    self.view?.addPlaces(placesList.listLocations)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func didGoToDetails(of place: Place) {
        getPlaceDetail(place) { result in
            let viewModel = PlaceDetailViewModel(imageUrl: place.originalImageUrl, placeDetail: result)
            self.delegate?.routeToDetails(viewModel)
        }
    }
    
    func getPhotos() {
        photosService.getPhotos(of: "restaurant") { result in
            do {
                let photosResponse = try result.get()
                DispatchQueue.main.async {
                    self.view?.populateWithPhotos(photosResponse.photos)
                }
            } catch {
                // Ignore and show the placeholder
            }
        }
    }
    
    func getPlaceDetail(_ place: Place, completion: @escaping(PlaceDetail) -> Void) {
        placesService.getPlaceDetail(id: place.id) { result in
            do {
                let placeDetail = try result.get()
                DispatchQueue.main.async {
                    completion(placeDetail)
                }
            } catch {
                self.view?.showAlert(title: "Ops".localized(), message: "An error occurred while processing the data.".localized())
            }
        }
    }
}
