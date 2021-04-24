//
//  PlacesFactory.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

struct PlacesFactory {
    static func makePlacesHome(delegate: PlacesHomePresenterDelegate) -> PlacesHomeViewController {
        let viewController = PlacesHomeViewController()
        let presenter = PlacesHomePresenter(delegate: delegate)
        viewController.presenter = presenter
        return viewController
    }
    
    static func  makePlacesDetail(delegate: PlacesDetailsPresenterDelegate) -> PlacesDetailsViewController {
        let viewController = PlacesDetailsViewController()
        let presenter = PlacesDetailsPresenter(delegate: delegate)
        viewController.presenter = presenter
        return viewController
    }
}
