//
//  PlacesRouter.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

protocol PlacesRouterProtocol: RouterProtocol {
    var navigationController: UINavigationController? { get }
    func gotoPlaceDetail(_ placeDetail: PlaceDetailViewModel)
}

class PlacesRouter: PlacesRouterProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = PlacesFactory.makePlacesHome(delegate: self)
        navigationController?.pushViewController(homeViewController, animated: true)
    }

    func gotoPlaceDetail(_ placeDetail: PlaceDetailViewModel) {
        let detailViewController = PlacesFactory.makePlacesDetailViewCode(placeDetail, delegate: self)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


// MARK: PlacesHomePresenterDelegate
extension PlacesRouter: PlacesHomePresenterDelegate {
    func routeToDetails(_ placeDetail: PlaceDetailViewModel) {
        self.gotoPlaceDetail(placeDetail)
    }
}

// MARK: PlacesDetailsPresenterDelegate
extension PlacesRouter: PlacesDetailsPresenterDelegate {
}
