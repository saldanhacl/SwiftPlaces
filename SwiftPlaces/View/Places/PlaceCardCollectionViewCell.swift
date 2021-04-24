//
//  PlaceCardCollectionViewCell.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

class PlaceCardCollectionViewCell: UICollectionViewCell {
    
    static let reusableIdentifier: String = "placeCardCell"

    @IBOutlet weak var placeImageView: UIImageView!

    func setupCell(placeName: String) {
        let colors = UIColor.getProjectColors()
        let placeHolderColor = colors[Int.random(in: 0 ..< colors.count)]
        placeImageView.backgroundColor = placeHolderColor
    }
}
