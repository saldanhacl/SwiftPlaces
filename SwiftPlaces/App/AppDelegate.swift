//
//  AppDelegate.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController = UINavigationController()
    var router: MainRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        startRouter()
        
        return true
    }
    
    private func startRouter() {
        self.router = MainRouter(navigationController: self.navigationController)
        self.router?.start()
    }
}

