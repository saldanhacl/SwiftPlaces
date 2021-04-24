//
//  PlacesHomeViewController.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

class PlacesHomeViewController: UIViewController {
    
    var presenter: PlacesHomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapGoToDetails(_ sender: Any) {
        self.presenter?.didGoToDetails()
    }
}
