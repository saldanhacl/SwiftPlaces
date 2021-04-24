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
    weak var delegate: PlacesDetailsPresenterDelegate?
    
    init(delegate: PlacesDetailsPresenterDelegate) {
        self.delegate = delegate
    }
}
