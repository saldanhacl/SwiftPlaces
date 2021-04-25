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
    weak var view: PlacesHomeViewController?

    
    init(delegate: PlacesHomePresenterDelegate) {
        self.delegate = delegate
        self.getPlaces()
    }
    
    private func getPlaces() {
        placesService.getPlaces { result in
            do {
                let placesList = try result.get()
                DispatchQueue.main.async {
                    self.view?.updateData(placesList.listLocations)
                }
            } catch {
                print("error")
            }
        }
    }
    
    func didGoToDetails(of place: Place) {
        getPlaceDetail(place) { result in
            let viewModel = PlaceDetailViewModel(placeDetail: result)
            self.delegate?.routeToDetails(viewModel)
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
                print("error")
            }
        }
    }
}
