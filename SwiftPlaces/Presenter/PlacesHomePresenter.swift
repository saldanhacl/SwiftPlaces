//
//  PlacesHomePresenter.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

protocol PlacesHomePresenterDelegate: class {
    func routeToDetails()
}

class PlacesHomePresenter {
    weak var delegate: PlacesHomePresenterDelegate?
    
    init(delegate: PlacesHomePresenterDelegate) {
        self.delegate = delegate
    }
    
    func didGoToDetails() {
        self.delegate?.routeToDetails()
    }
}
