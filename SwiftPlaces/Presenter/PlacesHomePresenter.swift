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
    
    init(delegate: PlacesHomePresenterDelegate) {
        self.delegate = delegate
    }
    
    func didGoToDetails(of place: Place) {
        let placeDetail = getPlaceDetail(place)
        self.delegate?.routeToDetails(placeDetail)
    }
    
    func getPlaceDetail(_ place: Place) -> PlaceDetailViewModel {
        let placeDetail = PlaceDetail(id: 0, name: "Padaria Pelicano", review: 3.9, type: "Coworking", about: "Se você curte um pão fresquinho, ou uma sobremesa caprichada, você precisa incluir uma visitinha a Padaria Pelicano no seu roteiro por BH. A fila é gigantesca, mas os quitutes estão sem dúvida entre os melhores da cidade." , phone: "+55 31 98892 5338", address: "Rua do ouro, 297 - Serra\nBelo Horizonte - MG", schedule: nil)
        return PlaceDetailViewModel(placeDetail: placeDetail)
    }
}
