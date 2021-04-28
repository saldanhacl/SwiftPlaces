//
//  PlaceDetailPhotoCollectionViewCell.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 27/04/21.
//

import UIKit
import SDWebImage

class PlaceDetailPhotoCollectionViewCell: UICollectionViewCell {
    
    static let reusableIdentifier: String = "placeDetailPhotoCell"
    
    @IBOutlet weak var detailImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.detailImage.clipsToBounds = true
    }
    
    func setImage(from urlString: String?) {
        if let imageUrl = urlString, let url = URL(string: imageUrl) {
            detailImage.sd_setImage(with: url)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.detailImage.image = nil
    }
}
