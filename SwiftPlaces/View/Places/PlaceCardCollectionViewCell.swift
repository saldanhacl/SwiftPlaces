//
//  PlaceCardCollectionViewCell.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

class PlaceCardCollectionViewCell: UICollectionViewCell {
    
    static let reusableIdentifier: String = "placeCardCell"
    @IBOutlet weak var placeName: UILabel!

    func setupCell(placeName: String) {
        self.placeName.text = placeName
    }
}
