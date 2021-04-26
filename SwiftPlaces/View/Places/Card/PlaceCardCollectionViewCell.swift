//
//  PlaceCardCollectionViewCell.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit
import Cosmos

class PlaceCardCollectionViewCell: UICollectionViewCell {
    
    static let reusableIdentifier: String = "placeCardCell"

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewScoreLabel: Number!
    @IBOutlet weak var cosmosView: CosmosView!
    
    func setupCell(placeHolderColor: UIColor, image: String, place: Place) {
        placeImageView.backgroundColor = placeHolderColor
        
        if let imageUrl = place.imageUrl, let url = URL(string: imageUrl) {
            placeImageView.loadImage(at: url)
        }
        
        cosmosView.rating = place.review
        
        self.titleLabel.text = place.name
        self.subtitleLabel.text = place.type
        self.reviewScoreLabel.text = String(place.review)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        placeImageView.image = nil
        placeImageView.cancelImageLoad()
    }
}
