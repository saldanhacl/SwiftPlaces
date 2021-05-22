//
//  ViewCodeHelper.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 22/05/21.
//

import UIKit

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func configureViews() {}
    
    func applyViewCode() {
        // pageConfig()
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}

extension UIViewController {
    func pageConfig() {
        view.backgroundColor = UIColor.getBackgroundColor()
    }
}
