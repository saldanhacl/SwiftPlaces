//
//  MainRouter.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

protocol RouterProtocol: class {
    func start()
}

class MainRouter: RouterProtocol {
    
    private let navigationController: UINavigationController
    private var placesRouter: PlacesRouter
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        placesRouter = PlacesRouter(navigationController: navigationController)
    }
    
    func start() {
        placesRouter.start()
    }
}
