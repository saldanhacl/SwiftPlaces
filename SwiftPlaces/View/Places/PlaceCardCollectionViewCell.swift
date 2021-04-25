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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewScoreLabel: Number!
    
    func setupCell(image: String, place: Place) {
        let colors = UIColor.getImagePlaceholderColors()
        let placeHolderColor = colors[Int.random(in: 0 ..< colors.count)]
        placeImageView.backgroundColor = placeHolderColor
        
        self.titleLabel.text = place.name
        self.subtitleLabel.text = place.type
        self.reviewScoreLabel.text = String(place.review)
    }
}
