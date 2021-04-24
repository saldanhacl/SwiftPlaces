//
//  PlacesRouter.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

protocol PlacesRouterProtocol: RouterProtocol {
    var navigationController: UINavigationController? { get }
    func gotoPlaceDetail()
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

    func gotoPlaceDetail() {
        let detailViewController = PlacesFactory.makePlacesDetail(delegate: self)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


// MARK: PlacesHomePresenterDelegate
extension PlacesRouter: PlacesHomePresenterDelegate {
    func routeToDetails() {
        self.gotoPlaceDetail()
    }
}

// MARK: PlacesDetailsPresenterDelegate
extension PlacesRouter: PlacesDetailsPresenterDelegate {
}
